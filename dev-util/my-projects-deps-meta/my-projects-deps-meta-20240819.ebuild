# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
SLOT="0"

DESCRIPTION="Meta package to install dependencies for the project I work on"
LICENSE="metapackage"

KEYWORDS="~amd64"
IUSE="asus-ec-sensors biola"

DEPEND=""

RDEPEND+="asus-ec-sensors? ( sys-apps/acpica )
	biola? (
		dev-cpp/xsd
		dev-db/dbeaver-bin
	)
"
