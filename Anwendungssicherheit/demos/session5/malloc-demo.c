#include <stdlib.h>
#include <stdio.h>

int main(){
  printf("malloc demo:\n");
  
  void *block1 = malloc(42);
  printf("block1 (42): %p\n", block1);
  void *block2 = malloc(45);
  printf("block2 (45): %p\n", block2);
  free(block1);
  printf("freeing block1\n");
  void *block3 = malloc(42);
  printf("block3 (42): %p\n", block3);
  void *block4 = malloc(56);
  printf("block4 (56): %p\n", block4);

  free(block2);
  printf("freeing block2\n");
  free(block4);
  printf("freeing block4\n");
  void *block5 = malloc(70);
  printf("block5 (70): %p\n", block5);
  free(block3);
  free(block5);
}
