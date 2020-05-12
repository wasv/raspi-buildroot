#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi
ln -sfv /usr/lib/systemd/system/getty@.service ${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service

# Disable wpa_supplicant.service, rootfs enables wpa_supplicant@wlan0.service
rm -f ${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/wpa_supplicant.service

# Add /boot to /etc/fstab
echo /dev/mmcblk0p1 /boot auto rw 0 0 >> ${TARGET_DIR}/etc/fstab
