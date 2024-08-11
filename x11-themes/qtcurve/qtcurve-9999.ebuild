# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake kde.org

DESCRIPTION="Widget styles for Qt and GTK2"
HOMEPAGE="https://invent.kde.org/system/qtcurve"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc ppc64 ~sparc x86"
IUSE="gtk nls plasma qt5 qt6 test X"

MULTIBUILD_VARIANTS="qt{5,6}"

REQUIRED_USE="gtk? ( X )
	|| ( gtk qt5 qt6 )
	plasma? ( || ( qt5 qt6 ) )
"
RESTRICT="test"

DEPEND="
	gtk? ( x11-libs/gtk+:2 )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtsvg:5
		dev-qt/qtwidgets:5
		plasma? (
			dev-qt/qtprintsupport:5
			kde-frameworks/frameworkintegration:5
			kde-frameworks/karchive:5
			kde-frameworks/kcompletion:5
			kde-frameworks/kconfig:5
			kde-frameworks/kconfigwidgets:5
			kde-frameworks/kcoreaddons:5
			kde-frameworks/kguiaddons:5
			kde-frameworks/ki18n:5
			kde-frameworks/kiconthemes:5
			kde-frameworks/kio:5
			kde-frameworks/kwidgetsaddons:5
			kde-frameworks/kwindowsystem:5
			kde-frameworks/kxmlgui:5
		)
		X? ( dev-qt/qtx11extras:5 )
	)
	qt6? (
		dev-qt/qtbase:6[widgets]
		dev-qt/qtsvg:6
		plasma? (
			dev-qt/qtbase:6[cups,dbus]
			dev-qt/qtdeclarative:6
			kde-frameworks/karchive:6
			kde-frameworks/kconfig:6
			kde-frameworks/kconfigwidgets:6
			kde-frameworks/frameworkintegration:6
			kde-frameworks/ki18n:6
			kde-frameworks/kguiaddons:6
			kde-frameworks/kio:6
			kde-frameworks/kiconthemes:6
			kde-frameworks/kwidgetsaddons:6
			kde-frameworks/kwindowsystem:6
			kde-frameworks/kxmlgui:6
		)
	)
	X? (
		x11-libs/libX11
		x11-libs/libxcb
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
	plasma? ( kde-frameworks/extra-cmake-modules:0 )
"

DOCS=( AUTHORS ChangeLog.md README.md TODO.md )

src_configure() {
	local mycmakeargs=(
		-DKDE_INSTALL_LIBDIR="$(get_libdir)"
		-DENABLE_QT4=OFF
		-DQTC_QT4_ENABLE_KDE=OFF
		-DQTC_KDE4_DEFAULT_HOME=ON
		-DENABLE_GTK2="$(usex gtk)"
		-DENABLE_QT5="$(usex qt5)"
		-DENABLE_QT6="$(usex qt6)"
		-DBUILD_TESTING="$(usex test)"
		-DQTC_ENABLE_X11="$(usex X)"
		-DQTC_INSTALL_PO="$(usex nls)"
	)
	use qt5 && mycmakeargs+=( -DQTC_QT5_ENABLE_KDE="$(usex plasma)" )
	use qt6 && mycmakeargs+=( -DQTC_QT6_ENABLE_KDE="$(usex plasma)" )

	cmake_src_configure
}
