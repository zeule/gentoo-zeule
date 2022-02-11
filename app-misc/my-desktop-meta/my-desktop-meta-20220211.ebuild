EAPI="5"
SLOT="0"

DESCRIPTION="My set of desktop packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="emacs kde gtk kvm latex mailfetch pdf kindle scanner virtualbox X"

DEPEND=""

RDEPEND="emacs? ( dev-util/my-emacs-meta )
	kde? ( kde-misc/my-kde-meta )
	gtk? ( dev-libs/libdbusmenu )
	dev-util/my-develop-meta
	latex? ( app-text/my-tex-meta[kde=] )
	games-misc/my-games-meta
	media-fonts/my-fonts-meta
	media-misc/my-multimedia-meta[kde=]
	net-misc/teamviewer
"

RDEPEND+="scanner? ( media-gfx/xsane
	kde? ( kde-misc/skanlite ) )
"

# Office
RDEPEND+="app-office/libreoffice
app-officeext/languagetool
"

# Banking
#RDEPEND+="app-crypt/ccid
#app-office/gnucash
#app-office/kmymoney
#"

# E-library
RDEPEND+="kindle? ( app-text/calibre )
app-text/fbreader
"

# Archive files support
RDEPEND+="app-arch/lz4
app-arch/lzop
app-arch/p7zip
app-arch/unrar
"

# Web
RDEPEND+="|| ( www-client/firefox-kde-opensuse www-client/firefox www-client/firefox-bin )
	www-plugins/chrome-binary-plugins
	|| ( www-client/google-chrome-unstable www-client/google-chrome-beta www-client/google-chrome )
	www-plugins/chrome-binary-plugins
	net-misc/grive
"

# Internet
RDEPEND+="net-im/skypeforlinux
net-im/whatsapp-for-linux
net-im/choqok
net-irc/konversation
net-im/signal-desktop-bin
x11-plugins/purple-hangouts
"

# net-im/empathy requires python 3.6

# net-misc/grive ?

# Downloaders
# net-p2p/eiskaltdcpp fails to build due to absence of qtquick1

# Plowshare is stalled, some modules do not work, openssl-1.1 is unsupported
RDEPEND+="net-misc/plowshare
net-misc/plowshare-module-mega
net-misc/plowshare-modules-legacy
"

# net-p2p/retroshare
RDEPEND+="net-misc/youtube-dl
dev-python/beautifulsoup4
net-misc/megacmd
"

# E-Mail
RDEPEND+="mailfetch? (	net-mail/dovecot
			net-mail/fetchmail
		)
"

# Various
RDEPEND+="app-text/pastebinit
app-text/wgetpaste
app-text/dos2unix
app-text/tree
net-misc/minidlna
media-video/simplescreenrecorder
media-gfx/krita
media-gfx/gimp
media-gfx/rawtherapee
"

RDEPEND+="gtk? (
	x11-themes/light-themes
	x11-themes/murrine-themes
	x11-themes/gtk-engines-murrine
	)
"
# Virtualization
RDEPEND+="virtualbox? ( app-emulation/virtualbox
		app-emulation/virtualbox-additions
		app-emulation/virtualbox-extpack-oracle )
	kvm? ( app-emulation/libvirt[qemu]
		app-emulation/virt-manager
		sys-firmware/edk2-ovmf
		app-emulation/virtio-win
		app-crypt/swtpm
	)
"
# kvm ? app-emulation/libguestfs
# Camera
RDEPEND+="sys-fs/exfat-utils
"
# Network tools
RDEPEND+="net-analyzer/wireshark
"

RDEPEND+="X? ( x11-misc/xsel )
"

# misc
RDEPEND+="media-sound/audacity
	net-im/zoom
	www-plugins/lightspark
"
