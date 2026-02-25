#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (C) 2025-2026 Chester A. Unal <chester.a.unal@arinc9.com>

usage() {
	echo "Usage: $0 --target <TARGET> --subtarget <SUBTARGET> --profile <PROFILE> --server-ipv4 <ADDR> --server-port <PORT> --uuid <UUID>"
	exit 1
}

# Parse arguments.
while [ $# -gt 0 ]; do
	case "$1" in
	--target)
		[ -z "$2" ] && usage
		target="$2"
		shift 2
		;;
	--subtarget)
		[ -z "$2" ] && usage
		subtarget="$2"
		shift 2
		;;
	--profile)
		[ -z "$2" ] && usage
		profile="$2"
		shift 2
		;;
	--server-ipv4)
		[ -z "$2" ] && usage
		server_ipv4="$2"
		shift 2
		;;
	--server-port)
		[ -z "$2" ] && usage
		server_port="$2"
		shift 2
		;;
	--uuid)
		[ -z "$2" ] && usage
		uuid="$2"
		shift 2
		;;
	*)
		usage
		;;
	esac
done

# Show usage if target, subtarget, profile, server IPv4 address, server port,
# and UUID were not provided.
{ [ -z "$target" ] || [ -z "$subtarget" ] || [ -z "$profile" ] || [ -z "$server_ipv4" ] || [ -z "$server_port" ] || [ -z "$uuid" ]; } && usage

# Update feeds and install all packages.
./scripts/feeds update && ./scripts/feeds install -a

# Configure the build system.
echo "CONFIG_TARGET_"$target"=y
CONFIG_TARGET_"$target"_"$subtarget"=y
CONFIG_TARGET_"$target"_"$subtarget"_DEVICE_"$profile"=y
CONFIG_PACKAGE_kmod-ifb=y
CONFIG_PACKAGE_kmod-nft-tproxy=y
CONFIG_PACKAGE_bsbf-bonding=y" > .config
make defconfig

# Configure bsbf-bonding.
mkdir -p files/etc/bsbf
cat <<EOF > files/etc/bsbf/bsbf-bonding.conf
server_ipv4=$server_ipv4
server_port=$server_port
uuid=$uuid
EOF

cleanup() {
	rm -rf files
}
trap cleanup EXIT
# Exit on interrupt to call the EXIT trap.
trap 'exit 1' INT

# Compile an image.
make -j$(nproc)
