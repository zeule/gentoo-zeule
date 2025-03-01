EAPI="8"
SLOT="0"

DESCRIPTION="My set of desktop packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="+conferencing cups downloaders emacs games gnome kde gtk latex mailfetch outlook pdf kindle +rdp scanner sound-edit transcode X wayland"
DEPEND=""

RDEPEND="emacs? ( dev-util/my-emacs-meta )
	gnome? ( gnome-extra/my-gnome-meta )
	kde? ( kde-misc/my-kde-meta )
	gtk? ( dev-libs/libdbusmenu )
	dev-util/my-develop-meta
	dev-util/my-projects-deps-meta
	latex? ( app-text/my-tex-meta[kde=] )
	games? ( games-misc/my-games-meta )
	media-fonts/my-fonts-meta
	media-misc/my-multimedia-meta[kde=]
	rdp? ( net-misc/teamviewer )
	app-emulation/my-virtualization-meta
	net-misc/freerdp
	X? ( x11-apps/xlsclients )
"

RDEPEND+="cups? (
		net-print/cups-meta[browsed,foomatic,pdf,poppler,postscript,zeroconf]
	)
	scanner? (
		kde? ( kde-misc/skanlite media-gfx/skanpage )
)
"

# Office
RDEPEND+="app-office/libreoffice
app-officeext/languagetool
"

RDEPEND+="outlook? ( net-im/teams-for-linux
	kde-apps/kdepim-meta
)
"

# Banking
#RDEPEND+="app-crypt/ccid
#app-office/gnucash
#app-office/kmymoney
#"

# E-library
RDEPEND+="kindle? ( app-text/calibre )
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
RDEPEND+="net-irc/konversation
net-im/signal-desktop-bin
conferencing? ( net-im/zoom )
x11-plugins/purple-signal
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
# net-misc/megacmd compilation fails
RDEPEND+="downloaders? ( net-misc/yt-dlp
dev-python/beautifulsoup4
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
RDEPEND+="sound-edit? ( media-sound/audacity )
	rdp? ( net-misc/anydesk )
	media-video/libva-utils
	x11-misc/vdpauinfo
	transcode? ( media-video/handbrake )
"
