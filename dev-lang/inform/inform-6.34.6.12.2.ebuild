# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_P="${PN}-$(ver_rs 2 -)"
DESCRIPTION="design system for interactive fiction"
HOMEPAGE="http://www.inform-fiction.org/"
SRC_URI="http://mirror.ifarchive.org/if-archive/infocom/compilers/inform6/source/${MY_P}.tar.gz"

LICENSE="Artistic-2 Inform"
SLOT="0"
KEYWORDS="amd64 ~ppc ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="emacs"
PDEPEND="emacs? ( app-emacs/inform-mode )"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i "s/PREFIX = \/usr\/local/PREFIX = \${EPREFIX}/g" Makefile || die
	default
}

src_install() {
	dobin inform
	doman inform.1
	dodoc VERSION
	docinto tutorial
	dodoc tutor/README tutor/*.inf
	mv "${ED}"/usr/share/${PN}/manual "${ED}"/usr/share/doc/${PF}/html
	rmdir "${ED}"/usr/share/inform/{include,module}
}
