# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="8"
SLOT=0

inherit git-r3 cmake

#EGIT_REPO_URI="https://github.com/CJCombrink/SpellChecker-Plugin.git"
EGIT_REPO_URI="https://github.com/zeule/qtc-SpellChecker-Plugin.git"
EGIT_BRANCH="feature/check-identifiers"

DESCRIPTION="SpellChecker Plugin for Qt Creator"
HOMEPAGE="https://github.com/CJCombrink/SpellChecker-Plugin"
LICENSE="LGPL-3"

RDEPEND=">=dev-qt/qt-creator-14[plugin-dev]
	app-text/hunspell"
BDEPEND="$RDEPEND"
