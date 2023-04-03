# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}-unix-${PV}"

DESCRIPTION="Open-source OS-independent implementation of the ACPI specification"
HOMEPAGE="https://acpica.org/"
SRC_URI="https://acpica.org/sites/${PN}/files/${MY_P}.tar.gz"

LICENSE="ACPICA"
KEYWORDS="~amd64"

SLOT="0"

DOCS=(changes.txt)

S="$WORKDIR/${MY_P}"

src_compile() {
	emake NOWERROR=TRUE
}
