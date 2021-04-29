EAPI=7
SLOT=5

inherit git-r3 ecm

DESCRIPTION="Material-ish window decoration theme for KWin."
EGIT_REPO_URI="https://github.com/Luwx/material-decoration.git"
IUSE=""

CDEPEND="kde-plasma/kdecoration"
DEPEND="$CDEPEND"
RDEPEND="$CDEPEND"



