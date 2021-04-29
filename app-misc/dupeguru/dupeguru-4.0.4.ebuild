# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
PYTHON_REQ_USE="sqlite"

inherit eutils python-any-r1

DESCRIPTION="Find duplicate files on your system"
HOMEPAGE="https://dupeguru.voltaicideas.net"
MY_P="${PN}-src-${PV}"
SRC_URI="https://github.com/arsenetar/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~arm"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	>=dev-qt/qtgui-5.5[jpeg,png,gif]
	$(python_gen_any_dep '
		dev-python/PyQt5[${PYTHON_USEDEP},gui,widgets]
		>=dev-python/hsaudiotag3k-1.1.3[${PYTHON_USEDEP}]
		>=dev-python/send2trash-1.3.0[${PYTHON_USEDEP}]
	')"
DEPEND="${RDEPEND}
	$(python_gen_any_dep '
		dev-python/polib[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
	')"

#PATCHES=(
#    # Recent pip update in Gentoo requires us to use --user at all times, even in venvs :(
#	"${FILESDIR}/fix-pip-call-in-makefile.patch"
#)

src_compile() {
	emake PYTHON=${EPYTHON} all build/help
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
