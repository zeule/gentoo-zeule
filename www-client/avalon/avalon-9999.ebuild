# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2 qt4-r2

EGIT_REPO_URI="git://github.com/rsdn/avalon.git"
DESCRIPTION="Qt4-based RSDN (www.rsdn.ru) offline forum client"
HOMEPAGE="https://github.com/rsdn/avalon"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug graphviz +mysql spell +sqlite"

RDEPEND="
	>=x11-libs/qt-gui-4.4
	>=x11-libs/qt-core-4.4
	>=x11-libs/qt-webkit-4.4
	>=x11-libs/qt-sql-4.4[mysql=,sqlite=]
	mysql? ( >=virtual/mysql-5.1 )
	sqlite?	( >=dev-db/sqlite-3.6.1 )
	>=sys-libs/zlib-1.2.3
	spell? ( >=app-text/aspell-0.60.6 )
	graphviz? ( >=media-gfx/graphviz-2.22.2 )
"
DEPEND="
	${RDEPEND}
"

S="${WORKDIR}/${PN}"

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	PROJECT_NAME="avalon"
	LIBS="-lz"
	use spell && LIBS+=" -laspell"

	qmake -project -recursive -Wall -nopwd -o ${PROJECT_NAME}.pro "CONFIG += release" "QT += network sql webkit" "LIBS += ${LIBS}" src
	eqmake4
}

#src_compile() {
#	cd "${S}"
#	cd dev
#	./build.sh
#	cmake_options=""
#	if use debug ; then
#		cmake_options="-DBUILD_DEBUG:BOOL=ON"
#	fi
#	cmake . \
#		-DCMAKE_INSTALL_PREFIX="/usr" \
#		-DOPTIMIZATION_FLAGS="${CFLAGS}" \
#		${cmake_options} || die "cmake failed"
#	emake || die "make failed"
#}

src_install() {
	#DESTDIR="${D}" \
	#INSTALL_ROOT="${D}" \
	#emake install || die "install failed"
	dobin avalon
	domenu avalon.desktop
	doicon src/icons/avalon.xpm
#	local share_target="/usr/share/${PN}"
#  	dodir "${share_target}"
 	docompress -x "${share_target}"
 # 	insinto "${share_target}"
	dodoc -r src/sql/
	dodoc README.md
}

pkg_postinst() {
	ewarn "!!!"
	ewarn "!!! You must create MySql or SqLite database by hand, SQL scripts placed into /usr/share/${PN}/sql !"
	ewarn "!!!"
}
