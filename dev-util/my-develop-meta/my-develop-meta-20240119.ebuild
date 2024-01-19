# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"

DESCRIPTION="My set of development packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android clang cxx dbus doc emacs git java javascript kate mono plasma php python qml qt5 uml zsh-completion"
REQUIRED_USE="kate? ( clang ) plasma? ( !kate !php )"

DEPEND=""

RDEPEND+="plasma? ( kde-plasma/plasma-meta kde-apps/kdecore-meta
		git? ( kde-apps/dolphin-plugins-git )
	)
"

RDEPEND+="dev-build/cmake[gui]
dev-build/ninja
"

# part of kdesdk
RDEPEND+="plasma? ( kde-apps/kompare kde-plasma/plasma-sdk )
kde-apps/kapptemplate
kde-apps/kcachegrind
uml? ( kde-apps/umbrello )
kde-apps/lokalize
kde-misc/kdiff3
kde-misc/kregexpeditor
"

RDEPEND+="doc? ( sys-apps/man-pages-posix )
"

RDEPEND+="git? (
	dev-vcs/git-extras
	dev-vcs/git-lfs
	dev-util/diffstat
	dev-util/git-autofixup
	dev-util/git-bug
	)
"

RDEPEND="${RDEPEND}
dev-util/kdevelop:5
dev-cpp/catch
clang? ( dev-util/lldb
	dev-util/clazy
	dev-util/include-what-you-use

)
cxx? ( qml? ( dev-qt/qt-creator dev-util/gammaray ) )
"

#"
#dev-util/eclipse-sdk
#x11-libs/qt-demo
#dev-util/kdevelop-extra-plugins
#dev-util/kdevelop-plugins

RDEPEND="${RDEPEND}
dev-util/gprof2dot
"

RDEPEND="${RDEPEND}
mono? ( dev-lang/mono
)
"

RDEPEND="${RDEPEND}
app-text/doxygen
qt5? (	dev-qt/assistant
	dev-qt/designer
	dev-qt/linguist
	dev-qt/linguist-tools
	dev-qt/qt-docs
	dev-qt/qtcharts
	dev-qt/qtdatavis3d
	dbus? ( dev-qt/qdbusviewer )
)
sys-apps/the_silver_searcher
android? ( dev-util/android-studio )
python? (
	dev-python/pycodestyle
	dev-python/autopep8
	dev-python/python-lsp-server
	app-editors/vscode
	zsh-completion? ( media-fonts/meslo-nerd )
)
javascript? ( app-editors/vscode
	net-libs/nodejs
	zsh-completion? ( media-fonts/meslo-nerd )
)
"

# java
RDEPEND+="java? ( virtual/jdk
	dev-java/maven-bin )
"

# Emacs
RDEPEND+="emacs? ( dev-util/my-emacs-meta )
"

# asus-ec-sensors
RDEPEND+="sys-apps/acpica
"
