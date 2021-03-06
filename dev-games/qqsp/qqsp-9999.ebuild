# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
inherit git-r3 qmake-utils desktop xdg
DESCRIPTION="Qt Quest Soft Player"
HOMEPAGE="https://gitlab.com/Sonnix1/Qqsp"
LICENSE="MIT"
EGIT_REPO_URI="https://gitlab.com/Sonnix1/Qqsp.git"

DOCS=( LICENSE )

src_configure() {
	eqmake5
}

src_install() {
	dobin Qqsp
	insinto /usr/share/applications
	doins Qqsp.desktop
	insinto /usr/share/mime/packages
	newins qsp.mime qsp.xml
	newicon icons/qsp-logo-vector.svg qsp.svg
	einstalldocs
}
