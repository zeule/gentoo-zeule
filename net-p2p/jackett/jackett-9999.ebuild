EAPI=7
SLOT=0

DESCRIPTION="API Support for your favorite torrent trackers."
HOMEPAGE="https://github.com/Jackett/Jackett"
EGIT_REPO_URI="https://github.com/Jackett/Jackett.git"
LICENSE="GPL-2"
KEYWORDS="~amd64"

RESTRICT="network-sandbox"

inherit git-r3 mono-env systemd
SRC_URI="" # mono-env resets it

IUSE="systemd"

MY_PN="Jackett"

DEPEND=">=dev-dotnet/dotnetcore-sdk-bin-3.1
acct-user/jackett
"

RDEPEND="$DEPEND
!net-p2p/jackett-bin
"

BUILD_DIR=${WORKDIR}/${P}_build

export XDG_DATA_HOME="${T}/data"
export LC_ALL=C
export XDG_CONFIG_HOME="${T}"
#export HOME="${T}"

src_compile() {
	dotnet build -c Release -o ${BUILD_DIR} src/Jackett.Server/Jackett.Server.csproj
	# remove dotnetcore assemblies that are available anyway from the dotnetcore package
#	rm ${BUILD_DIR}/System.*
#	rm ${BUILD_DIR}/Microsoft.*
}

src_install() {
	insinto /opt/jackett
	doins -r "${BUILD_DIR}"/*
	exeinto /opt/jackett
	doexe "${BUILD_DIR}"/jackett
	if use systemd; then
		systemd_dounit ${FILESDIR}/jackett.socket ${FILESDIR}/jackett.service
	fi
}
