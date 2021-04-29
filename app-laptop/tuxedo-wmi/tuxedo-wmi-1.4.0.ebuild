# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod

DESCRIPTION="A reverse engineering driver for the Clevo P15SM/P17SM/P150SM/P157SM/P170SM/P177SM backlight keyboard, by Christoph Jaeger"
HOMEPAGE="http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d"
SRC_URI="http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=262&h=98b12b8ddff00c49706504583dbaf5edb1ec3980&s=9c60706f6a2280ef42ebb52f264bbc7539d6af38 -> ${PN}-${PV}.src.tar.gz"

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
