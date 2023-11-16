#include <stdio.h>

int my_ints[16];

int main() {
	printf("my_ints[16] is %d\n", my_ints[16]);
	printf("Accessing the my_ints array...\n");
	for (int i = 0; i <= 16; i++) {
		my_ints[i] = i;
	}
	printf("my_ints[16] is now %d\n", my_ints[16]);
}
