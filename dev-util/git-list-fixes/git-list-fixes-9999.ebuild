# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Utility to list commits to be backported"
HOMEPAGE="https://github.com/zeule/git-list-fixes"

inherit cmake git-r3
EGIT_REPO_URI="https://github.com/zeule/git-list-fixes.git"

#S="${WORKDIR}/${P}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/libgit2"
DEPEND="${RDEPEND}"
BDEPEND="${RDEPEND}
	dev-cpp/cli11
"
