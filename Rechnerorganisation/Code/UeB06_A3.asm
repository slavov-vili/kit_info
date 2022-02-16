	.data
x: 2014
	.text
	.globl main
	
main:
S1:	addi $s0, $zero, 100
S2: 	lui  $t0, 0x2014
S3: 	ori  $t0, $t0, 0x1234
	addi $t0, $t0, 4
S4: 	lw   $s1, x
S5: 	add  $s1, $s1, $s0
S6: 	srl  $s2, $s1, 2
S7: 	sw   $s2, x
	
	move $a0 , $s2
	li $v0, 1
	syscall
