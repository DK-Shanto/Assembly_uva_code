
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.model small
.stack 100h
.code

  main proc
  start:
   mov bh,0
   mov bl,10
   call input
   mov dh,bh
   call input
   sub dh,bh
   mov ax,0
   mov al,dh
   cmp al,0
   
   jg p
   neg al 
   
   p:
   mov cl,10
   mov bx,0000h ;initialise address of bx
   store:
   div cl
   mov [0000h+bx],ah ;add bx to existing bx
   add bx,2
   mov ah,0
   cmp al,0
   jne store
   mov ah,2
   mov dl,0dh   ;for carriage
   int 21h
   mov dl,0ah   ;for new line
   int 21h
   call print
   jmp start

ret
main endp
  
  input proc
  mov ah,1
  int 21h
  cmp al,13
  jne number
  jmp exit
  
  number:
  sub al,48   ;to convert ascii to number
  mov cl,al
  mov al,bh
  mul bl
  add al,cl
  mov bh,al
  jmp input
  
  exit:
  
  ret
 input endp  
  
  print proc
  sub bx,2   ;sub bx to get actual address
  mov dl,[0000h+bx]
  add dl,48 ;to convert number to ascii value
  mov ah,2
  int 21h
  cmp bx,0
  jne print
  ret
print endp


