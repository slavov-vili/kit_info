
int success() {
    return 1;
}


int main() {
    int a = 3, b = 2;
    int c = a + b;
    success();

    scanf("%d", &a);

    printf("Success: %p\n", success);
    printf("Main: %p\n", main);
    return 0;
}
