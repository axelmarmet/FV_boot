#!/bin/bash
ISO=/home/axel/Documents/FV_boot/vignop/nfos-x86_64.iso

sudo qemu-system-x86_64 -s -S -enable-kvm -cdrom $ISO -cpu host,migratable=off -m 1G -nographic

# sudo gdb -ex "set arch i386:x86-64:intel" \
# 	-ex "target remote localhost:1234" \
# 	-ex "symbol-file $BIN" \
# 	-ex "hb 0x101000" 

# sudo kill `pidof qemu-system-x86_64`