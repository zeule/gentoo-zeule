# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( {17..20} )
PYTHON_COMPAT=( python3_{10..12} )
inherit cmake git-r3 llvm-r1 python-any-r1

DESCRIPTION="Compiler plugin which allows clang to understand Qt semantics"
HOMEPAGE="https://apps.kde.org/clazy"
EGIT_REPO_URI="https://invent.kde.org/sdk/clazy.git"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="$(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}=')"
DEPEND="${RDEPEND}"
BDEPEND="test? ( ${PYTHON_DEPS} )"

PATCHES=(
#	"${FILESDIR}"/${PN}-1.11-fix-regex-detect.patch
#	"${FILESDIR}"/${PN}-1.11-fix-llvm-{15,16,17}.patch
#	"${FILESDIR}"/${PN}-1.11-jobs-for-tests.patch
)

pkg_setup() {
	use test && python-any-r1_pkg_setup

	llvm-r1_pkg_setup
}

src_prepare() {
	cmake_src_prepare

	sed -e '/install(FILES README.md COPYING-LGPL2.txt checks.json DESTINATION/d' \
		-i CMakeLists.txt || die
}

src_configure() {
	export LLVM_ROOT="$(get_llvm_prefix -d ${LLVM_MAX_SLOT})"

	cmake_src_configure
}

src_test() {
	# Run tests against built copy, not installed
	# bug #811723
	PATH="${BUILD_DIR}/bin:${PATH}" LD_LIBRARY_PATH="${BUILD_DIR}/lib" cmake_src_test
}
