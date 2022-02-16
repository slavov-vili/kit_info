	.data

x:	.word 3
Y: 	.word 1 , 3 , 7
	.text
	
subroutine :
	li $v0 , 0
	li $t3 , 0

marke1 :
	bge $t3, $a1, marke2
	lw $t0, 0($a0)
	mul $t1, $t0, $t0
	add $v0, $v0, $t1
	addi $a0, $a0, 4
	addi , $t3, $t3, 1
	b marke1

marke2 :
	jr $ra
	
	.globl main
main :
	la $a0, Y
	lw $a1, x
	jal subroutine
	# Aufruf eines Unterprogramms , welches die # Quadratwurzel einer Integerzahl in $v0 berechnet .
	# Das Ergebnis steht in $v0
	move $a0 , $v0
	li $v0 , 1
	syscall
	
	li $v0 , 10
	syscall
	jr $a