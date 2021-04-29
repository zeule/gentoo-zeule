EAPI=7
SLOT=5

inherit git-r3 ecm

DESCRIPTION="Material-ish window decoration theme for KWin, with LIM, based on zzag's original design."
EGIT_REPO_URI="https://github.com/Zren/material-decoration.git"
IUSE=""

CDEPEND="kde-plasma/kdecoration"
DEPEND="$CDEPEND"
RDEPEND="$CDEPEND"
