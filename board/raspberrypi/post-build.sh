#!/bin/sh

set -u
set -e

# Disable wpa_supplicant.service, rootfs enables wpa_supplicant@wlan0.service
rm -f ${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/wpa_supplicant.service

# Add /boot to /etc/fstab
echo /dev/mmcblk0p1 /boot auto rw 0 0 >> ${TARGET_DIR}/etc/fstab
