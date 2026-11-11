#! /bin/sh

set -eu

source_file="$( dirname -- "$( readlink -e "${0}" )" )/../Library/symlink-exe.c"

err_exit() {
  1>&2 printf '%s\n' "${@}"
  exit 1
}

[ $# -ge 2 ] ||
  err_exit "Usage: $( basename "${0}" ) TARGET... DIRECTORY"

for out_path do true ; done
[ -d "${out_path-}" ] ||
  err_exit 'Last argument must be output directory, e.g., "%PREFIX%\Scripts"'

relpath_targets="$(
  for arg do
    if ! [ "${arg}" = "${out_path}" ] ; then
      printf '%s|%s\n' \
        "$(
          dirname "$( realpath --relative-to="${out_path}" -- "${arg}" )" |
            sed -e 's / \\ g' -e 's \\ \\\\ g'
        )" \
        "${arg}"
    fi
  done | sort
)"

# /FIXED (no base relocations) is rejected by the linker on ARM64 (LNK1246).
# Detect the target architecture from the environment, falling back to the
# cl banner, which is authoritative.
target_arch="$(
  printf '%s' "${VSCMD_ARG_TGT_ARCH-${Platform-}}" | tr '[:upper:]' '[:lower:]'
)"
if [ -z "${target_arch}" ] ; then
  if { cl 2>&1 || true ; } | head -n 1 | grep -qi 'for ARM64' ; then
    target_arch=arm64
  fi
fi
case "${target_arch}" in
  arm64) link_flags= ;;
  *) link_flags=-FIXED ;;
esac

IFS='
'
set -- ${relpath_targets}
prev_basename=
prev_rel_path=
for arg do
  exe_path="${arg#*|}"
  rel_path="${arg%|*}"
  [ "${exe_path}" = "${out_path}" ] && continue
  [ -e "${exe_path}" ] ||
    err_exit "Path \"${exe_path}\" does not exist"
  [ -f "${exe_path}" ] && [ -x "${exe_path}" ] ||
    err_exit "Path \"${exe_path}\" must be an executable"
  basename="$( basename "${exe_path}" )"
  if [ "${rel_path}" = "${prev_rel_path}" ] ; then
    cp "${out_path}/${prev_basename}" "${out_path}/${basename}" ||
      err_exit "Could not create \"${out_path}/${basename}\""
  else
    cl -O1 -Os -Gy -MD \
      "-DRELATIVE_PATH=\"${rel_path}\"" \
      -Fe"${out_path}\\${basename}" \
      "${source_file}" -link ${link_flags} ||
        err_exit "Could not compile \"${out_path}/${basename}\""
    prev_basename="${basename}"
    prev_rel_path="${rel_path}"
  fi
done
