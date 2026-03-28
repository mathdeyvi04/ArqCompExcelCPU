.DATA
    ; Define the list numbers, just a few so it runs quickly.
    NUM1 = $0009
    NUM2 = $0007
    NUM3 = $0005

.CODE
    ; Initialize in the registers and then store in ROM.
    LOAD R0 NUM1
    STORE R0 @0000
    LOAD R0 NUM2
    STORE R0 @0001
    LOAD R0 NUM3
    STORE R0 @0002
    LOAD R1 $0003 ; Fixed list length
    ; ------------
    ; Now, implement Bubble Sort

BubbleSort:
    DEC R1 ; Decrement to allow comparison with the element's index.
    LOAD R2 $0000 ; Use R2 for index iteration loop

    ITERATION_LOOP:
        LOAD R3 $0000 ; Use R3 for index comparation loop

        COMPARATION_LOOP:
            ; Check two adjacent elements
            LOAD R4 R3
            INC R3
            LOAD R5 R3
            ; Transform into R6 and R7 temporally for subsequent subtraction
            TRAN R4 R6
            TRAN R5 R7
            SUB R7 R6
            ; Note the difference: [j+1] - [j]
            ; Therefore, if [j] is equal to or greater than [j+1], ZF or CF will be 1, respectively.
            JGE NO_SWAP_CASE
                SWAP_CASE:
                    ; Load for display purposes only
                    LOAD R13 $1000
                NO_SWAP_CASE:
                    ; Nothing happens and it moves on to the next comparison if necessary
                    ; Transform into R6 temporally for subsequent subtraction
                    TRAN R1 R6
                    SUB R6 R3
                    ; Think about the possibles cases
                    ; This took me sometime to realize
                    JEQ AFTER_COMPARATION_LOOP
                    JMP COMPARATION_LOOP
        AFTER_COMPARATION_LOOP:
            INC R2
            TRAN R1 R6
            SUB R6 R2
            JEQ END_EXECUTION
            JMP ITERATION_LOOP

END_EXECUTION:
    ; For some reason, if there isn't a final loop running AND executing some thing, it will result in a #REF error in the cells.
    LOAD R0 $0100
    JMP END_EXECUTION