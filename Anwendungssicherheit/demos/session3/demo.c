#include <stdio.h>

void greet() {
	char name[128];
	printf("What's your name?\n");
	printf("P.S.: Your name is being stored at the address %p\n", name);
	scanf("%s", name);
	printf("Hello, %s!\n", name);
}

int main() {
	greet();
}
