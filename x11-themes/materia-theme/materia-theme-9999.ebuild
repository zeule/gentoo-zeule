# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Material Design-like flat theme for GTK3, GTK2 and GNOME Shell"
HOMEPAGE="https://github.com/nana-4/materia-theme"

if [[ ${PV} == *9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS="~*"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~*"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/gtk+:2
	>=x11-libs/gtk+-3.18:3
	>=x11-themes/gnome-themes-standard-3.18
	x11-libs/gdk-pixbuf
"
DEPEND=""

src_install(){
	mkdir -p "${D}/usr/share/themes"
	./install.sh --dest "${D}/usr/share/themes" || die "failed to install"
}
