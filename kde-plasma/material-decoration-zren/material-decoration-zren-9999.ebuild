# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
SLOT=5

inherit git-r3 ecm

DESCRIPTION="Material-ish window decoration theme for KWin, with LIM, based on zzag's design."
HOMEPAGE="https://github.com/Zren/material-decoration"
LICENSE="GPL-2"
EGIT_REPO_URI="https://github.com/Zren/material-decoration.git"
IUSE=""

CDEPEND="kde-plasma/kdecoration"
DEPEND="$CDEPEND"
RDEPEND="$CDEPEND"
