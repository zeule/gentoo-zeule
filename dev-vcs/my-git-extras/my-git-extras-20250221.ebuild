# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"

DESCRIPTION="Tiny git extras"
HOMEPAGE=""

IUSE=""

LICENSE="MIT"
KEYWORDS="~amd64 ~arm64 ~x64-macos"
SLOT="0"

RDEPEND="dev-vcs/git-extras"

S="$WORKDIR"

src_compile() {
	:;
}

src_install() {
	dobin $FILESDIR/git-rbu
	dobin $FILESDIR/git-stamp-fixes
}
