#!/bin/sh
#
# parazyd - (c) wtfpl 2016
# build script to compile android-tools on linux

pkgver="7.0.0_r1"

clone() {
	printf "(*) cloning %s...\\n" "$(basename $1)"
	git clone -b "android-$droidversion" "$1" || exit 1
}

## first we clone google's git repos...
clone https://android.googlesource.com/platform/system/core
clone https://android.googlesource.com/platform/system/extras
clone https://android.googlesource.com/platform/external/f2fs-tools
clone https://android.googlesource.com/platform/external/libselinux


## if that went well, we apply the patches...
printf "(*) patching to make it work...\\n"
patch -p1 < core-musl.patch   || exit 1
patch -p1 < extras-musl.patch || exit 1


## and finally we compile...
printf "(*) compiling... patience, young grasshopper\\n"
PKGVER="$pkgver" \
	CXXFLAGS="-fPIC -fPIE" \
	CPPFLAGS="-fPIC -fPIE" \
	LDFLAGS="-s" \
	sh compile.sh || exit 1


## aaaand for convenience's sake, we put the tools in bin/
mkdir -p bin
mv adb fastboot core/mkbootimg/mkbootimg bin/
ls -lAh bin
printf "(*) all done! enjoy!\\n"
