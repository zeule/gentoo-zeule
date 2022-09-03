# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 )
#inherit python-any-r1 cmake virtualx multibuild git-r3
inherit cmake git-r3

DESCRIPTION="Telegram binding for Qt"
HOMEPAGE="https://github.com/Kaffeine/telegram-qt"
EGIT_REPO_URI="https://github.com/Kaffeine/telegram-qt.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtnetwork:5
"

DOCS=( LICENSE.LGPL README.md )

src_configure() {
	local mycmakeargs=(
		-DENABLE_TESTS=OFF
		-DENABLE_TESTAPP=OFF
		-DENABLE_EXAMPLES=OFF
		-DDESIRED_QT_VERSION=5
	)
	cmake_src_configure
}
