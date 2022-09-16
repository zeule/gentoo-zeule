# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Apple San Francisco, New York fonts, directly from Apple official source"
HOMEPAGE="https://developer.apple.com/fonts/"
SRC_URI="
	https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg -> SF-Pro_${PV}.dmg
	https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg -> SF-Compact_${PV}.dmg
	https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg -> SF-Mono_${PV}.dmg
	https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg -> SF-Arabic_${PV}.dmg
	https://devimages-cdn.apple.com/design/resources/download/NY.dmg -> NY.dmg_${PV}.dmg
"
RESTRICT="mirror"

BDEPEND="app-arch/p7zip"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="~amd64 ~x86"

FONT_SUFFIX="otf ttf"
S="${WORKDIR}"

FONT_S="${WORKDIR}/Library/Fonts"

src_unpack() {
	for f in $A; do
		7z e -aos ${DISTDIR}/$f
	done
	for f in *.pkg; do
		7z e -aoa "$f"
		7z x 'Payload~'
	done
}
