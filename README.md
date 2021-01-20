# Formally verified Bootloader
## Modify the output of extract_dis.sh
### Deletion
Lines like
```
**/*:     file format [elf32-i386|elf64-x86-64]
address <label>:
Disassembly of section  *
```
Should be deleted.
### Modification
#### Instruction
Instruction lines like
```
101000:	bc 00 30 2e 00                                  	movl   $0x2e3000,%esp
```
should be transformed to
```
0x101000: 0xbc00302e00                              	movl   $0x2e3000,%esp
```
#### Data
Data lines like 
```
 1a4000 83000000 00000000 83000040 00000000  ...........@....
```
should be transformed to
```
0x1a4000: 0x83 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x83 0x00 0x00 0x40 0x00 0x00 0x00 0x00 
```
### Optimization
Parsing takes a majority of the execution time. As an optimization, lines of memory that are written before being read can be deleted. As they do not need to be parsed.# FV_boot
