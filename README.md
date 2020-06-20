# raspi-music-hub

Buildroot external tree for a small footprint Raspberry Pi Zero W image.

## Dependencies (Debian)
```
build-essential libncurses5-dev rsync cpio python unzip bc wget git
```

## Dependencies (Fedora)
```
gcc g++ patch file make perl-ExtUtils-MakeMaker perl-Thread-Queue ncurses-devel rsync cpio python3 unzip bc wget git
```

## Build Instructions
```bash
mkdir raspi-build && cd raspi-build
git clone https://github.com/wasv/raspi-buildroot
git clone --branch 2020.05 https://git.busybox.net/buildroot
make -C buildroot O=../output/ BR2_EXTERNAL=../raspi-buildroot raspi-0w_defconfig # or raspi-3-arm64_defconfig
make -C output clean all # This will take at least 30 minutes, possibly an hour or more.
# The SD Card image will be in output/images/sdcard.img
```

See [the Buildroot User Manual](https://buildroot.org/downloads/manual/manual.html#outside-br-custom) for more instructions.
