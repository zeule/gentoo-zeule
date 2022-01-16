EAPI=7
SLOT=0

DESCRIPTION="API Support for your favorite torrent trackers."
HOMEPAGE="https://github.com/Jackett/Jackett"
EGIT_REPO_URI="https://github.com/Jackett/Jackett.git"
LICENSE="GPL-2"
KEYWORDS="~amd64"

DOTNET_COMPAT=( dotnetcore5_0 )

inherit git-r3 dotnet-core systemd

IUSE="systemd"

MY_PN="Jackett"

DEPEND="acct-user/jackett
"

RDEPEND="$DEPEND
!net-p2p/jackett-bin
"

# S="$S/src"

DOTNET_INSTALL_EXECUTABLES=(
	jackett
)

src_unpack() {
	git-r3_src_unpack
	# have to patch before src_prepare
	pushd "$S"
	eapply "$FILESDIR/remove-tray-project.patch"
	popd
	dotnet-core_src_unpack
}

src_install() {
	dotnet-core_src_install

	if use systemd; then
		systemd_dounit ${FILESDIR}/jackett.socket ${FILESDIR}/jackett.service
	fi
}
