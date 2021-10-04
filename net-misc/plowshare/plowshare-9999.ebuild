# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 git-r3

DESCRIPTION="Command-line downloader and uploader for file-sharing websites"
HOMEPAGE="https://github.com/mcrapet/plowshare"
#SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"
EGIT_REPO_URI="https://github.com/mcrapet/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="bash-completion +javascript view-captcha"

RDEPEND="
	>=app-shells/bash-4
	|| ( app-text/recode ( dev-lang/perl dev-perl/HTML-Parser ) )
	|| ( media-gfx/imagemagick[tiff] media-gfx/graphicsmagick[imagemagick,tiff] )
	net-misc/curl
	sys-apps/util-linux
	javascript? ( || ( dev-lang/spidermonkey dev-java/rhino ) )
	view-captcha? ( || ( media-gfx/aview media-libs/libcaca ) )"
DEPEND=""

DOCS=(AUTHORS README.md)

#S=${WORKDIR}/${MY_P}

# NOTES:
# javascript dep should be any javascript interpreter using /usr/bin/js

# Modules using detect_javascript
JS_MODULES="letitbit nowdownload_co oboom rapidgator zalaa zalil_ru zippyshare"

src_prepare() {
	default
	if ! use javascript; then
		for module in ${JS_MODULES}; do
			sed -i -e "s:^${module}.*::" src/modules/config || die "${module} sed failed"
			rm src/modules/${module}.sh || die "${module} rm failed"
		done
	fi

	# Don't let 'make install' install docs.
	sed -i -e "/INSTALL.*DOCDIR/d" Makefile || die "sed failed"

#	if use bash-completion; then
#		sed -i -e \
#			"s,/usr/local\(/share/plowshare4/modules/config\),${EPREFIX}/usr\1," \
#			etc/plowshare.completion || die "sed failed"
#	fi
	if ! use bash-completion
	then
		sed -i -e \ "/^install:/s/install_bash_completion//" \
		Makefile || die "sed failed"
	fi
}

src_compile() {
	# There is a Makefile but it's not compiling anything, let's not try.
	:
}

src_test() {
	# Disable tests because all of them need a working Internet connection.
	:
}

src_install() {
	default

	if use bash-completion; then
		newbashcomp scripts/${PN}.completion ${PN}
	fi
}

pkg_postinst() {
	if ! use javascript; then
		ewarn "Without javascript you will not be able to use:"
		ewarn " rapidgator, zalaa, zippyshare"
	fi
}
