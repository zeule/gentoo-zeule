EAPI="8"
SLOT="0"

DESCRIPTION="My set of virtualization packages"
LICENSE="metapackage"

KEYWORDS="~amd64"
IUSE="kvm looking-glass virtualbox"
REQUIRED_USE="looking-glass? ( kvm )"
DEPEND=""

RDEPEND+="virtualbox? ( app-emulation/virtualbox
		app-emulation/virtualbox-additions
		app-emulation/virtualbox-extpack-oracle )
	kvm? ( app-emulation/libvirt[qemu]
		app-emulation/qemu[io-uring,spice,usbredir,virgl]
		app-emulation/virt-manager
		app-emulation/virtio-win
		app-crypt/swtpm
		looking-glass? ( app-emulation/looking-glass
				app-emulation/looking-glass-kvmfr
		)
	)
"
# kvm ? app-emulation/libguestfs
