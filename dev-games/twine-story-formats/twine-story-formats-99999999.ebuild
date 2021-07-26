# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

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

S="${S}/public/story-formats"

src_prepare() {
	default
	use external-sugarcube && rm -r sugarcube-2*
	use external-sugarcube && rm -r sugarcube-1*
}

src_compile() {
	:;
}

src_install() {
	for sf in *; do
		sdf=$(echo $sf | sed -E 's/([a-z]+-[0-9]).*/\1/')
		cd $sf
		insinto /usr/share/tweego/storyformats/$sdf
		doins -r *
		cd ..
	done
}
