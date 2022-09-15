# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
SLOT=0
KEYWORDS="~amd64"

DESCRIPTION="fonts/icons for powerlines"
HOMEPAGE="https://github.com/gabrielelana/awesome-terminal-fonts"
LICENSE="MIT"

inherit git-r3 font
EGIT_REPO_URI="https://github.com/gabrielelana/awesome-terminal-fonts.git"

RDEPEND="media-fonts/source-code-pro
media-fonts/source-sans
media-fonts/source-serif
"

FONT_SUFFIX="ttf"
FONT_CONF=(config/10-symbols.conf)
FONT_S="build"

pkg_preinst() {
	OLD_AWESOME_FONTS_VERSION=$(has_version ${CATEGORY}/${PN})
}

src_install() {
	sed -i 's/PragmataPro/Source Code Pro/g' config/10-symbols.conf
	font_src_install

	local shell_files_dir=/usr/share/${PN}
	local profile_file=90-awesome-terminal-fonts-fontmaps.sh
	echo "for f in ${shell_files_dir}/*.sh; do source \$f; done" > $profile_file
	insinto ${shell_files_dir}
	doins build/*.sh
	insinto /etc/profile.d/
#	doins $profile_file
}

pkg_postinst() {
	if !$OLD_AWESOME_FONTS_VERSION ; then
		einfo "You need to source shell files from /usr/share/${PN}"
		einfo "in your shell in order to make it work"
	fi
}
