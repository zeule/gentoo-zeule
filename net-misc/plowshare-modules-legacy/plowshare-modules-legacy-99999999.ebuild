# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/plowshare/plowshare-20130520.ebuild,v 1.2 2013/06/15 23:49:56 voyageur Exp $

EAPI=5

inherit git-r3

DESCRIPTION="Plowshare legacy & unmaintained modules "
HOMEPAGE="https://github.com/mcrapet/plowshare-modules-legacy"
EGIT_REPO_URI="https://github.com/mcrapet/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE=""

RDEPEND=">=net-misc/plowshare-9999"
DEPEND="${RDEPEND}"

#S=${WORKDIR}/${MY_P}

src_compile() {
	:
}

src_test() {
	# Disable tests because all of them need a working Internet connection.
	:
}

src_install() {
	insinto /usr/share/plowshare/modules.d/legacy
	doins *
}
