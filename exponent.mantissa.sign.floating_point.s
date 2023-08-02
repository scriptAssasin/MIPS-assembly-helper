.text
.globl __start
__start:

li $t0, 0  # Initialize register $t0 to 0
la $a0, b0  # Load the address of 'b0' into $a0
l.s $f1, ($a0)  # Load the single-precision float at memory address 'b0' into $f1

loop:
	la $a0, giveFloat  # Load the address of 'giveFloat' into $a0
	jal pr_str  # Jump to the 'pr_str' label, printing the prompt

	li $v0, 6  # Load the system call code for reading a float
	syscall  # Perform the system call (read a float from the user)
	
	mov.s $f12, $f0  # Move the user's input into $f12

    # move the float to integer register
    mfc1 $t1, $f0

    # get the sign
    li $t2, 0x80000000
    and $t3, $t1, $t2
    srl $t3, $t3, 31
    move $a0, $t3
    la $a0, signIs
    jal pr_str  # print the string "sign is: "
    move $a0, $t3
    jal pr_int  # print the sign
    jal pr_endl  # print a newline

    # get the exponent
    li $t2, 0x7F800000
    and $t3, $t1, $t2
    srl $t3, $t3, 23
    sub $t3, $t3, 127
    move $a0, $t3
    la $a0, exponentIs
    jal pr_str  # print the string "exponent is: "
    move $a0, $t3
    jal pr_int  # print the exponent
    jal pr_endl  # print a newline

    # get the mantissa
    li $t2, 0x007FFFFF
    and $t3, $t1, $t2
    move $a0, $t3
    la $a0, mantissaIs
    jal pr_str  # print the string "mantissa is: "
    move $a0, $t3
    jal pr_int  # print the mantissa
    jal pr_endl  # print a newline

	c.eq.s $f0, $f1  # Compare the user's input with 0.0
	bc1f loop  # If they're not equal, continue the loop

exit:
	li $v0, 10  # Load the exit system call code
	syscall  # Perform the system call (exit the program)

pr_str:
		li $v0, 4  # Load the system call code for printing a string
		syscall  # Perform the system call (print the string)
		jr $ra  # Return from the subroutine

pr_float:
		li $v0, 2  # Load the system call code for printing a float
		syscall  # Perform the system call (print the float)
		jr $ra  # Return from the subroutine

pr_int:
		li $v0, 1  # Load the system call code for printing an integer
		syscall  # Perform the system call (print the integer)
		jr $ra  # Return from the subroutine

pr_endl:
		li $v0, 4  # Load the system call code for printing a string
		la $a0, endl  # Load the address of 'endl' into $a0
		syscall  # Perform the system call (print a newline)
		jr $ra  # Return from the subroutine

.data
b0: .float 0.0
giveFloat: .asciiz "Give float: "
endl: .asciiz "\n"
bye:   .asciiz "bye"
signIs: .asciiz "Sign is: "
exponentIs: .asciiz "Exponent is: "
mantissaIs: .asciiz "Mantissa is: "
