#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {

     #define NUM 8
     int *array = malloc(NUM*sizeof(int));
     
     for (int i = 0; i < NUM; i++) {
	  array[i] = i;
     }

     free(array);
     int *new_array = malloc(NUM*sizeof(int));

     for (int i = 0; i < NUM; i++) {
	  printf("new_array[%i] = %i\n",i,array[i]);
     }

     return 0;
     

}
