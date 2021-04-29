# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EGIT_REPO_URI="https://github.com/instead-hub/instead.git"

inherit games cmake-utils
[[ ${PV} == *9999* ]] && inherit git-r3

DESCRIPTION="INterpreter for Simple TExt ADventures"
HOMEPAGE="http://instead.syscall.ru/"
[[ ${PV} == *9999* ]] || \
SRC_URI="mirror://sourceforge/${PN}/${PV}/${PN}_${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="gtk gtk3 iconv"
REQUIRED_USE="^^ ( gtk gtk3 )"

DEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	media-libs/libsdl2
	media-libs/sdl2-mixer
	media-libs/sdl2-image
	media-libs/sdl2-ttf
	gtk? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 )
	iconv? ( virtual/libiconv )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with gtk GTK2)
		$(cmake-utils_use_with gtk3)
		$(cmake-utils_use_with iconv)
		"-DWITH_SDL2=ON"
	)

	cmake-utils_src_configure
}


src_install() {
	cmake-utils_src_install
	prepgamesdirs
}

