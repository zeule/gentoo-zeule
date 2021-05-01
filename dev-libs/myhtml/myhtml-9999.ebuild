# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

SLOT=0
LICENSE="LGPL-2.1"
HOMEPAGE="https://github.com/lexborisov/myhtml/"
DESCRIPTION="Fast C/C++ HTML 5 Parser. Using threads."
EGIT_REPO_URI="https://github.com/lexborisov/myhtml.git"
IUSE="static-libs +threads"

src_configure() {
	mycmakeargs=(
		-DMyHTML_INSTALL_HEADER=ON
		-DMyHTML_BUILD_WITHOUT_THREADS=$(usex threads OFF ON)
		-DMyCORE_BUILD_WITHOUT_THREADS=$(usex threads OFF ON)
		-DMyHTML_BUILD_SHARED=ON
		-DMyHTML_BUILD_STATIC=$(usex static-libs ON OFF)
	)
	cmake_src_configure
}
