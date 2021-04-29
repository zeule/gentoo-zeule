EAPI=7
SLOT=0
LICENSE="BSD"
KEYWORDS="~ia64 ~mips ~ppc ~sparc ~x86 ~amd64 ~ppc-macos"

DESCRIPTION="Story formats for Tweego"
HOMEPAGE="https://www.motoslave.net/tweego/"
IUSE="+external-sugarcube"

SRC_URI="https://www.motoslave.net/tweego/download.php/story-formats-${PV}.zip"

PDEPEND="external-sugarcube? ( dev-games/twine-format-sugarcube )"

S="${WORKDIR}/story-formats"


src_prepare() {
	default
	use external-sugarcube && rm -r sugarcube-2
}

src_install() {
	insinto /usr/share/tweego/story-formats
	doins -r *
}
