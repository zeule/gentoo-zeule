# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
KEYWORDS="~amd64 ~x86"
LICENSE="BSD-2"
HOMEPAGE="https://www.motoslave.net/tweego/"
DESCRIPTION="Aa free (gratis and libre) command line compiler for Twine/Twee story formats, written in Go."

MY_PN="tweego"
MY_P="${MY_PN}-${PV}"

EGO_PN="github.com/tmedwards/tweego"
inherit golang-vcs golang-build
#RESTRICT="network-sandbox"

RDEPEND+="dev-games/twine-story-formats"

#S="${WORKDIR}"

src_compile() {
	set -- env GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath):${EGO_STORE_DIR}" \
		GOCACHE="${T}/go-cache" \
		go build -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"
}

src_install() {
	set -- env GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath):${EGO_STORE_DIR}" \
		go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"
	echo "$@"
	"$@" || die
	dobin "${FILESDIR}"/tweego
	exeinto /usr/libexec/
	doexe "${S}"/bin/tweego
}
