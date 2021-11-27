# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"

inherit cmake xdg

DESCRIPTION="KLatexFormula is a program to easily get an image from a LaTeX formula"
HOMEPAGE="http://klatexformula.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="dbus static +tools +X"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	virtual/latex-base"

RDEPEND="${DEPEND}
	app-text/ghostscript-gpl"

PATCHES=(
	$FILESDIR/${PN}-4.1.0-fix-qpainterpath-include.patch
)

src_configure() {
	local mycmakeargs=(
		-DKLF_INSTALL_POST_UPDATEMIMEDATABASE=OFF
		-DKLF_LIBKLFTOOLS_STATIC=$(usex static ON OFF)
		-DKLF_LIBKLFBACKEND_AUTO_STATIC=$(usex static ON OFF)
		-DKLF_BUILD_TOOLS=$(usex tools ON OFF)
		-DKLF_USE_DBUS=$(usex dbus ON OFF)
		-DKLF_BUILD_GUI=$(usex X ON OFF)
	)
	cmake_src_configure
}
