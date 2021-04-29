EAPI=7
SLOT=0
KEYWORDS="~amd64"
DESCRIPTION="The most awesome Powerline theme for ZSH around!"
HOMEPAGE="https://github.com/bhilburn/powerlevel9k"
EGIT_REPO_URI="https://github.com/bhilburn/powerlevel9k.git"

IUSE="powerline-font"

inherit git-r3

DEPEND="app-shells/oh-my-zsh"
RDEPEND="${DEPEND}
	powerline-font? ( media-fonts/awesome-terminal-fonts )
"

src_install(){
	insinto /usr/share/zsh/site-contrib/oh-my-zsh/themes/${PN}
	doins -r functions
	doins powerlevel9k.zsh-theme prompt_powerlevel9k_setup
}
