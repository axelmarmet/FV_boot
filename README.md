# Formally verified Bootloader
## Workflow
Run `make nfos-all`
Run `extract_dis.sh` on the `nfos-x86_64-multiboot2.bin` obtained
Modify the output as indicated on next section
Run `run.sh` with for first argument the wanted configuration located in the `configurations` directory and as a second argument the file you wish to run
The resulting configuration will then be printed after ~10 minutes on a Thinkpad T480, since it is quite big it is recommended to pipe it to a file.
If you do not wish to extract the code there already exists a file `X86-64-semantics/build/nfos.dis` that is the result of the extraction and lightly modified syntax.
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
Parsing takes a majority of the execution time. As an optimization, lines of memory that are written before being read can be deleted. As they do not need to be parsed.
## Note
Sometimes for reasons unknown the compilation runs out of memory. Doing `rm -r X86-64-semantics/semantics/x86-semantics-kompiled` removes the cache and fixes the problem.