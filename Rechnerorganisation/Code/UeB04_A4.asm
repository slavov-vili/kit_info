	.data
a:	.word 36, 20, 27, 15, 1, 62, 41
n:	.word 7
	
	.text
	
	.globl main
main: 	li $t0, 0 #t0 = curIndex
	li $s0, 0 #s0 = maxElement
	lw $s1, n #s1 = array size
	
m1:	bge $t0, $s1, m3 #Jump if curIndex >= arraySize
	mul $t1, $t0, 4  #curIndex*4 = address of next element in array
	lw $t2, a($t1)	 #t2 = array[curIndex]
	ble $t2, $s0, m2 #Jump if curElement <= maxElement
	move $s0, $t2	 #Make curElement the max

m2:
	addi $t0, $t0, 1 #increment curIndex
	b m1		 #go back to loop
	
m3:	move $a0, $s0 #Store maxElement in a0
	li $v0, 1     #Load the code for print_int into v0
	syscall       #Call print_int (it automatically reads a0 aka max)
	
	
	li $v0, 10 #Load the code for exit into v0
	syscall    #Call exit
