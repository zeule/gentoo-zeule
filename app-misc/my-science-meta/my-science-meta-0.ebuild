EAPI="5"
SLOT="0"

DESCRIPTION="My set of science related packages packages"

KEYWORDS="~x86 ~amd64"
IUSE="cluster"

DEPEND=""

RDEPEND="virtual/cblas
	cluster? ( app-misc/mycluster-meta )
"
