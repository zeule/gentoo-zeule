# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=2
LICENSE="BSD"
KEYWORDS="~amd64 ~ia64 ~mips ~ppc ~sparc ~x86 ~ppc-macos"

DESCRIPTION="Sugarcube story format for Tweego/Twine"
HOMEPAGE="http://www.motoslave.net/sugarcube/2/"
TWINE_VER="2.1"
SRC_URI="https://github.com/tmedwards/sugarcube-2/releases/download/v${PV}/sugarcube-${PV}-for-twine-${TWINE_VER}-local.zip"
RESTRICT="mirror"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/tweego/storyformats/
	doins -r *
}
