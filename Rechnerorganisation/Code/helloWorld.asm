	.data
helloWorld:	.asciiz "Hello, World!\n"
	
	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, helloWorld
	syscall
	
	li $v0, 4
	syscall
