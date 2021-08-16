# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: dotnet-core.eclass
# @MAINTAINER:
# maintainer-needed@gentoo.org
# @SUPPORTED_EAPIS: 7
# @BLURB: Build and install .NET Core based packages.
# @DESCRIPTION:
# Build and install .NET Core based packages.

case ${EAPI:-0} in
	[78]) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

inherit plocale multibuild

EXPORT_FUNCTIONS pkg_setup src_unpack src_compile src_install

if [[ -z ${_DOTNET_CORE_ECLASS} ]] ; then
_DOTNET_CORE_ECLASS=1

# @ECLASS-VARIABLE: DOTNET_COMPAT
# @REQUIRED
# @DESCRIPTION:
# This variable contains a list of .NET framework versions the package
# supports. It must be set before the `inherit' call. It has to be
# an array.
#
# Example:
# @CODE
# DOTNET_COMPAT=( dotnetcore5_0 dotnetcore6_0 )
# @CODE
#
# Please note that you can also use bash brace expansion if you like:
# @CODE
# DOTNET_COMPAT=( dotnetcore{5,6}_0 )
# @CODE

# @ECLASS-VARIABLE: DOTNET_BDEPS
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# This is an eclass-generated .NET dependency string for all
# implementations listed in DOTNET_COMPAT.
#
# Example use:
# @CODE
# BDEPEND="${DOTNET_BDEPS}
#	dev-foo/mydep"
# @CODE

# @ECLASS-VARIABLE: DOTNET_RDEPS
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# This is an eclass-generated .NET dependency string for all
# implementations listed in DOTNET_COMPAT.
#
# Example use:
# @CODE
# RDEPEND="${DOTNET_RDEPS}
#	dev-foo/mydep"
# @CODE

# @ECLASS-VARIABLE: DOTNET_USEDEP
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# This is an eclass-generated USE-dependency string which can be used to
# depend on another .NET package being built for the same .NET
# implementations.
#
# Example use:
# @CODE
# RDEPEND="dev-dotnet/foo[${DOTNET_USEDEP}]"
# @CODE

# @ECLASS-VARIABLE: DOTNET_REQUIRED_USE
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# This is an eclass-generated required-use expression which ensures at
# least one .NET implementation has been enabled.
#
# This expression should be utilized in an ebuild by including it in
# REQUIRED_USE, optionally behind a use flag.
#
# Example use:
# @CODE
# REQUIRED_USE="dotnet? ( ${DOTNET_REQUIRED_USE} )"
# @CODE
#
# Example value:
# @CODE
# || ( dotnet_targets_dotnetcore5_0 dotnet_targets_dotnetcore6_0 )
# @CODE

# @ECLASS-VARIABLE: _DOTNET_ALL_IMPLS
# @INTERNAL
# @DESCRIPTION:
# All supported .NET implementations, most preferred last.
_DOTNET_ALL_IMPLS=(
	dotnetcore{5..6}_0
)
readonly _DOTNET_ALL_IMPLS

_DOTNET_HISTORICAL_IMPLS=(
	dotnetcore{2,3}_1
)
readonly _DOTNET_HISTORICAL_IMPLS

# @ECLASS-VARIABLE: DOTNET_CLEANUP
# @DESCRIPTION:
# Remove these files from the published image
: ${DOTNET_CLEANUP:=( )}

# @ECLASS-VARIABLE: DOTNET_INSTALL_EXECUTABLES
# @DEFAULT_UNSET
# @DESCRIPTION:
# Array of executables that will be symlinked to bin
: ${DOTNET_INSTALL_EXECUTABLES:=( )}

PLOCALE_BACKUP="en"

# @FUNCTION: _dotnet_set_impls
# @INTERNAL
# @DESCRIPTION:
# Check DOTNET_COMPAT for well-formedness and validity, then set
# two global variables:
#
# - _DOTNET_SUPPORTED_IMPLS containing valid implementations supported
#   by the ebuild (DOTNET_COMPAT - dead implementations),
#
# - and _DOTNET_UNSUPPORTED_IMPLS containing valid implementations that
#   are not supported by the ebuild.
#
# Implementations in both variables are ordered using the pre-defined
# eclass implementation ordering.
#
# This function must be called once in global scope by an eclass
# utilizing DOTNET_COMPAT.
_dotnet_set_impls() {
	local i

	if ! declare -p DOTNET_COMPAT &>/dev/null; then
		die 'DOTNET_COMPAT not declared.'
	fi
	if [[ $(declare -p DOTNET_COMPAT) != "declare -a"* ]]; then
		die 'DOTNET_COMPAT must be an array.'
	fi
	if [[ ! ${DOTNET_COMPAT_NO_STRICT} ]]; then
		for i in "${DOTNET_COMPAT[@]}"; do
			# check for incorrect implementations
			# we're using pattern matching as an optimization
			# please keep them in sync with _DOTNET_ALL_IMPLS
			# and _DOTNET_HISTORICAL_IMPLS
			case ${i} in
				dotnetcore[56]_0)
					;;
				*)
					if has "${i}" "${_DOTNET_ALL_IMPLS[@]}" \
						"${_DOTNET_HISTORICAL_IMPLS[@]}"
					then
						die "Mis-synced patterns in _dotnet_set_impls: missing ${i}"
					else
						die "Invalid implementation in DOTNET_COMPAT: ${i}"
					fi
			esac
		done
	fi

	local supp=() unsupp=()

	for i in "${_DOTNET_ALL_IMPLS[@]}"; do
		if has "${i}" "${DOTNET_COMPAT[@]}"; then
			supp+=( "${i}" )
		else
			unsupp+=( "${i}" )
		fi
	done

	if [[ ! ${supp[@]} ]]; then
		die "No supported implementation in DOTNET_COMPAT."
	fi

	if [[ ${_DOTNET_SUPPORTED_IMPLS[@]} ]]; then
		# set once already, verify integrity
		if [[ ${_DOTNET_SUPPORTED_IMPLS[@]} != ${supp[@]} ]]; then
			eerror "Supported impls (DOTNET_COMPAT) changed between inherits!"
			eerror "Before: ${_DOTNET_SUPPORTED_IMPLS[*]}"
			eerror "Now   : ${supp[*]}"
			die "_DOTNET_SUPPORTED_IMPLS integrity check failed"
		fi
		if [[ ${_DOTNET_UNSUPPORTED_IMPLS[@]} != ${unsupp[@]} ]]; then
			eerror "Unsupported impls changed between inherits!"
			eerror "Before: ${_DOTNET_UNSUPPORTED_IMPLS[*]}"
			eerror "Now   : ${unsupp[*]}"
			die "_DOTNET_UNSUPPORTED_IMPLS integrity check failed"
		fi
	else
		_DOTNET_SUPPORTED_IMPLS=( "${supp[@]}" )
		_DOTNET_UNSUPPORTED_IMPLS=( "${unsupp[@]}" )
		readonly _DOTNET_SUPPORTED_IMPLS _DOTNET_UNSUPPORTED_IMPLS
	fi
}

# @FUNCTION: _dotnet_export
# @USAGE: [<impl>] <variables>...
# @INTERNAL
# @DESCRIPTION:
# Set and export the .NET implementation-relevant variables passed
# as parameters.
#
# The optional first parameter may specify the requested .NET
# implementation (either as DOTNET_TARGETS value, e.g. dotnetcore5_0,
# or an EDOTNET one, e.g. dotnetcore5.0). If no implementation passed,
# the current one will be obtained from ${EDOTNET}.
#
# The variables which can be exported are: DOTNET, EDOTNET,
# DOTENT_SITEDIR. They are described more completely in the eclass
# variable documentation.
_dotnet_export() {
	debug-print-function ${FUNCNAME} "${@}"

	local impl var

	case "${1}" in
		dotnetcore*)
			impl=${1/_/.}
			shift
			;;
		*)
			impl=${EDOTNET}
			if [[ -z ${impl} ]]; then
				die "_dotnet_export called without a dotnet implementation and EDOTNET is unset"
			fi
			;;
	esac
	debug-print "${FUNCNAME}: implementation: ${impl}"

	for var; do
		case "${var}" in
			EDOTNET)
				export EDOTNET=${impl}
				debug-print "${FUNCNAME}: EDOTNET = ${EDOTNET}"
				;;
			DOTNET)
				export DOTNET=${EPREFIX}/opt/dotnet-sdk-bin-${impl#dotnetcore}/dotnet
				debug-print "${FUNCNAME}: DOTNET = ${DOTNET}"
				;;
			DOTNET_SITEDIR)
				case ${impl} in
					dotnetcore*)
						export DOTNET_SITEDIR="usr/lib/dotnet/net${impl#dotnetcore}";;
					*)
						die "Invalid implementation: ${impl}"
				esac
				debug-print "${FUNCNAME}: DOTNET_SITEDIR = ${DOTNET_SITEDIR}"
				;;
			DOTNET_PKG_DEP)
				local d
				case ${impl} in
					dotnetcore*)
						DOTNET_PKG_DEP="dev-dotnet/dotnet-sdk-bin:${impl#dotnetcore}";;
					*)
						die "Invalid implementation: ${impl}"
				esac

				# use-dep
				if [[ ${DOTNET_REQ_USE} ]]; then
					DOTNET_PKG_DEP+=[${DOTNET_REQ_USE}]
				fi

				export DOTNET_PKG_DEP
				debug-print "${FUNCNAME}: DOTNET_PKG_DEP = ${DOTNET_PKG_DEP}"
				;;
			DOTNET_FRAMEWORK)
				local d
				case ${impl} in
					dotnetcore*)
						export DOTNET_FRAMEWORK="net${impl#dotnetcore}";;
					*)
						die "Invalid implementation: ${impl}"
				esac
				debug-print "${FUNCNAME}: DOTNET_FRAMEWORK = ${DOTNET_FRAMEWORK}"
				;;
			*)
				die "_dotnet_export: unknown variable ${var}"
		esac
	done
}

_dotnet_set_globals() {
	local deps i DOTNET_PKG_DEP

	_dotnet_set_impls

	for i in "${_DOTNET_SUPPORTED_IMPLS[@]}"; do
		_dotnet_export "${i}" DOTNET_PKG_DEP
		deps+="dotnet_targets_${i}? ( ${DOTNET_PKG_DEP} ) "
	done

	local flags=( "${_DOTNET_SUPPORTED_IMPLS[@]/#/dotnet_targets_}" )
	local optflags=${flags[@]/%/(-)?}
	local requse="|| ( ${flags[*]} )"
	local usedep=${optflags// /,}

	if [[ ${DOTNET_DEPS+1} ]]; then
		# IUSE is magical, so we can't really check it
		# (but we verify DOTNET_COMPAT already)

		if [[ ${DOTNET_DEPS} != "${deps}" ]]; then
			eerror "DOTNET_DEPS have changed between inherits (DOTNET_REQ_USE?)!"
			eerror "Before: ${DOTNET_DEPS}"
			eerror "Now   : ${deps}"
			die "DOTNET_DEPS integrity check failed"
		fi

		# these two are formality -- they depend on DOTNET_COMPAT only
		if [[ ${DOTNET_REQUIRED_USE} != ${requse} ]]; then
			eerror "DOTNET_REQUIRED_USE have changed between inherits!"
			eerror "Before: ${DOTNET_REQUIRED_USE}"
			eerror "Now   : ${requse}"
			die "DOTNET_REQUIRED_USE integrity check failed"
		fi

		if [[ ${DOTNET_USEDEP} != "${usedep}" ]]; then
			eerror "DOTNET_USEDEP have changed between inherits!"
			eerror "Before: ${DOTNET_USEDEP}"
			eerror "Now   : ${usedep}"
			die "DOTNET_USEDEP integrity check failed"
		fi
	else
		IUSE="debug ${flags[*]}"

		DOTNET_DEPS=${deps}
		DOTNET_REQUIRED_USE=${requse}
		DOTNET_USEDEP=${usedep}
		readonly DOTNET_DEPS DOTNET_REQUIRED_USE
	fi
}
_dotnet_set_globals
unset -f _dotnet_set_globals

# @FUNCTION: _dotnet_validate_useflags
# @INTERNAL
# @DESCRIPTION:
# Enforce the proper setting of DOTNET_TARGETS, if DOTNET_COMPAT_OVERRIDE
# is not in effect. If it is, just warn that the flags will be ignored.
_dotnet_validate_useflags() {
	debug-print-function ${FUNCNAME} "${@}"

	if [[ ${DOTNET_COMPAT_OVERRIDE} ]]; then
		if [[ ! ${_DOTNET_COMPAT_OVERRIDE_WARNED} ]]; then
			ewarn "WARNING: DOTNET_COMPAT_OVERRIDE in effect. The following .NET"
			ewarn "implementations will be enabled:"
			ewarn
			ewarn "	${DOTNET_COMPAT_OVERRIDE}"
			ewarn
			ewarn "Dependencies won't be satisfied, and DOTNET_TARGETS will be ignored."
			_DOTNET_COMPAT_OVERRIDE_WARNED=1
		fi
		# we do not use flags with DCO
		return
	fi

	local i

	for i in "${_DOTNET_SUPPORTED_IMPLS[@]}"; do
		use "dotnet_targets_${i}" && return 0
	done

	eerror "No .NET implementation selected for the build. Please add one"
	eerror "of the following values to your DOTNET_TARGETS (in make.conf):"
	eerror
	eerror "${DOTNET_COMPAT[@]}"
	echo
	die "No supported Python implementation in DOTNET_TARGETS."
}

# @FUNCTION: dotnet_foreach_impl
# @USAGE: <command> [<args>...]
# @DESCRIPTION:
# Run the given command for each of the enabled .NET implementations.
# If additional parameters are passed, they will be passed through
# to the command.
#
# The function will return 0 status if all invocations succeed.
# Otherwise, the return code from first failing invocation will
# be returned.
#
# For each command being run, EDOTNET, DOTNET and BUILD_DIR are set,
# and the former two are set locally and exported to the command environment.
dotnet_foreach_impl() {
	debug-print-function ${FUNCNAME} "${@}"

	local MULTIBUILD_VARIANTS
	_dotnet_obtain_impls

	multibuild_foreach_variant _dotnet_multibuild_wrapper "${@}"
}

# @FUNCTION: _dotnet_obtain_impls
# @INTERNAL
# @DESCRIPTION:
# Set up the enabled implementation list.
_dotnet_obtain_impls() {
	_dotnet_validate_useflags

	if [[ ${DOTNET_COMPAT_OVERRIDE} ]]; then
		MULTIBUILD_VARIANTS=( ${DOTNET_COMPAT_OVERRIDE} )
		return
	fi

	MULTIBUILD_VARIANTS=()

	local impl
	for impl in "${_DOTNET_SUPPORTED_IMPLS[@]}"; do
		has "${impl}" "${DOTNET_COMPAT[@]}" && \
		use "dotnet_targets_${impl}" && MULTIBUILD_VARIANTS+=( "${impl}" )
	done
}

# @FUNCTION: _dotnet_multibuild_wrapper
# @USAGE: <command> [<args>...]
# @INTERNAL
# @DESCRIPTION:
# Initialize the environment for .NET implementation selected
# for multibuild.
_dotnet_multibuild_wrapper() {
	debug-print-function ${FUNCNAME} "${@}"

	local -x EDOTNET DOTNET DOTNET_FRAMEWORK
	local -x PATH=${PATH} PKG_CONFIG_PATH=${PKG_CONFIG_PATH}
	_dotnet_export "${MULTIBUILD_VARIANT}" EDOTNET DOTNET DOTNET_FRAMEWORK
	_dotnet_wrapper_setup

	"${@}"
}

# @FUNCTION: _dotnet_wrapper_setup
# @USAGE: [<path> [<impl>]]
# @INTERNAL
# @DESCRIPTION:
# exports required variables and
_dotnet_wrapper_setup() {
	debug-print-function ${FUNCNAME} "${@}"

	local workdir=${1:-${T}/${EDOTNET}}
	local impl=${2:-${EDOTNET}}

	[[ ${workdir} ]] || die "${FUNCNAME}: no workdir specified."
	[[ ${impl} ]] || die "${FUNCNAME}: no impl nor EDOTNET specified."

	if [[ ! -x ${workdir}/bin/dotnet ]]; then
		mkdir -p "${workdir}"/{bin,pkgconfig} || die

		# Clean up, in case we were supposed to do a cheap update.
		rm -f "${workdir}"/bin/dotnet || die

		local EDOTNET DOTNET DOTNET_FRAMEWORK
		_dotnet_export "${impl}" EDOTNET DOTNET DOTNET_FRAMEWORK
	fi

	# Now, set the environment.
	# But note that ${workdir} may be shared with something else,
	# and thus already on top of PATH.
	if [[ ${PATH##:*} != ${workdir}/bin ]]; then
		PATH=${workdir}/bin${PATH:+:${PATH}}
	fi
	if [[ ${PKG_CONFIG_PATH##:*} != ${workdir}/pkgconfig ]]; then
		PKG_CONFIG_PATH=${workdir}/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
	fi
	export BUILD_DIR DOTNET_FRAMEWORK PATH
}

REQUIRED_USE=${DOTNET_REQUIRED_USE}

dotnet-core_pkg_setup() {
	# nuget downloads packages to the home dir
	export HOME="${T}"
	export XDG_DATA_HOME="${T}/data"
	export XDG_CONFIG_HOME="${T}"

	# Building many dotnet packages is known to fail if LC_ALL
	# variable is not set to C. To prevent this all dotnet related packages will be
	export LC_ALL=C

	# libs can live on /usr/lib as they are not arch specific
	QA_MULTILIB_PATHS="usr/lib/"
}

dotnet_get_build_configuration() {
	usex debug "Debug" "Release"
}

dotnet_get_rid() {
	echo "linux-x64"
}

dotnet_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	dotnet build --no-restore -c $(dotnet_get_build_configuration) -f $DOTNET_FRAMEWORK || die
}

dotnet_install() {
	debug-print-function ${FUNCNAME} "${@}"

	local _packagePrefix _targetDir _implsCount DOTNET_SITEDIR
	_dotnet_export DOTNET_SITEDIR
	_targetDir="$DOTNET_SITEDIR/$PN/"

	_implsCount=0
	for i in "${_DOTNET_SUPPORTED_IMPLS[@]}"; do
		use "dotnet_targets_${i}" && _implsCount=$((_implsCount+1))
	done

	dotnet publish --no-restore --no-build -c $(dotnet_get_build_configuration) -f $DOTNET_FRAMEWORK -o "$D/$_targetDir" || die

	local _enabledLocales, _disabledLocales, l
	_enabledLocales=$(plocale_get_locales)
	_disabledLocales=$(plocale_get_locales disabled)

	pushd "$D/${_targetDir}" > /dev/null
	for item in "${DOTNET_CLEANUP[@]}"; do
		rm -r $item || die
		for l in $_enabledLocales; do
			rm -fr $l/$item
		done
	done

	for l in $_disabledLocales; do
		rm -r $l
	done
	popd > /dev/null

	local _appBinName
	for app in "${DOTNET_INSTALL_EXECUTABLES[@]}"; do
		if [ "$_implsCount" == 1 ]; then
			_appBinName=$app
		else
			_appBinName=$app-$DOTNET_FRAMEWORK
		fi
		einfo "Symlinking $_appBinName to /usr/bin"
		mkdir -p "$D"/usr/bin
		ln -s ../../$_targetDir/$app "$D"/usr/bin/$_appBinName || die
	done
}

dotnet-core_src_unpack() {
	default
	pushd "${S}" > /dev/null
	dotnet restore -r $(dotnet_get_rid) || die
	popd > /dev/null
}

dotnet-core_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	dotnet_foreach_impl dotnet_compile
}

dotnet-core_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	dotnet_foreach_impl dotnet_install
}

fi
