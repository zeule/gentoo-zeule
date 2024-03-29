# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Telegram connection manager for Telepathy."
HOMEPAGE="https://projects.kde.org/projects/playground/network/telepathy/telepathy-morse"
EGIT_REPO_URI="https://github.com/TelepathyQt/telepathy-morse"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	=net-libs/telegram-qt-9999
	=net-libs/telepathy-qt-9999
"

DOCS=( README.md )

src_configure() {
	local mycmakeargs=(
		-DENABLE_TESTS=OFF
		-DENABLE_TESTAPP=OFF
		-DENABLE_EXAMPLES=OFF
		-DDESIRED_QT_VERSION=5
	)
	cmake_src_configure
}
