.MODEL SMALL
.STACK 100H

.DATA
    msg  DB "=== NUMBER COUNTER ===", 13, 10, "$"
    newl DB 13, 10, "$"

.CODE
MAIN PROC

    ; Setup data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print heading
    LEA DX, msg
    MOV AH, 09H
    INT 21H

    ; CX = 10 (loop runs 10 times)
    MOV CX, 10

    ; BL = 1 (starting number)
    MOV BL, 1

PRINT_LOOP:
    ; Convert number to ASCII (digit + 30H = ASCII code)
    MOV DL, BL
    ADD DL, 30H

    ; Print the character
    MOV AH, 02H
    INT 21H

    ; Print new line
    LEA DX, newl
    MOV AH, 09H
    INT 21H

    ; Next number
    INC BL

    ; Repeat until CX = 0
    LOOP PRINT_LOOP

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

