# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

inherit git-r3 mono-env

DESCRIPTION="Clang bindings for .NET and Mono written in C#"
HOMEPAGE="https://github.com/microsoft/ClangSharp"
SRC_URI="" # mono-env resets it

EGIT_REPO_URI="https://github.com/microsoft/ClangSharp.git"

LICENSE="NCSA"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/dotnet-sdk"
RDEPEND="$DEPEND
	dev-dotnet/libclangsharp
"

RESTRICT="network-sandbox"

PATCHES=(
	"$FILESDIR"/ClangSharp-fix-name-mangling.patch
)

BUILD_DIR=${WORKDIR}/${P}_build
NET_RUNTIME="net5.0"

export XDG_DATA_HOME="${T}/data"
export LC_ALL=C
export XDG_CONFIG_HOME="${T}"
#export HOME="${T}"

src_prepare() {
	default
	dotnet restore
}

src_compile() {
	dotnet build -c Release -f $NET_RUNTIME
}

src_install() {
	dotnet publish -c Release -f $NET_RUNTIME -o "$BUILD_DIR"

	# remove unit test assemblies
	rm "$BUILD_DIR"/Microsoft.TestPlatform.*
	rm "$BUILD_DIR"/Microsoft.VisualStudio.CodeCoverage.*
	rm "$BUILD_DIR"/Microsoft.VisualStudio.TestPlatform.*
	rm "$BUILD_DIR"/xunit.*

	mkdir -p "${D}/opt/${PN}"
	cp -R -t "${D}/opt/${PN}" "$BUILD_DIR"/*
	mkdir -p "${D}/usr/bin"
	cat <<- EOF > "${D}/usr/bin/ClangSharpPInvokeGenerator"
	#!/bin/sh
	/opt/${PN}/ClangSharpPInvokeGenerator "\$@"
	EOF
	chmod +x "${D}/usr/bin/ClangSharpPInvokeGenerator"
}
