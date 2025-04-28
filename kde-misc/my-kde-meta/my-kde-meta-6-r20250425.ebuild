EAPI=8
SLOT=6

DESCRIPTION="My set of KDE packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="+android bluetooth gtk semantic-desktop +networkmanager pim photoarchive +pulseaudio +scanner +torrent +qt5 wayland zeroconf"

DEPEND=""

RDEPEND="kde-plasma/plasma-meta:${SLOT}[bluetooth=,browser-integration,discover,display-manager,gtk=,networkmanager=,pulseaudio=,sddm,wallpapers]
	>=kde-apps/kdecore-meta-24.02.0[share,webengine]
	kde-apps/thumbnailers:${SLOT}[pdf,video]
	kde-apps/kdegraphics-meta[scanner=]
	kde-apps/kdenetwork-meta
	kde-apps/kdeutils-meta[7zip,lrz,rar]
	wayland? ( x11-misc/sddm-wayland-config )
"
#RDEPEND+="kde-apps/kde-l10n:${SLOT}
#"

RDEPEND+="kde-apps/dolphin-plugins-git:${SLOT}
	kde-apps/kdialog:${SLOT}
	kde-apps/kfind:${SLOT}
	kde-apps/keditbookmarks:${SLOT}
"

#part of kdepim
RDEPEND+="kde-apps/kidentitymanagement:${SLOT}
pim? ( kde-apps/akonadi-calendar:${SLOT}
	>=kde-apps/kdepim-meta-24.02.0
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
# kde-misc/krusader no KF6 version yet

RDEPEND+="kde-apps/kate:${SLOT}
kde-apps/yakuake:${SLOT}
torrent? ( || ( net-p2p/qbit net-p2p/qbittorrent ) )
bluetooth? ( kde-plasma/bluedevil:${SLOT} )
kde-apps/filelight:${SLOT}
kde-plasma/kdeplasma-addons:${SLOT}
sys-block/partitionmanager:${SLOT}
media-gfx/graphicsmagick
kde-apps/kmag:${SLOT}
|| ( media-video/smplayer media-video/smplayer2 )
|| ( kde-plasma/kde-cli-tools:${SLOT}[kdesu] kde-misc/kdesudo:${SLOT} )
networkmanager? ( kde-plasma/plasma-nm:${SLOT} )
kde-misc/krename
media-gfx/icoutils
"
#
#kde-misc/kcm-touchpad
#"

RDEPEND+="
	android? ( kde-misc/kdeconnect:${SLOT} )
"

#themes, styles, etc. ...
RDEPEND+="gtk? (
	x11-themes/oxygen-gtk:3
	kde-plasma/breeze-gtk:${SLOT}
	kde-plasma/kde-gtk-config:${SLOT}
	sys-apps/xdg-desktop-portal-gtk
	x11-misc/gtk3-nocsd
)
kde-misc/darkly
x11-misc/xclip
"
#x11-themes/materia-kde
#x11-themes/materia-theme

# kde-apps/signon-kwallet-extension no :6 version
# kde-misc/kio-gdrive  no :6 version
RDEPEND+="kde-apps/kwalletmanager:${SLOT}
torrent? ( net-p2p/ktorrent:${SLOT} )
x11-apps/ocs-url
"
