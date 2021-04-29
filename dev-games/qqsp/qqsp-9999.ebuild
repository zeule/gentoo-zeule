EAPI=7
SLOT=0
inherit git-r3 qmake-utils desktop xdg
DESCRIPTION="Qt Quest Soft Player"
HOMEPAGE="https://gitlab.com/Sonnix1/Qqsp"
EGIT_REPO_URI="https://gitlab.com/Sonnix1/Qqsp.git"

src_configure() {
	eqmake5
}

src_install() {
	dobin Qqsp
	dodoc LICENSE
	insinto ${EPREFIX}/usr/share/applications
	doins Qqsp.desktop
	insinto ${EPREFIX}/usr/share/mime/packages
	newins qsp.mime qsp.xml
	newicon icons/qsp-logo-vector.svg qsp.svg
}

