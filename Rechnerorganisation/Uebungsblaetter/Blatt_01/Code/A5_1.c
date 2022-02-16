#include <stdio.h>

int main() {
    int x = 14; int y = 19;
    int *p; int *q;

    p = &x;
    *p = 22;
    q = &y;
    p = q;
    y = 21;
    *p = x;

    printf("x = %d, y = %d\n", x, y);
}
