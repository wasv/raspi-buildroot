#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
BOARD_NAME="raspberrypi0w"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

for arg in "$@"
do
	case "${arg}" in
		--add-miniuart-bt-overlay)
		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
dtoverlay=miniuart-bt
__EOF__
		fi
		;;
		--aarch64)
		# Run a 64bits kernel (armv8)
		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# enable 64bits support
arm_64bit=1
__EOF__
		fi
		;;
		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
		# Set GPU memory
		gpu_mem="${arg:2}"
		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
		;;
	esac

done

echo "dtparam=audio=1" >> "${BINARIES_DIR}/rpi-firmware/config.txt"

cat << __EOF__ > "${BINARIES_DIR}/rpi-firmware/firstboot.sh"
#!/bin/sh

# Create a file named 'wifi 'with network info in the format SSID:PSK.
#  Example: HomeWifi:MyPassword
[ -e "/boot/wifi" ] && wpa_passphrase \$(cut -d: -f1 /boot/wifi) \$(cut -d: -f2 /boot/wifi) >> /etc/wpa_supplicant.conf && rm /boot/wifi

# Create a file 'hostname' with desired hostname to set computer name.
#  Example: myraspi
[ -e "/boot/hostname" ] && hostnamectl set-hostname \$(</boot/hostname) && rm /boot/hostname

# Create a file 'users' with desired usernames and passwords in the format username:password.
#  Example: root:changethispassword
if [ -e "/boot/users" ]; then
    for account in \$(</boot/users); do
        adduser -D \$(cut -d: -f1 <<<\$account)
        chpasswd <<<\$account
    done
    rm /boot/users
fi

__EOF__

# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
# space. We don't rely on genimage to build the rootfs image, just to insert a
# pre-built one in the disk image.

trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
ROOTPATH_TMP="$(mktemp -d)"

rm -rf "${GENIMAGE_TMP}"

genimage \
	--rootpath "${ROOTPATH_TMP}"   \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
