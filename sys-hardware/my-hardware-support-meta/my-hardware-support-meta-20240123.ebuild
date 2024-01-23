EAPI=7
SLOT=0

DESCRIPTION="My set of packages for supporting my hardware"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="android cups efi fingerprint kindle logitech
	machines_clevo_p17sm machines_minisforum_hx90 machines_dell_3650 machines_office_pc
	printer_devices_brother_mfc_l8690 printer_devices_epson_wf_3520 printer_devices_epson_ecotank
	pulseaudio nvme scanner v4l video_cards_intel video_cards_radeon"
REQUIRED_USE="?? ( machines_clevo_p17sm machines_minisforum_hx90 machines_dell_3650 machines_office_pc )
	machines_minisforum_hx90? ( efi nvme )
	machines_office_pc? ( efi nvme )
	printer_devices_epson_wf_3520? ( cups )
	printer_devices_epson_ecotank? ( cups )
	printer_devices_brother_mfc_l8690? ( cups )"

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
	machines_dell_3650? ( sys-firmware/intel-microcode  )
"

RDEPEND+="cups? ( net-print/foomatic-db-ppds )
	nvme? ( sys-apps/nvme-cli )
	sys-apps/usb_modeswitch
	x11-misc/read-edid
"
#Keyboard backlit for Clevo
#app-laptop/tuxedo-keyboard
RDEPEND+="machines_clevo_p17sm? ( app-laptop/clevo-xsm-wmi-module
	)
"

RDEPEND+="cups? ( printer_devices_epson_wf_3520? ( net-print/epson-inkjet-printer-escpr )
		printer_devices_epson_ecotank? ( net-print/epson-inkjet-printer-escpr )
		printer_devices_brother_mfc_l8690? ( net-print/brother-mfcl8690cdw-bin[-scanner] )
	)
	net-print/hplip
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
