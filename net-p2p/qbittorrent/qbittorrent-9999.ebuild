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
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5[ssl]
	>=dev-qt/qtsingleapplication-2.6.1_p20130904-r1[qt5(+),X?]
	dev-qt/qtxml:5
	>=net-libs/libtorrent-rasterbar-1.2.11:0=
	sys-libs/zlib
	dbus? ( dev-qt/qtdbus:5 )
	jackett? ( || ( net-p2p/jackett net-p2p/jackett-bin ) )
	X? (
		dev-libs/geoip
		dev-qt/qtgui:5
		dev-qt/qtsvg:5
		dev-qt/qtwidgets:5
	)"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	virtual/pkgconfig"

DOCS=( AUTHORS Changelog CONTRIBUTING.md README.md )
# PATCHES=( "${FILESDIR}/${PN}-4.0.4-werror.patch" )

src_configure() {
	local mycmakeargs=(
		-DSYSTEM_QTSINGLEAPPLICATION=ON
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
