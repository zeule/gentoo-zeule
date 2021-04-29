EAPI="5"
inherit git-r3 cmake-utils

DESCRIPTION="Lomoco can configure vendor-specific options on Logitech USB mice."
HOMEPAGE="http://lomoco.linux-gamers.net/"
EGIT_REPO_URI="git://git.lomoco.org/projects/lomoco/lomoco.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/log4c"
RDEPEND="${DEPEND}
"

src_unpack(){
  git-r3_src_unpack
}
