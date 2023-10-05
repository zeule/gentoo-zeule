EAPI=8
SLOT=0
KEYWORDS="~amd64"
HOMEPAGE="https://github.com/PapirusDevelopmentTeam/materia-kde"
DESCRIPTION="Port of the GTK theme Materia for Plasma 5 desktop"

inherit git-r3
EGIT_REPO_URI="https://github.com/PapirusDevelopmentTeam/materia-kde"

RDEPEND="x11-themes/kvantum
	x11-themes/papirus-icon-theme
"
