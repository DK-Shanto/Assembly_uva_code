
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
UN DB 'The 1500', 39,'th ugly number is 859963392.', 10, 13, '$'

.CODE
MOV AX, @DATA
MOV DS, AX
LEA DX, UN
MOV AH, 9
INT 21H

RET





