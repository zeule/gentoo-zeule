# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
inherit git-r3 qmake-utils
HOMEPAGE="https://github.com/rrockru/QtQGen"
DESCRIPTION="Editor for QSP games"
EGIT_REPO_URI="https://github.com/rrockru/QtQGen.git"

RDEPEND="dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/qtxml:5
"

DEPEND="${RDEPEND}"

src_configure() {
	eqmake5
}
