# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT="0"

CRATES=""

inherit cargo flag-o-matic git-r3

DESCRIPTION="LaTeX Language Server"
HOMEPAGE="https://texlab.netlify.app"
EGIT_REPO_URI="https://github.com/latex-lsp/texlab"
RESTRICT="mirror"
LICENSE="Apache-2.0 BSD BSL-1.1 CC0-1.0 GPL-3+ ISC MIT MPL-2.0 ZLIB"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/rust-1.39.0"
RDEPEND=""

pkg_setup() {
	filter-flags "-flto*"
}

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
