# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11} )

inherit meson udev git-r3 python-r1

DESCRIPTION="Library to configure gaming mice"
HOMEPAGE="https://github.com/libratbag/libratbag"
EGIT_REPO_URI="https://github.com/libratbag/libratbag"

LICENSE="MIT"
SLOT="0"
IUSE="doc test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}
"

DEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"
RDEPEND="
	dev-libs/libevdev
	virtual/libudev
"

src_prepare () {
	default
	python_setup
}

src_configure() {
	local emesonargs=(
		-Ddocumentation=$(usex doc true false)
		-Dtests=$(usex test true false)
		-Dudev-dir=$(get_udevdir)
	)
	meson_src_configure
}
