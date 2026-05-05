CODE:
    ; Input the WIDTH
    LOAD R1 #2
    ; Input the HEIGHT
    LOAD R2 #3
    ; ---------------------------
    ; For temporary use
    TRAN R1 R5
    TRAN R2 R6
    ; R5 = R5 * R6
    MULT R5 R6
    ; Finally putting the area in the mem position R0
    STORE R5 R0
    ; Sets R0 to value for ending
    TRAN R5 R0

END:
    JMP END
