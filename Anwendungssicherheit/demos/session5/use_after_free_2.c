int *pointer = malloc(sizeof(int));
*pointer = 7;

free(pointer);

int *another_pointer = malloc(sizeof(int));
*another_pointer = 5;
     
if (*pointer == 5) {
     printf("Success!\n");
}
