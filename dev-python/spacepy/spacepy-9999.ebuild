EAPI=7
PYTHON_COMPAT=( python2_7 python3_7 python3_8 python3_9 )
SLOT=0
KEYWORDS="~x86 ~amd64"

inherit git-r3 distutils-r1

DEPEND="sci-libs/cdf
	dev-python/ffnet[${PYTHON_USEDEP}]
"

HOMEPAGE="https://github.com/spacepy/spacepy"
DESCRIPTION="Space Science library for Python"
EGIT_REPO_URI="https://github.com/spacepy/spacepy.git"
