CC=gcc
CFLAGS=-std=c11 -Wall -Werror

OBJECTS = comparison_demo overflow_demo comparison_bug_example cast_bug_example

all: $(OBJECTS)

comparison_demo: comparison_demo.c
	$(CC) $(CFLAGS) -o $@ $<

overflow_demo: overflow_demo.c
	$(CC) $(CFLAGS) -o $@ $<

comparison_bug_example: comparison_bug_example.c
	$(CC) $(CFLAGS) -o $@ $<

cast_bug_example: cast_bug_example.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJECTS)

