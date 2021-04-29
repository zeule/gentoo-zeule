# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_LINGUAS="bs ca ca@valencia cs da de el es et fi fr ga gl hu ia it ja kk km
lt mr nb nds nl pl pt pt_BR ro ru sk sl sr sr@ijekavian sr@ijekavianlatin
sr@latin sv uk vi zh_CN zh_TW"
inherit kde4-base

DESCRIPTION="KDE Simple address book application displaying info about aggregated contacts"
HOMEPAGE="https://projects.kde.org/projects/playground/network/telepathy/ktp-nepomuk-service"
if [[ ${PV} != *9999* ]]; then
	SRC_URI="mirror://kde/stable/kde-telepathy/${PV}/src/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
else
	KEYWORDS=""
fi

LICENSE="LGPL-2.1"
SLOT="4"
IUSE="debug"

DEPEND="
	kde-base/nepomuk-core
	net-libs/libkpeople
	>=net-libs/libkfbapi-1.0
"
RDEPEND="${DEPEND}"
