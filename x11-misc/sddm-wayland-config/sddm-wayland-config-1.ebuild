# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Wayland config for x11-misc/sddm"
IUSE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="x11-misc/sddm"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	insinto /etc/sddm.conf.d
	doins "${FILESDIR}/10-wayland-kwin.conf"
}
