EAPI=7
inherit git-r3 cmake-utils
SLOT=0
HOMEPAGE="https://github.com/cvuchener/hidpp"
EGIT_REPO_URI="https://github.com/cvuchener/hidpp.git"

src_install() {
	cmake-utils_src_install
	mv ${D}/usr/lib ${D}/usr/lib64
}
