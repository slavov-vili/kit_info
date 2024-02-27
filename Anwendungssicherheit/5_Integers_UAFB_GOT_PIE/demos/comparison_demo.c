#include <stdint.h>
#include <stdio.h>
#include <limits.h>

int main() {
	
	// 64 Bit
	{
		uint64_t a = 1;
		int64_t  b = -1;
		printf("64bit: ");
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
		unsigned int casted_b = (unsigned int) b;
		printf("a = %1$11d == %1$#x\n", a);
		printf("b = %1$11u == %1$#x\n", b);
		printf("casted_b = %1$11u == %1$#x\n", casted_b);
		printf("32bit: ");
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
		int32_t casted_b = (int32_t) b;
		uint32_t ucasted_b = (uint32_t) casted_b;
		printf("a = %1$11u == %1$#x\n", a);
		printf("b = %1$11d == %1$#x\n", b);
		printf("casted_b = %1$11d == %1$#x\n", casted_b);
		printf("ucasted_b = %1$11u == %1$#x\n", ucasted_b);
		printf("8bit: ");
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
