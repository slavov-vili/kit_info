#include <stdio.h>
#include <string.h>

char my_first_string[] = "Hello, World!";
char my_second_string[] = "How are you today?";
char my_third_string[] = "I hope you are doing well!";

int main() {
	
	puts(my_first_string);
	puts(my_second_string);
	printf("\n");
	
	printf("Writing to the first string...\n");
	strcpy(my_first_string, my_third_string);
	printf("Now, the second string is: %s\n", my_second_string);
	
	printf("But the array still contains: %s\n", &(my_second_string[11]));
	
}
	
