# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="09_27_24"

DESCRIPTION="Open-source OS-independent implementation of the ACPI specification"
HOMEPAGE="https://acpica.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/R${MY_PV}.tar.gz -> ${PN}-R${MY_PV}.tar.gz"

LICENSE="ACPICA"
KEYWORDS="~amd64"

SLOT="0"

DOCS=( documents/changes.txt documents/acpica-reference.pdf documents/aslcompiler.pdf documents/acpica-design.doc )

S="$WORKDIR/${PN}-R${MY_PV}"

src_compile() {
	emake NOWERROR=TRUE
}
