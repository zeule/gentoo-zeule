# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# version of romkatv's libgit2 fork required for gitstatus
# update from 'gitstatus/build.info' for EVERY new release
libgit2ver="tag-82cefe2b42300224ad3c148f8b1a569757cc617a"

if [[ "${PV}" == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/romkatv/powerlevel10k.git"
	inherit git-r3
else
	SRC_URI="https://github.com/romkatv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
			 https://github.com/romkatv/libgit2/archive/${libgit2ver}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
HOMEPAGE="https://github.com/romkatv/powerlevel10k"

LICENSE="MIT GPL-3"
SLOT="0"
IUSE="nerd-fonts oh-my-zsh"
RESTRICT="mirror"

RDEPEND="
	app-shells/zsh
	nerd-fonts? ( media-fonts/nerdfonts[meslo] )
	oh-my-zsh? ( app-shells/oh-my-zsh )
"

DOCS=(
	README.md
	gitstatus/README.gitstatus.md
	gitstatus/docs/listdir.md
	)

src_configure() {
	# get, extract, and build libgit2 fork (after finding version required)
	#libgit2ver=$(sed -ne 's@libgit2_version=\"\([^]]*\)\"@\1@gp' "${S}/gitstatus/build.info")
	#wget "https://github.com/romkatv/libgit2/archive/${libgit2ver}.tar.gz"
	#tar -xzf "${libgit2ver}.tar.gz"

	cd "${WORKDIR}/libgit2-${libgit2ver}"
	cmake \
		-DZERO_NSEC=ON \
		-DTHREADSAFE=ON \
		-DUSE_BUNDLED_ZLIB=ON \
		-DREGEX_BACKEND=builtin \
		-DUSE_HTTP_PARSER=builtin \
		-DUSE_SSH=OFF \
		-DUSE_HTTPS=OFF \
		-DBUILD_CLAR=OFF \
		-DUSE_GSSAPI=OFF \
		-DUSE_NTLMCLIENT=OFF \
		-DBUILD_SHARED_LIBS=OFF \
		-DENABLE_REPRODUCIBLE_BUILDS=ON \
		.
	make

	# build gitstatus
	cd "${WORKDIR}/${P}/gitstatus"
	export CXXFLAGS+=" -I${WORKDIR}/libgit2-${libgit2ver}/include -DGITSTATUS_ZERO_NSEC -D_GNU_SOURCE"
	export LDFLAGS+=" -L${WORKDIR}/libgit2-${libgit2ver}"
	make

	# compile zsh files (and rename a doc file)
	cd "${WORKDIR}/${P}"
	mv "gitstatus/README.md" "gitstatus/README.gitstatus.md"
	for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
		zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
	done
}

src_install() {
	einstalldocs

	# define install directory
	local install_dir="/usr/share/zsh/$(usex oh-my-zsh site-contrib/oh-my-zsh/themes themes)/${PN}"
	insinto "${install_dir}"

	# clean up unneccesary files before install
	rm -rf "gitstatus/obj"
	rm -rf "gitstatus/.gitignore"
	rm -rf "gitstatus/.gitattributes"
	rm -rf "gitstatus/src"
	rm -rf "gitstatus/build"
	rm -rf "gitstatus/deps"
	rm -rf "gitstatus/Makefile"
	rm -rf "gitstatus/mbuild"
	rm -rf "gitstatus/LICENSE"
	rm -rf "gitstatus/README.gitstatus.md"
	rm -rf "gitstatus/docs"
	rm ".gitattributes"
	rm ".gitignore"
	rm -rf "gitstatus/usrbin/.gitkeep"
	rm "gitstatus/.clang-format"
	rm -rf "gitstatus/.vscode/"
	rm -rf "internal/notes.md"

	# do install
	doins -r "config"
	doins -r "gitstatus"
	doins -r "internal"
	doins "powerlevel10k.zsh-theme"
	doins "powerlevel9k.zsh-theme"
	doins "powerlevel10k.zsh-theme.zwc"
	doins "powerlevel9k.zsh-theme.zwc"
	doins "prompt_powerlevel10k_setup"
	doins "prompt_powerlevel9k_setup"

	exeinto "${install_dir}/gitstatus/usrbin"
	doexe "gitstatus/usrbin/gitstatusd"
}

pkg_postinst() {
	elog "To enable, add the following to your .zshrc:"
	use oh-my-zsh && elog "ZSH_THEME=\"powerlevel10k/powerlevel10k\""
	use !oh-my-zsh && elog "'source /usr/share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme'"
}
