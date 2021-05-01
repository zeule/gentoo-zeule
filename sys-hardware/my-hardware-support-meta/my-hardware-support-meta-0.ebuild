EAPI=7
SLOT=0

DESCRIPTION="My set of packages for supporting my hardware"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android cups efi fingerprint kindle pulseaudio scanner v4l video_cards_intel video_cards_radeon"

DEPEND=""
RDEPEND=""

#boot
RDEPEND+="efi? ( sys-boot/refind
		sys-boot/efibootmgr )
	!efi? ( sys-boot/grub
		sys-boot/os-prober )
"

# Firmware
RDEPEND+="|| ( >=sys-kernel/linux-firmware-9999[-savedconfig]
		( sys-kernel/linux-firmware[savedconfig]
		video_cards_radeon? ( x11-drivers/radeon-ucode )
		sys-firmware/iwl7260-ucode ) )
	sys-firmware/intel-microcode
"

RDEPEND+="cups? ( net-print/foomatic-db-ppds )
	sys-apps/usb_modeswitch
	x11-misc/read-edid
"
#Keyboard backlit for Clevo
#app-laptop/tuxedo-keyboard
RDEPEND+="app-laptop/clevo-xsm-wmi-module
"

# printer Epson MF 3520
RDEPEND+="cups? ( net-print/epson-inkjet-printer-escpr )
	net-print/hplip
"

# Scaner Epson MF 3520
RDEPEND+="scanner? ( media-gfx/iscan
		media-gfx/iscan-plugin-esdip
		media-gfx/iscan-plugin-network-nt )
"

# Logitech mouse/keyboard
RDEPEND+="dev-libs/libratbag
app-misc/piper
"

# Android SDK for phone
RDEPEND+="android? ( dev-util/android-sdk-update-manager
			app-mobilephone/heimdall )
"

RDEPEND+="sys-apps/lm-sensors
app-benchmarks/i7z
sys-apps/lshw
sys-apps/sdparm
sys-apps/smartmontools
app-admin/hddtemp
sys-power/thermald
"

# Webcam tune
RDEPEND+="v4l? ( media-tv/v4l-utils )
"

# Fingerprint
#RDEPEND+="fingerprint? ( sys-auth/fingerprint-gui )
#"

#Headphones

RDEPEND+="pulseaudio? ( media-sound/pulseaudio-modules-bt media-sound/pulseaudio[-bluetooth] )
"

# Workarounds
RDEPEND+="sys-power/acpi_call
"

# Kindle
RDEPEND+="kindle? ( app-text/kindlegen )
"
