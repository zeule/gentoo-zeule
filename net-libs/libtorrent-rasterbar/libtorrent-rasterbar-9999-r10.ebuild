# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit cmake git-r3 python-single-r1

DESCRIPTION="C++ BitTorrent implementation focusing on efficiency and scalability"
HOMEPAGE="https://libtorrent.org/ https://github.com/arvidn/libtorrent"
EGIT_REPO_URI="https://github.com/arvidn/libtorrent.git"

LICENSE="BSD"
SLOT="0/2.0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE="+dht debug examples gnutls python ssl test"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/boost:=
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-libs/boost[python,${PYTHON_USEDEP}]
		')
	)
	ssl? (
		gnutls? ( net-libs/gnutls:= )
		!gnutls? ( dev-libs/openssl:= )
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	examples? ( dev-util/patchelf )
	python? (
		$(python_gen_cond_dep '
			dev-python/setuptools[${PYTHON_USEDEP}]
		')
	)"

pkg_setup() {
	# python required for tests due to webserver.py
	if use python || use test; then
		python-single-r1_pkg_setup
	fi
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=20
		-DBUILD_SHARED_LIBS=ON
		-Dbuild_examples=$(usex examples)
		-Ddht=$(usex dht)
		-Dencryption=$(usex ssl)
		-Dgnutls=$(usex gnutls)
		-Dlogging=$(usex debug)
		-Dpython-bindings=$(usex python)
		-Dbuild_tests=$(usex test)
	)

	# We need to drop the . from the Python version to satisfy Boost's
	# FindBoost.cmake module, bug #793038.
	use python && mycmakeargs+=( -Dboost-python-module-name="${EPYTHON/./}" )

	cmake_src_configure
}

src_test() {
	local myctestargs=(
		# Needs running UPnP server
		-E "test_upnp"
	)

	# Checked out Fedora's test workarounds for inspiration
	# https://src.fedoraproject.org/rpms/rb_libtorrent/blob/rawhide/f/rb_libtorrent.spec#_120
	LD_LIBRARY_PATH="${BUILD_DIR}:${LD_LIBRARY_PATH}" cmake_src_test
}

src_install() {
	cmake_src_install
	einstalldocs

	if use examples; then
		pushd "${BUILD_DIR}"/examples >/dev/null || die
		for binary in {client_test,connection_tester,custom_storage,dump_bdecode,dump_torrent,make_torrent,simple_client,stats_counters,upnp_test}; do
			patchelf --remove-rpath ${binary} || die
			dobin ${binary}
		done
		popd >/dev/null || die
	fi
}
