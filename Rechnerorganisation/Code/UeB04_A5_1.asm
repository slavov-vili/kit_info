	.data
n:	.word 10

	.text
	
	.globl main
main: 	lw $a0, n

anfang:
	addi $t0, $zero, 0
	addi $t1, $zero, 1

schleife:
	slt $t2, $a0, $t1    # if (n<$t1) then $t2=1 else $t2=0 (loop while $t1 <= n)
	bne $t2, $zero, ende #if n < $t1: go to end
	add $t0, $t0, $t1    #Add the current odd number to the sum
	addi $t1, $t1, 2     #Calc next odd number
	j schleife
	
ende:
	add $v0, $t0, $zero
	
	move $a0, $v0
	li $v0, 1
	syscall