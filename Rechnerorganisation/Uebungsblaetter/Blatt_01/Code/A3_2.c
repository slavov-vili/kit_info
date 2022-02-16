#include <stdio.h>

int main() {
    int f = 10;
    int g = 7;
    int h = 0;
    
    h = f & g;
    printf("h = f & g; // h = %d\n", h);
    h = f | g;
    printf("h = f | g; // h = %d\n", h);
    h = ~f | ~g;
    printf("h = ~f | ~g; // h = %d\n", h);
    h = f << g;
    printf("h = f << g; // h = %d\n", h);
}

