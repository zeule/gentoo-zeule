# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multibuild qmake-utils git-r3

DESCRIPTION="A Qt-based library for OAuth support"
HOMEPAGE="http://wiki.github.com/ayoy/qoauth"
EGIT_REPO_URI="git://github.com/ayoy/${PN}"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS=""
IUSE="debug doc static-libs test qt4 qt5"

COMMON_DEPEND="qt4? ( app-crypt/qca:2[debug?,qt4(+)] )
	qt5? ( app-crypt/qca:2[debug?,qt5] )
        qt4? ( dev-qt/qtcore:4 )
        qt5? (
                dev-qt/qtcore:5
                dev-qt/qtconcurrent:5
                dev-qt/qtnetwork:5
        )
"
DEPEND="${COMMON_DEPEND}
	doc? ( app-doc/doxygen )
	test? ( dev-qt/qttest:4 )
"
RDEPEND="${COMMON_DEPEND}
	|| ( app-crypt/qca-ossl:2[debug?] app-crypt/qca:2[debug?,ssl] )
"

DOCS="README CHANGELOG"

pkg_setup() {
        MULTIBUILD_VARIANTS=( $(usev qt4) $(usev qt5) )
}



src_prepare() {
#	qt4-r2_src_prepare
	myprepare() {
		cd "${BUILD_DIR}"
		if ! use test; then
			sed -i -e '/SUBDIRS/s/tests//' ${PN}.pro || die "sed failed"
		fi

		sed -i -e '/^ *docs \\$/d' \
			-e '/^ *build_all \\$/d' \
			-e 's/^\#\(!macx\)/\1/' \
			src/src.pro || die "sed failed"

		sed -i -e "s/\(.*\)lib$/\1$(get_libdir)/" src/pcfile.sh || die "sed failed"
	}
	multibuild_copy_sources
	multibuild_foreach_variant myprepare
}

src_compile() {
	mycompile() {
		cd "${BUILD_DIR}"
		if [[ ${MULTIBUILD_VARIANT} == qt4 ]]; then
                        eqmake4
                fi
		if [[ ${MULTIBUILD_VARIANT} == qt5 ]]; then
                        eqmake5
                fi
		emake
#	default
		if use static-libs; then
			emake -C src static
		fi
	}
	multibuild_foreach_variant mycompile
}

src_install() {
	myinstall() {
		cd "${BUILD_DIR}"
		emake INSTALL_ROOT="${D}" install

		if use static-libs; then
			dolib.a "${S}"/lib/lib${PN}.a
		fi

		if use doc; then
			doxygen "${S}"/Doxyfile || die "failed to generate documentation"
			dohtml "${S}"/doc/html/*
		fi
	}
	multibuild_foreach_variant myinstall
}
