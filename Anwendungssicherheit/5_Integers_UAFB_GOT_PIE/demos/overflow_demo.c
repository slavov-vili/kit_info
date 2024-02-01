
#include <limits.h>
#include <stdio.h>

int main() {
	int x = INT_MAX;
	int y = INT_MIN;
	printf("INT_MAX == %1$11d == %1$#x\n", x);
	printf("INT_MIN == %1$11d == %1$#x\n", y);
	printf("INT_MAX + INT_MAX == %d\n", x + INT_MAX);
	printf("INT_MAX + 1 == %1$d == %1$#x\n", x + 1);
	printf("INT_MIN + INT_MIN == %d\n", y + INT_MIN);
}
