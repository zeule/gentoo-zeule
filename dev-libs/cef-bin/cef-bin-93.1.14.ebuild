# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

KEYWORDS="~amd64"
HOMEPAGE="https://bitbucket.org/chromiumembedded/cef/src/master/"
DESCRIPTION="Chromium Embedded Framework"
LICENSE="BSD"

inherit cmake

CHROMIUM_PV="93.0.4577.82"
GIT_PV="gf38ce34"
MY_PV="${PV}+${GIT_PV}+chromium-${CHROMIUM_PV}"
MY_BASE_FN="cef_binary_${PV}%2B${GIT_PV}%2Bchromium-${CHROMIUM_PV}"

IUSE="+minimal"

SRC_URI="!minimal? ( https://cef-builds.spotifycdn.com/${MY_BASE_FN}_linux64.tar.bz2 )
	minimal? ( https://cef-builds.spotifycdn.com/${MY_BASE_FN}_linux64_minimal.tar.bz2 )"

DOCS=( README.txt LICENSE.txt )
S="$WORKDIR/cef_binary_${MY_PV}_linux64"

pkg_setup() {
	use minimal && export S="${S}_minimal"
}

src_prepare() {
	cmake_comment_add_subdirectory test
	cmake_src_prepare
}

src_configure() {
	cd libcef_dll
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	into /opt/cef
	insinto /opt/cef

	doins -r Release
	use minimal || doins -r Debug
	doins -r Resources
	dolib.so "${BUILD_DIR}"/libcef_dll_wrapper/libcef_dll_wrapper.so

	mv include cef && doheader -r cef
	doins -r cmake
	doins -r libcef_dll

	einstalldocs
	dosym ../../usr/include/cef opt/cef/include
}
