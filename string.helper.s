.data
source: .asciiz "Hello, world!"
position: .word 7
new_char: .byte '!'
index: .word 7

.text
.globl __start
__start:

	###########################    EXAMPLE OF STRING REPLACE START  ##################################
    # Prepare the arguments
    la $a0, source  # Pointer to the source string
    lw $a1, position  # Position of the character to replace
    lb $a2, new_char  # The new character

    # Call the function
    jal replace_char

    # Print the modified string
    la $a0, source  # Load the address of the source string
    jal print_str  # Call a function to print the string
	
	###########################    EXAMPLE OF STRING REPLACE END  ##################################
	
	
	
	###########################    EXAMPLE OF get_substring START  ##################################
	    # Prepare the arguments
    la $a0, source  # Pointer to the source string
    lw $a1, start_index  # The starting index
    lw $a2, end_index  # The ending index

    # Call the function
    jal get_substring

    # Print the new string
    la $a0, new_string  # Load the address of the new string
    jal print_str  # Call a function to print the string
	
	###########################    EXAMPLE OF get_substring END  ##################################
	
	
	
	
	
	###########################    EXAMPLE OF strcpy START  ##################################
	# Prepare the arguments
    la $a0, dest  # Address of the destination string
    la $a1, source  # Address of the source string

    # Call the function
    jal strcpy

    # Print the destination string
    la $a0, dest  # Load the address of the destination string
    jal print_str  # Call a function to print the string
	
	###########################    EXAMPLE OF strcpy END  ##################################
	
	
	
	
	
	
	
	
	###########################    EXAMPLE OF strcmp START  ##################################
	    # Prepare the arguments
    la $a0, str1  # Address of the first string
    la $a1, str2  # Address of the second string

    # Call the function
    jal str_compare

    # Print the result
    move $a0, $v0  # Move the result to $a0
    jal print_int  # Call a function to print the integer
	
	
	###########################    EXAMPLE OF strcmp END  ##################################
	
	
	
	
	
	
	
	###########################    EXAMPLE OF replacement of substrings of equal size START  ##################################
	
	# Prepare the arguments
    la $a0, str  # Address of the string
    li $a1, 0  # Position 1
    li $a2, 5  # Position 2
    li $a3, 7  # Position 3
    li $t0, 12  # Position 4

    # Call the function
    jal swap_substrings

    # Print the string
    la $a0, str  # Load the address of the string
    jal print_str  # Call a function to print the string
	
	###########################    EXAMPLE OF replacement of substrings of equal size END  ##################################

	
	
	
	
	
	
	###########################    EXAMPLE OF strlen START  ##################################
	
    # Prepare the argument
    la $a0, str  # Address of the string

    # Call the function
    jal str_len

    # Print the result
    move $a0, $v0  # Move the result to $a0
    jal print_int  # Call a function to print the integer
	
	###########################    EXAMPLE OF strlen END  ##################################
	
	
	
	
	
	
	
	
	###########################    EXAMPLE OF strcat START  ##################################
	
	# Prepare the arguments
    la $a0, dest  # Address of the destination string
    la $a1, source  # Address of the source string

    # Call the function
    jal str_cat

    # Print the destination string
    la $a0, dest  # Load the address of the destination string
    jal print_str  # Call a function to print the string
	
	###########################    EXAMPLE OF strcat START  ##################################
	
	
	
	
	
	
	
	
	###########################    EXAMPLE OF reverse string START  ##################################
	
	la $a0, string     # Load address of the string
	li $a1, 0          # Start position
	li $a2, 1         # End position

	# Call the function
	jal reverse_substring
  
	# Print the reversed string
	la $a0, string
	li $v0, 4
	syscall
	###########################    EXAMPLE OF reverse string START  ##################################
	
	
	
	
	
	
	###########################    EXAMPLE OF string insert at custom pos START  ##################################
			.data
	baseString: .asciiz "Hello"
	insertString: .asciiz " world!"
	baseLen: .word 6  # "Hello" + '\0'
	insertLen: .word 7 # " world!" + '\0'
	insertPos: .word 3
	text
	globl __start
	_start:
	la $a0, baseString
	la $a1, insertString
	lw $a2, insertPos
	lw $a3, baseLen
	lw $t0, insertLen
	
	# Store base string
	li $v0, 4
	syscall
	
	# Call the function
	jal string_insert
	
	# Print the updated base string
	la $a0, baseString
	li $v0, 4
	syscall
	###########################    EXAMPLE OF string insert at custom pos END  ##################################
	

	###########################    EXAMPLE OF string convert to integer START  ##################################
	la $a0, str

	# Call the function
	jal str_to_int

	# Print the integer
	move $a0, $v0
	li $v0, 1
	syscall

	###########################    EXAMPLE OF string convert to integer START  ##################################


    # Exit the program
    li $v0, 10
    syscall





########################################## FUNCTIONS IMPLEMENTATIONS ################################################



# The function that replaces a character at a specified position
# $a0 = source string
# $a1 = position
# $a2 = new char
replace_char:
    add $t0, $a0, $a1  # Calculate the address of the character to replace
    sb $a2, 0($t0)  # Replace the character
    jr $ra  # Return from the function
	
	
	
	
	
	
	
# The function to get the kth character of a string
# $a0 = source string
# $a1 = index
get_kth_char:
    add $t0, $a0, $a1  # Calculate the address of the character
    lb $v0, 0($t0)  # Load the character into $v0
    jr $ra  # Return from the function
	
	
	
	
	
	

# Function to get a substring
# $a0 = source string
# $a1 = start index
# $a2 = end index
get_substring:
    la $t0, new_string  # Load the address of new_string to $t0
    add $t1, $a0, $a1  # Calculate the address of the start character
    add $t2, $a0, $a2  # Calculate the address of the end character
get_substring_loop:
    lb $t3, 0($t1)  # Load the current character from the source string
    sb $t3, 0($t0)  # Store the current character to new_string
    addiu $t0, $t0, 1  # Increase the pointer to new_string
    addiu $t1, $t1, 1  # Increase the pointer to the source string
    bne $t1, $t2, get_substring_loop  # If we haven't reached the end, continue the loop
    li $t3, 0  # The null character
    sb $t3, 0($t0)  # Append the null character to the end of new_string
    jr $ra  # Return from the function






# Function to compare two strings for equality
# $a0 = first string
# $a1 = second string
# $v0 = result (0 if equal, 1 if not)
str_compare:
    move $t0, $a0  # Pointer to the current character in the first string
    move $t1, $a1  # Pointer to the current character in the second string
str_compare_loop:
    lb $t2, 0($t0)  # Load the current character from the first string
    lb $t3, 0($t1)  # Load the current character from the second string
    bne $t2, $t3, str_compare_not_equal  # If the characters are not equal, the strings are not equal
    addiu $t0, $t0, 1  # Move to the next character in the first string
    addiu $t1, $t1, 1  # Move to the next character in the second string
    beqz $t2, str_compare_equal  # If we've reached the end of the strings, they're equal
    j str_compare_loop
str_compare_not_equal:
    li $v0, 1  # The strings are not equal
    jr $ra
str_compare_equal:
    li $v0, 0  # The strings are equal
    jr $ra





# Function to copy a string
# $a0 = destination string
# $a1 = source string
strcpy:
    move $t0, $a0  # Pointer to the current character in the destination string
    move $t1, $a1  # Pointer to the current character in the source string
strcpy_loop:
    lb $t2, 0($t1)  # Load the current character from the source string
    sb $t2, 0($t0)  # Store the current character to the destination string
    addiu $t0, $t0, 1  # Move to the next character in the destination string
    addiu $t1, $t1, 1  # Move to the next character in the source string
    bnez $t2, strcpy_loop  # If we haven't reached the end of the source string, continue the loop
    jr $ra  # Return from the function



# Function to swap two substrings of equal length
# $a0 = string
# $a1 = position 1
# $a2 = position 2
# $a3 = position 3
# $t0 = position 4
swap_substrings:
    sub $t1, $a2, $a1  # Length of the first substring
    sub $t2, $t0, $a3  # Length of the second substring

    # Ensure the lengths are equal
    bne $t1, $t2, swap_substrings_end

    # Swap the characters
swap_substrings_loop:
    add $t3, $a0, $a1  # Address of the character in the first substring
    add $t4, $a0, $a3  # Address of the character in the second substring

    lb $t5, 0($t3)  # Load the character from the first substring
    lb $t6, 0($t4)  # Load the character from the second substring

    sb $t6, 0($t3)  # Store the character from the second substring to the first substring
    sb $t5, 0($t4)  # Store the character from the first substring to the second substring

    addiu $a1, $a1, 1  # Move to the next character in the first substring
    addiu $a3, $a3, 1  # Move to the next character in the second substring
    addiu $t1, $t1, -1  # Decrease the length

    bnez $t1, swap_substrings_loop  # If we haven't reached the end of the substrings, continue the loop

swap_substrings_end:
    jr $ra  # Return from the function



# Function to calculate the length of a string
# $a0 = string
# $v0 = length
str_len:
    move $t0, $a0  # Pointer to the current character in the string
    li $v0, 0  # Initialize the length to 0
str_len_loop:
    lb $t1, 0($t0)  # Load the current character
    beqz $t1, str_len_end  # If we've reached the end of the string, exit the loop
    addiu $t0, $t0, 1  # Move to the next character
    addiu $v0, $v0, 1  # Increase the length
    j str_len_loop
str_len_end:
    jr $ra  # Return from the function





# Function to concatenate two strings
# $a0 = destination string
# $a1 = source string
str_cat:
    move $t0, $a0  # Pointer to the current character in the destination string
str_cat_dest_end:
    lb $t1, 0($t0)  # Load the current character from the destination string
    bnez $t1, str_cat_dest_next  # If we haven't reached the end of the destination string, continue the loop
    j str_cat_copy  # If we've reached the end of the destination string, start copying
str_cat_dest_next:
    addiu $t0, $t0, 1  # Move to the next character in the destination string
    j str_cat_dest_end
str_cat_copy:
    move $t1, $a1  # Pointer to the current character in the source string
str_cat_copy_loop:
    lb $t2, 0($t1)  # Load the current character from the source string
    sb $t2, 0($t0)  # Store the current character to the destination string
    addiu $t0, $t0, 1  # Move to the next character in the destination string
    addiu $t1, $t1, 1  # Move to the next character in the source string
    bnez $t2, str_cat_copy_loop  # If we haven't reached the end of the source string, continue the loop
    jr $ra  # Return from the function
	
	
	
	
	
# Function to reverse a substring
# Arguments:
#   $a0 - The address of the string
#   $a1 - The start position (0-indexed, inclusive)
#   $a2 - The end position (0-indexed, inclusive)
# Procedure:
#   The function goes from the start position to the end position,
#   swapping the characters at the current positions. This continues
#   until the start position is greater than the end position,
#   at which point the substring has been reversed.
reverse_substring:
  # Save registers
  addi $sp, $sp, -12
  sw $ra, 8($sp)
  sw $a2, 4($sp)
  sw $a1, 0($sp)

  # Initialize counters
  move $t0, $a1 # Starting index
  move $t1, $a2 # Ending index

  # Loop until start is less or equal to end
  loop:
    ble $t0, $t1, continue
    j exit_loop

  continue:
    # Swap characters
    add $t2, $a0, $t0 # Address of start
    add $t3, $a0, $t1 # Address of end
    lb $t4, 0($t2)    # Load start character
    lb $t5, 0($t3)    # Load end character
    sb $t5, 0($t2)    # Store end character at start
    sb $t4, 0($t3)    # Store start character at end

    # Increment start and decrement end
    addi $t0, $t0, 1
    addi $t1, $t1, -1
    j loop

  # Restore registers and return
  exit_loop:
    lw $a1, 0($sp)
    lw $a2, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra	


# Function to insert a string into another string at a specific position
# Arguments:
#   $a0 - The base string address
#   $a1 - The insert string address
#   $a2 - The insert position (0-indexed)
#   $a3 - The length of the base string
#   $t0 - The length of the insert string
string_insert:
  # Save registers
  addi $sp, $sp, -20
  sw $ra, 16($sp)
  sw $a3, 12($sp)
  sw $a2, 8($sp)
  sw $a1, 4($sp)
  sw $a0, 0($sp)

  # Shift characters to the right from the insertion point
  add $t1, $a0, $a3 # The end of the base string
  add $t2, $a0, $a2 # The insertion point
  loop_shift:
    sub $t1, $t1, 1
    sub $t3, $t1, $t0 # Destination after shifting
    lb $t4, 0($t1) # Load character
    sb $t4, 0($t3) # Store character
    bne $t1, $t2, loop_shift

  # Insert the string
  add $t1, $a0, $a2 # The insertion point
  loop_insert:
    lb $t4, 0($a1) # Load character from the insert string
    sb $t4, 0($t1) # Store character in the base string
    addi $t1, $t1, 1
    addi $a1, $a1, 1
    addi $t0, $t0, -1
    bnez $t0, loop_insert

  # Restore registers and return
  lw $a0, 0($sp)
  lw $a1, 4($sp)
  lw $a2, 8($sp)
  lw $a3, 12($sp)
  lw $ra, 16($sp)
  addi $sp, $sp, 20
  jr $ra



# Function to convert a string to an integer
# Arguments:
#   $a0 - The string address
# Returns:
#   $v0 - The integer
str_to_int:
  # Initialize result
  li $v0, 0

  # Convert string to integer
  loop:
    lbu $t1, 0($a0) # Load character
    beqz $t1, exit_loop # Break if end of string
    subu $t1, $t1, 48 # Convert from ASCII to integer
    mul $v0, $v0, 10 # Multiply result by 10
    add $v0, $v0, $t1 # Add new digit
    addiu $a0, $a0, 1 # Move to next character
    j loop

  exit_loop:
    jr $ra


print_str:
    li $v0, 4  # Load the system call code for printing a string
    syscall  # Perform the system call (print the string)
    jr $ra  # Return from the subroutine