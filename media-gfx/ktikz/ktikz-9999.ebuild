# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3 cmake

MY_P=ktikz_${PV}
DESCRIPTION="A Qt5-based editor for the TikZ language"
HOMEPAGE="https://github.com/evsh/ktikz"
EGIT_REPO_URI="https://github.com/zeule/ktikz.git"
EGIT_REPO_URI="https://github.com/fhackenberger/ktikz.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

CDEPEND="app-text/poppler:=[qt5]
	virtual/latex-base
	dev-texlive/texlive-latexextra
	dev-tex/pgf
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-qt/qtprintsupport:5
	kde-frameworks/kxmlgui:5
	kde-frameworks/ktexteditor:5
	kde-frameworks/kparts:5
	kde-frameworks/kiconthemes:5
	"
DEPEND="${CDEPEND}
	dev-qt/linguist-tools:5
	kde-frameworks/extra-cmake-modules
	kde-frameworks/kdoctools:5
	"

RDEPEND="${CDEPEND}"

DOCS="Changelog TODO"
#S=${WORKDIR}/${PN}

