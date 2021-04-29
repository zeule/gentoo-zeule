# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CMAKE_MIN_VERSION=3.11

PYTHON_COMPAT=( python3_{7,8,9} )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_OPTIONAL=true
DISTUTILS_SINGLE_IMPL=true
#DISTUTILS_IN_SOURCE_BUILD=true

inherit cmake-utils distutils-r1 git-r3 flag-o-matic

MY_PV=$(ver_rs 1- _)

DESCRIPTION="C++ BitTorrent implementation focusing on efficiency and scalability"
HOMEPAGE="http://libtorrent.org"
EGIT_REPO_URI="https://github.com/arvidn/libtorrent.git"
#EGIT_REPO_URI="https://github.com/evsh/libtorrent.git"
#EGIT_BRANCH="cmake"

LICENSE="BSD"
SLOT="0/10"
KEYWORDS="amd64 ~arm ppc ppc64 ~sparc x86 ~x86-fbsd"
IUSE="debug +deprecated +dht doc examples iconv libressl python +ssl static-libs test"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/boost:=[threads]
	virtual/libiconv
	examples? ( !net-p2p/mldonkey )
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-libs/boost:=[python,${PYTHON_MULTI_USEDEP}]
		')
	)
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:= )
	)
"

src_prepare() {
	use debug && append-cxxflags "-DTORRENT_DEBUG -DTORRENT_USE_ASSERTS"
	cmake-utils_src_prepare

#	use python && distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-Ddeprecated-functions=$(usex deprecated)
		-DBUILD_SHARED_LIBS=$(usex static-libs no yes)
		-Dstatic_runtime=no
		-Dencryption=yes
		$(cmake-utils_use_find_package iconv Iconv)
		$(cmake-utils_use_find_package ssl OpenSSL)
		-Dexceptions=yes
		-Dlogging=$(usex debug)
		-Dbuild_examples=$(usex examples)
		-Dpython-bindings=$(usex python)
		-Dskip-python-runtime-test=true
		-DPython_ADDITIONAL_VERSIONS="${PYTHON: -3}"
		-DPYTHON_EXECUTABLE="${PYTHON}"
		-Dboost-python-module-name="${EPYTHON/./}"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	use doc && HTML_DOCS+=( "${S}"/docs )

	cmake-utils_src_install
}
