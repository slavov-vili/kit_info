#include <stdio.h>

//int no_more_credit = 1;

int get_balance(char * user) {
	return -100;
}

void transfer_money(int amount, char* sender, char* receipient) {
	//user.balance -= amount
	//receipient.balance += amount
	printf("Transferred %d Euros from %s to %s\n", amount, sender, receipient);
}

char * sender = "Gunnar Hartung, German Account";
char * receipient = "Gunnar Hartung, Offshore Account";

int main() {
	int balance = get_balance(sender);
	unsigned int transfer_amount;
	scanf(" %u", &transfer_amount);
	
	if (balance > transfer_amount) {
		transfer_money(transfer_amount,
			sender,	receipient);
	} else {
		fputs("Insufficient balance\n",
			stderr);
	};
}
