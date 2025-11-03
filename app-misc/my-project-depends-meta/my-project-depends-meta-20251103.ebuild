EAPI=7
SLOT=0

DESCRIPTION="My set of packages to pin depemdemcies for the projects I'm working on"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="glk renpy +twee dotnet"

DEPEND=""
RDEPEND=""

RDEPEND+="glk? ( games-engines/git )
	renpy? ( games-engines/renpy )
	twee? ( || ( dev-games/tweego dev-games/tweego-bin )
		dev-games/tweexx
	)
	dotnet? ( dev-dotnet/clangsharp )
"
