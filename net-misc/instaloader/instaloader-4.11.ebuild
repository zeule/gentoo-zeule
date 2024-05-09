EAPI=8
SLOT=0
KEYWORDS="~amd64"

HOMEPAGE="https://instaloader.github.io/"
DESCRIPTION="Download pictures (or videos) along with their captions and other metadata from Instagram"

SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
RESTRICT="mirror"

PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

RDEPEND="$(python_gen_cond_dep '
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/browser-cookie3[${PYTHON_USEDEP}]
	')
"

