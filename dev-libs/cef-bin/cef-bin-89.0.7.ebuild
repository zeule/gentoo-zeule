EAPI=7
SLOT=0

KEYWORDS="~amd64"
HOMEPAGE="https://bitbucket.org/chromiumembedded/cef/src/master/"
DESCRIPTION="Chromium Embedded Framework"

inherit cmake

CHROMIUM_PV="89.0.4389.72"
GIT_PV="gb5952bd"
MY_PV="${PV}+${GIT_PV}+chromium-${CHROMIUM_PV}"

SRC_URI="https://cef-builds.spotifycdn.com/cef_binary_${PV}%2B${GIT_PV}%2Bchromium-${CHROMIUM_PV}_linux64_minimal.tar.bz2"

S="$WORKDIR/cef_binary_${MY_PV}_linux64_minimal"

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
	doins -r Resources
	dolib.so "${BUILD_DIR}"/libcef_dll_wrapper/libcef_dll_wrapper.so

	mv include cef && doheader -r cef
	doins -r cmake
	doins -r libcef_dll

	dodoc README.txt LICENSE.txt
	dosym /usr/include/cef /opt/cef/include
}
