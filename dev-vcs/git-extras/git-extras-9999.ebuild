# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit git-r3 bash-completion-r1

EGIT_REPO_URI="https://github.com/tj/git-extras.git"
DESCRIPTION="Little git extras"
HOMEPAGE="https://github.com/tj/git-extras.git"

IUSE="bash-completion zsh-completion"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-vcs/git"

src_compile() {
	:;
	# we skip this because the first target of the
	# Makefile is "install" and plain "make" would
	# actually run "make install"

}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" SYSCONFDIR="/etc" install
	nonfatal dodoc Readme.md
	use bash-completion && newbashcomp "${D}/etc/bash_completion.d/${PN}" ${PN}
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins "${S}/etc/git-extras-completion.zsh"
	fi
}
