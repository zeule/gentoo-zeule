EAPI=7
SLOT=0
inherit git-r3
LICENSE="BSD"
KEYWORDS="~ia64 ~mips ~ppc ~sparc ~x86 ~amd64 ~ppc-macos"

DESCRIPTION="Story formats for Tweego"
HOMEPAGE="https://www.motoslave.net/tweego/"
IUSE="+external-sugarcube"
EGIT_REPO_URI="https://github.com/klembot/twinejs.git"
EGIT_REPO_BRANCH="main"

PDEPEND="external-sugarcube? (
	dev-games/twine-format-sugarcube:1
	dev-games/twine-format-sugarcube:2
)"

#S="${WORKDIR}/story-formats"


src_prepare() {
	default
	use external-sugarcube && rm -r story-formats/sugarcube-2*
	use external-sugarcube && rm -r story-formats/sugarcube-1*
}

src_compile() {
	:;
}

src_install() {
	cd story-formats
	for sf in *; do
		sdf=$(echo $sf | sed -E 's/([a-z]+-[0-9]).*/\1/')
		cd $sf
		insinto /usr/share/tweego/storyformats/$sdf
		doins -r *
		cd ..
	done
}
