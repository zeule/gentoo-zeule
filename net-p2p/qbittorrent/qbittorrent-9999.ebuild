# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="BitTorrent client in C++ and Qt"
HOMEPAGE="https://www.qbittorrent.org/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/qBittorrent.git"
else
	SRC_URI="https://github.com/qbittorrent/qBittorrent/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm ~ppc64 x86"
	S="${WORKDIR}/qBittorrent-release-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+dbus debug +jackett webui +X"
REQUIRED_USE="dbus? ( X )"

RDEPEND="
	>=dev-libs/boost-1.62.0-r1:=
	dev-qt/qtbase:6[dbus?,network,ssl,xml]
	>=net-libs/libtorrent-rasterbar-1.2.11:0=
	sys-libs/zlib
	jackett? ( www-apps/jackett )
	X? (
		dev-libs/geoip
		dev-qt/qtbase:6[gui,widgets]
		dev-qt/qtsvg:6
	)"
DEPEND="${RDEPEND}
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig"

DOCS=( AUTHORS Changelog CONTRIBUTING.md README.md )
# PATCHES=( "${FILESDIR}/${PN}-4.0.4-werror.patch" )

src_configure() {
	local mycmakeargs=(
		-DDBUS=$(usex dbus)
		-DGUI=$(usex X)
		-DWEBUI=$(usex webui)
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
