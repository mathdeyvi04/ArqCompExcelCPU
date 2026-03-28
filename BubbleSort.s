.DATA
    ; Define the list numbers, just a few so it runs quickly.
    NUM1 = $0005
    NUM2 = $0009
    NUM3 = $000B

.CODE
    ; Initialize in the registers and then store in RAM.
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
            ; Transform into R6 and R7 for store temporally
            TRAN R4 R6
            TRAN R5 R7
            SUB R5 R4
            ; Note the difference: [j+1] - [j]
            ; Therefore, if [j] is equal to or greater than [j+1], ZF or CF will be 1, respectively
            JGE NO_SWAP_CASE
                SWAP_CASE:
                    DEC R3
                    STORE R7 R3 ; Store [j+1] in [j]
                    INC R3
                    STORE R6 R3 ; Store [j] in [j+1]
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
    ; Sets R0 to 999 to visualize the end
    LOAD R0 $03E7
    JMP END_EXECUTION