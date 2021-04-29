EAPI=7
SLOT=0

DESCRIPTION="A command line tool used to build eBooks that can be sold through Amazon's Kindle platform."
HOMEPAGE="https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211"
LICENSE="Amazon-EULA"
SRC_URI="https://s3.amazonaws.com/${PN}/${PN}_linux_2.6_i386_v${PV/\./_}.tar.gz"

S="${WORKDIR}"

src_install() {
	dobin kindlegen
	dodoc EULA.txt
	dodoc 'KindleGen Legal Notices 2013-02-19 Linux.txt'
}

