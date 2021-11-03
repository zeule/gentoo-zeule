# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="HWMON driver for EC sensors in ASUS motherboards"
HOMEPAGE="https://github.com/zeule/asus-ec-sensors"
EGIT_REPO_URI="https://github.com/zeule/asus-ec-sensors.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

MODULE_NAMES="asus-ec-sensors(hwmon:${S}:${S})"
BUILD_TARGETS="modules"
TARGET="${KV_FULL}"
