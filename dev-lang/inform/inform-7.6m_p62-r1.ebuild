# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils versionator

MY_MAJOR=$(get_version_component_range 2)
MY_LETTER=$(get_version_component_range 3)
MY_MINOR=$(get_version_component_range 4)

MY_LOWERS=abcdefghijklmnopqrstuvwxyz
MY_UPPERS=ABCDEFGHIJKLMNOPQRSTUVWXYZ
MY_INDEX=${MY_LOWERS%${MY_LETTER}*}
MY_UPPER=${MY_UPPERS:${#MY_INDEX}:1}

MY_PV=${MY_MAJOR}${MY_UPPER}${MY_MINOR#p}
DESCRIPTION="Design system for interactive fiction"
HOMEPAGE="http://inform7.com/"
SRC_URI="http://inform7.com/download/content/${MY_PV}/I7_${MY_PV}_Linux_all.tar.gz"

# "Inform" for the core, "GPL-2" for the i7 user-interface script
LICENSE="Inform GPL-2"
SLOT="7"
#KEYWORDS="-* ~amd64 ~arm ~ppc ~x86"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RESTRICT="strip"

DEPEND=""
# i7 is written in perl, and uses uuidgen from e2fsprogs
RDEPEND="dev-lang/perl
	sys-fs/e2fsprogs
	games-engines/glkfrotz
	games-engines/glulxe
	>=dev-lang/inform-6.33:0"

S=${WORKDIR}/inform7-${MY_PV}

src_unpack() {
	unpack ${A}
	cd "${S}"

	mkdir usr
	cd usr

	case ${CHOST} in
		# XXX if the arm team wants to keyword this, someone who knows
		# how these things work should probably restrict this to
		# compatible CHOSTS
		arm*-*)     MY_ARCH=armv6lhf ;;
		i?86-*)     MY_ARCH=i386     ;;
		# XXX does it work on ppc64? (statically linked, so doesn't
		# need 32bit libs)
		powerpc*-*) MY_ARCH=ppc      ;;
		x86_64-*)   MY_ARCH=x86_64   ;;
		*) die "unsupported CHOST"
	esac

	unpack ./../inform7-common_${MY_PV}_all.tar.gz
	unpack ./../inform7-compilers_${MY_PV}_${MY_ARCH}.tar.gz
	# We don't currently use anything from here, but a future version
	# might include more interpreters.
	unpack ./../inform7-interpreters_${MY_PV}_${MY_ARCH}.tar.gz

	epatch "${FILESDIR}"/inform7-6L02-paths-r1.patch
	epatch "${FILESDIR}"/inform7-6L02-readonly-var.patch
	epatch "${FILESDIR}"/inform7-6L02-pager-exit-status.patch
}

src_install() {
	cp -pPR usr "${D}" || die "cp usr failed"
	cd "${D}"/usr

	dodoc share/doc/inform7/README || die "dodoc README failed"
	rm share/doc/inform7/README
	docinto ChangeLogs
	dodoc share/doc/inform7/ChangeLogs/*.txt || die "dodoc ChangeLogs failed"
	rm share/doc/inform7/ChangeLogs/*.txt
	rmdir share/doc/inform7/ChangeLogs
	rm share/doc/inform7/INSTALL
	rmdir share/doc/inform7 || die "rmdir doc/inform7 failed"

	if use doc; then
		mv share/inform7/Documentation share/doc/${PF}/html || die "mv Documentation failed"
		dosym /usr/share/doc/${PF}/html /usr/share/inform7/Documentation || die "dosym Documentation failed"
		dodir /usr/share/doc/${PF}/html/Documentation || die "dodir failed"
		dosym ../doc_images /usr/share/doc/${PF}/html/Documentation/Images || die "dosym doc_images failed"
		rm -r "${D}"/usr/share/doc/${PF}/html/English.lproj || die "rm -r English.lproj failed"
	else
		rm -r share/inform7/Documentation || die "rm -r Documentation failed"
	fi

	# Don't use the bundled interpreter binaries or Inform 6 compiler.
	#
	# The binaries that we do keep are unpacked into /usr/share with
	# symlinks in /usr/libexec, which is silly; move them to libexec
	# (there doesn't seem to be any need to recreate the symlinks
	# going the other way: the i7 script accesses them from libexec).
	# List the kept binaries explicitly (instead of using a wildcard)
	# so that if a future version adds more, the rmdir will fail and
	# alert the maintainer that changes (new dependencies etc) might
	# be required.
	rm libexec/* || die "rm libexec failed"
	mv share/inform7/Compilers/{ni,cBlorb} libexec || die "mv Compilers failed"
	rm share/inform7/Compilers/inform6
	rmdir share/inform7/Compilers || die "rmdir Compilers failed"
	rm share/inform7/Interpreters/{dumb-frotz,dumb-glulxe,dumb-git}
	rmdir share/inform7/Interpreters || die "rmdir Interpreters failed"

	mv man share/man || die "mv man failed"
}
