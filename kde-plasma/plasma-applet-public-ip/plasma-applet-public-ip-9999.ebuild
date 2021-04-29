EAPI=6
SLOT=5
KDE_AUTODEPS="false"
inherit kde5
EGIT_REPO_URI="https://github.com/Davide-sd/ip_address.git"
HOMEPAGE="https://github.com/Davide-sd/ip_address.git"
KEYWORDS="~amd64"

DEPEND="kde-frameworks/plasma
        dev-qt/qtdeclarative:5
        dev-qt/qtgui:5
        dev-qt/qtgraphicaleffects:5
	dev-qt/qtlocation:5
"
RDEPEND="${DEPEND}"


