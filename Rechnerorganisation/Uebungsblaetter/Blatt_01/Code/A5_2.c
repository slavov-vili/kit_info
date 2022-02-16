#include <stdio.h>

int main() {
    int a[10];

    for (int i = 0; i <= 9; ++i)
        a[i] = 1;

    int* pa;                // Neuen Integer Pointer initializieren
    pa = &a[2];             // Pointer wird auf der Speicheraddresse von a[2] (3. Element von a) gesetzt
    a[6] = 7;               // Der Wert von a[6] (7. Element von a) wird auf 7 gesetzt
    *pa = 5;                // Der Wert der Speicheraddresse pa wird auf 5 gesetzt (i.e. a[2] wird auf 5 gesetzt)
    pa = pa + 1;            // Der Pointer pa wird ein Mal incrementiert: pa = pa + <int size mal 1> (pa zeigt auf a[3])
    *(pa + 3) = *pa + 2;    // Der Wert an der Speicheraddresse pa + <int size mal 3> wird gesetzt auf der Summe von
                            // dem Wert der an der Speicheraddresse pa steht (a[3] = 1) und 2 (also a[6] = 3)
    *(pa + *pa - 1) = 48;   // pa + *pa - 1 = Der Pointer pa wird <Wert an der Speicheraddresse pa> (a[3]) - 1 mal incrementiert
                            // (also 1-1 = 0, d.h. pa zeigt immer noch auf a[3])
                            // Der Wert an der Speicheraddresse pa + *pa - 1 wird auf 48 gesetzt (also a[3] = 48)

    int sizeOfA = sizeof(a)/sizeof(a[0]);
    printf("a = [%d", a[0]);
    for (int i = 1; i < sizeOfA; i++)
        printf(", %d", a[i]);
    printf("]\n");
}

