EAPI=7
SLOT=0
KEYWORDS="~amd64 ~x86"
LICENSE="BSD"
HOMEPAGE="https://www.motoslave.net/tweego/"
DESCRIPTION="Tweego is a free (gratis and libre) command line compiler for Twine/Twee story formats, written in Go."

SRC_URI="amd64? ( https://www.motoslave.net/tweego/download.php/tweego-1.3.0-linux-x64.zip )
	x86? ( https://www.motoslave.net/tweego/download.php/tweego-1.3.0-linux-x86.zip )
"

IUSE="+story-formats"

RDEPEND+="story-formats? ( dev-games/twine-story-formats )
"

S="${WORKDIR}"

src_install() {
	if use story-formats; then
		dobin ${FILESDIR}/tweego
		exeinto /usr/libexec/
		doexe tweego
	else
		dobin tweego
	fi
	dodoc LICENSE
}
