EAPI="5"
SLOT="0"

DESCRIPTION="My set of portage-related packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""

RDEPEND="sys-apps/paludis
	|| ( sys-apps/portage-mgorny sys-apps/portage )
	app-portage/eix
	app-portage/euses
	app-portage/g-cpan
	app-portage/genlop
	app-portage/gentoolkit
	app-eselect/eselect-repository
	app-portage/mirrorselect
	app-portage/portpeek
	app-portage/smart-live-rebuild
	app-portage/find_cruft
	sys-config/ltoize
	app-portage/portage-lostfiles
	app-portage/portconf
	app-portage/showbuild
"
