# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod

DESCRIPTION="A reverse engineering driver for the Clevo P15SM/P17SM/P150SM/P157SM/P170SM/P177SM backlight keyboard, by Christoph Jaeger"
HOMEPAGE="http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d"
SRC_URI="http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=76&h=e1c3a51c297ded51bbddfac915ec65a050f576ca&s=da97045136775d797dba92988670cc65bbfe88d7 -> ${PN}-${PV}.src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/linux-sources
	sys-kernel/linux-headers"
RDEPEND=""

MODULE_NAMES="tuxedo-wmi(wmi:${S}/src)"
#S="${S}/src"

pkg_pretend() {
	CONFIG_CHECK="ACPI_WMI"
	check_extra_config
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_TARGETS="all"
}
