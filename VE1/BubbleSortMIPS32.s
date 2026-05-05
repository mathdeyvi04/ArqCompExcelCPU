# Bubble Sort Algorithm in MIPS Assembly
# Assumes that the array is stored in memory and the address of the array is in $a0
# The length of the array is in $a1

.data
array: .word 10, 21, 3, 40, 5  # Example array to sort

.text
.globl main
main:
    la $a0, array          # Load address of the array into $a0
    li $a1, 5              # Load array length into $a1
    jal bubbleSort         # Call the bubbleSort function
    li $v0, 10             # Exit program
    syscall

# Bubble Sort Function
# a0: address of the array
# a1: length of the array
bubbleSort:
    sub $a1, $a1, 1        # Decrement length for 0 indexing
    li $t0, 0              # Outer loop index i
    outer_loop:
        li $t1, 0          # Inner loop index j
        move $t2, $a0      # Pointer to the start of the array
        inner_loop:
            lw $t3, 0($t2)     # Load array[j]
            lw $t4, 4($t2)     # Load array[j+1]
            ble $t3, $t4, no_swap   # If array[j] <= array[j+1], no swap
            sw $t3, 4($t2)     # Swap elements
            sw $t4, 0($t2)
            no_swap:
            addiu $t2, $t2, 4  # Move to the next pair
            addiu $t1, $t1, 1  # Increment inner loop index
            blt $t1, $a1, inner_loop  # If j < length-1, continue inner loop
        addiu $t0, $t0, 1      # Increment outer loop index
        blt $t0, $a1, outer_loop   # If i < length-1, continue outer loop
    jr $ra                   # Return from function
