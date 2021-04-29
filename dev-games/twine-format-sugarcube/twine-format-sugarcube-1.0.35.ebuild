# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=1
LICENSE="BSD"
KEYWORDS="~ia64 ~mips ~ppc ~sparc ~x86 ~amd64 ~ppc-macos"

DESCRIPTION="Sugarcube story format for Tweego/Twine"
HOMEPAGE="http://www.motoslave.net/sugarcube/1/"
TWINE_VER="2.0"
SRC_URI="https://www.motoslave.net/sugarcube/download.php/1/sugarcube-${PV}-for-twine-${TWINE_VER}-local.zip"
RESTRICT="mirror"

S="${WORKDIR}/SugarCube-1"

src_install() {
	insinto /usr/share/tweego/storyformats/sugarcube-1
	doins -r *
}
