[![License][license-image]][license-url]
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)
[![Actions Status][action-image]][action-url]

# WIP: mt5-python-wine-containers

This project is a partial fork of the [materya/containers][orig-repo-url]
repository with my own modifications.

This repository only contains necessary containers to run a MetaTrader® 5
terminal on Wine with the Windows version of Python (>=3.10) included.

The contents of the original repository from 2021-04-14 are preserved in
the [`original-repository' branch][orig-repo-branch].

## Containers

| Name | Description |
|-|-|
| **[MetaTrader5](/specs/metatrader5)** | Wine headless container with MetaTrader® 5 and Python included in the default prefix |
| **[PyWine](/specs/pywine)** | Wine headless container with Python included in the default prefix |
| **[Wine](/specs/wine)** | Basic Lightweight Wine headless base container |

## License

[GPL-3.0](LICENSE)

[license-image]: https://img.shields.io/github/license/wyrmiyu/mt5-python-wine-containers?style=flat-square
[license-url]: LICENSE
[action-image]: https://img.shields.io/github/workflow/status/wyrmiyu/mt5-python-wine-containers/Build%20&%20Push?label=Build%20%26%20Push&logo=github&style=flat-square
[action-url]: https://github.com/wyrmiyu/mt5-python-wine-containers/actions
[orig-repo-branch]: https://github.com/wyrmiyu/mt5-python-wine-containers/tree/original-repository
[orig-repo-url]: https://github.com/materya/containers