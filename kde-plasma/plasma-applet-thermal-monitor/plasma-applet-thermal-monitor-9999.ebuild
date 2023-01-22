# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
SLOT=5
inherit git-r3 ecm
EGIT_REPO_URI="https://gitlab.com/agurenko/plasma-applet-thermal-monitor.git"
HOMEPAGE="https://gitlab.com/agurenko/plasma-applet-thermal-monitor"
DESCRIPTION="Plasma 5 applet for monitoring CPU, GPU and other available temperature sensors."
LICENSE="GPL-2"
KEYWORDS="~amd64"

DEPEND="kde-frameworks/plasma
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtgraphicaleffects:5
"
RDEPEND="${DEPEND}"
