	.text
	
	.globl main
main: 	li $s2, 0
	
	lw $s1, 100($s2)
	move $a0, $s1
	li $v0, 1
	syscall
	
	li $v0, 10 #Load the code for exit into v0
	syscall    #Call exit