.DATA
    ; Define the list numbers, just a few so it runs quickly.
    NUM1 = $0005
    NUM2 = $0007
    NUM3 = $0009

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
    DEC R1 ; Decrement so that we can iterate over the array elements.
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
            SUB R7 R6 ; Note the difference. [j+1] - [j]
            JGE NO_SWAP_CASE
                ; Load for display purposes only
                SWAP_CASE:
                    LOAD R13 $0100
                NO_SWAP_CASE:
                    LOAD R14 $0100

END_EXECUTION:
    ; For some reason, if there isn't a final loop running AND executing some thing, it will result in a #REF error in the cells.
    LOAD R0 $0100
    JMP END_EXECUTION