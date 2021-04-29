EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 git-r3
EGIT_REPO_URI="https://github.com/Donearm/PyImagedownloader.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

COMMON_DEPEND=""
RDEPEND="${COMMON_DEPEND}
        dev-python/lxml[${PYTHON_USEDEP}]"
DEPEND="${COMMON_DEPEND}
        dev-python/setuptools[${PYTHON_USEDEP}]"

