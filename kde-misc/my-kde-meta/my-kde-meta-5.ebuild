EAPI="5"
SLOT="0"

inherit mykde

DESCRIPTION="My set of KDE packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="+android bluetooth gtk gtk3 semantic-desktop mldonkey +networkmanager pim +pulseaudio +scanner +telepathy +torrent +qt5"

DEPEND=""

RDEPEND="kde-plasma/plasma-meta:5
	kde-apps/kdecore-meta:5
	kde-apps/kdegraphics-meta:5[scanner=]
	kde-apps/kdeutils-meta[7zip,-floppy,lrz,rar]
	kde-plasma/xdg-desktop-portal-kde:5
"
#RDEPEND+="kde-apps/kde-l10n:5
#"

RDEPEND+="kde-apps/dolphin-plugins-git:5
	kde-apps/kdialog:5
	kde-apps/kfind:5
	kde-apps/keditbookmarks:5
"

#part of kdenetwork
# kde-apps/kget:5
RDEPEND+="kde-apps/krdc
kde-apps/kdenetwork-filesharing
"


#part of kdepim
RDEPEND+="kde-apps/kidentitymanagement:5
pim? ( kde-apps/akonadi-calendar:5
	kde-apps/kalarmcal:5
	kde-apps/kdepim-meta:5
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

# no KDE 5 version:
# kde-apps/audiocd-kio
#part of kdemultimedia
RDEPEND+="kde-apps/dragon:5
kde-apps/kmix:5
kde-apps/ffmpegthumbs:5
pulseaudio? ( kde-plasma/plasma-pa:5 )
"

# These packages lack kde-apps versions
RDEPEND+="kde-apps/kipi-plugins:5
media-gfx/digikam
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

RDEPEND+="kde-apps/kate
kde-apps/yakuake:5
|| ( net-p2p/qbit net-p2p/qbittorrent )
mldonkey? ( net-p2p/kmldonkey )
bluetooth? ( kde-plasma/bluedevil )
sci-astronomy/kstars
kde-apps/filelight:5
kde-plasma/kdeplasma-addons
sys-block/partitionmanager:5
media-gfx/graphicsmagick
kde-apps/kmag
kde-misc/openofficeorg-thumbnail:5
|| ( media-video/smplayer media-video/smplayer2 )
|| ( kde-plasma/kde-cli-tools[kdesu] kde-misc/kdesudo )
networkmanager? ( kde-plasma/plasma-nm )
kde-misc/krename
media-gfx/icoutils
kde-plasma/kscreen
telepathy? (
	kde-apps/plasma-telepathy-meta:5
	net-im/telepathy-morse
)
!telepathy? ( kde-apps/kopete )
x11-misc/sddm
kde-plasma/sddm-kcm
"
#
#kde-misc/kcm-touchpad
#"

RDEPEND+="
	android? ( kde-misc/kdeconnect:5 )
"

#themes, styles, etc. ...
RDEPEND+="x11-themes/qtcurve[qt5=,gtk=]
kde-frameworks/breeze-icons
gtk? (
	x11-themes/oxygen-gtk
	kde-plasma/breeze-gtk
	kde-plasma/kde-gtk-config
)
x11-misc/xclip
x11-themes/materia-kde
x11-themes/materia-theme
gtk3? (
	x11-misc/gtk3-nocsd
)
"

RDEPEND+="kde-apps/kwalletmanager:5
kde-apps/signon-kwallet-extension
kde-plasma/plasma-applet-thermal-monitor
net-libs/telepathy-accounts-signon
kde-misc/kio-gdrive
torrent? ( net-p2p/ktorrent )
kde-plasma/plasma-browser-integration
kde-plasma/discover
x11-apps/ocs-url
"
