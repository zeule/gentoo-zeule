# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

MY_P="${PN}-v${PV}"

DESCRIPTION="Video player built with Qt/QML on top of libmpv"
HOMEPAGE="https://invent.kde.org/multimedia/haruna"
SRC_URI="https://invent.kde.org/multimedia/${PN}/-/archive/v${PV}/${MY_P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="dev-qt/qtbase:6[dbus,gui]
	dev-qt/qt5compat:6
	dev-qt/qtdeclarative:6
	dev-qt/qtquickcontrols2:6
	media-libs/mpvqt
	media-video/ffmpeg
	kde-frameworks/breeze-icons:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdoctools:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/kwindowsystem:6
	net-misc/yt-dlp"
DEPEND="${RDEPEND}"
BDEPEND="kde-frameworks/extra-cmake-modules
	sys-devel/gettext"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local mycmakeargs=(
		-DKDE_INSTALL_DOCBUNDLEDIR="${EPREFIX}/usr/share/help"
	)
	cmake_src_configure
}
