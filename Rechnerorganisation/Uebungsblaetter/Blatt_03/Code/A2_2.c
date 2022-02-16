#include <stdio.h>

int* f() {
    int i = 5;
    return &i;
}

void g() {
    int j = 25;
}

int main() {
    int* x = f();
    g();
    printf("x = %d\n", *x);
    return 0;
}
