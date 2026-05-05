DATA:
    ; Defining the pixels
    ; -------------------
    ; Iterator for the array of pixels
    LOAD R0 #128

    ; First Pixel
    LOAD R1 #1
    STORE R1 R0
    INC R0
    LOAD R1 #0
    STORE R1 R0
    INC R0
    LOAD R1 #0
    STORE R1 R0
    INC R0

    ; Second Pixel
    LOAD R1 #1
    STORE R1 R0
    INC R0
    LOAD R1 #1
    STORE R1 R0
    INC R0
    LOAD R1 #1
    STORE R1 R0
    INC R0

    ; Third Pixel
    LOAD R1 #0
    STORE R1 R0
    INC R0
    LOAD R1 #0
    STORE R1 R0
    INC R0
    LOAD R1 #6
    STORE R1 R0
    INC R0

    ; Fourth Pixel
    LOAD R1 #0
    STORE R1 R0
    INC R0
    LOAD R1 #51
    STORE R1 R0
    INC R0
    LOAD R1 #51
    STORE R1 R0
    INC R0

    ; Fifth Pixel
    LOAD R1 #0
    STORE R1 R0
    INC R0
    LOAD R1 #3
    STORE R1 R0
    INC R0
    LOAD R1 #12
    STORE R1 R0
    INC R0

    ; Sixth Pixel
    LOAD R1 #112
    STORE R1 R0
    INC R0
    LOAD R1 #8
    STORE R1 R0
    INC R0
    LOAD R1 #83
    STORE R1 R0
    INC R0

    ; Seventh Pixel
    LOAD R1 #41
    STORE R1 R0
    INC R0
    LOAD R1 #73
    STORE R1 R0
    INC R0
    LOAD R1 #153
    STORE R1 R0
    INC R0

    ; The End
    LOAD R1 #65535
    STORE R1 R0

CODE:
    ; Defining Variables
    ; -------------------
    ; For read the values
    LOAD R0 #128
    ; For writing the values
    LOAD R1 #0
    ; For ending the sequence
    LOAD R2 #65535
    ; For dividing the summed values
    LOAD R3 #3

RGB_TO_GRAY:
    ; To prevent a Segmentation Fault, it is first necessary 
    ; to access the RED, verify that it equals the end value
    ; and then continue.
    LOAD R6 R0 ; RED
    TRAN R6 R7
    SUB R7 R2
    JEQ END

    ; Get the other colors
    INC R0
    LOAD R7 R0 ; GREEN
    INC R0
    LOAD R8 R0 ; BLUE
    INC R0

    ; Calculates the media
    TRAN R6 R9
    ADD R9 R7
    ADD R9 R8
    TRAN R3 R10
    DIV R9 R10

    ; Writes on  mem
    STORE R9 R1
    INC R1
    JMP RGB_TO_GRAY

END:
    JMP END
