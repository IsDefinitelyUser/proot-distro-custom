# proot-distro-custom
# Custom Alpine - Developer Build

DISTRO_NAME="Alpine Linux (edge) - Developer Build"

TARBALL_URL['aarch64']="https://github.com/termux/proot-distro/releases/download/v2.8.0/alpine-aarch64-pd-v2.8.0.tar.xz"
TARBALL_SHA256['aarch64']="5cba06db08fbbb90efd08002cc4242d56c81102cb3645bc857983afa17b605b3"
TARBALL_URL['arm']="https://github.com/termux/proot-distro/releases/download/v2.8.0/alpine-arm-pd-v2.8.0.tar.xz"
TARBALL_SHA256['arm']="a53d745ba8a442de6e186e39369960c1c6247f078b6b1068fc0492357e125950"
TARBALL_URL['i686']="https://github.com/termux/proot-distro/releases/download/v2.8.0/alpine-i686-pd-v2.8.0.tar.xz"
TARBALL_SHA256['i686']="c662fe8b52eee65e164475c36e88ca9393ac7e5ec7faa7119e8613c21f55475a"
TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v2.8.0/alpine-x86_64-pd-v2.8.0.tar.xz"
TARBALL_SHA256['x86_64']="ca8d1b086e9bc6c76092ee6f272f3ae65475fc0b068ffe7bfdfb0621ec1dea41"

# Additional configuration for this build is defined by the following function.

distro_setup() {
	run_proot_cmd echo "proot-distro-custom - https://github.com/IsDefinitelyUser/proot-distro-custom"
	run_proot_cmd echo "Alpine Linux (edge) - Developer Build"
	run_proot_cmd echo "Updating & upgrading packages."
	run_proot_cmd apk update && apk upgrade
	run_proot_cmd apk add bash-completion git php
	run_proot_cmd apk add github-cli libgit2 gitui
}