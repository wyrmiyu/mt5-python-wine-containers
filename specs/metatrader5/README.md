# MetaTrader® 5

[![License][license-image]][license-url]
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)

Wine headless container with prefix preinstalled with MetaTrader® 5 and Python.

Based on [`pywine-3.10` image][base-image-url].

The default Wine environment variables are:

| Env Name | Value |
|-|-|
| WINEARCH | `win64` (default) |
| WINEDEBUG | `-all` |
| WINEPREFIX | `/opt/pywine` |

## Available versions

[image-size-badge]: https://img.shields.io/docker/image-size/wyrmiyu/metatrader/latest?style=flat-square
[image-url]: https://github.com/orgs/wyrmiyu/packages/container/metatrader/latest
[![Size][image-size-badge]][image-url]

**[5](https://github.com/orgs/wyrmiyu/packages/container/metatrader/5)**,
**[latest](https://github.com/orgs/wyrmiyu/packages/container/metatrader/latest)**

## License

This container spec source code is licensed under the [GPL-3.0][license-url].

When started at the first time, the container downloads and installs inside
a wine prefix the MetaTrader® software which is a [MetaQuotes®][mq-url]
product & Trademark, all rights reserved.
See [MetaQuotes® Legal Information][mq-legal].


[base-image-url]: https://github.com/orgs/wyrmiyu/packages/container/package/pywine-3.10
[license-image]: https://img.shields.io/github/license/wyrmiyu/containers?style=flat-square
[license-url]: LICENSE
[mq-url]: https://www.metaquotes.net
[mq-legal]: https://www.metaquotes.net/en/legal