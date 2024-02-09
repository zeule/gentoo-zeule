# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10,11} )

inherit git-r3 python-r1 meson

DESCRIPTION="A GTK front-end to ratbagd"
HOMEPAGE="https://github.com/libratbag/piper"
EGIT_REPO_URI="https://github.com/libratbag/piper"
LICENSE="GPL-2"

SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}
"

DEPEND="
	>=dev-build/meson-0.51.0
	dev-python/flake8
"

RDEPEND="
	dev-python/python-evdev
	>=x11-libs/gtk+-3.22
	dev-python/pygobject:3
"

src_prepare() {
	default
	python_setup
}

src_configure() {
  local emesonargs=(
#    -Dtests=$(usex test true false)
  )
  meson_src_configure
}
