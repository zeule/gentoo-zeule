# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit qmake-utils git-r3
DESCRIPTION="Cross-platform, easy-to-use and open-source media converter GUI using FFmpeg as its backend"
HOMEPAGE="http://qwinff.github.io/"
EGIT_REPO_URI="https://github.com/evsh/qwinff.git"
LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="libnotify"

#RESTRICT="strip"
DEPEND="dev-qt/qtgui:5
	libnotify? ( x11-libs/libnotify )
"

RDEPEND="${DEPEND}
	virtual/ffmpeg
	media-sound/sox
"

#S=${WORKDIR}/${P}/src

src_configure() {
	cd src
	local myconfig
	use libnotify && myconfig+="CONFIG+=libnotify"
	export DATA_PATH=\\\"/usr/share/${PN}\\\"
	eqmake5 $myconfig
}

# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
# For EAPI < 2 src_compile runs also commands currently present in
# src_configure. Thus, if you're using an older EAPI, you need to copy them
# to your src_compile and drop the src_configure function.
src_compile() {
	pushd src
	default
	$(qt5_get_bindir)/lrelease qwinff.pro
	popd
}

src_install() {
	dobin src/qwinff
	insinto /usr/share/${PN}
	doins src/presets.xml src/constants.xml
	insinto /usr/share/${PN}/translations
	doins src/translations/*.qm
	insinto /usr/share/applications/
	doins qwinff.desktop
	insinto /usr/share/pixmaps
	doins src/icons/qwinff_256x256.png
	doman man/qwinff.1
}
