# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"

DESCRIPTION="My set of font packages"
LICENSE="metapackage"
KEYWORDS="~amd64 ~x86"
IUSE="plasma truetype"

REQUIRED_USE="plasma? ( truetype )"

DEPEND=""

RDEPEND="media-libs/freetype[cleartype-hinting]
	media-fonts/baekmuk-fonts
	media-fonts/cm-unicode
	media-fonts/droid
	media-fonts/free-bangla-font
	media-fonts/freefont
	media-fonts/freefonts
	media-fonts/fs-fonts
	media-fonts/inconsolata
	media-fonts/takao-fonts
	media-fonts/terminus-font
	media-fonts/ubuntu-font-family
	media-fonts/fontawesome
"

# truetype
RDEPEND+="truetype? (
		media-fonts/libertine
		media-fonts/apple-fonts
		media-fonts/ttf-bitstream-vera
		media-fonts/corefonts
		media-fonts/lato
		media-fonts/texcm-ttf
		media-fonts/paratype
		media-fonts/oldstandard
		media-fonts/liberation-fonts
		media-fonts/stix-fonts
		media-fonts/noto
		media-fonts/hack
		media-fonts/tex-gyre
		media-fonts/source-code-pro
		media-fonts/source-sans
		media-fonts/source-serif
		media-fonts/croscorefonts
		media-fonts/crosextrafonts-carlito
		media-fonts/alegreya-sans
		media-fonts/alegreya-serif
		media-fonts/quivira
		media-fonts/robotoslab
		media-fonts/noto-emoji
	)
	media-fonts/signika
"
#media-fonts/googlewebfonts ?

# KDE
RDEPEND+="plasma? ( media-fonts/oxygen-fonts )
"
