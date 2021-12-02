# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

inherit cmake git-r3 llvm

DESCRIPTION="Native library for dev-dotnet/clangsharp"
HOMEPAGE="https://github.com/dotnet/ClangSharp"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/dotnet/ClangSharp.git"

KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=sys-devel/clang-12:=
"
DEPEND=${RDEPEND}


src_configure() {
	mycmakeargs=(
		-DPATH_TO_LLVM=$(get_llvm_prefix)
	)
	cmake_src_configure
}
