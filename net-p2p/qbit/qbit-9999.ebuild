# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
KEYWORDS="~amd64"
inherit cmake gnome2-utils xdg-utils

DESCRIPTION="BitTorrent client in C++ and Qt"
HOMEPAGE="https://www.qbittorrent.org/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/evsh/qbit.git"
else
	MY_P=${P/_}
	SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.xz"
	S=${WORKDIR}/${MY_P}
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+dbus debug jackett plasma webui +X"
REQUIRED_USE="dbus? ( X ) plasma? ( X )"

RDEPEND="
	!net-p2p/qbittorrent
	>=dev-libs/boost-1.62.0-r1:=
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtxml:5
	>=net-libs/libtorrent-rasterbar-1.0.6:0=
	sys-libs/zlib
	dbus? ( dev-qt/qtdbus:5 )
	X? (
		dev-qt/qtgui:5
		dev-qt/qtsvg:5
		dev-qt/qtwidgets:5
	)"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	virtual/pkgconfig"

PDEPEND="jackett? ( || ( net-p2p/jackett net-p2p/jackett-bin ) )
"

DOCS=( AUTHORS Changelog CONTRIBUTING.md README.md TODO )
#PATCHES=( "${FILESDIR}/${PN}-4.0.4-werror.patch" )

src_configure() {
	local mycmakeargs=(
		-DDBUS=$(usex dbus)
		-DGUI=$(usex X)
		-DPLASMA_INTEGRATION=$(usex plasma)
		-DWEBUI=$(usex webui)
	)
	cmake_src_configure
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
