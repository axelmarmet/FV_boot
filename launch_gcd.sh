#!/bin/bash
BIN=/home/axel/Documents/FV_boot/vignop/nfos-x86_64-multiboot2.bin

sudo gdb -ex "set arch i386:x86-64:intel" \
	-ex "target remote localhost:1234" \
	-ex "symbol-file $BIN" \
	-ex "hb *0x101000" \
    -ex "layout asm" \
    -ex "c" 
