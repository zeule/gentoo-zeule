# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"

DESCRIPTION="My set of development packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android clang cxx dbus emacs git java javascript kate mono plasma php python qt5 uml zsh-completion"
REQUIRED_USE="kate? ( clang ) plasma? ( !kate !php )"

DEPEND=""

RDEPEND+="plasma? ( kde-plasma/plasma-meta kde-apps/kdecore-meta
		git? ( kde-apps/dolphin-plugins-git )
	)
"

RDEPEND+="dev-util/cmake[qt5=]
dev-util/ninja
"

# part of kdesdk
RDEPEND+="plasma? ( kde-apps/kompare kde-plasma/plasma-sdk )
kde-apps/kapptemplate
kde-apps/kcachegrind
kde-apps/kdesdk-kioslaves
uml? ( kde-apps/umbrello )
kde-apps/lokalize
kde-misc/kdiff3
kde-misc/kregexpeditor
"

RDEPEND+="git? (
	dev-vcs/git-extras
	dev-vcs/git-lfs )
"

RDEPEND="${RDEPEND}
cxx? ( dev-util/cppcheck )
dev-util/kdevelop:5
dev-util/kdevelop-valgrind:5
dev-util/kdevelop-python:5
dev-util/kdevelop-upload:5
dev-util/valgrind
dev-libs/dmalloc
dev-cpp/catch
clang? ( dev-util/lldb
	dev-util/clazy
)
dev-qt/qt-creator
"

#"
#dev-util/eclipse-sdk
#x11-libs/qt-demo
#dev-util/kdevelop-extra-plugins
#dev-util/kdevelop-plugins

RDEPEND="${RDEPEND}
sci-astronomy/cspice
dev-util/gprof2dot
"

RDEPEND="${RDEPEND}
mono? ( dev-lang/mono
)
"

RDEPEND="${RDEPEND}
app-doc/doxygen
qt5? (	dev-qt/assistant:5
	dev-qt/designer:5
	dev-qt/linguist:5
	dev-qt/linguist-tools:5
	dev-qt/qtquickcontrols:5
	dev-qt/qt-docs:5
	dev-qt/qtcharts:5
	dev-qt/qtdatavis3d:5
	dbus? ( dev-qt/qdbusviewer:5 )
)
sys-apps/the_silver_searcher
android? ( dev-util/android-studio )
	python? (
		dev-python/pycodestyle
		dev-python/autopep8
		dev-python/python-lsp-server
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
