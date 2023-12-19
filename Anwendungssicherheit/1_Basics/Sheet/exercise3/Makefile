
binding.o: binding.asm
	nasm -f elf64 -o $@ $<

test: test.o binding.o foo_system_v.o
	gcc -o test test.o binding.o foo_system_v.o
