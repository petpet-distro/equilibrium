#!/bin/sh

set -e; # exit on error

if [ -z "$1" ]; then
	printf "usage: %s block_device\n\n" "$0"

	printf "Installs Equilibrium onto a block device\n"
	exit 1
fi

dd if=/dev/zero "of=$1" count=1 bs=440
dd if=/dev/zero "of=$1" count=8 bs=512

dd if=build/bios-Stage1.bin "of=$1" bs=440 count=1
dd if=build/bios-EBR.bin "of=$1" bs=512 count=8
