#include <stdint.h>
#include <stdio.h>
#include <limits.h>

int main() {
	
	// 64 Bit
	{
		uint64_t a = 1;
		int64_t  b = -1;
		if (a >= b) {
			printf("%lu >= %ld\n", a, b);
		} else {
			printf("%lu < %ld\n", a, b);
		};
	}
	// 32 Bit
	{
		unsigned int a = 1;
		int b = -1;
		if (a >= b) {
			printf("%u >= %d\n", a, b);
		} else {
			printf("%u < %d\n", a, b);
		};
	}
	// 8 Bit
	{
		uint8_t a = 1;
		int8_t b = -1;
		if (a >= b) {
			printf("%u >= %d\n", a, b);
		} else {
			printf("%u < %d\n", a, b);
		};
	}
	
	// 32 Bit
	{
		int32_t  a = 0x80000000;
		uint32_t b = 0x80000000;
		if (a == b) {
			printf("a == b\n");
		} else {
			printf("a != b\n");
		};
	}
	// 8 Bit
	{	
		int8_t  a = 0x80;
		uint8_t b = 0x80;
		if (a == b) {
			puts("a == b");
		} else {
			puts("a != b");
		};
		
	}
}
