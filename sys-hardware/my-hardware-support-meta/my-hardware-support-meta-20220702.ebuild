EAPI=7
SLOT=0

DESCRIPTION="My set of packages for supporting my hardware"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android cups efi fingerprint kindle machine_clevo_p17sm machine_minisforum_hx90 pulseaudio scanner v4l video_cards_intel video_cards_radeon"

DEPEND=""
RDEPEND=""

#boot
RDEPEND+="efi? ( sys-boot/refind
		sys-boot/efibootmgr )
	!efi? ( sys-boot/grub
		sys-boot/os-prober )
"

# Firmware
RDEPEND+="sys-kernel/linux-firmware
"

RDEPEND+="cups? ( net-print/foomatic-db-ppds )
	sys-apps/usb_modeswitch
	x11-misc/read-edid
"
#Keyboard backlit for Clevo
#app-laptop/tuxedo-keyboard
RDEPEND+="machine_clevo_p17sm? ( app-laptop/clevo-xsm-wmi-module
	)
	machine_minisforum_hx90? ( sys-apps/nvme-cli
	)
"

# printer Epson MF 3520
RDEPEND+="cups? ( net-print/epson-inkjet-printer-escpr )
	net-print/hplip
"

# Scaner Epson MF 3520
RDEPEND+="scanner? ( media-gfx/iscan
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
sys-apps/gptfdisk
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

RDEPEND+="pulseaudio? ( media-video/pipewire )
"

# Workarounds
RDEPEND+="sys-power/acpi_call
"

# Kindle
RDEPEND+="kindle? ( app-text/kindlegen )
"
