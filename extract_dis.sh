#!/bin/bash


VERSION_32=$1_32
VERSION_64=$1
OUT=$2

objcopy -O elf32-i386 --only-section=.text.start.32 $VERSION_64 $VERSION_32
objdump -Msuffix --insn-width=16 -j .text.start.32 -d $VERSION_32 >  $OUT
objdump -Msuffix --insn-width=16 -j .text.start.64 -d $VERSION_64 >> $OUT
objdump -j .rodata.start -s $VERSION_64 >> $OUT
# objdump -j .bss.start -s $VERSION_64 >> $OUT
objdump -j .data.start -s $VERSION_64 >> $OUT
