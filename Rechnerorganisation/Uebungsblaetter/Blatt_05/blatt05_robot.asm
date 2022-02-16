#
# Karlsruher Institut fuer Technologie
# Institut fuer Anthropomatik und Robotik (IAR) 
# Vorlesung Rechnerorganisation
# 
# Autor:
# Matrikelnummer:
# Tutoriumsnummer:
# Name des Tutors:
#


.data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Depository                                                                            #
#                                                                                       #
#       This is a defined field for the robot to move on.                               #
#       The field contains obstacles, represented by the ASCII '#'                      #
#       The field is completely surrounded by obstacles.                                #
#                                                                                       #
# Attributes:                                                                           #
#       field_width:    The "column-count" of the depository field                      #
#       field_height:   The "row-count" of the depository field                         #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
depository:             .ascii          "############\n"
                        .ascii          "#  #   #  0#\n"
                        .ascii          "# ## # # ###\n"
                        .ascii          "#    # #   #\n"
                        .ascii          "###### ### #\n"
                        .ascii          "#          #\n"
                        .asciiz         "############\n"
#temporary buffer for printing the depository field to the console:
depository_image:       .space 91 # = field_width * field_height
field_width:            .word 13
field_height:           .word 7
field_char_count:       .word 92

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Kobi, le petit robot                                                             i_i  #
#                                                                                 [@_@] #
#       The Robot is represented by the characters " > v > ^ ".                  /|___|\#
#       It can move one step in direction "kobi_dir" within the field             d  b  #
#       or make a turn to the left. He can check if there is a wall in front            #
#       of him or a disc at his position.                                               #
#                                                                                       #
# Attributes:                                                                           #
#       kobi_pos_x:     The x position of the robot.                                    #
#       kobi_pos_y:     The y position of the robot.                                    #
#       kobi_dir:       The direction in which the robot is moving.                     #
#                                                                                       #
# Methods:                                                                              #
#       advance                                                                         #
#       turnLeft                                                                        #
#       checkWall                                                                       #
#       checkDisc                                                                       #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
kobi_pos_x:             .word 1
kobi_pos_y:             .word 1
kobi_dir:               .byte 0 #0 = north, 1 = east, 2 = south, 3 = west
#maps a direction byte value to the displayable cursor character
dir_map: .asciiz "^>v<"
kobi_sayFound:          .asciiz "I found the disc!"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Debug Data                                                                            #
#                                                                                       #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
field_width_debug:      .asciiz "\n The value of field_width is: "
field_height_debug:     .asciiz "\n The value of field_height is: "
kobi_pos_x_debug:       .asciiz "\n The value of kobi_pos_x is: "
kobi_pos_y_debug:       .asciiz "\n The value of kobi_pos_y is: " 
field_char_count_debug: .asciiz "\n The value of field_count is: "
kobi_dir_debug:         .asciiz "\n The value of kobi_dir is: "

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Formatting Data                                                                       #
#                                                                                       #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
cr_string:              .asciiz "\n"
clear_screen_string:    .asciiz "\n\n\n\n\n\n\n\n\n\n"


.text
# The .globl <Name> makes the symbol <Name> globally visible to the linker and available
# to any file that is linked to the file in which the .globl pseudo-op occurs.
.globl main
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#       MAIN                                                                            #
#                                                                                       #
#       starting point of the execution                                                 #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
main:           # prepare a new stackframe for the routine
                  subu $sp, $sp, 40
                  sw $ra, 40($sp)
                  sw $fp, 36($sp)
                  sw $s0, 32($sp)
                  sw $s1, 28($sp)
                  sw $s2, 24($sp)
                  sw $s3, 20($sp)
                  sw $s4, 16($sp)
                  sw $s5, 12($sp)
                  sw $s6, 8($sp)
                  sw $s7, 4($sp)
                  addu $fp, $sp, 8
                # load data from data_segment to registers s0 to s7
                  jal load_data
                  # Attention: Normally this would have been done just for registers s0 to s5
                  # as s6 and s7 are unused. Additionally this would have been necessary for
                  # every single subroutine as well. But in order to make this program a bit
                  # more leightweight. The s registers are used as global variables and reachable
                  # from every subroutine without additional loading. This implies that you
                  # mustn't use the s registers for another variable than specified in the
                  # load_data subroutine.
        
                # while ( !found_disc ){
                #   if (right is a wall){
                #     if ( in front of you is a wall){
                #       turn left
                #     } else {
                #       move forward
                #     }
                #   }
                #   else {
                #     turn right (= 3x turn left)
                #     move forward
                #   }
                # }
        
# PUT YOUR CODE HERE
#       Implement the search algorithm as described in the PSEUDO CODE above here:
#
#
#
#
#
###

                # we found the disc and print that to the console
                  la $a0, kobi_sayFound
                  jal print_asciiz
                
                # store data to data_segment from registers s0 to s7
                  jal store_data
                  # Attention: Normally this would have been done just for registers s0 to s5
                  # as s6 and s7 are unused. Additionally this would have been necessary for
                  # every single subroutine as well. But in order to make this program a bit
                  # more leightweight. The s registers are used as global variables and reachable
                  # from every subroutine without additional storing. This implies that you
                  # mustn't use the s registers for another variable than specified in the
                  # load_data subroutine.
                # restore the old stackframe and return to the calling function
                  lw $ra, 40($sp)
                  lw $fp, 36($sp)
                  lw $s0, 32($sp)
                  lw $s1, 28($sp)
                  lw $s2, 24($sp)
                  lw $s3, 20($sp)
                  lw $s4, 16($sp)
                  lw $s5, 12($sp)
                  lw $s6, 8($sp)
                  lw $s7, 4($sp)
                  addu $sp, $sp, 40
                # jr $ra
                # as the MARS simulator doesn't jump back for the main subroutine
                # different to other simulators you have to use the exit system call
                # instead of jr $ra to terminate the main program
                  li $v0, 10
                  syscall       

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: load_data                                                                 #
#                                                                                       #
#       The subroutine loads the data from data segment to resgister set                #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

load_data:      # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # - - - - - - - - - - - - - - - - - - - - - - - #
                # registerr to variable table                   #
                #       | $s0 | kobi_pos_x                      #
                #       | $s1 | kobi_pos_y                      #
                #       | $s2 | kobi_dir                        #
                #       | $s3 | field_width                     #
                #       | $s4 | field_height                    #
                #       | $s5 | field_char_count                #
                #       | $s6 | unused                          #
                #       | $s7 | unused                          #
                # - - - - - - - - - - - - - - - - - - - - - - - #
                #load register $s0
                  la $t0, kobi_pos_x
                  lw $s0, 0($t0)
                #load register $s1
                  la $t0, kobi_pos_y
                  lw $s1, 0($t0)
                #load register $s2
                  la $t0, kobi_dir
                  lb $s2, 0($t0)
                #load register $s3
                  la $t0, field_width
                  lw $s3, 0($t0)                
                #load register $s4
                  la $t0, field_height
                  lw $s4, 0($t0)                
                #load register $s5
                  la $t0, field_char_count
                  lw $s5, 0($t0)                
                #load register $s6
                
                #load register $s7

                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: store_data                                                                #
#                                                                                       #
#       The subroutine stores the data to data segment from resgister set.              #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

store_data:     # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                #store register $s0
                  la $t0, kobi_pos_x
                  sw $s0, 0($t0)
                #store register $s1
                  la $t0, kobi_pos_y
                  sw $s1, 0($t0)
                #store register $s2
                  la $t0, kobi_dir
                  sb $s2, 0($t0)
                #store register $s3
                  la $t0, field_width
                  sw $s3, 0($t0)                
                #store register $s4
                  la $t0, field_height
                  sw $s4, 0($t0)                
                #store register $s5
                  la $t0, field_char_count
                  sw $s5, 0($t0)                
                #store register $s6
                
                #store register $s7

                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: kobi_turnLeft                                                             #
#                                                                                       #
#       Kobi does a turn to the left.                                                   #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
kobi_turnLeft:  # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

# PUT YOUR CODE HERE
#       Complete the kobi_turnLeft subroutine:
#
#
#
#
#
###
            
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: kobi_advance                                                              #
#                                                                                       #
#       Kobi does a step in direction.                                                  #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

kobi_advance:   # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8
                
                # check for wall in front of you
                jal kobi_checkWall 
                  
                # if subroutine returns true for a wall, skip advancement:
                  bne $v0, $zero, skip_advancement
                          
                          move $t0, $s0
                          move $t1, $s1
####################### MYSTIC CODE
                          li $t3, 8
                          mul $t3, $s2, $t3
                          la $t2, MYSTIC_LABEL
                          add $t3, $t2, $t3
                          jr $t3
                        MYSTIC_LABEL:
                          addi $t1, $s1, -1
                          j ANOTHER_MYSTIC_LABEL
                          addi $t0, $s0, 1
                          j ANOTHER_MYSTIC_LABEL
                          addi $t1, $s1, 1
                          j ANOTHER_MYSTIC_LABEL
                          addi $t0, $s0, -1
                        ANOTHER_MYSTIC_LABEL:
####################### END OF MYSTIC CODE
                          move $s0, $t0
                          move $s1, $t1
                skip_advancement:

                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: print_kobi                                                                #
#                                                                                       #
#       The subroutine provides the possibility to print the field                      #
#       with the robot at his actual position in his actual direction.                  #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
print_kobi:     # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # copy the depository field to printing buffer
                  la $a0, depository
                  la $a1, depository_image
                  move $a2, $s5
                  jal mem_copy
                
                # store kobi le petit robot at his position with his direction to the image
                # - step one - 
                # printing to data segment adress depository_image + string_offset
                # string_offset = kobi_pos_y * field width + kobi_pos_x
                  mul $t0, $s1, $s3
                  add $t0, $t0, $s0
                  la $t1, depository_image
                  add $t0, $t0, $t1
                # - step two -
                # load the right displayale cursor
                  la $t1, dir_map
                  add $t1, $t1, $s2
                  lb $t1, 0($t1)
                # - step three -
                # save the cursor to the image
                  sb $t1, 0($t0)
                
                # print the depository image to the console
                  jal clear_screen
                  la $a0, depository_image
                  jal print_asciiz
                
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: kobi_checkWall                                                            #
#                                                                                       #
#       The subroutine checks if in front of kobi is a wall.                            #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# Return value:                                                                         #
#       $v0 returns boolean $v0 = 1 for true and $v0 = 0 for false                      #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
kobi_checkWall: # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8
                  
                  move $t0, $s0
                  move $t1, $s1

####################### MYSTIC CODE
                  li $t3, 8
                  mul $t3, $s2, $t3
                  la $t2, MYSTIC_LABEL0
                  add $t3, $t2, $t3
                  jr $t3
                MYSTIC_LABEL0:
                  addi $t1, $s1, -1
                  j ANOTHER_MYSTIC_LABEL0
                  addi $t0, $s0, 1
                  j ANOTHER_MYSTIC_LABEL0
                  addi $t1, $s1, 1
                  j ANOTHER_MYSTIC_LABEL0
                  addi $t0, $s0, -1
                ANOTHER_MYSTIC_LABEL0:
####################### END OF MYSTIC CODE
                
                # t0 contains now x value of the field in front of kobi
                # t1 contains now y value of the field in front of kobi
                
                # check if on new position is a wall
                  mul $t2, $t1, $s3 # pos_y * field_width
                  add $t2, $t2, $t0 # ANS + pos_x
                  la $t3, depository
                  add $t3, $t2, $t3
                  lb $t3, 0($t3)
                  subi $t3, $t3, '#'
                  # if ( !position_is_wall ) set_false else set_true;
                  beq $t3, $zero, checkWall_setTrue 
                  checkWall_setFalse: # at new position is no wall
                        li $v0, 0
                        j checkWall_fi
                  checkWall_setTrue:  # at new position is a wall
                        li $v0, 1
                  checkWall_fi:
                  
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: kobi_checkDisc                                                            #
#                                                                                       #
#       The subroutine provides the possibility to check if there is a disc             #
#       at kobis position.                                                              #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# Return value:                                                                         #
#       $v0 returns boolean $v0 = 1 for true and $v0 = 0 for false                      #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
kobi_checkDisc: # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

# PUT YOUR CODE HERE
#       Complete the kobi_checkDisc subroutine:
#
#
#
#
#
###
                  
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra
                  
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: print_deposit                                                             #
#                                                                                       #
#       The subroutine provides the possibility to print the depository field.          #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
print_deposit:  # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # print de depository string
                  la $a0, depository
                  jal print_asciiz
                
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra
                  
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: print_asciiz                                                              #
#                                                                                       #
#       The subroutine provides the possibility to print a zero                         #
#       terminated ascii string to the console.                                         #
#                                                                                       #
# Parameters:                                                                           #
#       Before calling the subroutines expect the adress of the                         #
#       string that has to be printed in the register $a0                               #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
print_asciiz:   # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # call the systemcall 4 "print_string"
                  li $v0, 4
                  syscall
                
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: clear_screen                                                              #
#                                                                                       #
#       The subroutine provides the possibility to clear the actual                     #
#       console output by flushing the console with clear lines.                        #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #       
clear_screen:   # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # clear the screen by printing the clear String to the console
                  la $a0, clear_screen_string
                  jal print_asciiz

                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: mem_copy                                                                  #
#                                                                                       #
#       The subroutine provides the possibility to copy an amount of                    #
#       continuous bytes from one adress in the datasegment to another.                 #
#                                                                                       #
# Parameters:                                                                           #
#       Before calling the starting adress of the origin continuous                     #
#       bytes has to be provided in the register $a0, the destination                   #
#       adress in $a1 and the amount of bytes in the register $a2                       #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #       
mem_copy:       # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8

                # - - - - - - - - - - - - - - - - -  - -  - - - - - - - #
                # for ( i = 0; i < amount_of_bytes; i++ ){              #
                #       load byte on starting_adress + i;               #
                #       save byte on destination_adress + i;            #
                # }                                                     #
                # - - - - - - - - - - - - - - - - - - - - - - - - - - - #
                  li $t0, 0                     # i = 0
                for:
                  slt $t1, $t0, $a2             # i < amount of bytes ?
                  beqz $t1, rof                 # yes: go on
                
                  add $t1, $t0, $a0
                  lb $t2, 0($t1)
                  add $t1, $t0, $a1
                  sb $t2, 0($t1)
                  
                  addi $t0, $t0, 1              # i++
                  j for
                rof:                            # no: exit for          
                
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Subroutine: debug                                                                     #
#                                                                                       #
#       The subroutine provides the possibility to print the actual                     #
#       content of the variables stored in the registers s0 to s2                       #
#                                                                                       #
# Parameters:                                                                           #
#       - none -                                                                        #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #       
debug:          # prepare a new stackframe for the subroutine
                  subu $sp, $sp, 8
                  sw $ra, 8($sp)
                  sw $fp, 4($sp)
                  addu $fp, $sp, 8
        
                # print s0
                  la $a0, kobi_pos_x_debug
                  jal print_asciiz
                  move $a0, $s0
                  li $v0, 1
                  syscall
                  la $a0, cr_string
                  jal print_asciiz

                # print s1
                  la $a0, kobi_pos_y_debug
                  jal print_asciiz
                  move $a0, $s1
                  li $v0, 1
                  syscall
                  la $a0, cr_string
                  jal print_asciiz

                # print s2
                  la $a0, kobi_dir_debug
                  jal print_asciiz      
                  move $a0, $s2
                  li $v0, 1
                  syscall
                  la $a0, cr_string
                  jal print_asciiz
                
                # restore the old stackframe and return to the calling function
                  lw $ra, 8($sp)
                  lw $fp, 4($sp)
                  addu $sp, $sp, 8
                  jr $ra
