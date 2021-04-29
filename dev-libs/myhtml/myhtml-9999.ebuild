
EAPI=6

inherit cmake-utils git-r3

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
	cmake-utils_src_configure
}

