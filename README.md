# [Template Repository](https://github.com/djmaxus/matlab-repo-init) for Open-Source MATLAB

![CI](https://github.com/djmaxus/matlab-repo-init/actions/workflows/ci.yml/badge.svg?branch=main)
[![View matlab-repo-init on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/171364-matlab-repo-init)
![GitHub Tag](https://img.shields.io/github/v/tag/djmaxus/matlab-repo-init?sort=semver&style=flat&label=version)
![GitHub Release Date](https://img.shields.io/github/release-date/djmaxus/matlab-repo-init?display_date=published_at&style=flat&label=dated)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15447056.svg)](https://doi.org/10.5281/zenodo.15447056)


Quickstart your public MATLAB repository. Batteries included 🔋

<!-- markdownlint-disable MD033 -->
<img src="doc/matlab-repo-init.png" width=280 alt="logo">
<!-- markdownlint-enable MD033 -->

## How to use

First, click [Use this template][github-use-template]
to make your own repository from this template.
Clone your new repository.

Then locally:

1. **Run [`init`](./init.m)** function for cleanup
2. **Upload your own MATLAB code**
3. Change anything else to your liking
4. Commit changes [appropriately][conventional-commits] along the way

Then, in _Settings — **Actions** — General_ of your repository:

1. [x] _Allow all actions and reusable workflows_
2. [x] _Allow GitHub Actions to create and approve pull requests_

To enable repository webpage deployment:

- [x] _Settings — **Pages** — Build and deployment — Source_ = **GitHub Actions**

You can also import a pre-built [**ruleset**](.github/rules/main.json) to protect
`main` branch from accidental unwanted hard-to-recover changes.\
In _Settings — Rules — Rulesets_ of your repository:

1. Click _New ruleset — Import a ruleset_
2. Upload [`.github/rules/main.json`](.github/rules/main.json)
3. Modify if needed and save

Then push the local changes and carry on with the development
of your freshly established public MATLAB project!

Please go to repository's [Wiki][wiki] (when it's ready)
for more detailed user manual.

Do not hesitate to ask [me](https://djmaxus.github.io/)
for assistance and technical support.\
And everyone is welcome to open
[issues](https://github.com/djmaxus/matlab-repo-init/issues)
to request a feature, enhance the documentation, or report a bug.

## Known template users

- [GitHub search query](https://github.com/search?q=%22Generated+from+matlab-repo-init%22+OR+%22https%3A%2F%2Fgithub.com%2Fdjmaxus%2Fmatlab-repo-init+%28BSD+3-Clause+License%29%22&type=code)
- [Forks](https://github.com/djmaxus/matlab-repo-init/forks?include=active%2Cinactive%2Cnetwork&page=1&period=2y)

||
|:-|
|[`StrataTrapper`](https://github.com/ImperialCollegeLondon/StrataTrapper)|
|[`par-waitbar`](https://github.com/djmaxus/par-waitbar)|

## Features

- Automated Path initialization on [`startup`](startup.m)
- [Utility functions](util/) for analyzing legacy MATLAB scripts
- [`.gitignore`](.gitignore) for MATLAB/Simulink/Octave
- [MATLAB code checks](.github/workflows/matlab.yml)
on pull requests and pushes to `main` branch
- Automated [releases](.github/workflows/release-please.yml)
based on Conventional Commits
- [Dependabot](.github/dependabot.yml) for GitHub Actions
- [`README`](README.md) [deployment](.github/workflows/webpage.yml) at [`<user>.github.io/<repo>`](https://djmaxus.github.io/matlab-repo-init)
- [BSD 3-Clause](LICENSE) open-source license

## References

- [Creating a Repository From a Template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
- [Overview of MATLAB Build Tool](https://mathworks.com/help/matlab/matlab_prog/overview-of-matlab-build-tool.html)
- [User-defined `startup` script for MATLAB](https://mathworks.com/help/matlab/ref/startup.html)
- [`.gitignore` generator](https://gitignore.io)
- [Choosing an Open Source License](https://choosealicense.com/)
- [Conventional Commits][conventional-commits]

[github-use-template]: https://github.com/new?template_name=matlab-repo-init&template_owner=djmaxus
[conventional-commits]: https://www.conventionalcommits.org
[wiki]: https://github.com/djmaxus/matlab-repo-init/wiki
