# PyWine

[![License][license-image]][license-url]
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)

Wine headless container with a ready to use prefix with Python.

Based on [`wine-stable` image][base-image-url].

The default Wine environment variables are:

| Env Name | Value |
|-|-|
| WINEARCH | `win64` (default) |
| WINEDEBUG | `-all` |
| WINEPREFIX | `/opt/pywine` |

## Available versions

### Python 3.10

[3.10-size-badge]: https://img.shields.io/docker/image-size/materya/pywine-3.10/latest?style=flat-square
[3.10-url]: https://github.com/orgs/materya/packages/container/pywine-3.10/latest
[![Size][3.10-size-badge]][3.10-url]

**[3.10.8](https://github.com/orgs/materya/packages/container/pywine-3.10/3.8.10)**,
**[latest](https://github.com/orgs/materya/packages/container/pywine-3.10/latest)**


## License

[GPL-3.0](LICENSE)

[base-image-url]: https://github.com/orgs/wyrmiyu/packages/container/package/wine-stable
[license-image]: https://img.shields.io/github/license/wyrmiyu/containers?style=flat-square
[license-url]: LICENSE
