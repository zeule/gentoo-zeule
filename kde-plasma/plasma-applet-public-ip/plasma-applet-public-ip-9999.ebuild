# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=5
inherit ecm git-r3
EGIT_REPO_URI="https://github.com/Davide-sd/ip_address.git"
HOMEPAGE="https://github.com/Davide-sd/ip_address.git"
DESCRIPTION="Plasma 5 widget to quickly show the public IP address and related informations."
LICENSE="GPL-2"
KEYWORDS="~amd64"

DEPEND="kde-frameworks/plasma:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtlocation:5
"
RDEPEND="${DEPEND}"
