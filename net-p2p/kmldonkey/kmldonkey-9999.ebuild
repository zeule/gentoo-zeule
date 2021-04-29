# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/kmldonkey/kmldonkey-2.0.2.ebuild,v 1.4 2008/12/28 15:38:06 scarabeus Exp $

EAPI=5

KMNAME="extragear/network"
inherit kde4-base

DESCRIPTION="Provides integration for the MLDonkey P2P software and KDE 4."
HOMEPAGE="http://www.kde.org/"
LICENSE="GPL-2 LGPL-2"

KEYWORDS=""
SLOT="live"
IUSE="plasma"

RDEPEND="plasma? ( kde-base/plasma-workspace:${SLOT} )"
DEPEND="${RDEPEND}
	sys-devel/gettext"


src_configure() {
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_with plasma Plasma)"

	kde4-base_src_configure
}
