# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://gitorious.org/openprefqt4/annulens-clone.git"
KEYWORDS="~x86 ~amd64"
inherit  qt4-r2 git-r3

DESCRIPTION="Open source implementation of European trick-taking game Preferans"
HOMEPAGE="http://openpref.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-4.7:4
	>=dev-qt/qtgui-4.7:4"

RDEPEND="${DEPEND}"

#DOCS=( AUTHORS BUILDING CHANGELOG FAQ README.md )

src_configure() {
	eqmake4
}

src_install() {
	qt4-r2_src_install
}
