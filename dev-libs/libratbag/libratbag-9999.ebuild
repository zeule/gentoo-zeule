# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8,9} )

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
		-Denable-documentation=$(usex doc true false)
		-Denable-tests=$(usex test true false)
		-Dudev-dir=$(get_udevdir)
	)
	meson_src_configure
}
