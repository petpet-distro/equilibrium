#!/bin/sh

set -e; # exit on error

mkdir -p build/bios

buildAsm() {
	printf "\t\tAS\t%s\n" "$2"
	nasm -f bin -o "$1" "$2"
}

buildAsm build/bios-Stage1.bin src/bios/bootsector.asm
buildAsm build/bios-EBR.bin src/bios/VBR.asm
