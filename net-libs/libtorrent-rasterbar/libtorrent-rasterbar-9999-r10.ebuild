
EAPI=7

PYTHON_COMPAT=( python{3_8,3_9} )

inherit cmake git-r3 python-any-r1

DESCRIPTION="C++ BitTorrent implementation focusing on efficiency and scalability"
HOMEPAGE="https://libtorrent.org/ https://github.com/arvidn/libtorrent"
EGIT_REPO_URI="https://github.com/arvidn/libtorrent.git"

LICENSE="BSD"
SLOT="0/2.0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug deprecated +dht examples gnutls python ssl static-libs test"

RESTRICT="!test? ( test ) test" # not yet fixed
RDEPEND="dev-libs/boost:=[threads(+)]"
DEPEND="
        python? (
                ${PYTHON_DEPS}
                $(python_gen_any_dep '
                        dev-libs/boost[python,${PYTHON_USEDEP}]')
        )
        ssl? (
                gnutls? ( net-libs/gnutls:= )
                !gnutls? ( dev-libs/openssl:= )
        )
        ${DEPEND}
"

src_prepare() {
	use debug && append-cxxflags "-DTORRENT_DEBUG -DTORRENT_USE_ASSERTS"
	cmake_src_prepare
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
	)
	use python && mycmakeargs+=( -Dboost-python-module-name="${EPYTHON/./}" )
	cmake_src_configure
}

src_install() {
	use doc && HTML_DOCS+=( "${S}"/docs )

	cmake_src_install
}

pkg_setup() {
	use python && python-any-r1_pkg_setup
}

