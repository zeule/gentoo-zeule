# Copyright 1999-2013 Sabayon
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils rpm

#BUILD="0-${PV}.b1291.gdf60fb4-2"
BUILD="0~20150106.5c2d456b-2"
MY_PN=${PN/-/.}
DESCRIPTION="TianoCore EDK2 OVMF Binary images by Gerd Hoffman"
HOMEPAGE=""
#SRC_URI="https://www.kraxel.org/repos/jenkins/edk2/${MY_PN}-${BUILD}.noarch.rpm"
SRC_URI="http://ftp.de.debian.org/debian/pool/non-free/e/edk2/ovmf_${BUILD}_all.deb"
LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="${DEPEND}"
RDEPEND=""

S="${WORKDIR}"
RESTRICT="strip"

src_prepare() {
	tar xf data.tar.xz
}

src_install() {

	# Removing links of file we don't need, we just want the OVF image
#	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.bin
#	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.rom

	insinto /usr/share
	doins -r "${S}"/usr/share/*
}
