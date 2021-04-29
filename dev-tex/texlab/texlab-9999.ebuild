EAPI=7
SLOT=0

DESCRIPTION="An implementation of the Language Server Protocol for LaTeX"
HOMEPAGE="https://texlab.netlify.app/ https://github.com/latex-lsp/texlab"

CRATES___="
async-trait-0.1.0
aovec-1.1.0
base64-0.12.0
bibutils-sys-0.1.0
byteorder-1.3.0
bytes-0.5.0
chashmap-2.2.0
citeproc
citeproc-db
citeproc-io
csl
fern-0.6.0
fnv-1.0.0
futures-0.3.0
html2md-0.2.0
image-0.23.0
itertools-0.9.0
#jsonrpc = { path = "crates/jsonrpc" }
#jsonrpc-derive = { path = "crates/jsonrpc_derive" }
lalrpop-util-0.18.0
log-0.4.0
lsp-types-0.74.1
nom-5.1.0
once_cell-1.4.0
petgraph-0.5.0
rayon-1.3.0
regex-1.3.0
serde-1.0.0
serde_json-1.0.0
serde_repr-0.1.0
structopt-0.3.0
tempfile-3.1.0
thiserror-1.0.0
titlecase-1.1.0
tokio-0.2.0
tokio-util-0.3.0
url-2.1.0
uuid-0.8.0
"

RESTRICT="network-sandbox"

inherit git-r3 cargo

#SRC_URI="https://github.com/latex-lsp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz $(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/latex-lsp/texlab.git"

IUSE="+citation"
KEYWORDS="~amd64 ~ppc64 ~x86"

RESTRICT="network-sandbox"
#use citation && CRATES="$CRATES
#"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_prepare() {
	default
}
