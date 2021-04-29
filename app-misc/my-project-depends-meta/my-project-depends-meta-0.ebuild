EAPI=7
SLOT=0

DESCRIPTION="My set of packages to pin depemdemcies for the projects I'm working on"

KEYWORDS="~x86 ~amd64"
IUSE="glk renpy +twee"

DEPEND=""
RDEPEND=""

RDEPEND+="glk? ( games-engines/git )
	renpy? ( games-engines/renpy )
	twee? ( || ( dev-games/tweego dev-games/tweego )
		dev-games/tweexx
	)
	dev-libs/cef-bin
"
