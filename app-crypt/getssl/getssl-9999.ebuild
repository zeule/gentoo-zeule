# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/srvrco/getssl"
KEYWORDS=""

DESCRIPTION="letsencrypt/acme client implemented as a shell-script"
HOMEPAGE="https://github.com/srvrco/getssl"

LICENSE="GPL-3"
SLOT="0"
IUSE="+godaddy"

RDEPEND="
	net-dns/bind-tools
	sys-apps/grep
	app-alternatives/awk
	sys-apps/sed
	net-misc/openssh
	sys-apps/coreutils
	net-misc/curl
	dev-libs/openssl
	godaddy? ( app-shells/json-sh )
"
DEPEND=""

DOCS=( README.md )

src_compile() { :; }

src_install() {
	default
	use godaddy && ln -s ../../../bin/JSON.sh $D/usr/share/getssl/dns_scripts/JSON.sh
}
