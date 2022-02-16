          .data

          # String literals for output
prompt:   .asciiz "Bitte Text eingeben: "
output:   .asciiz "ROT13-verschluesselter Text: "

          # Memory to store the string
string:   .space 256

          .text
          .globl main

          # Register usage:
          # $s0: Current position in string (address)
          # $s1: Current character

          # Prompt user for string
main:     li   $v0, 4
          la   $a0, prompt
          syscall

          # Read string from user
          li   $v0, 8
          la   $a0, string
          li   $a1, 256
          syscall

###############################################################################################################
#	Write your solution here
encrypt:  li $a1, 13	 # Encryption key
	  li $a3, 0	 # Iteration index
	  
	  subu $sp, $sp, 12
	  sw $a3, 4($sp)
	  sw $ra, 8($sp)
	  sw $fp, 12($sp)

	  jal shift_loop # Shift all characters
	  
	  lw $a3, 4($sp)
	  lw $ra, 8($sp)
	  lw $fp, 12($sp)
	  addu $sp, $sp, 12
	  
	  j finish



shift_loop: lb $s0, string($a3)      # Load current character
	    beq $s0, $zero, end_loop # Jump when finished iterating
	    
	    # Check if the current character is a letter
	    subu $sp, $sp, 16
	    sw $s0, 4($sp)
	    sw $a3, 8($sp)
	    sw $ra, 12($sp)
	    sw $fp, 16($sp)
	  
	    move $a0, $s0
	    jal is_letter
	   
	    lw $s0, 4($sp)
	    lw $a3, 8($sp)
	    lw $ra, 12($sp)
	    lw $fp, 16($sp)
  	    addu $sp, $sp, 16
	    
	    beqz $v0, continue   # If the character is not a letter, ignore it    
	    
	    # Shift the current character
	    subu $sp, $sp, 16
	    sw $s0, 4($sp)
	    sw $a3, 8($sp)
	    sw $ra, 12($sp)
	    sw $fp, 16($sp)
	  
	    move $a0, $s0
	    jal shift_char
	   
	    lw $s0, 4($sp)
	    lw $a3, 8($sp)
	    lw $ra, 12($sp)
	    lw $fp, 16($sp)
  	    addu $sp, $sp, 16
	    
	    sb $v0, string($a3)  # Store shifted character
continue:   addi $a3, $a3, 1     # Increment index
	    j shift_loop
end_loop:   jr $ra



# a0 = letter to shift
# a1 = shift amount
shift_char: # Check if the character is a capital letter
	    subu $sp, $sp, 16
	    sw $a0, 4($sp)
	    sw $a1, 8($sp)
	    sw $ra, 12($sp)
	    sw $fp, 16($sp)

	    jal is_capital
	   
	    lw $a0, 4($sp)
	    lw $a1, 8($sp)
	    lw $ra, 12($sp)
	    lw $fp, 16($sp)
  	    addu $sp, $sp, 16
  	    
  	    bnez $v0, handle_cap
  	    li $t0, 97  # Set lower bound of range (Code of a)
  	    li $t1, 122 # Set upper bound of range (Code of z)
  	    b shift
handle_cap: li $t0, 65  # Set lower bound of range (Code of A)
  	    li $t1, 90 # Set upper bound of range (Code of Z)
shift:      add $t2, $a0, $a1    # Increase current character
	    div $t2, $t1
	    mflo $t3
	    beqz $t3, return_char # If the increased character is within the range
  	    # Shift the character with respect to the beginning of the range
  	    mfhi $t3
  	    add $t2, $t0, $t3
  	    li $t3, 1
  	    sub $t2, $t2, $t3
return_char: move $v0, $t2     # Return the shifted character
	     jr $ra



# a0 = letter to check
is_letter: subu $sp, $sp, 12
	   sw $a0, 4($sp)
	   sw $ra, 8($sp)
	   sw $fp, 12($sp)
	  
	   jal is_capital     # Check if a0 is a capital letter
	   
	   lw $a0, 4($sp)
	   lw $ra, 8($sp)
	   lw $fp, 12($sp)
  	   addu $sp, $sp, 12
  	   
	   move $s0, $v0      # Store result
	   
	   subu $sp, $sp, 16
	   sw $a0, 4($sp)
	   sw $s0, 8($sp)
	   sw $ra, 12($sp)
	   sw $fp, 16($sp)
	  
	   jal is_lowercase   # Check if a0 is a lowercase letter
	   
	   lw $a0, 4($sp)
	   lw $s0, 8($sp)
	   lw $ra, 12($sp)
	   lw $fp, 16($sp)
  	   addu $sp, $sp, 16
	   
	   or $v0, $s0, $v0  # Check if either of the above is true
              
	   jr $ra



# a0 = letter to check
is_capital: li $t0, 65          # Code of A
	    sge $t1, $a0, $t0   # curChar >= A
	    li $t0, 90          # Code of Z
	    sle $t2, $a0, $t0   # curChar <= Z
	    and $v0, $t1, $t2   # A <= curChar <= Z
	    jr $ra



# a0 = letter to check
is_lowercase: li $t0, 97        # Code of a
	      sge $t1, $a0, $t0 # curChar >= a
	      li $t0, 122       # Code of z
	      sle $t2, $a0, $t0 # curChar <= z
	      and $v0, $t1, $t2 # a <= curChar <= z
	      jr $ra



finish:   # Output explanatory text
          li   $v0, 4
          la   $a0, output
          syscall

          # Output string
          la   $a0, string
          syscall
          
          # Exit
          li $v0, 10
          syscall
