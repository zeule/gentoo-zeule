# Copyright 2005-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"

DESCRIPTION="My set of system packages"
HOMEPAGE="https://github.com/zeule/gentoo-zeule"
LICENSE="metapackage"

KEYWORDS="~amd64"
IUSE="bash-completion btrfs networkmanager powerline systemd usb vim zsh-completion"

DEPEND=""

RDEPEND="app-admin/needrestart
	app-admin/eclean-kernel
	app-admin/logrotate
	app-admin/makepasswd
	app-misc/fdupes
	app-misc/rdfind
	sys-fs/ncdu
	btrfs? ( sys-fs/duperemove )
	app-editors/nano
	bash-completion? ( app-shells/bash-completion
		app-shells/gentoo-bashcomp )
	dev-libs/libcgroup
	sys-apps/cpuid
	sys-apps/dmidecode
	sys-apps/dstat
	sys-apps/hdparm
	sys-apps/i2c-tools
	sys-apps/mlocate
	sys-apps/udevil
	systemd? ( sys-apps/systemd[sysv-utils]
		sys-apps/my-systemd-units
		)
	sys-fs/filesystems-tools-meta
	sys-block/gparted
	sys-block/partclone
	sys-fs/extundelete
	sys-fs/inotify-tools
	sys-fs/libeatmydata
	sys-devel/mold
	sys-kernel/dracut
	sys-kernel/gentoo-sources
	sys-libs/gpm
	sys-power/cpupower
	sys-power/powertop
	sys-process/htop
	sys-process/iotop-c
	sys-process/lsof
	sys-process/time
	sys-kernel/kernel
	powerline? (
		media-fonts/powerline-symbols
		media-fonts/awesome-terminal-fonts
		vim? ( app-vim/airline )
		zsh-completion? ( app-shells/powerlevel10k )
	)
	zsh-completion? ( app-shells/gentoo-zsh-completions
			app-shells/oh-my-zsh
			app-shells/zsh-completions
			app-shells/zsh-autosuggestions
			app-shells/fast-syntax-highlighting
	)
"

# Network
RDEPEND+="net-misc/dhcpcd
net-misc/netkit-telnetd
networkmanager? ( net-vpn/networkmanager-openvpn
	net-vpn/networkmanager-pptp
	net-vpn/networkmanager-vpnc
	net-vpn/networkmanager-libreswan
	net-vpn/networkmanager-openconnect
	)
net-misc/bridge-utils
net-misc/iperf
net-misc/ntp
net-vpn/openvpn
net-misc/whois
net-misc/wol
net-wireless/wireless-tools
net-wireless/iw
|| ( >=sys-apps/util-linux-2.31 net-wireless/rfkill )
net-analyzer/dhcpdump
net-analyzer/iftop
net-analyzer/iptraf-ng
net-analyzer/net-snmp
net-analyzer/nethogs
net-analyzer/nettop
net-analyzer/nmapsi
net-analyzer/speedtest-cli
net-analyzer/tcpdump
net-analyzer/traceroute
net-firewall/iptables
net-firewall/nftables
net-fs/autofs
net-fs/curlftpfs
net-fs/davfs2
net-fs/nfs-utils
sys-apps/ethtool
sys-apps/less
sys-apps/memtest86+
app-portage/lto-rebuild
"

RDEPEND+="usb? ( sys-apps/usbutils )
"

RDEPEND+="dev-util/debugedit
"
