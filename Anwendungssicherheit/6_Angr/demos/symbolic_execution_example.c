
#include <stdio.h>
#include <stdlib.h>

void success() {
	puts("Okay!");
}
void fail() {
	puts("No.");
}

int main() {
	char buf[10];
	fgets(buf, 10, stdin);
	int a = atoi(buf);
	int b = a * 2;
	if (b == 20) {
		success();
	} else {
		fail();
	}
}
