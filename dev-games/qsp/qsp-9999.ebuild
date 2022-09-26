# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
inherit git-r3 cmake
DESCRIPTION="Quest Soft Player (QSP) Library"
HOMEPAGE="https://github.com/QSPFoundation/qsp"
LICENSE="LGPL-2"

RDEPEND="dev-libs/oniguruma"
DEPEND="$RDEPEND"

EGIT_REPO_URI="https://github.com/QSPFoundation/qsp.git"

src_configure() {
	mycmakeargs=(
		-DUSE_INSTALLED_ONIGURUMA=ON
	)
	cmake_src_configure
}
