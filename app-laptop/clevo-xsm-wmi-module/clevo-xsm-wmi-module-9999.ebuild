# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="Kernel module for keyboard backlighting of Clevo SM series notebooks"
HOMEPAGE="https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi"
EGIT_REPO_URI="https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/linux-sources
	sys-kernel/linux-headers"
RDEPEND=""

MODULE_NAMES="clevo-xsm-wmi(wmi:${S}/module)"
#S="${S}/module"

pkg_pretend() {
	CONFIG_CHECK="ACPI_WMI"
	check_extra_config
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_TARGETS="all"
}

src_prepare() {
	default
	sed -i -e 's/$(shell uname -r)/'${KV_FULL}'/' module/Makefile || die "sed failed"
}
