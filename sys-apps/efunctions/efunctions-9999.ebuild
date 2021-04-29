# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# copied from coreos-overlay because they do not root on gentoo

EAPI=5
inherit vcs-snapshot

# A longish note on versions because I will forget:
# This ebuild fetches tarballs from github instead of using cros-workon
# because having a system-level package using git clone to fetch sources
# adds new ways for bootstrapping to fail. Also ${PN} needs to have a
# one-to-one relationship with git commits to make mirroring/caching work.
# - The version field is the date of the last upstream commit.
# - Use patch (_p) instead of revision (-r) when updating the git hash.
# So: 20130722_p1 includes upstream up through July with one CoreOS patch.

DESCRIPTION="Stand-alone and portable version of Gentoo's functions.sh"

HOMEPAGE="https://github.com/marcusatbang/efunctions"
GIT_COMMIT=31892b3ef711c7ba8fe8b233156cc35a265e1044
SRC_URI="${HOMEPAGE}/tarball/${GIT_COMMIT} -> ${P}.tar.gz"

# FIXME(marineam): The origional functions.sh claims 2-clause BSD but
# efunctions has no license declared. Assume it is unchanged until I
# contact the author and get that sorted out...
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="!sys-apps/openrc"

src_install() {
	local dst_dir=/usr/lib/${PN}

	dodir $dst_dir
	insinto $dst_dir
	doins ${S}/functions.sh
	doins -r ${S}/efunctions

	fperms -R +x $dst_dir
}

pkg_postinst() {
	local dst_dir=/usr/lib/${PN}

	einfo "Creating /etc/init.d/functions.sh symlink..."
	mkdir -p "${ROOT}"/etc/init.d
	ln -sf ../..${dst_dir}/functions.sh "${ROOT}"/etc/init.d/functions.sh
}

pkg_prerm() {
	local dst_dir=/usr/lib/${PN}
	local functions_path=/etc/init.d/functions.sh

	if test -L ${functions_path} && test $(readlink -f ${functions_path}) = $(readlink -f ${dst_dir}/functions.sh)
	then
		einfo "removing /etc/init.d/functions.sh symlink..."
     		rm -f ${functions_path}
	else
		einfo "symlink /etc/init.d/functions.sh does not point to ${dst_dir}/functions.sh"
	fi
}
