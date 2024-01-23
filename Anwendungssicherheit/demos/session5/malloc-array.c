#include <stdlib.h>
#include <stdio.h>
# define NUM 8 

int main(){
	int *array = malloc(NUM * sizeof(int));

	for (int i = 0; i < NUM; i++) {
		array[i] = i;
	}
	for (int i = 0; i < NUM; i++) {
		printf("array[%i] = %i\n", i, array[i]);
	}

	free (array);
	for (int i = 0; i < NUM; i++) {
		printf("array[%i] = %i\n", i, array[i]);
	}

	int *new_array = malloc(NUM * sizeof(int));

	for (int i = 0; i < NUM; i++) {
		printf("new_array[%i] = %i\n", i, array[i]);
	}
}
