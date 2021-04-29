EAPI=7
SLOT=0
KEYWORDS=""
DESCRIPTION="The most awesome Powerline theme for ZSH around!"
HOMEPAGE="https://github.com/romkatv/powerlevel10k"
EGIT_REPO_URI="https://github.com/romkatv/powerlevel10k.git"

IUSE="powerline-font"

inherit git-r3

DEPEND="app-shells/oh-my-zsh
	dev-libs/libgit2
"
RDEPEND="${DEPEND}
	powerline-font? ( media-fonts/awesome-terminal-fonts )
"

src_compile() {
	pushd gitstatus
	emake CFLAGS="${CFLAGS}" CPPFLAGS="${CFLAGS} -DGITSTATUS_ZERO_NSEC -D_GNU_SOURCE"
	popd
}

src_install(){
	insinto /usr/share/zsh/site-contrib/oh-my-zsh/themes/${PN}
	rm -rf "gitstatus/obj"
	rm -rf "gitstatus/.gitignore"
	rm -rf "gitstatus/.gitattributes"
	rm -rf "gitstatus/src"
	rm -rf "gitstatus/build"
	rm -rf "gitstatus/deps"
	rm -rf "gitstatus/Makefile"
	rm -rf "gitstatus/mbuild"
	rm "gitattributes"
	rm "gitignore"
	rm -rf "gitstatus/usrbin/.gitkeep"
	rm "gitstatus/.clang-format"
	rm -rf "gitstatus/.vscode/"
	doins -r .
	for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
		zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
	done
}
