EAPI="8"
SLOT=0

DESCRIPTION="Free Heroes of Might and Magic II (fheroes2) is a recreation of HoMM2 game engine."
HOMEPAGE="https://ihhub.github.io/fheroes2/"
LICENSE="GPL2"
KEYWORDS="~amd64"
IUSE="image tools"

inherit cmake git-r3

EGIT_REPO_URI="https://github.com/ihhub/fheroes2.git"

RDEPEND="media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	dev-games/libsmacker
	sys-libs/zlib
	image? ( media-libs/libpng )
"

src_configure() {
	mycmakeargs=(
		-DUSE_SYSTEM_LIBSMACKER=OFF
		-DUSE_SDL_VERSION=SDL2
		-DENABLE_IMAGE=$(usex image)
		-DFHEROES2_DATA=/usr/share/fheroes2
		-DENABLE_TOOLS=$(usex tools)
	)

	cmake_src_configure
}
