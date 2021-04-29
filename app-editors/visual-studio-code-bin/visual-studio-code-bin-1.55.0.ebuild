# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils pax-utils xdg

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	amd64? ( https://update.code.visualstudio.com/${PV}/linux-x64/stable -> ${P}-amd64.tar.gz )
	arm? ( https://update.code.visualstudio.com/${PV}/linux-armhf/stable -> ${P}-arm.tar.gz )
	arm64? ( https://update.code.visualstudio.com/${PV}/linux-arm64/stable -> ${P}-arm64.tar.gz )"

RESTRICT="mirror strip bindist"

LICENSE="MIT Microsoft-VSCode"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm ~arm64"
IUSE=""

RDEPEND="
	app-accessibility/at-spi2-atk
	app-crypt/libsecret[crypt]
	dev-libs/nss
	media-libs/libpng:0/16
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango"

QA_PRESTRIPPED="*"

QA_PREBUILT="
	opt/${PN}/code
	opt/${PN}/libEGL.so
	opt/${PN}/libffmpeg.so
	opt/${PN}/libGLESv2.so
	opt/${PN}/libvk_swiftshader.so
	opt/${PN}/libvulkan.so
	opt/${PN}/swiftshader/libEGL.so
	opt/${PN}/swiftshader/libGLESv2.so"

pkg_setup() {
	if use amd64; then
		S="${WORKDIR}/VSCode-linux-x64"
	elif use arm; then
		S="${WORKDIR}/VSCode-linux-armhf"
	elif use arm64; then
		S="${WORKDIR}/VSCode-linux-arm64"
	else
		die "Visual Studio Code only supports amd64, arm and arm64"
	fi
}

src_install() {
	pax-mark m code
	insinto "/opt/${PN}"
	doins -r *
	find . -type f -executable -not -name '*.so' -exec fperms +x /opt/${PN}/{} \;
	dosym "../../opt/${PN}/bin/code" "usr/bin/code"
	domenu "${FILESDIR}/code.desktop"
	domenu "${FILESDIR}/code-url-handler.desktop"
	dodoc "resources/app/LICENSE.rtf"
	newicon "resources/app/resources/linux/code.png" "visual-studio-code.png"
}

pkg_postinst() {
	xdg_pkg_postinst
	elog "You may want to install some additional utils, check in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
