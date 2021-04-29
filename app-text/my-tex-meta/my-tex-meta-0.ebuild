EAPI="7"
KEYWORDS="~amd64 ~x86"
SLOT="0"
DESCRIPTION="My set of LaTeX related packages"
SRC_URI=""
IUSE="emacs html kde pdf"

RDEPEND="app-text/texlive[context,dvipdfm(+),extra,graphics,humanities,luatex,pdfannotextractor,pstricks,publishers,science,xetex]
kde? (
	media-gfx/ktikz
	kde-misc/klatexformula
	app-text/kbibtex
	app-editors/kile
)
emacs? ( app-emacs/auctex )
dev-tex/biblatex
dev-tex/biber
dev-tex/latex2rtf
html? (
	dev-tex/html2latex
	dev-tex/latex2html
	dev-tex/tth
	dev-tex/hevea
)
media-gfx/asymptote
"

#pdf? ( app-text/pdftk )
#"

DEPEND=""
