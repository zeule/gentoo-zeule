EAPI="3"
SLOT="1"

DESCRIPTION="My set of Emacs related packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="+doom +latex"

RDEPEND="app-editors/emacs[xft]
	latex? ( app-emacs/auctex[preview-latex] )
	doom? ( sys-apps/fd 
		sys-apps/ripgrep
	)
"
