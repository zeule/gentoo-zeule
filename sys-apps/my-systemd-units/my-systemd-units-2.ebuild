# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit eutils systemd

DESCRIPTION="Service files for sys-apps/systemd"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/systemd https://en.gentoo-wiki.com/wiki/Systemd"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+basic"

S="$WORKDIR"

src_install() {
	if use basic; then
		systemd_dounit "${FILESDIR}"/services-basic/*
		dosbin "${FILESDIR}"/helpscripts-basic/* || die
#		systemd_dotmpfilesd "${FILESDIR}"/tmpfiles-basic/*
	fi

	# Files in portage cannot contain a literal '@' character. Therfore,
	# convert the code string "_at" into an '@' before installing.
	rename '_at' '@' "${D}/$(systemd_get_systemunitdir)"/*
}
