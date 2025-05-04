EAPI="7"
SLOT="0"

DESCRIPTION="My set of games packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="action gog kde qsp steam wine"

DEPEND=""

RDEPEND="steam? ( games-util/steam-launcher
		games-util/esteam
		)
"

RDEPEND+="action? ( games-action/chromium-bsu
	games-simulation/openttd
	games-engines/openxcom
)
kde? ( kde-apps/knights
	kde-apps/kmines
	kde-apps/bovo
	kde-apps/kigo
	kde-apps/klines
	kde-apps/kreversi
	kde-apps/palapeli
	kde-apps/kpat
)
gog? ( games-strategy/fheroes2
	games-strategy/homm2-gold-data
)
"

RDEPEND+="wine? ( app-emulation/wine-staging
	app-emulation/winetricks
)
"

#Hardware
#RDEPEND+="games-util/sc-controller
#"

RDEPEND+="qsp? ( games-qsp/qqsp )
"
