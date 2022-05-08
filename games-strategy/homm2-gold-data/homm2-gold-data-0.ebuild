# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# For GOG install
MY_EXE="setup_heroes_of_might_and_magic_2_gold_1.01_(2.1)_(33438).exe"

DESCRIPTION="Data files for Heroes of Might and Magic 2: Gold"
HOMEPAGE="https://www.gog.com/game/heroes_of_might_and_magic_2_gold_edition"
# There are non-English GOG downloads but RTTR uses its own translations.
SRC_URI="${MY_EXE}"
LICENSE="GOG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="bindist fetch"

RDEPEND="
	games-strategy/fheroes2
"

BDEPEND="
	>=app-arch/innoextract-1.8
	app-arch/libarchive
"

S="${WORKDIR}/gog"
UNPACKED="${WORKDIR}/unpacked"
DOCS=( ${S}/manual.pdf )

pkg_nofetch() {
	einfo "Please buy and download ${MY_EXE} from:"
	einfo "  https://www.gog.com/game/heroes_of_might_and_magic_2_gold_edition"
	einfo "and move it to your distfiles directory."
}

src_unpack() {
	mkdir -p "${S}" || die
	einfo "Unpacking ${MY_EXE}."
	innoextract -e -m -s -d gog "${DISTDIR}/${MY_EXE}" || die
	cp /usr/share/doc/fheroes2-9999/homm2/extract_homm2_resources.sh.xz .
	unxz extract_homm2_resources.sh.xz || die
	mkdir ${UNPACKED}
	sh extract_homm2_resources.sh ${S} ${UNPACKED}
}


src_install() {
	insinto /usr/share/fheroes2
	doins -r ${UNPACKED}/*
	einstalldocs
}
