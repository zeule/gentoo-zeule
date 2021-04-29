EAPI=7
SLOT="5"

inherit qmake-utils git-r3
EGIT_REPO_URI="https://git.qt.io/rigustav/treeview.git"

DESCRIPTION="A QML TreeView control"
KEYWORDS="~amd64"

PATCHES=(
	${FILESDIR}/qtreeview.patch
)

src_configure() {
	eqmake5
}

src_compile() {
	emake
}

src_install() {
	INSTALL_ROOT="$D" make install || die 
}
