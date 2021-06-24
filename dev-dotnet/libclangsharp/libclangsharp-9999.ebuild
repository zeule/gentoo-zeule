# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

inherit cmake git-r3

DESCRIPTION="Native library for ClangSharp"
HOMEPAGE="https://github.com/microsoft/ClangSharp"

EGIT_REPO_URI="https://github.com/zeule/ClangSharp.git"
EGIT_BRANCH="feature/install-native-lib"

LICENSE="NCSA"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/clang:12"
RDEPEND="$DEPEND"

src_configure() {
	mycmakeargs=(
		-DPATH_TO_LLVM=/usr/lib/llvm/12
	)
	cmake_src_configure
}
