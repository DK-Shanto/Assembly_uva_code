
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


.MODEL SMALL
.STACK 100h
.CODE

  START:
    CALL SCAN   ;INPUT NUMBER OF LINES
    CMP DL, 0   ;IF INPUT IS ZERO 
    JE ENDMAIN  ;TERMINATE
    
    MOV CX, 0   ;CLEAR CX
    MOV CL, DL
    MOV AX, 1   ;MOVED 1 TO AX
    
    SUM:
    ADD AL, CL
    LOOP SUM
    
    CALL PRINT
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    JMP START   ;TAKE INPUT AGAIN
    ENDMAIN:
    RET
    
ENDP


;a procedure that read an integer value
;of one or more digit
;input is terminated by both space and new line
;the inputed integer will be present in dl
SCAN PROC       
    MOV DX, 0
    INPUT:
    MOV AH, 1
    INT 21h  
    CMP AL, ' '
    JE END
    CMP AL, 13
    JE END
    PUSH AX
    MOV AL, 10
    MUL DL
    MOV DL, AL
    POP AX
    SUB AL, '0'
    ADD DL, AL
    JMP INPUT
    END: 
    RET
SCAN ENDP 


;a procedure that prints an integer
;consisting of one or more digits
;the integer must be present in ax
PRINT PROC
    MOV CX, 0
    LOOP1:
    CWD 
    MOV BX, 10
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JG LOOP1
    
    LOOP2:
    POP DX 
    ADD DX, '0'
    MOV AH, 2
    INT 21h
    LOOP LOOP2  
    RET
PRINT ENDP    




