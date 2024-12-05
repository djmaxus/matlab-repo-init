# MATLAB GitHub Repository [Template](https://github.com/djmaxus/matlab-repo-init)

![MATLAB checks](../../actions/workflows/matlab-ci.yml/badge.svg)
[![View matlab-repo-init on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/171364-matlab-repo-init)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Quickstart your public MATLAB repository. Batteries included 🔋

## How to use

1. Click [Use this template][github-use-template]
to make your own repository from this template
2. Run [`reset_template`](./reset_template.m) script
3. **Upload your own MATLAB code**
4. Tweak anything else to you liking
5. Commit changes [appropriately][conventional-commits] along the way

Please go to repository's [Wiki][wiki] for more detailed user manual.

## Features

- Automated Path initialization on [`startup`](startup.m)
- [Utility functions](util/) for analyzing legacy MATLAB scripts
- [`.gitignore`](.gitignore) for MATLAB/Simulink/Octave
- [MATLAB syntax checks](.github/workflows/matlab-ci.yml)
on pull requests and pushes to `main` branch
- Automated [releases](.github/workflows/release-please.yml)
based on [Conventional Commits](.github/workflows/commitlint.yml)
- [Dependabot](.github/dependabot.yml) for GitHub Actions
- [`README`](README.md) [deployment](.github/workflows/webpage.yml) at [`<user>.github.io/<repo>`](https://djmaxus.github.io/matlab-repo-init)
- [BSD 3-Clause](LICENSE) open-source license

## References

- [Overview of MATLAB Build Tool](https://mathworks.com/help/matlab/matlab_prog/overview-of-matlab-build-tool.html)
- [User-defined `startup` script for MATLAB](https://mathworks.com/help/matlab/ref/startup.html)
- [`.gitignore` generator](https://gitignore.io)
- [Choosing an Open Source License](https://choosealicense.com/)
- [Conventional Commits][conventional-commits]

[github-use-template]: https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template
[conventional-commits]: https://www.conventionalcommits.org
[wiki]: https://github.com/djmaxus/matlab-repo-init/wiki
