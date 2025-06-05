EAPI=7
SLOT=0

DESCRIPTION="My set of packages for supporting my hardware"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android cups fingerprint kindle logitech
	machines_minisforum_hx90  machines_office_pc machines_asus_x870e_proart
	printer_devices_brother_mfc_l8690 printer_devices_epson_wf_3520 printer_devices_epson_et_5170
	pulseaudio scanner v4l video_cards_intel video_cards_radeon"
REQUIRED_USE="?? ( machines_minisforum_hx90 machines_office_pc machines_asus_x870e_proart )
	printer_devices_epson_wf_3520? ( cups )
	printer_devices_epson_et_5170? ( cups )
	printer_devices_brother_mfc_l8690? ( cups )"

DEPEND=""
RDEPEND=""

#boot
RDEPEND+=" sys-boot/refind
	sys-boot/efibootmgr
"

# Firmware
RDEPEND+="sys-kernel/linux-firmware
"

RDEPEND+="cups? ( net-print/foomatic-db-ppds )
	sys-apps/nvme-cli
	sys-apps/usb_modeswitch
	x11-misc/read-edid
"
RDEPEND+="machines_asus_x870e_proart? ( app-misc/openrgb
	)
"

RDEPEND+="cups? ( printer_devices_epson_wf_3520? ( net-print/epson-inkjet-printer-escpr )
		printer_devices_epson_et_5170? ( net-print/epson-inkjet-printer-escpr:2 )
		printer_devices_brother_mfc_l8690? ( net-print/brother-mfcl8690cdw-bin[-scanner] )
	)
"

RDEPEND+="scanner? ( media-gfx/sane-airscan
	printer_devices_epson_wf_3520? ( media-gfx/iscan
		media-gfx/iscan-plugin-network-nt )
	printer_devices_brother_mfc_l8690? ( media-gfx/brscan4 )
)
"

# Logitech mouse/keyboard
RDEPEND+="logitech? ( dev-libs/libratbag
	app-misc/piper
	app-misc/solaar
)
"

# Android SDK for phone
RDEPEND+="android? ( dev-util/android-sdk-cmdline-tools
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
RDEPEND+="v4l? ( media-libs/libv4l[utils] )
"

# Fingerprint
#RDEPEND+="fingerprint? ( sys-auth/fingerprint-gui )
#"

#Headphones

RDEPEND+="pulseaudio? ( media-video/pipewire )
"

# Kindle
RDEPEND+="kindle? ( app-text/kindlegen )
"
