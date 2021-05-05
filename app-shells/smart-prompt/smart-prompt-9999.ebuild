# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

EGIT_REPO_URI="https://github.com/zaufi/smart-prompt.git"
inherit git-r3 cmake

DESCRIPTION="Smart bash prompt: show various context info in a command prompt"
HOMEPAGE="https://github.com/zaufi/smart-prompt"

IUSE="git subversion"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~sparc ~x86"

COMMON_DEPEND=">=app-shells/bash-4.0"

DEPEND="${COMMON_DEPEND} dev-util/cmake"
RDEPEND="${COMMON_DEPEND}
    git? ( dev-vcs/git )
    subversion? ( dev-vcs/subversion )
    "

src_configure() {
    local mycmakeargs=(
        $(cmake-utils_use_disable git)
        $(cmake-utils_use_disable subversion SVN)
    )
    cmake_src_configure
}
