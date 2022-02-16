#include <stdio.h>

int main() {
    int z = 3;
    printf("z = 3; // z = %d\n", z);
    int x = ++z;
    printf("x = ++z; // z = %d, x = %d\n", z, x);
    int y = z--;
    printf("y = z--; // z = %d, x = %d, y = %d\n", z, x, y);
}

