#!/bin/bash
#
#
# ARG_OPTIONAL_BOOLEAN([pod-perceiver],[k],[Install the pod perceiver pod.],[on])
# ARG_OPTIONAL_BOOLEAN([image-perceiver],[o],[Install the image perceiver pod.],[off])
# ARG_OPTIONAL_BOOLEAN([prometheus-metrics],[M],[Enable prometheus metrics.],[off])
# ARG_OPTIONAL_BOOLEAN([developer-mode],[d],[Use developer mode.],[off])
# ARG_OPTIONAL_BOOLEAN([skyfire],[],[Enable Skyfire container for testing.],[off])
#

# ARG_OPTIONAL_SINGLE([private-registry],[p],[A private registry url you will need to pull images for scan.],["docker-registry.default.svc:5000"])
# ARG_OPTIONAL_SINGLE([private-registry-token],[t],[A private registry token to have access to pull images],[perceptor-scanner-sa service account token])

# ARG_OPTIONAL_SINGLE([container-registry],[c],[Base docker repo for the applicaition.],[gcr.io])
# ARG_OPTIONAL_SINGLE([image-repository],[I],[Image repository for the applicaition.],[gke-verification/blackducksoftware])
# ARG_OPTIONAL_SINGLE([default-container-version],[v],[Default container version],[master])
# ARG_OPTIONAL_SINGLE([pcp-namespace],[n],[The namespace perceptor containers run in.],[nginx-webapp-logstash])

# ARG_OPTIONAL_SINGLE([hub-user],[U],[hub user],[master])
# ARG_OPTIONAL_SINGLE([hub-password],[W],[hub password],[master])
# ARG_OPTIONAL_SINGLE([hub-host],[H],[hub hostname ],[nginx-webapp-logstash])
# ARG_OPTIONAL_SINGLE([hub-port],[P],[hub port ],[8443])
# ARG_OPTIONAL_SINGLE([hub-client-timeout-perceptor-seconds],[T],[hub client timeout for perceptor in seconds ],[5])
# ARG_OPTIONAL_SINGLE([hub-client-timeout-scanner-seconds],[],[hub client timeout for perceptor scanner in seconds ],[120])
# ARG_OPTIONAL_SINGLE([hub-max-concurrent-scans],[C],[maximum scans at a time for the hub],[7])
# ARG_OPTIONAL_SINGLE([container-default-cpu],[u],[All containers default cpu],[300m])
# ARG_OPTIONAL_SINGLE([container-default-memory],[m],[All containers default memory],[1300Mi])
# ARG_OPTIONAL_SINGLE([container-default-log-level],[l],[All containers default log level],[info])
# ARG_OPTIONAL_SINGLE([prompt],[],[prompt for values rather then expecting them all at the command line],[off])


# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.6.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate

# When called, the process ends.
# Args:
# 	$1: The exit message (print to stderr)
# 	$2: The exit code (default is 1)
# if env var _PRINT_HELP is set to 'yes', the usage is print to stderr (prior to )
# Example:
# 	test -f "$_arg_infile" || _PRINT_HELP=yes die "Can't continue, have to supply file as an argument, got '$_arg_infile'" 4
die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}

# Function that evaluates whether a value passed to it begins by a character
# that is a short option of an argument the script knows about.
# This is required in order to support getopts-like short options grouping.
begins_with_short_option()
{
	local first_option all_short_options
	all_short_options='koptcvnUWHPCih'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_pod_perceiver="on"
_arg_image_perceiver="off"
_arg_prometheus_metrics="off"
_arg_private_registry=
_arg_private_registry_token=""
_arg_container_registry="gcr.io"
_arg_image_repository="gke-verification/blackducksoftware"
_arg_default_container_version="master"
_arg_pcp_namespace="bds-perceptor"
_arg_hub_user="sysadmin"
_arg_hub_password=""
_arg_hub_host="nginx-webapp-logstash"
_arg_hub_port="8443"
_arg_hub_client_timeout_perceptor_seconds="5"
_arg_hub_client_timeout_scanner_seconds="120"
_arg_hub_max_concurrent_scans="7"
_arg_prompt="off"
_arg_container_default_cpu="300m"
_arg_container_default_memory="1300Mi"
_arg_container_default_log_level="debug"
_arg_developer_mode="off"
_arg_skyfire="off"

# Function that prints general usage of the script.
# This is useful if users asks for it, or if there is an argument parsing error (unexpected / spurious arguments)
# and it makes sense to remind the user how the script is supposed to be called.
print_help ()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-p|--(no-)pod-perceiver] [-i|--(no-)image-perceiver] [-M|--(no-)prometheus-metrics] [--private-registry <arg>] [-t|--private-registry-token <arg>] [-c|--container-registry <arg>] [-I|--image-repository <arg>] [-v|--default-container-version <arg>] [-n|--pcp-namespace <arg>] [-U|--hub-user <arg>] [-W|--hub-password <arg>] [-H|--hub-host <arg>] [-P|--hub-port <arg>] [-T|--hub-client-timeout-perceptor-seconds <arg>] [-s|--hub-client-timeout-scanner-seconds <arg>] [-C|--hub-max-concurrent-scans <arg>] [-u|--container-default-cpu <arg>] [-m|--container-default-memory <arg>] [-l|--container-default-log-level <arg>] [-d|--developer-mode <arg>] [--(no-)prompt] [-h|--help]\n' "$0"
	printf '\t%s\n' "-p,--pod-perceiver,--no-pod-perceiver: Whether the pod perceiver is enabled. (on by default)"
	printf '\t%s\n' "-i,--image-perceiver,--no-image-perceiver: Whether the image perceiver is enabled. (off by default)"
	printf '\t%s\n' "-M,--prometheus-metrics,--no-prometheus-metrics: Whether the prometheus metrics is enabled. (off by default)"
	printf '\t%s\n' "--private-registry: A private registry url you will need to pull images for scan. (default: [\"docker-registry.default.svc:5000\"]). eg. [\"docker-registry.default.svc:5000\", \"172.1.1.0:5000\"]"
	printf '\t%s\n' "-t,--private-registry-token: A private registry token to have access to pull images  (default: 'perceptor-scanner-sa service account token')"
	printf '\t%s\n' "-c,--container-registry: Base docker repo for the applicaition. (default: 'gcr.io')"
	printf '\t%s\n' "-I,--image-repository: Image repository for the applicaition. (default: 'gke-verification/blackducksoftware ')"
	printf '\t%s\n' "-v,--default-container-version: Default container version (default: 'master')"
	printf '\t%s\n' "-n,--pcp-namespace: The namespace perceptor containers run in. (default: 'bds-perceptor')"
	printf '\t%s\n' "-U,--hub-user: hub user (default: 'sysadmin')"
	printf '\t%s\n' "-W,--hub-password: hub password"
	printf '\t%s\n' "-H,--hub-host: hub hostname  (default: 'nginx-webapp-logstash')"
	printf '\t%s\n' "-P,--hub-port: hub port  (default: '8443')"
	printf '\t%s\n' "-T,--hub-client-timeout-perceptor-seconds: hub client timeout for perceptor in seconds  (default: '5')"
	printf '\t%s\n' "-s,--hub-client-timeout-scanner-seconds: hub client timeout for perceptor scanner in seconds  (default: '30')"
	printf '\t%s\n' "-C,--hub-max-concurrent-scans: maximum scans at a time for the hub (default: '7')"
	printf '\t%s\n' "-u,--container-default-cpu: All container's default cpu (default: '300m')"
	printf '\t%s\n' "-m,--container-default-memory: All container's default memory (default: '1300Mi')"
	printf '\t%s\n' "-l,--container-default-log-level: All container's default log level (default: 'info')"
	printf '\t%s\n' "-d,--developer-mode,--no-developer-mode: Whether the developer mode is enabled. (off by default)"
	printf '\t%s\n' "--prompt,--no-prompt: prompt for values rather then expecting them all at the command line (off by default)"
	printf '\t%s\n' "-h,--help: Prints help"
}

# The parsing of the command-line
parse_commandline ()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			# The pod-perceiver argurment doesn't accept a value,
			# we expect the --pod-perceiver or -k, so we watch for them.
			-k|--no-pod-perceiver|--pod-perceiver)
				_arg_pod_perceiver="on"
				test "${1:0:5}" = "--no-" && _arg_pod_perceiver="off"
				;;
			# We support getopts-style short arguments clustering,
			# so as -k doesn't accept value, other short options may be appended to it, so we watch for -k*.
			# After stripping the leading -k from the argument, we have to make sure
			# that the first character that follows coresponds to a short option.
			-k*)
				_arg_pod_perceiver="on"
				_next="${_key##-k}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-k" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			-i|--no-image-perceiver|--image-perceiver)
				_arg_image_perceiver="on"
				test "${1:0:5}" = "--no-" && _arg_image_perceiver="off"
				;;
			# See the comment of option '-k' to see what's going on here - principle is the same.
			-i*)
				_arg_image_perceiver="on"
				_next="${_key##-i}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-o" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			-M|--no-prometheus-metrics|--prometheus-metrics)
				_arg_prometheus_metrics="on"
				test "${1:0:5}" = "--no-" && _arg_prometheus_metrics="off"
				;;
			# See the comment of option '-k' to see what's going on here - principle is the same.
			-M*)
				_arg_prometheus_metrics="on"
				_next="${_key##-M}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-o" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			# We support whitespace as a delimiter between option argument and its value.
			# Therefore, we expect the --private-registry value.
			# so we watch for --private-registry.
			# Since we know that we got the long or short option,
			# we just reach out for the next argument to get the value.
			--private-registry)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_private_registry="$2"
				shift
				;;
			# We support the = as a delimiter between option argument and its value.
			# Therefore, we expect --private-registry=value, so we watch for --private-registry=*
			# For whatever we get, we strip '--private-registry=' using the ${var##--private-registry=} notation
			# to get the argument value
			--private-registry=*)
				_arg_private_registry="${_key##--private-registry=}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-t|--private-registry-token)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_private_registry_token="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--private-registry-token=*)
				_arg_private_registry_token="${_key##--private-registry-token=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-t*)
				_arg_private_registry_token="${_key##-t}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-c|--container-registry)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_container_registry="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--container-registry=*)
				_arg_container_registry="${_key##--container-registry=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-c*)
				_arg_container_registry="${_key##-c}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-I|--image-repository)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_image_repository="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--image-repository=*)
				_arg_image_repository="${_key##--image-repository=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-I*)
				_arg_image_repository="${_key##-I}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-v|--default-container-version)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_default_container_version="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--default-container-version=*)
				_arg_default_container_version="${_key##--default-container-version=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-v*)
				_arg_default_container_version="${_key##-v}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-n|--pcp-namespace)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_pcp_namespace="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--pcp-namespace=*)
				_arg_pcp_namespace="${_key##--pcp-namespace=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-n*)
				_arg_pcp_namespace="${_key##-n}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-U|--hub-user)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_user="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-user=*)
				_arg_hub_user="${_key##--hub-user=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-U*)
				_arg_hub_user="${_key##-U}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-W|--hub-password)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_password="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-password=*)
				_arg_hub_password="${_key##--hub-password=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-W*)
				_arg_hub_password="${_key##-W}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-H|--hub-host)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_host="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-host=*)
				_arg_hub_host="${_key##--hub-host=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-H*)
				_arg_hub_host="${_key##-H}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-P|--hub-port)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_port="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-port=*)
				_arg_hub_port="${_key##--hub-port=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-P*)
				_arg_hub_port="${_key##-P}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-T|--hub-client-timeout-perceptor-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_client_timeout_perceptor_seconds="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-client-timeout-perceptor-seconds=*)
				_arg_hub_client_timeout_perceptor-seconds="${_key##--hub-client-timeout-perceptor-seconds=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-T*)
				_arg_hub_client_timeout_perceptor_seconds="${_key##-T}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-s|--hub-client-timeout-scanner-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_client_timeout_scanner_seconds="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-client-timeout-scanner-seconds=*)
				_arg_hub_client_timeout_scanner_seconds="${_key##--hub-client-timeout-scanner-seconds=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-s*)
				_arg_hub_client_timeout_scanner_seconds="${_key##-s}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-C|--hub-max-concurrent-scans)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_hub_max_concurrent_scans="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--hub-max-concurrent-scans=*)
				_arg_hub_max_concurrent_scans="${_key##--hub-max-concurrent-scans=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-C*)
				_arg_hub_max_concurrent_scans="${_key##-C}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-u|--container-default-cpu)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_container_default_cpu="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--container-default-cpu=*)
				_arg_container_default_cpu="${_key##--container-default-cpu=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-u*)
				_arg_container_default_cpu="${_key##-u}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-m|--container-default-memory)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_container_default_memory="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--container-default-memory=*)
				_arg_container_default_memory="${_key##--container-default-memory=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-m*)
				_arg_container_default_memory="${_key##-m}"
				;;
			# See the comment of option '--private-registry' to see what's going on here - principle is the same.
			-l|--container-default-log-level)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_container_default_log_level="$2"
				shift
				;;
			# See the comment of option '--private-registry=' to see what's going on here - principle is the same.
			--container-default-log-level=*)
				_arg_container_default_log_level="${_key##--container-default-log-level=}"
				;;
			# See the comment of option '-p' to see what's going on here - principle is the same.
			-l*)
				_arg_container_default_log_level="${_key##-l}"
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			-d|--no-developer-mode|--developer-mode)
				_arg_developer_mode="on"
				test "${1:0:5}" = "--no-" && _arg_developer_mode="off"
				;;
			# See the comment of option '-k' to see what's going on here - principle is the same.
			-d*)
				_arg_developer_mode="on"
				_next="${_key##-d}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-o" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			--no-prompt|--prompt)
				_arg_prompt="on"
				test "${1:0:5}" = "--no-" && _arg_prompt="off"
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			--no-skyfire|--skyfire)
				_arg_skyfire="on"
				test "${1:0:5}" = "--no-" && _arg_skyfire="off"
				;;
			# See the comment of option '--pod-perceiver' to see what's going on here - principle is the same.
			-h|--help)
				print_help
				exit 0
				;;
			# See the comment of option '-k' to see what's going on here - principle is the same.
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

# Now call all the functions defined above that are needed to get the job done
parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

##################

# ] <-- needed because of Argbash
