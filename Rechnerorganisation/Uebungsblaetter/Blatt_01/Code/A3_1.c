#include <stdio.h>

int main() {
    int a = 1337;
    int aHex = 0x1337;
    int b = 7331;
    int bHex = 0x7331;

    printf("0x%x | 0x%x = 0x%x\n", aHex, bHex, aHex | bHex);
    printf("0x%x & 0x%x = 0x%x\n", aHex, bHex, aHex & bHex);
    printf("0x%x ^ 0x%x = 0x%x\n", aHex, bHex, aHex ^ bHex);
    printf("~0x%x = 0x%x\n", aHex, ~aHex);
    printf("%d | %d = %d\n", a, b, a | b);
    printf("0x%x >> 2 = 0x%x\n", aHex, aHex >> 2);
    printf("0x%x << 3 = 0x%x\n", aHex, aHex << 3);
    printf("%d >> 2 = %d\n", a, a >> 2);
    printf("%d << 3 = %d\n", a, a << 3);
}

