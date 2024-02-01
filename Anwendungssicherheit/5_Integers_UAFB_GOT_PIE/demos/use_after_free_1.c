int *pointer = malloc(sizeof(int));
*pointer = 7;

[...]

free(pointer);

[...]
     
if (*pointer == 5) {
     printf("Success!\n");
}
