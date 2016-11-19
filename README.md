android-tools-musl
==================

this repository holds useful scripts and patches to make android-tools
compile on musl. the version i got working is `android-7.0.0_r1`. it
should last us for a while ;)

if you don't know what android-tools are, they're:

* adb (android debug bridge)
* fastboot
* mkbootimg

## requirements

* posix shell
* git master of musl-libc (current version 1.1.15 doesn't have all needed functions)
* clang
* gtest (optional)

## usage

just run `runme.sh` and the script will do everything for you. after
it's done, you'll find the binaries in a directory called `bin`.

if the script exits with 1, it means something went wrong. read
`runme.sh` to get a better insight.
