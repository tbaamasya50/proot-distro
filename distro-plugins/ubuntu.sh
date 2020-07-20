##
## Plug-in for installing Ubuntu Focal (20.04).
##

DISTRO_NAME="Ubuntu 20.04"

# Returns download URL.
get_download_url() {
	# Ubuntu Focal does not provide tarballs for x86 32bit.
	case "$(uname -m)" in
		aarch64)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-arm64-root.tar.gz"
			;;
		armv7l|armv8l)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-armhf-root.tar.gz"
			;;
		x86_64)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-amd64-root.tar.gz"
			;;
	esac
}

# Define here additional steps which should be executed
# for configuration.
distro_setup() {
	# DNS resolver.
	rm -f ./etc/resolv.conf
	cat <<- EOF > ./etc/resolv.conf
	nameserver 1.1.1.1
	nameserver 1.0.0.1
	EOF
}
