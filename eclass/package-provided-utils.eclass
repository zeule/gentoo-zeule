# @ECLASS: package-provided-utils.eclass
# @MAINTAINER:
# eugene.shalygin@gmail.com
# @BLURB: This eclass contains tools to install package.provided files
# @DESCRIPTION:

inherit eutils

# @ECLASS-VARIABLE: PROVIDED_PACKAGES
# @DESCRIPTION:
# List of packages, that this package provides
PROVIDED_PACKAGES="${PROVIDED_PACKAGES:-}"

PROVIDED_VERSION="${PROVIDED_VERSION:-${PV}}"

package-provided-utils_pkg_preinst() {
	einfo "Generating package.provided file"
	local PROVIDED_DIR="etc/portage/profile/package.provided"
	mkdir -p "${D}/${PROVIDED_DIR}"
#     for pkg in "${PROVIDED_PACKAGES}"; do
#         echo "$pkg-${PROVIDED_VERSION}" >> ${D}/etc/portage/package.provided/${P}.conf
#     done
	printf "%s-$PROVIDED_VERSION\n" $PROVIDED_PACKAGES >> ${D}/${PROVIDED_DIR}/${P}.conf
}


EXPORT_FUNCTIONS pkg_preinst

# create_packages_list <category> <pkg names>
create_packages_list() {
#     declare res
#     while read -r p; do
#         res+="$1/$p
#         "
#     done <<< $2
#     echo $res
    printf "$1/%s\n" $2
}
