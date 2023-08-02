.data
float1: .float 10.0
float2: .float 2.0
result: .float 0.0
newline: .asciiz "\n"

.text
.globl __start
__start:

#############################EXAMPLE USAGE SUBSTRACTION#################################

    la $a0, float1  # Load the address of float1 into $a0
    la $a1, float2  # Load the address of float2 into $a1
    jal subtract_floats  # Call the subtract_floats function

    la $a0, result  # Load the address of result into $a0
    swc1 $f14, 0($a0)  # Store the result of the subtraction
    
    # Print the result
    lwc1 $f12, 0($a0)  # Load the result into $f12
    li $v0, 2  # Set syscall service to print float
    syscall
    
    # Print a newline
    la $a0, newline
    li $v0, 4  # Set syscall service to print string
    syscall

    # Exit the program
    li $v0, 10  # Set syscall service to exit
    syscall

#############################EXAMPLE USAGE SUBSTRACTION END#################################




#############################EXAMPLE USAGE DIVISION START#################################

    la $a0, float1  # Load the address of float1 into $a0
    la $a1, float2  # Load the address of float2 into $a1
    jal divide_floats  # Call the divide_floats function

    la $a0, result  # Load the address of result into $a0
    swc1 $f14, 0($a0)  # Store the result of the division
    
    # Print the result
    lwc1 $f12, 0($a0)  # Load the result into $f12
    li $v0, 2  # Set syscall service to print float
    syscall
    
    # Print a newline
    la $a0, newline
    li $v0, 4  # Set syscall service to print string
    syscall

    # Exit the program
    li $v0, 10  # Set syscall service to exit
    syscall

#############################EXAMPLE USAGE DIVISION END#################################




#############################EXAMPLE USAGE MULTIPLY START#################################


    la $a0, float1  # Load the address of float1 into $a0
    la $a1, float2  # Load the address of float2 into $a1
    jal multiply_floats  # Call the multiply_floats function

    la $a0, result  # Load the address of result into $a0
    swc1 $f14, 0($a0)  # Store the result of the multiplication
    
    # Print the result
    lwc1 $f12, 0($a0)  # Load the result into $f12
    li $v0, 2  # Set syscall service to print float
    syscall
    
    # Print a newline
    la $a0, newline
    li $v0, 4  # Set syscall service to print string
    syscall

    # Exit the program
    li $v0, 10  # Set syscall service to exit
    syscall
	
#############################EXAMPLE USAGE MULTIPLY END#################################






#############################EXAMPLE USAGE COMPARE START#################################
    la $a0, float1  # Load the address of float1 into $a0
    la $a1, float2  # Load the address of float2 into $a1
    jal compare_floats  # Call the compare_floats function

    # Now let's print the result
    move $a0, $v0  # Move the comparison result to $a0
    li $v0, 1  # Set syscall service to print integer
    syscall

    # Print a newline
    la $a0, newline
    li $v0, 4  # Set syscall service to print string
    syscall

    # Exit the program
    li $v0, 10  # Set syscall service to exit
    syscall
#############################EXAMPLE USAGE COMPARE END#################################



#############################EXAMPLE USAGE ADD FLOATS START#################################
    la $a0, float1  # Load the address of float1 into $a0
    la $a1, float2  # Load the address of float2 into $a1
    jal add_floats  # Call the add_floats function

    la $a0, result  # Load the address of result into $a0
    swc1 $f14, 0($a0)  # Store the result of the addition
    
    # Now let's print the result
    lwc1 $f12, 0($a0)  # Load the result into $f12
    li $v0, 2  # Set syscall service to print float
    syscall
    
    # Print a newline
    la $a0, newline
    li $v0, 4  # Set syscall service to print string
    syscall

    # Exit the program
    li $v0, 10  # Set syscall service to exit
    syscall
#############################EXAMPLE USAGE ADD FLOATS END#################################



#############################EXAMPLE USAGE FLOATS EXTRACT SIGN START#################################
.data
float: .float 10.0
sign: .word 0
newline: .asciiz "\n"

.text
.globl main
main:
  la $a0, float  # Load the address of the float into $a0
  jal extract_sign  # Call the extract_sign function
  sw $v0, sign  # Store the sign bit

  # Print the sign bit
  move $a0, $v0  # Move the result to $a0
  li $v0, 1  # Load syscall number for print integer
  syscall  # Make the syscall
  
  # Print a newline
  la $a0, newline  # Load the address of the newline string into $a0
  li $v0, 4  # Load syscall number for print string
  syscall  # Make the syscall

  # Exit the program
  li $v0, 10  # Load syscall number for exit
  syscall  # Make the syscall
#############################EXAMPLE USAGE FLOATS EXTRACT SIGN END#################################


#############################EXAMPLE USAGE FLOATS EXTRACT MANTISSA START#################################
.data
float: .float 10.0
mantissa: .word 0
newline: .asciiz "\n"

.text
.globl main
main:
  la $a0, float  # Load the address of the float into $a0
  jal extract_mantissa  # Call the extract_mantissa function
  sw $v0, mantissa  # Store the mantissa

  # Print the mantissa
  move $a0, $v0  # Move the result to $a0
  li $v0, 1  # Load syscall number for print integer
  syscall  # Make the syscall
  
  # Print a newline
  la $a0, newline  # Load the address of the newline string into $a0
  li $v0, 4  # Load syscall number for print string
  syscall  # Make the syscall

  # Exit the program
  li $v0, 10  # Load syscall number for exit
  syscall  # Make the syscall
#############################EXAMPLE USAGE FLOATS EXTRACT MANTISSA END#################################




#############################EXAMPLE USAGE FLOATS TO INT START#################################

.data
float: .float 10.5

.text
.globl main
main:
  la $a0, float  # Load the address of the float into $a0
  jal float_to_int  # Call the float_to_int function
  
  # Print the integer
  move $a0, $v0  # Move the result to $a0
  li $v0, 1  # Load syscall number for print integer
  syscall  # Make the syscall
  
  # Exit the program
  li $v0, 10  # Load syscall number for exit
  syscall  # Make the syscall

#############################EXAMPLE USAGE FLOATS TO INT MANTISSA END#################################





#############################EXAMPLE USAGE EXTRACT EXPONENT START#################################
.data
float: .float 10.5
exponent: .word 0

.text
.globl main
main:
  la $a0, float  # Load the address of the float into $a0
  jal extract_exponent  # Call the extract_exponent function
  
  # Print the exponent
  move $a0, $v0  # Move the exponent to $a0
  sw $a0, exponent  # Store the exponent
  li $v0, 1  # Load syscall number for print integer
  syscall  # Make the syscall
  
  # Exit the program
  li $v0, 10  # Load syscall number for exit
  syscall  # Make the syscall
#############################EXAMPLE USAGE EXTRACT EXPONENT END#################################


#######################FUNCTION IMPLEMENTATIONS############################


# Function: compare_floats
# Description: Compares two floating point numbers and sets the result to $v0. 
#              The result is -1 if the first number is less than the second, 0 if they are equal, or 1 if the first number is greater.
# Input: The addresses of the two floats in $a0 and $a1
# Output: The comparison result in $v0
compare_floats:
  lwc1 $f12, 0($a0)  # Load the first float into $f12
  lwc1 $f13, 0($a1)  # Load the second float into $f13
  c.eq.s $f12, $f13  # Compare the floats for equality
  bc1t equal
  c.lt.s $f12, $f13  # Compare the floats for less than
  bc1t less_than
  li $v0, 1  # Greater than
  jr $ra
less_than:
  li $v0, -1  # Less than
  jr $ra
equal:
  li $v0, 0  # Equal
  jr $ra  # Return from the function
  
# Function: add_floats
# Description: Adds two floating point numbers and stores the result in memory. 
# Input: The addresses of the two floats in $a0 and $a1
# Output: The sum of the two floats, stored at the address in $a0
add_floats:
  lwc1 $f12, 0($a0)  # Load the first float into $f12
  lwc1 $f13, 0($a1)  # Load the second float into $f13
  add.s $f14, $f12, $f13  # Add the floats
  swc1 $f14, 0($a0)  # Store the result
  jr $ra  # Return from the function
  
# Function: divide_floats
# Description: Divides the first floating point number by the second and stores the result in memory. 
# Input: The addresses of the two floats in $a0 and $a1
# Output: The result of the division, stored at the address in $a0
divide_floats:
  lwc1 $f12, 0($a0)  # Load the first float into $f12
  lwc1 $f13, 0($a1)  # Load the second float into $f13
  div.s $f14, $f12, $f13  # Divide the floats
  swc1 $f14, 0($a0)  # Store the result
  jr $ra  # Return from the function
  
# Function: multiply_floats
# Description: Multiplies two floating point numbers and stores the result in memory. 
# Input: The addresses of the two floats in $a0 and $a1
# Output: The result of the multiplication, stored at the address in $a0
multiply_floats:
  lwc1 $f12, 0($a0)  # Load the first float into $f12
  lwc1 $f13, 0($a1)  # Load the second float into $f13
  mul.s $f14, $f12, $f13  # Multiply the floats
  swc1 $f14, 0($a0)  # Store the result
  jr $ra  # Return from the function
  
# Function: subtract_floats
# Description: Subtracts the second floating point number from the first and stores the result in memory. 
# Input: The addresses of the two floats in $a0 and $a1
# Output: The result of the subtraction, stored at the address in $a0
subtract_floats:
  lwc1 $f12, 0($a0)  # Load the first float into $f12
  lwc1 $f13, 0($a1)  # Load the second float into $f13
  sub.s $f14, $f12, $f13  # Subtract the floats
  swc1 $f14, 0($a0)  # Store the result
  jr $ra  # Return from the function


# Function: extract_sign
# Description: Extracts the sign bit from a floating point number. 
# Input: The address of the float in $a0
# Output: The sign bit in $v0 (0 for positive, 1 for negative)
extract_sign:
  lwc1 $f12, 0($a0)  # Load the float into $f12
  mfc1 $t0, $f12  # Move the float to a general-purpose register
  srl $t0, $t0, 31  # Shift right to isolate the sign bit
  move $v0, $t0  # Move the sign bit to $v0
  jr $ra  # Return from the function
  
  
# Function: extract_mantissa
# Description: Extracts the mantissa from a floating point number. 
# Input: The address of the float in $a0
# Output: The mantissa in $v0
extract_mantissa:
  lwc1 $f12, 0($a0)  # Load the float into $f12
  mfc1 $t0, $f12  # Move the float to a general-purpose register
  srl $t0, $t0, 9  # Shift right to move the mantissa to the right
  li $t1, 0x007FFFFF  # Load a mask to isolate the mantissa
  and $v0, $t0, $t1  # Bitwise AND to isolate the mantissa
  jr $ra  # Return from the function
  
  
# Function: float_to_int
# Description: Converts a floating point number to an integer. 
# Input: The address of the float in $a0
# Output: The integer in $v0
float_to_int:
  lwc1 $f12, 0($a0)  # Load the float into $f12
  cvt.w.s $f12, $f12  # Convert the float to an integer
  mfc1 $v0, $f12  # Move the integer to $v0
  jr $ra  # Return from the function
  

# Function: extract_exponent
# Description: Extracts the exponent from a floating point number. 
# Input: The address of the float in $a0
# Output: The exponent in $v0
extract_exponent:
  lwc1 $f12, 0($a0)  # Load the float into $f12
  mfc1 $t0, $f12  # Move the float to a general-purpose register
  srl $t1, $t0, 23  # Shift right to move the exponent to the right
  andi $v0, $t1, 0xFF  # Apply a mask to isolate the exponent
  jr $ra  # Return from the function