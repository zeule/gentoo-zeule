EAPI=7
SLOT=0

DESCRIPTION="CSL processor in Rust"
HOMEPAGE="https://github.com/cormacrelf/citeproc-rs"
CRATES="
parking_lot_core-0.7.2
parking_lot-0.10.2
"

inherit cargo
SRC_URI="$(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/cormacrelf/citeproc-rs.git"

inherit git-r3

src_unpack() {
	git-r3_src_unpack
}
