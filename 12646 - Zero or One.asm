
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    START:
    MOV AH, 1
    INT 21H   ;INPUT FOR ALICE
    MOV BH, AL
    MOV AH, 2
    MOV DL, ' '
    INT 21H
    MOV AH, 1
    INT 21H   ;INPUT FOR BETO
    MOV BL, AL
    MOV AH, 2
    MOV DL, ' '
    INT 21H
    MOV AH, 1
    INT 21H   ;INPUT FOR CLARA
    MOV CH, AL
    MOV AH, 2
    MOV DL, ' '
    INT 21H
    
    CMP BH, BL
    JNE NEQUAL
    CMP BH, CH
    JE NONE
    
    MOV AH, 2
    MOV DL, 'C' ;CLARA IS DIFFERENT
    INT 21H
    JMP NEWLINE
    
    NEQUAL: 
    CMP BH, CH
    JNE NEQUAL2
    MOV AH, 2
    MOV DL, 'B'
    INT 21H
    JMP NEWLINE
               
    NEQUAL2:
    MOV AH, 2
    MOV DL, 'A'
    INT 21H
    JMP NEWLINE
    
    NONE:
    MOV AH, 2
    MOV DL, '*'
    INT 21H
    
    NEWLINE:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    JMP START
    ENDMAIN:
    RET
    
ENDP




