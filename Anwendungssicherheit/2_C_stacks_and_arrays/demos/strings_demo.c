#include <stdio.h>
#include <string.h>

char my_first_string[] = "Hello, World!";
char my_second_string[] = "How are you today?";
char my_third_string[] = "Fine";

int main() {
	
	puts(my_first_string);
	puts(my_second_string);
	puts(my_third_string);
	printf("\n");

	printf(
		"The lengths of the strings are: %lu, %lu, %lu\n",
		strlen(my_first_string),
		strlen(my_second_string),
		strlen(my_third_string)
	);
	printf(
		"But their sizes are: %lu, %lu, %lu\n\n",
		sizeof(my_first_string),
		sizeof(my_second_string),
		sizeof(my_third_string)
	);
	printf(
		"The addresses of the strings are: %p, %p, %p\n",
		(void*)&my_first_string,
		(void*)&my_second_string,
		(void*)&my_third_string
	);
	
	printf("Now changing the second string...\n");
	my_second_string[strlen(my_second_string)] = ' ';
	puts("Now, the second string is: ");
	puts(my_second_string);
	printf("\n");
	
	printf(
		"Now, the length of the second string is %lu,\n"
		"while the array still only has %lu bytes.\n",
		strlen(my_second_string),
		sizeof(my_second_string)
	);
}
