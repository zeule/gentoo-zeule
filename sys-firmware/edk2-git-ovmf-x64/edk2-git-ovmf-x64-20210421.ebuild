# Copyright 1999-2013 Sabayon
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils rpm
BUILD="0-${PV}.8.g5b90b8abb4"
MY_PN=${PN/-/.}
DESCRIPTION="TianoCore EDK2 OVMF Binary images by Gerd Hoffman"
HOMEPAGE="https://www.kraxel.org/repos/jenkins/edk2/"
SRC_URI="https://www.kraxel.org/repos/jenkins/edk2/${MY_PN}-${BUILD}.noarch.rpm"
LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="${DEPEND}"
RDEPEND=""

S="${WORKDIR}"
RESTRICT="strip"


src_install() {

	# Removing links of file we don't need, we just want the OVF image
	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.bin
	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.rom

	insinto /usr/share
	doins -r "${S}"/usr/share/*
}
