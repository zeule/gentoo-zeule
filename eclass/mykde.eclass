# @ECLASS: mykde.eclass
# @MAINTAINER:
# eugene.shalygin@gmail.com
# @BLURB: This eclass contains tools to simplify defining my KDE meta packages
# @DESCRIPTION:

inherit eutils

IUSE+="kde5"

echoerr() { cat <<< "$@" 1>&2; }

# @FUNCTION: add_kde_dep
# @USAGE: <kde5_pkg> <kde4_pkg> [kde5_slot] [kde4_slot]
# @DESCRIPTION:
#
add_kde_dep() {
	local kde5_pkg=${1}
	local kde4_pkg=${2}
	local kde5_dep_slot=${3:-"5"}
	local kde4_dep_slot=${4:-"4"}
	
	echo "kde5? ( ${kde5_pkg}:${kde5_dep_slot} ) !kde5? ( ${kde4_pkg}:${kde4_dep_slot} )"
}

# @FUNCTION: add_slotted_dep
# @USAGE: <pkgname> [kde5_slot] [kde4_slot]
# @DESCRIPTION:
#
add_kde_slotted_dep() {
	add_kde_dep ${1} ${1} ${2:-"5"} ${3:-"4"}
}

# @FUNCTION: add_category_dep
# @USAGE: <kde5_category> <kde4_category> <pkgname> [kde5_slot] [kde4_slot]
# @DESCRIPTION:
#
add_kde_category_dep() {
	add_kde_dep "${1}/${3}" "${2}/${3}" ${4:-5} ${5:-4}
}

# @FUNCTION: add_kde_app_dep
# @USAGE: <pkgname> [kde5_slot] [kde4_slot]
# @DESCRIPTION:
#
add_kde_app_dep() {
	add_kde_dep "kde-apps/${1}" "kde-base/${1}" ${2:-5} ${3:-4}
}
