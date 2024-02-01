
CC=clang
CFLAGS=-std=c11 -Wall -Werror

fauxware: fauxware.c
	$(CC) $(CFLAGS) -o $@ $<

symbolic_execution_example: symbolic_execution_example.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f fauxware symbolic_execution_example
