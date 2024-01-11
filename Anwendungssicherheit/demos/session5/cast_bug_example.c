#include <stdio.h>

unsigned int read_transfer_amount() {
	unsigned int r;
	scanf(" %u", &r);
	return r;
}

void transfer_money(int amount, char* sender, char* receipient) {
	//user.balance -= amount
	//receipient.balance += amount
	printf("Transferred %d Euros from %s to %s\n", amount, sender, receipient);
}

int get_balance(char * user) {
	return 1000000;
}

char * sender = "Gunnar Hartung";
char * receipient = "Doktor Meta";

int main() {
	int amount = read_transfer_amount();
	int balance = get_balance(sender);
	
	if (amount < balance) {
		transfer_money(amount,
			sender, receipient);
	} else {
		fputs("Insufficient Balance\n",
			stderr);
	};
}
