	unsigned int read_transfer_amount();

	int amount = read_transfer_amount();
	int balance = get_balance(sender);
	if (amount < balance) {
		transfer_money(amount,
			sender, receipient);
	} else {
		fputs("Insufficient Balance\n",
			stderr);
	};
