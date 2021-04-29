# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs multilib games

MY_P=${P//./}
DESCRIPTION="Fast interpreter for the Glulx VM"
HOMEPAGE="http://www.ifarchive.org/indexes/if-archiveXprogrammingXglulxXinterpretersXgit.html http://www.diden.net/if/git/"
SRC_URI="mirror://ifarchive/programming/glulx/interpreters/${PN}/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-games/glkloader"
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-games/glk-headers"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/git-1.2.2-LDFLAGS.patch
	epatch "${FILESDIR}"/git-1.2.2-gargoyle.patch
}

src_compile() {
	emake CC=$(tc-getCC) OPTIONS="-DUSE_INLINE ${CFLAGS}" LINKLIBS=-lm \
		GLKLIBDIR=/usr/$(get_libdir) GLKINCLUDEDIR=/usr/include/glk GLK=glkloader || die "emake failed"
}

src_install() {
	newgamesbin git glulxgit || die "newgamesbin failed"
	dodoc README.txt || die "dodoc failed"
	prepgamesdirs
}
