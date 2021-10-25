EAPI="5"
SLOT="0"

DESCRIPTION="My set of portage-related packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="lto paludis"

DEPEND=""

RDEPEND="sys-apps/portage
	app-portage/eix
	app-portage/euses
	app-portage/g-cpan
	app-portage/genlop
	app-portage/gentoolkit
	app-eselect/eselect-repository
	app-portage/mirrorselect
	app-portage/portpeek
	app-portage/smart-live-rebuild
	sys-portage/my-update-tools
	app-portage/find_cruft
	lto? ( sys-config/ltoize )
	app-portage/portage-lostfiles
	app-portage/portconf
	app-portage/showbuild
	app-portage/repoman
	app-portage/metagen
	paludis? ( sys-apps/paludis )
"
