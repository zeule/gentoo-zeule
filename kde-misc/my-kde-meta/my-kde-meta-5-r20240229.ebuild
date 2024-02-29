EAPI=8
SLOT=5

DESCRIPTION="My set of KDE packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="+android bluetooth gtk semantic-desktop +networkmanager pim photoarchive +pulseaudio +scanner +telepathy +torrent +qt5 wayland zeroconf"

DEPEND=""

RDEPEND="kde-plasma/plasma-meta:${SLOT}[bluetooth=,browser-integration,desktop-portal,discover,display-manager,gtk=,networkmanager=,pulseaudio=,sddm,wallpapers]
	kde-apps/kdecore-meta:${SLOT}
	kde-apps/kdegraphics-meta:${SLOT}[scanner=]
	kde-apps/kdeutils-meta[7zip,-floppy,lrz,rar]
	wayland? ( dev-libs/weston[fullscreen,wayland-compositor] )
"
#RDEPEND+="kde-apps/kde-l10n:${SLOT}
#"

RDEPEND+="kde-apps/dolphin-plugins-git:${SLOT}
	kde-apps/kdialog:${SLOT}
	kde-apps/kfind:${SLOT}
	kde-apps/keditbookmarks:${SLOT}
"

#part of kdenetwork
# kde-apps/kget:${SLOT}
# kde-apps/krdc:${SLOT}
RDEPEND+="kde-apps/kdenetwork-filesharing:${SLOT}
zeroconf? ( net-misc/kio-zeroconf )
"

#part of kdepim
RDEPEND+="kde-apps/kidentitymanagement:${SLOT}
pim? ( kde-apps/akonadi-calendar:${SLOT}
	kde-apps/kdepim-meta:${SLOT}
	virtual/mysql
	)
"

# RDEPEND+="kde-apps/kgpg
# kde-base/kdepim-icons
# kde-base/ktimetracker
# kde-base/kmail
# kde-base/kjots
# kde-base/kalarm
# kde-base/kaddressbook
# "
#
# # kde-base/kleopatra ?
# RDEPEND+="kde-base/knotes
# kde-base/kontact
# kde-base/korganizer
# kde-apps/ktimer
# kde-base/akregator
# "

#part of kdemultimedia
RDEPEND+="kde-apps/dragon:${SLOT}
kde-apps/ffmpegthumbs:${SLOT}
"

RDEPEND+="photoarchive? ( media-gfx/digikam:${SLOT} )
"

# these too
# kde-misc/customizable-weather
# kde-misc/kaffeine-ty
# net-misc/knemo
# net-misc/smb4k
# kde-misc/krename
# kde-apps/jovie
# kde-apps/kmouth
# kde-misc/kio-locate
# app-dicts/dikt
# kde-misc/akonadi-exchange
# kde-base/akonadiconsole

RDEPEND+="kde-apps/kate:${SLOT}
kde-apps/yakuake:${SLOT}
kde-misc/krusader:${SLOT}
torrent? ( || ( net-p2p/qbit net-p2p/qbittorrent ) )
bluetooth? ( kde-plasma/bluedevil:${SLOT} )
sci-astronomy/kstars:${SLOT}
kde-apps/filelight:${SLOT}
kde-plasma/kdeplasma-addons:${SLOT}
sys-block/partitionmanager:${SLOT}
media-gfx/graphicsmagick
kde-apps/kmag:${SLOT}
kde-misc/openofficeorg-thumbnail:${SLOT}
|| ( media-video/smplayer media-video/smplayer2 )
|| ( kde-plasma/kde-cli-tools:${SLOT}[kdesu] kde-misc/kdesudo:${SLOT} )
networkmanager? ( kde-plasma/plasma-nm:${SLOT} )
kde-misc/krename:${SLOT}
media-gfx/icoutils
telepathy? (
	kde-apps/plasma-telepathy-meta:${SLOT}
	net-im/telepathy-morse
)
!telepathy? ( kde-apps/kopete:${SLOT} )
"
#
#kde-misc/kcm-touchpad
#"

RDEPEND+="
	android? ( kde-misc/kdeconnect:${SLOT} )
"

#themes, styles, etc. ...
RDEPEND+="x11-themes/qtcurve[qt5=,gtk=]
gtk? (
	x11-themes/oxygen-gtk:3
	kde-plasma/breeze-gtk:${SLOT}
	kde-plasma/kde-gtk-config:${SLOT}
	sys-apps/xdg-desktop-portal-gtk
	x11-misc/gtk3-nocsd
)
x11-misc/xclip
x11-themes/materia-kde
x11-themes/materia-theme
"

RDEPEND+="kde-apps/kwalletmanager:${SLOT}
kde-apps/signon-kwallet-extension
net-libs/telepathy-accounts-signon
kde-misc/kio-gdrive
torrent? ( net-p2p/ktorrent:${SLOT} )
x11-apps/ocs-url
"
