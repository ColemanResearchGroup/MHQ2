#!/bin/bash
#
## Convert fields to R format for input into phenotype scripts
#
# ARG_OPTIONAL_SINGLE([enc_ukb],[u],[enc_ukb release file])
# ARG_OPTIONAL_SINGLE([fields],[i],[field IDs include list],[data/MHQ2.fields])
# ARG_OPTIONAL_SINGLE([encoding],[e],[encoding file],[encoding.dat])
# ARG_HELP([Extract MHQ2 fields from an unpacked UKB release (*.enc.ukb) to R format])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='uieh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_enc_ukb=
_arg_fields="data/MHQ2.fields"
_arg_encoding="encoding.dat"


print_help()
{
	printf '%s\n' "Extract MHQ2 fields from an unpacked UKB release (*.enc.ukb) to R format"
	printf 'Usage: %s [-u|--enc_ukb <arg>] [-i|--fields <arg>] [-e|--encoding <arg>] [-h|--help]\n' "$0"
	printf '\t%s\n' "-u, --enc_ukb: enc_ukb release file (no default)"
	printf '\t%s\n' "-i, --fields: field IDs include list (default: 'data/MHQ2.fields')"
	printf '\t%s\n' "-e, --encoding: encoding file (default: 'encoding.dat')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-u|--enc_ukb)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_enc_ukb="$2"
				shift
				;;
			--enc_ukb=*)
				_arg_enc_ukb="${_key##--enc_ukb=}"
				;;
			-u*)
				_arg_enc_ukb="${_key##-u}"
				;;
			-i|--fields)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_fields="$2"
				shift
				;;
			--fields=*)
				_arg_fields="${_key##--fields=}"
				;;
			-i*)
				_arg_fields="${_key##-i}"
				;;
			-e|--encoding)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_encoding="$2"
				shift
				;;
			--encoding=*)
				_arg_encoding="${_key##--encoding=}"
				;;
			-e*)
				_arg_encoding="${_key##-e}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

ukb=$(dirname $_arg_enc_ukb)/$(basename $_arg_enc_ukb .enc_ukb)
ukb_tab="${ukb}.tab"
ukb_r="${ukb}.r"
ukb_rds="${ukb}.rds"

if [ ! -f $ukb_tab ]; then

    if [ ! -f $_arg_encoding ]; then
        curl "https://biobank.ndph.ox.ac.uk/showcase/ukb/utilx/encoding.dat" -o "encoding.dat"
    fi

    echo "Converting ${_arg_enc_ukb}"
    dconvert $_arg_enc_ukb r -i$_arg_fields -e$_arg_encoding
else
    echo "${ukb_tab} aleady exists"
fi

echo "Processing ${ukb_r}"
Rscript -e "source('${ukb_r}'); saveRDS(bd, '${ukb_rds}')"
echo "Fields written to ${ukb_rds}"

# ] <-- needed because of Argbash