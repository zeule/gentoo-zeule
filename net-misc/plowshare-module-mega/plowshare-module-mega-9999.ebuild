# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="mega.co.nz module for Plowshare"
HOMEPAGE="https://github.com/mcrapet/plowshare-module-mega"
EGIT_REPO_URI="https://github.com/mcrapet/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE=""

CDEPEND="dev-libs/openssl
	>=net-misc/plowshare-9999"

RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}"

PATCHES=(
	"$FILESDIR"/openssl-1.1.patch
)

#S=${WORKDIR}/${MY_P}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_test() {
	# Disable tests because all of them need a working Internet connection.
	:
}

src_install() {
	default

	mkdir -p "${D}"/usr/share/plowshare/modules.d/
	mv "${D}/usr/share/plowshare/modules/" "${D}/usr/share/plowshare/modules.d/mega/" || die "move failed"
#	mv "${D}/usr/share/plowshare/modules/mega.sh" "${D}/usr/share/plowshare/modules.d/mega" || die "move failed"
}
