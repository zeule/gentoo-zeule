EAPI="5"
SLOT="0"

DESCRIPTION="My set of multimeia packages"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="bash-completion encode kde mpd plasma pulseaudio python subtitles v4l video x264"

DEPEND=""

RDEPEND="kde? (	video? ( media-video/smplayer
		)
		media-sound/kid3
	)
	media-video/mediainfo
	media-video/mkvtoolnix
	media-video/mpv
	mpv-plugin/mpv-mpris
	media-sound/easytag
	pulseaudio? ( media-sound/pavucontrol )
	python? ( media-sound/rgain )
	media-sound/sox
	media-sound/vorbisgain
	mpd? ( media-sound/cantata
		app-misc/media-player-info
		media-sound/mpd
		plasma? ( media-sound/mpDris2 )
		media-sound/mpc
	)
"
# Photos

#RDEPEND+="
#media-gfx/digikam
#RDEPEND+="
#media-gfx/blender
#"
