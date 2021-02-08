;playing with strings in Assembly Language

.386

.model flat, stdcall

includelib msvcrt.lib
extern  exit:proc
extern printf: proc
extern scanf: proc


public start


.data
player dd 8

sir db "0123",0
format DB "%c", 0


 
 
 .code
 start:

mov esi,0 
lea esi, sir

mov ebx, 'b'
mov [esi+2],bl

push offset sir

call printf

push 0
call exit
end start