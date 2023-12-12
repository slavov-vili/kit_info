CC=gcc
NO_NX=-z execstack
NO_CANARY=-fno-stack-protector

all: demo_with_stack_canary demo shellcode

demo_with_stack_canary: demo.c
	$(CC) $(NO_NX) -o $@ $<

demo: demo.c
	$(CC) $(NO_NX) $(NO_CANARY) -o $@ $<

shellcode: shellcode.asm
	nasm -o $@ $<

clean:
	rm -f demo_with_stack_canary demo shellcode

.PHONY: all clean
