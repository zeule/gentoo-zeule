EAPI="5"
SLOT="0"

DESCRIPTION="My set of font packages"

KEYWORDS="~x86 ~amd64"
IUSE="infinality plasma truetype"

REQUIRED_USE="plasma? ( truetype )"

DEPEND=""

RDEPEND="infinality? ( media-libs/fontconfig-ultimate )
	!infinality? ( media-libs/freetype[cleartype_hinting] )
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
RDEPEND+="truetype? ( media-fonts/libertine
		media-fonts/ttf-bitstream-vera
		media-fonts/corefonts
		media-fonts/texcm-ttf
		media-fonts/paratype
		media-fonts/oldstandard
		media-fonts/liberation-fonts
		media-fonts/stix-fonts
		media-fonts/noto
		infinality? ( media-fonts/infinality-ultimate-meta
			media-fonts/ibfonts-meta-extended
		)
		media-fonts/hack
		media-fonts/tex-gyre
		media-fonts/source-pro
		media-fonts/croscorefonts
		media-fonts/alegreya-sans
		media-fonts/alegreya-serif
		media-fonts/quivira
		media-fonts/noto-emoji
		)
		media-fonts/signika
"
#media-fonts/googlewebfonts ?

# KDE
RDEPEND+="plasma? ( media-fonts/oxygen-fonts )
"
