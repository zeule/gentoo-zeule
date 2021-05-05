EAPI=7
inherit eutils qmake-utils git-r3 systemd

DESCRIPTION="Qt application to visually control the keyboard lighting using the sysfs interface."
HOMEPAGE="https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi"
EGIT_REPO_URI="https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND="dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}
	app-laptop/clevo-xsm-wmi-module
"

S=${S}/utility

src_configure() {
	eqmake5
}

src_install() {
	dobin clevo-xsm-wmi
	use systemd && systemd_dounit systemd/clevo-xsm-wmi.service
}
