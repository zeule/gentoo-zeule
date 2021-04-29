EAPI=7
SLOT=0

DESCRIPTION="C++ cross-platform file system watcher and notifier"
HOMEPAGE="https://github.com/SpartanJ/efsw"
KEYWORDS="~amd64"

EGIT_REPO_URI="https://github.com/SpartanJ/efsw.git"

inherit git-r3 cmake

src_configure() {
	local mycmakeargs=(
		-DVERBOSE=OFF
		-DBUILD_SHARED_LIBS=ON
		-DBUILD_TEST_APP=OFF
	)

	cmake_src_configure
}
