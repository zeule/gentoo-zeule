# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Metapackage to pull filesystem utilities for various file systems."
HOMEPAGE="https://github.com/zeule/gentoo-zeule"
LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64"
IUSE="btrfs exfat fat f2fs xfs zfs"

RDEPEND="btrfs? ( sys-fs/btrfs-progs )
	exfat? ( sys-fs/exfatprogs )
	fat? ( sys-fs/dosfstools )
	f2fs? ( sys-fs/f2fs-tools )
	xfs? ( sys-fs/xfsprogs )
	zfs? ( sys-fs/zfs )
"
