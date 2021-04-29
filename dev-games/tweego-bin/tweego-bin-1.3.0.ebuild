# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
KEYWORDS="~amd64 ~x86"
LICENSE="BSD"
HOMEPAGE="https://www.motoslave.net/tweego/"
DESCRIPTION="Command line compiler for Twine/Twee story formats, written in Go."

SRC_URI="amd64? ( https://www.motoslave.net/tweego/download.php/tweego-1.3.0-linux-x64.zip )
	x86? ( https://www.motoslave.net/tweego/download.php/tweego-1.3.0-linux-x86.zip )
"

IUSE="+story-formats"

RDEPEND+="story-formats? ( dev-games/twine-story-formats )
"
DOCS=( LICENSE )

S="${WORKDIR}"

src_install() {
	if use story-formats; then
		dobin "${FILESDIR}"/tweego
		exeinto /usr/libexec/
		doexe tweego
	else
		dobin tweego
	fi
	einstalldocs
}
