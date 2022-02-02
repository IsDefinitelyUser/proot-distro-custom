# Do not modify this file. All changes will be discarded on the next
# package update.

# Default value is set by proot-distro script and is equal to the CPU
# architecture of your device. You can set this to a custom value to
# force use emulation mode (QEMU user).
# Valid values are: aarch64, arm, i686, x86_64.
DISTRO_ARCH=arm

# Name of distribution.
DISTRO_NAME="JuNest Arch Linux"

# Optional comment for distribution.
DISTRO_COMMENT="Arch Linux with JuNest"

# How much path components should be stripped when extracting rootfs tarball.
# The default is "1" which means to omit the root component.
#TARBALL_STRIP_OPT=1

# TARBALL_URL is a Bash associative array containing rootfs URLs for specified
# CPU architectures. You must specify at least one.
TARBALL_URL['arm']="https://github.com/termux/proot-distro/releases/download/v1.10.1/archlinux-arm-pd-v1.10.1.tar.xz"
# SHA-256 checksum for the given tarball. You must specify checksum for each
# defined tarball.
TARBALL_SHA256['arm']="5b35f8158d6c37b9e6cb13e1753afd5c2b480d6297b73a39b24c2065a2931f67"

# This function defines any additional steps that should be executed during
# installation. You can use "run_proot_cmd" to execute a given command in
# proot environment.
distro_setup() {
	run_proot_cmd echo && echo "JuNEST – Arch Linux – proot-distro" && echo
	run_proot_cmd pacman --noconfirm -Syu
	run_proot_cmd pacman -Syu --ignore sudo base-devel
	run_proot_cmd pacman -S --noconfirm git arch-install-scripts haveged curl wget tar
	run_proot_cmd echo && echo "Package installation done."
	run_proot_cmd mkdir -p ~/.local/share
	run_proot_cmd git clone https://github.com/fsquillace/junest.git ~/.local/share/junest
	run_proot_cmd touch ~/.bashrc
	run_proot_cmd cp ~/.bashrc ~/.bashrc.bak
	run_proot_cmd echo 'export PATH="~/.local/share/junest/bin:$PATH"' > ~/junest-path-env.txt
	run_proot_cmd tee -a .bashrc < ~/junest-path-env.txt
	run_proot_cmd rm ~/junest-path-env.txt
	run_proot_cmd echo 'export PATH="$PATH:~/.junest/usr/bin_wrappers"' > ~/junest-wrapper-env.txt
	run_proot_cmd tee -a .bashrc < ~/junest-wrapper-env.txt
	run_proot_cmd rm ~/junest-wrapper-env.txt
	run_proot_cmd echo 'export JUNEST_ARGS="proot"' > ~/sjunest-args.txt
	run_proot_cmd tee -a .bashrc < junest-args.txt
	run_proot_cmd rm ~/junest-args.txt
	run_proot_cmd export PATH="~/.local/share/junest/bin:$PATH"
	run_proot_cmd JUNEST_HOME="~/.junest" && export JUNEST_HOME
	run_proot_cmd export PATH="$PATH:~/.junest/usr/bin_wrappers"
	run_proot_cmd JUNEST_ARGS="proot" && export JUNEST_ARGS
#	run_proot_cmd mkdir package-query && cd package-query
#	run_proot_cmd wget https://aur.archlinux.org/packages/pa/package-query/PKGBUILD
#	run_proot_cmd makepkg -fsc
#	run_proot_cmd pacman -U package-query.*.xz
	run_proot_cmd junest setup
	run_proot_cmd junest build
	run_proot_cmd echo "Run the following command to setup Junest image builder:"
	run_proot_cmd echo "cd /sdcard/Files/PATH/TO/DIR" && echo "curl -k https://raw.githubusercontent.com/fsquillace/junest-builder/master/setup_builder.sh | bash"
}
