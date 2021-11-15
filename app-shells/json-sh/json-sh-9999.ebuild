# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="JSON parser written in shell, compatible with ash, bash, dash and zsh"
HOMEPAGE="https://github.com/dominictarr/JSON.sh"

inherit git-r3
EGIT_REPO_URI="https://github.com/dominictarr/JSON.sh.git"
SLOT=0

src_compile() { :; }

src_install() {
	dobin JSON.sh
}
