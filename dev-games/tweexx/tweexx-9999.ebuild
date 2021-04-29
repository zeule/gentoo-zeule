# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

DESCRIPTION="Twee compiler in C++"
HOMEPAGE="https://gitlab.com/ezsh/tweexx"
LICENSE="BSD-2"
KEYWORDS="~amd64"

EGIT_REPO_URI="https://gitlab.com/ezsh/tweexx.git"

inherit git-r3 cmake

IUSE="+decompile +file-watch +tweego-compat"

CDEPEND="dev-libs/spdlog
	dev-libs/jsoncpp
	dev-libs/boost
	decompile? ( dev-libs/gumbo )
	file-watch? ( dev-libs/efsw )
"

DEPEND="$CDEPEND"
RDEPEND="$CDEPEND"

RESTRICT="network-sandbox"

src_configure() {
	mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DTWINE_STORYFORMAT_DIRS=/usr/share/tweego/storyformats
		$(cmake_use_find_package decompile Gumbo)
		$(cmake_use_find_package file-watch efsw)
		-DBUILD_TWEEXX=$(usex tweego-compat)
	)
	cmake_src_configure
}
