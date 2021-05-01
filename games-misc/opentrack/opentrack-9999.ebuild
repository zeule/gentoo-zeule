EAPI=5
SLOT=0
inherit git-r3 cmake-utils

DESCRIPTION="application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
HOMEPAGE="https://github.com/opentrack/opentrack"
EGIT_REPO_URI="https://github.com/opentrack/opentrack.git"

IUSE="evdev hatire wine"

RDEPEND=">=media-libs/opencv-3.0
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtxml:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	evdev? ( dev-libs/libevdev virtual/pkgconfig )
	hatire? ( dev-qt/qtserialport:5 )
	wine? ( virtual/wine )
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package hatire Qt5SerialPort)
		$(cmake-utils_use evdev SDK_ENABLE_LIBEVDEV)
		$(cmake-utils_use wine SDK_WINE_PREFIX)
       )

       cmake-utils_src_configure
}
