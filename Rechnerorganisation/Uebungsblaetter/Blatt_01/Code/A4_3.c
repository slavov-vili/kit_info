#include <stdio.h>

int main() {
    int r = 0;
    int s = 0;
    int w = 11;
    int sum = 0;

    for (r = 1; r <= w; r++)
        for (s = r; s < w; s++)
            sum = sum + s;

    printf("sum = %d\n", sum);
}
