# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Qwen Code is a powerful command-line AI workflow tool adapted from Gemini CLI"
HOMEPAGE="https://github.com/QwenLM/qwen-code"
SRC_URI="
	amd64? ( https://github.com/QwenLM/${PN}/releases/download/v${PV}/${PN}-linux-x64.tar.gz )
	arm64? ( https://github.com/QwenLM/${PN}/releases/download/v${PV}/${PN}-linux-arm64.tar.gz )"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RDEPEND="
	net-libs/nodejs
	sys-apps/ripgrep
"

S="$WORKDIR/${PN}"

src_install() {
	rm -r lib/vendor/ripgrep || die

	insinto /opt/qwen-code
	doins -r lib

	fperms +x opt/qwen-code/lib/cli-entry.js

	dodir /opt/bin
	dosym ../qwen-code/lib/cli-entry.js /opt/bin/qwen
}
