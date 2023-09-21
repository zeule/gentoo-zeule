# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 git-r3 udev

DESCRIPTION="Interface to the IVSHMEM device for Looking Glass in VM"
HOMEPAGE="https://looking-glass.io/docs/B6/module/#kernel-module"
EGIT_REPO_URI="https://github.com/gnif/LookingGlass.git"
EGIT_SUBMODULES=( '-*' )

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${S}/module"

#MODULE_NAMES="kvmfr(hwmon:${S}:${S})"
#BUILD_TARGETS="modules"
#KVER="${KV_FULL}"

src_compile() {
	local modlist=(
		kvmfr
	)

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	insinto /etc/modprobe.d
	doins ${FILESDIR}/kvmfr.conf
	insinto "$(get_udevdir)"/rules.d
	doins ${FILESDIR}/99-kvmfr.rules
}
