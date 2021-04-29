# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/customizable-weather/customizable-weather-1.5.5.ebuild,v 1.1 2011/09/08 23:00:44 dilfridge Exp $

EAPI=4

inherit kde4-base

MY_REV="8942d09"
MY_P="leonardo2d-${PN}-${MY_REV}"

DESCRIPTION="Emerging plasmoid displays information about the ongoing gentoo install process through emerge using progress bars."
HOMEPAGE="http://kde-look.org/content/show.php/Emerging+Plasmoid?content=147414"
SRC_URI="https://github.com/downloads/leonardo2d/${PN}/${MY_P}.tar.gz"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"
SLOT="4"
IUSE="debug"

RDEPEND="
	>=dev-lang/perl-5.8.0-r12
	>=dev-perl/DateManip-5.40
	dev-perl/libwww-perl
	$(add_kdebase_dep plasma-workspace)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"


pkg_postinst(){
    ewarn "Do not forget to add your user(s) to 'portage' group."
	ewarn "Otherwise you will be unable to read portage log"
}

