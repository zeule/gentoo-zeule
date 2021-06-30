# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

DOTNET_COMPAT=( dotnetcore5_0 )

inherit git-r3 dotnet-core

DESCRIPTION="Clang bindings for .NET and Mono written in C#"
HOMEPAGE="https://github.com/microsoft/ClangSharp"

EGIT_REPO_URI="https://github.com/microsoft/ClangSharp.git"
PLOCALES="cs de es fr it ja ko pl pt-BR ru tr zh-Hans zh-Hant"

LICENSE="NCSA"

KEYWORDS="~amd64"

DEPEND="virtual/dotnet-sdk"
RDEPEND="$DEPEND
	dev-dotnet/libclangsharp
"

PATCHES=(
	"$FILESDIR"/ClangSharp-fix-name-mangling.patch
)

DOTNET_INSTALL_EXECUTABLES=(
	ClangSharpPInvokeGenerator
)

DOTNET_CLEANUP=(
	'Microsoft.CodeCoverage.*'
	'Microsoft.TestPlatform.*'
	'Microsoft.VisualStudio.Coverage.*'
	'Microsoft.VisualStudio.CodeCoverage.*'
	'Microsoft.VisualStudio.TestPlatform.*'
	'Microsoft.VisualStudio.TraceDataCollector.dll'
	'xunit.*'
	'testhost.dll'
	'*.UnitTests.dll'
	'*.UnitTests.*.json'
	"CodeCoverage"
	"InstrumentationEngine"
)

src_unpack() {
	git-r3_src_unpack
	dotnet-core_src_unpack
}
