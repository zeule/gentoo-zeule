EAPI="5"
SLOT="0"

DESCRIPTION="My set of desktop packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="downloaders emacs games gnome kde gtk kvm latex mailfetch pdf kindle scanner transcode virtualbox X wayland"
DEPEND=""

RDEPEND="emacs? ( dev-util/my-emacs-meta )
	gnome? ( gnome-extra/my-gnome-meta )
	kde? ( kde-misc/my-kde-meta )
	gtk? ( dev-libs/libdbusmenu )
	dev-util/my-develop-meta
	latex? ( app-text/my-tex-meta[kde=] )
	games? ( games-misc/my-games-meta )
	media-fonts/my-fonts-meta
	media-misc/my-multimedia-meta[kde=]
	net-misc/teamviewer
"

RDEPEND+="scanner? (
	kde? ( kde-misc/skanlite media-gfx/skanpage )
)
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
"

# Internet
RDEPEND+="net-im/skypeforlinux
net-im/choqok
net-irc/konversation
net-im/signal-desktop-bin
net-im/zoom
x11-plugins/purple-hangouts
x11-plugins/purple-signal
net-im/telegram-desktop-bin
"

# net-im/empathy requires python 3.6

# net-misc/grive ?

# Downloaders
# net-p2p/eiskaltdcpp fails to build due to absence of qtquick1

# Plowshare is stalled, some modules do not work, openssl-1.1 is unsupported
RDEPEND+="downloaders? ( net-misc/plowshare
net-misc/plowshare-module-mega
net-misc/plowshare-modules-legacy
)
"

# net-p2p/retroshare
RDEPEND+="downloaders? ( net-misc/yt-dlp
dev-python/beautifulsoup4
net-misc/megacmd
net-misc/gallery-dl
)
"

# E-Mail
RDEPEND+="mailfetch? (	net-mail/dovecot
			net-mail/fetchmail
		)
"

# Various
RDEPEND+="app-text/dos2unix
app-text/tree
net-misc/minidlna
media-video/simplescreenrecorder
media-gfx/gimp
media-gfx/krita
media-gfx/rawtherapee
"

# Virtualization
RDEPEND+="virtualbox? ( app-emulation/virtualbox
		app-emulation/virtualbox-additions
		app-emulation/virtualbox-extpack-oracle )
	kvm? ( app-emulation/libvirt[qemu]
		app-emulation/virt-manager
		app-emulation/virtio-win
		app-crypt/swtpm
	)
"
# kvm ? app-emulation/libguestfs
# Network tools
RDEPEND+="net-analyzer/wireshark
"

RDEPEND+="X? (
		x11-misc/xsel
)
	wayland? (
		app-misc/wayland-utils
)
"

# misc
RDEPEND+="media-sound/audacity
	net-misc/anydesk
	media-video/libva-utils
	x11-misc/vdpauinfo
	transcode? ( media-video/handbrake )
"
