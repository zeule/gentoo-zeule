# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic games

MY_P=${P//./}
DESCRIPTION="An interpreter for the Glulx Virtual Machine"
HOMEPAGE="http://www.eblong.com/zarf/glulx/"
SRC_URI="mirror://ifarchive/programming/glulx/interpreters/${PN}/${MY_P}.tar.gz"

LICENSE="Zarf"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="profile"

RDEPEND="dev-games/glkloader"
DEPEND="${RDEPEND}
	dev-games/glk-headers"
RDEPEND="${RDEPEND}
	profile? ( =dev-lang/python-2* )"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

#	epatch "${FILESDIR}"/glulxe-0.4.6-user-CFLAGS.patch
	epatch "${FILESDIR}"/glulxe-0.5.1-gargoyle.patch
	sed -i -e "s,@PV@,${PV}," unixstrt.c || die "sed failed"

	sed -i \
		-e '1s,/usr/bin/python,/usr/bin/python2,' \
		-e 's/profile-analyze\.py/glulxe-&/g' \
		profile-analyze.py || die "sed failed"
}

src_compile() {
	use profile && append-flags -DVM_PROFILING=1
	emake \
		GLKINCLUDEDIR=/usr/include/glk \
		GLKMAKEFILE=Make.glkloader \
		|| die "emake failed"
}

src_install() {
	dogamesbin glulxe || die "dogamesbin failed"
	if use profile; then
		newgamesbin profile-analyze.py glulxe-profile-analyze.py || die "newgamesbin failed"
	fi

	dodoc README || die "dodoc failed"
	prepgamesdirs
}
