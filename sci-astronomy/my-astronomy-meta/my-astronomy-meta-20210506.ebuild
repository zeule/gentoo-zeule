EAPI=7
KEYWORDS="amd64"
SLOT=0

DESCRIPTION="My meta package for astronomy-related software"
LICENSE="metapackage"

IUSE="comets magnetosphere"

RDEPEND="media-libs/cimg
	comets? ( media-gfx/meshlab
		media-gfx/blender )
	magnetosphere? ( dev-python/spacepy )
"
