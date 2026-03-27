.DATA
    ; Define the list numbers, just a few so it runs quickly.
    NUM1 = $0005
    NUM2 = $0007
    NUM3 = $0009
    ; ----------

.CODE
    ; Initialize in the registers and then store in ROM.
    LOAD R0 NUM1
    STORE R0 @0000
    LOAD R0 NUM2
    STORE R0 @0001
    LOAD R0 NUM3
    STORE R0 @0002
    LOAD R0 @0000 ; Pointer to array
    LOAD R1 $0003 ; Fixed list length
    ; ------------
    ; Implement Bubble Sort

BubbleSort:
    LOAD R2 $0000 ; Use R2 for iteration loop
    DEC R1 ; Decrement so that we can iterate over the array elements.





END_EXECUTION:
    ; For some reason, if there isn't a final loop running AND executing some thing, it will result in a #REF error in the cells.
    LOAD R0 $0100
    JMP END_EXECUTION