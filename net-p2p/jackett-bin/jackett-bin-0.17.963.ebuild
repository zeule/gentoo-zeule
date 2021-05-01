EAPI=7
SLOT=0

DESCRIPTION="API Support for your favorite torrent trackers."
HOMEPAGE="https://github.com/Jackett/Jackett"
LICENSE="GPL-2"
KEYWORDS="~amd64"

inherit systemd

IUSE="systemd"

MY_PN="Jackett"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_PN}.Binaries.LinuxAMDx64.tar.gz -> ${MY_PN}.Binaries.LinuxAMDx64-${PV}.tar.gz"

DEPEND=">=dev-dotnet/dotnetcore-sdk-bin-3.1
acct-user/jackett
"

RDEPEND="$DEPEND
!net-p2p/jackett
"

S="${WORKDIR}/Jackett"

src_compile() {
	:;
}

src_install() {
	insinto /opt/jackett
	doins -r *
	exeinto /opt/jackett
	doexe jackett
	if use systemd; then
		systemd_dounit ${FILESDIR}/jackett.socket ${FILESDIR}/jackett.service
	fi
}
