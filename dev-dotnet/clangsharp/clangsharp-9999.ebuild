# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
SLOT=0

DOTNET_COMPAT=( dotnetcore7_0 )

inherit git-r3 dotnet-core

DESCRIPTION="Clang bindings for .NET and Mono written in C#"
HOMEPAGE="https://github.com/dotnet/ClangSharp"

EGIT_REPO_URI="https://github.com/dotnet/ClangSharp.git"
PLOCALES="cs de es fr it ja ko pl pt-BR ru tr zh-Hans zh-Hant"

LICENSE="MIT"

KEYWORDS="~amd64"

DEPEND="${DOTNET_DEPS}"
RDEPEND="dev-dotnet/libclangsharp
"

DOTNET_INSTALL_EXECUTABLES=(
	ClangSharpPInvokeGenerator
)

DOTNET_PROJECTS=(
	sources/ClangSharpPInvokeGenerator/ClangSharpPInvokeGenerator.csproj
)

DOTNET_CLEANUP=(
)

src_unpack() {
	git-r3_src_unpack
	dotnet-core_src_unpack
}
