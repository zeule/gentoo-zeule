# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A set of scripts for routine system update tasks"
HOMEPAGE="https://github.com/zeule/gentoo-zeule"
LICENSE="BSD"
KEYWORDS="~amd64"

SLOT="0"

RDEPEND="app-portage/smart-live-rebuild
	sys-apps/gentoo-functions
"

S=$WORKDIR

src_configure(){
	:
}

src_compile(){
	:
}

src_install(){
	dosbin $FILESDIR/make-and-install-kernel
	dosbin $FILESDIR/update-live-packages
	dosbin $FILESDIR/update-world
}
