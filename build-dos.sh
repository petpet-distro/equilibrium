#!/bin/sh

set -e; # exit on error

buildAsm() {
	printf "\t\tAS\t%s\n" "$2"
	nasm -f bin -o "$1" "$2"
}

buildAsm build/bios-Stage1.bin src/bios/Stage1/bootsector.asm
