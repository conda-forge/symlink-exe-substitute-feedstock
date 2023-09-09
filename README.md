About symlink-exe-substitute-feedstock
======================================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/symlink-exe-substitute-feedstock/blob/main/LICENSE.txt)


About symlink-exe-substitute
----------------------------

Home: http://github.com/conda-forge/symlink-exe-substitute-feedstock

Package license: BSD-3-Clause AND (MIT OR PSF-2.0 OR ZPL-2.1)

Summary: Build .exe launchers under %PREFIX%/Scripts as symlink substitutes.

Development: http://github.com/conda-forge/symlink-exe-substitute-feedstock

Compile small .exe launchers to be placed under, e.g., %PREFIX%/Scripts.
These launch target executables relative to their path inside the prefix
and as such work as alternative to symbolic links (symlinks) to binaries.
Use this package as a build dependency to workaround the fact that by
default creating symlinks is not available to non-admin users on Windows.
Usage is similar to `ln TARGET... DIRECTORY` on Unixes, e.g., run
`call build-symlink-exe "%PREFIX%\some\dir\your.exe" "%PREFIX%\Scripts"`


About symlink-exe-runtime
-------------------------

Home: http://github.com/conda-forge/symlink-exe-substitute-feedstock

Package license: BSD-3-Clause

Summary: Runtimes needed for .exe files built by symlink-exe-build.

This is an empty, only-dependency-providing package (meta-package).
The executable launchers built by symlink-exe-build are dynamically
linked to the C runtime provided by the "strong" "run_exports" from the
"compiler('c')" packages. As of now, conda-build does not offer
transitive "run_exports" and as such this package helps to provide them.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=17767&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/symlink-exe-substitute-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>win_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=17767&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/symlink-exe-substitute-feedstock?branchName=main&jobName=win&configuration=win%20win_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-symlink--exe--build-green.svg)](https://anaconda.org/conda-forge/symlink-exe-build) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/symlink-exe-build.svg)](https://anaconda.org/conda-forge/symlink-exe-build) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/symlink-exe-build.svg)](https://anaconda.org/conda-forge/symlink-exe-build) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/symlink-exe-build.svg)](https://anaconda.org/conda-forge/symlink-exe-build) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-symlink--exe--runtime-green.svg)](https://anaconda.org/conda-forge/symlink-exe-runtime) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/symlink-exe-runtime.svg)](https://anaconda.org/conda-forge/symlink-exe-runtime) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/symlink-exe-runtime.svg)](https://anaconda.org/conda-forge/symlink-exe-runtime) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/symlink-exe-runtime.svg)](https://anaconda.org/conda-forge/symlink-exe-runtime) |

Installing symlink-exe-substitute
=================================

Installing `symlink-exe-substitute` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `symlink-exe-build, symlink-exe-runtime` can be installed with `conda`:

```
conda install symlink-exe-build symlink-exe-runtime
```

or with `mamba`:

```
mamba install symlink-exe-build symlink-exe-runtime
```

It is possible to list all of the versions of `symlink-exe-build` available on your platform with `conda`:

```
conda search symlink-exe-build --channel conda-forge
```

or with `mamba`:

```
mamba search symlink-exe-build --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search symlink-exe-build --channel conda-forge

# List packages depending on `symlink-exe-build`:
mamba repoquery whoneeds symlink-exe-build --channel conda-forge

# List dependencies of `symlink-exe-build`:
mamba repoquery depends symlink-exe-build --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [Anaconda-Cloud](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating symlink-exe-substitute-feedstock
=========================================

If you would like to improve the symlink-exe-substitute recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/symlink-exe-substitute-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@mbargull](https://github.com/mbargull/)

