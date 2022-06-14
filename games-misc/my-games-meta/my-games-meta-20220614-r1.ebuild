EAPI="7"
SLOT="0"

DESCRIPTION="My set of games packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="flash kde qsp steam qt4"

DEPEND=""

RDEPEND="steam? ( games-util/steam-client-meta
		games-util/steam-meta
		games-util/esteam
		)
"

RDEPEND+="games-action/chromium-bsu
games-simulation/openttd
games-engines/openxcom
qt4? ( games-engines/instead-launcher )
kde-apps/knights
kde-apps/kmines
kde-apps/bovo
kde-apps/kigo
kde-apps/klines
kde-apps/kreversi
kde-apps/palapeli
games-strategy/fheroes2
games-strategy/homm2-gold-data
"

RDEPEND+="virtual/wine[staging]
app-emulation/winetricks
"

#Fortune
RDEPEND+="games-misc/fortune-mod
games-misc/fortune-mod-all
"

RDEPEND+="kde? ( kde-apps/kpat )
"

#Hardware
#RDEPEND+="sys-apps/sc-controller
#"
RDEPEND+="qsp? ( dev-games/qqsp )
"

# misc
RDEPEND+="dev-games/qsp
flash? ( media-gfx/flash-player-projector )
"
