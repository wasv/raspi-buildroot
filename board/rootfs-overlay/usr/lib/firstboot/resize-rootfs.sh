#!/bin/sh
parted -m /dev/mmcblk0 u s resizepart 2 $(($(cat /sys/block/mmcblk0/size)-8))
e2fsck -f /dev/mmcblk0p2
resize2fs /dev/mmcblk0p2
