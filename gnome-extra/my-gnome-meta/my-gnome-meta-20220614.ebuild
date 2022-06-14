EAPI=7
SLOT=0

KEYWORDS="~x86 ~amd64"
DESCRIPTION="My set of Gnome packages"
LICENSE="metapackage"

RDEPEND="gnome-base/gnome[-extras]
	app-arch/file-roller
	app-dicts/gnome-dictionary
	gnome-base/dconf-editor
	gnome-extra/gnome-calculator
	gnome-extra/gnome-power-manager
	gnome-extra/gnome-system-monitor
	gnome-extra/gnome-tweaks
	gnome-extra/gnome-weather
	gnome-extra/nautilus-sendto
	gnome-extra/sushi
	media-gfx/gnome-font-viewer
	media-gfx/gnome-screenshot
	net-analyzer/gnome-nettool
	sys-apps/baobab
	sys-apps/gnome-disk-utility
"
