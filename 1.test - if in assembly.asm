;if statement in assembly language


.386
.model flat,stdcall

includelib msvrct.lib
extern exit:proc
extern printf:proc


public start

.data
sir DB 0,1,2,3,43,5,6,7,8,9
format db "%d test",0
format1 db "some text"
.code
start:

mov esi,0
mov eax,0
mov al,sir[esi+0]
cmp al,sir[esi+1]
jne da
jmp nu

da: 
push offset format1
call printf

	nu:
	push eax
	push offset format
	call printf
	

push 0
call exit

end start