# xSpim Memory Demo Program

#  Data Area
.data

space:
    .asciiz " "

newline:
    .asciiz "\n"

dispArray:
    .asciiz "\nCurrent Array:\n"

convention:
    .asciiz "\nConvention Check\n"

myArray:
	.word 0 33 123 -66 332 -1 -223 453 9 45 -78 -14  

#Text Area (i.e. instructions)
.text

main:
    ori     $v0, $0, 4          
    la      $a0, dispArray 
    syscall

    ori     $s1, $0, 12
    la      $s0, myArray

    add     $a1, $0, $s1
    add     $a0, $0, $s0
 
    jal     DispArray

    ori     $s2, $0, 0
    ori     $s3, $0, 0
    ori     $s4, $0, 0
    ori     $s5, $0, 0
    ori     $s6, $0, 0
    ori     $s7, $0, 0
    
    add     $a1, $0, $s1
    add     $a0, $0, $s0

    jal     IterativeMax

    add     $s1, $s1, $s2
    add     $s1, $s1, $s3
    add     $s1, $s1, $s4
    add     $s1, $s1, $s5
    add     $s1, $s1, $s6
    add     $s1, $s1, $s7

    add     $a1, $0, $s1
    add     $a0, $0, $s0
    jal     DispArray

    j       Exit

DispArray:
    addi    $t0, $0, 0 
    add     $t1, $0, $a0

dispLoop:
    beq     $t0, $a1, dispend
    sll     $t2, $t0, 2
    add     $t3, $t1, $t2
    lw      $t4, 0($t3)

    ori     $v0, $0, 1
    add     $a0, $0, $t4
    syscall

    ori     $v0, $0, 4
    la      $a0, space
    syscall

    addi    $t0, $t0, 1
    j       dispLoop    

dispend:
    ori     $v0, $0, 4
    la      $a0, newline
    syscall
    jr      $ra 

ConventionCheck:
    addi    $t0, $0, -1
    addi    $t1, $0, -1
    addi    $t2, $0, -1
    addi    $t3, $0, -1
    addi    $t4, $0, -1
    addi    $t5, $0, -1
    addi    $t6, $0, -1
    addi    $t7, $0, -1
    ori     $v0, $0, 4
    la      $a0, convention
    syscall
    addi $v0, $zero, -1
    addi $v1, $zero, -1
    addi $a0, $zero, -1
    addi $a1, $zero, -1
    addi $a2, $zero, -1
    addi $a3, $zero, -1
    addi $k0, $zero, -1
    addi $k1, $zero, -1
    jr      $ra
    
Exit:
    ori     $v0, $0, 10
    syscall

# COPYFROMHERE - DO NOT REMOVE THIS LINE

IterativeMax:
    #TODO: write your code here, $a0 stores the address of the array, $a1 stores the length of the array
    addiu $sp, $sp, -20
    sw $s0, 0($sp)  #address of the array
    sw $s1, 4($sp)  #length of the array
    sw $s2, 8($sp)  #loop counter
    sw $s3, 12($sp)  #maximum
    sw $ra, 16($sp)
    
    move $s0, $a0
    move $s1, $a1
    li $s2, 0
    lw $s3, 0($s0)  #initialize maximum to first element
    
    loop:
    	bge $s2, $s1, return_main
    	lw $t0, 0($s0)  #put current value of array in t0 to compare to the maximum
    	addi $s0, $s0, 4
    	addi $s2, $s2, 1
    	#print the current value of the array
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	
    	#check if current is greater than max
	bgt $t0, $s3, newMax
		
	#print new line
	li $v0, 4
	la $a0, newline
	syscall	
		
	#print the max
	li $v0, 1
	move $a0, $s3
	syscall
	
	jal ConventionCheck
    	
        j loop
                
return_main:
    	lw $ra, 16($sp)  
    	lw $s3, 12($sp)  
    	lw $s2, 8($sp)  
    	lw $s1, 4($sp)  
    	lw $s0, 0($sp)
    	addiu $sp, $sp, 20
    	
    	jr $ra
    	
    	
newMax:
	move $s3, $t0
	
	#print new line
	li $v0, 4
	la $a0, newline
	syscall	
		
	#print the max
	li $v0, 1
	move $a0, $s3
	syscall
	
	jal ConventionCheck
    	
        j loop
	
	
	
	
	
	
	
	