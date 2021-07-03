# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0

DESCRIPTION="Switch headphones to A2DP profile upon connection (if available)"
HOMEPAGE="https://aiguofer.medium.com/flawless-bluetooth-headset-mdr-100abn-on-linux-e745cb746671"

inherit udev

IUSE="udev"

S="$T"

src_install() {
	dobin "${FILESDIR}"/a2dp-fix
	if use udev; then
		dobin "${FILESDIR}"/a2dp-fix-wrapper
		udev_dorules "${FILESDIR}"/80-bt-headset-a2dp.rules
	fi
}
