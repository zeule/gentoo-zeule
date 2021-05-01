# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{7,8,9})

inherit python-single-r1 autotools eutils git-r3 l10n

DESCRIPTION="An implementation of the MPRIS 2 interface as a client for MPD"
HOMEPAGE="https://github.com/eonpatapon/mpDris2"
EGIT_REPO_URI="https://github.com/eonpatapon/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}
"



DEPEND="$(python_gen_cond_dep '
	>=dev-python/dbus-python-0.80[${PYTHON_USEDEP}]
	>=dev-python/pygobject-3.14.0:3[${PYTHON_USEDEP}]
	>=dev-python/python-mpd2-0.5.5[${PYTHON_USEDEP}]
')"

src_prepare() {
#	sed -i 's/3.4/2.4/g' configure.ac
	eautoreconf
	default
}
