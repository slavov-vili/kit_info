exercise4: exercise4.asm
	nasm -o $@ $<

exercise4_test: exercise4.asm
	nasm -f elf64 -D TEST_MODE -o exercise4.o $<
	ld -o $@ exercise4.o

clean:
	rm -f exercise4 exercise4_test exercise4.o

.PHONY: clean
