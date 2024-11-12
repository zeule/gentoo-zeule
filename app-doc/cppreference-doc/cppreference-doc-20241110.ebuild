# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
SLOT="0"

LICENSE="GPL-3"
KEYWORDS="amd64 x86"

HOMEPAGE="https://github.com/PeterFeicht/cppreference-doc"
DESCRIPTION="C++ standard library reference"

SRC_URI="https://github.com/PeterFeicht/${PN}/releases/download/v${PV}/qch-book-${PV}.tar.xz"

RDEPEND="dev-qt/qttools:6[assistant]
"

S="$WORKDIR"

src_compile() {
	:
}

src_install() {
	insinto /usr/share/doc/${PN}
	docompress -x /usr/share/doc
	doins cppreference-doc-en-cpp.qch
}
