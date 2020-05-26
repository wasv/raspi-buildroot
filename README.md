# raspi-music-hub

Buildroot external tree for a small footprint Raspberry Pi Zero W image.

## Dependencies (Debian)
```
build-essential libncurses5-dev rsync cpio python unzip bc wget git
```

## Build Instructions
```bash
mkdir raspi-0w-build && cd raspi-0w-build
git clone https://github.com/wasv/raspi-0w-buildroot
git clone --branch 2020.02.1 https://git.busybox.net/buildroot
make -C buildroot O=../output/ BR2_EXTERNAL=../raspi-0w-buildroot raspi-0w-custom_defconfig
make -C output clean all # This will take at least 30 minutes, possibly an hour or more.
# The SD Card image will be in output/images/sdcard.img
```

See [the Buildroot User Manual](https://buildroot.org/downloads/manual/manual.html#outside-br-custom) for more instructions.
