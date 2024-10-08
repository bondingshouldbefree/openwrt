<picture>
  <source srcset="include/logolight.png" media="(prefers-color-scheme: dark)">
  <source srcset="include/logodark.png" media="(prefers-color-scheme: light)">
  <img src="include/logolight.png" alt="openwrtmptcp Logo">
</picture>

FusionLink Multipath Bonding based on openwrtmptcp is a fork of OpenWrt that integrates Multipath TCP (MPTCP), providing advanced network aggregation and redundancy capabilities. This project leverages an upstream kernel and is currently focused on supporting the Banana Pi BPi R4, with plans to expand support to all OpenWrt-compatible devices. The main goal of openwrtmptcp is to combine multiple internet connections into a single connection to improve both bandwidth throughput and network reliability. By aggregating multiple internet breakouts, users can achieve better performance and maintain connectivity even if one of the connections fails.

## Key Features

* Multipath TCP (MPTCP) for network aggregation and redundancy.
* Focused support for Banana Pi BPi R4, with future support planned for all OpenWrt devices.
* Uses an upstream kernel for compatibility and stability.
* Aims to provide out-of-the-box functionality: all necessary configurations are pre-installed and ready to use from boot.

## Development

To build your own firmware you need a GNU/Linux, BSD or macOS system (case
sensitive filesystem required). Cygwin is unsupported because of the lack of a
case sensitive file system.

### Requirements

### Quickstart

### Related Repositories

The main repository uses multiple sub-repositories to manage packages of
different categories. All packages are installed via the OpenWrt package
manager called `opkg`. If you're looking to develop the web interface or port
packages to OpenWrt, please find the fitting repository below.

* [LuCI Web Interface](https://github.com/openwrt/luci): Modern and modular
  interface to control the device via a web browser.

* [OpenWrt Packages](https://github.com/openwrt/packages): Community repository
  of ported packages.

* [OpenWrt Routing](https://github.com/openwrt/routing): Packages specifically
  focused on (mesh) routing.

* [OpenWrt Video](https://github.com/openwrt/video): Packages specifically
  focused on display servers and clients (Xorg and Wayland).

## Support Information

Currently the project supports the [Banana Pi BPI-R4](https://wiki.banana-pi.org/Banana_Pi_BPI-R4)

More hardware coming soon!

### Documentation

* [Quick Start Guide](https://openwrt.org/docs/guide-quick-start/start)
* [User Guide](https://openwrt.org/docs/guide-user/start)
* [Developer Documentation](https://openwrt.org/docs/guide-developer/start)
* [Technical Reference](https://openwrt.org/docs/techref/start)

### Support Community

* [Discord]([https://forum.openwrt.org](https://discord.gg/qJ7KP6SQxC)): For usage, projects, discussions and hardware advise.
* [Pre-configured Devices](https://xpedite-tech.com/fusion-x/): Pre built Banana PI Bpi R4 with the firmware pre-installed is available for purchase.
* Wiki coming soon!

## License

OpenWrt is licensed under GPL-2.0
