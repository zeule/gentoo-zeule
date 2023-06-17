EAPI="8"
SLOT="0"

DESCRIPTION="My set of virtualization packages"
LICENSE="metapackage"

KEYWORDS="~amd64"
IUSE="kvm virtualbox"
DEPEND=""

RDEPEND+="virtualbox? ( app-emulation/virtualbox
		app-emulation/virtualbox-additions
		app-emulation/virtualbox-extpack-oracle )
	kvm? ( app-emulation/libvirt[qemu]
		app-emulation/virt-manager
		app-emulation/virtio-win
		app-crypt/swtpm
		app-emulation/virtiofsd
	)
"
# kvm ? app-emulation/libguestfs
