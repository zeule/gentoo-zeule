EAPI=7
SLOT=5
KDE_AUTODEPS="false"
inherit ecm
EGIT_REPO_URI="https://github.com/kotelnik/plasma-applet-thermal-monitor"
HOMEPAGE="https://github.com/kotelnik/plasma-applet-thermal-monitor"
KEYWORDS="~amd64"

DEPEND="kde-frameworks/plasma
        dev-qt/qtdeclarative:5
        dev-qt/qtgui:5
        dev-qt/qtgraphicaleffects:5
"
RDEPEND="${DEPEND}"
