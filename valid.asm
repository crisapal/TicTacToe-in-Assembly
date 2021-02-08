.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf:proc
public start

.data
format DB "%d",0
sq db "011164x32",0
validat DB "0123456789",0
ceva dd 99
rez dd 99
.code

; a procedure to validate if a move it's legal or not
validare PROC
	push EBP
mov EBP, ESP
sub ESP,4
	mov esi,0
	mov edx,0
	mov dl,sq[esi+1]
	cmp dl,sq[esi+2]
	je da1
	jmp dif1	
	da1: 
	mov edx,0
	mov dl,sq[esi+2]
	cmp dl,sq[esi+3]
	je da ;return 1
	jmp dif1
	
	dif1:
	mov edx,0
	mov dl,sq[esi+4]
	cmp dl,sq[esi+5]
	je da2
	jmp dif2	
	da2: 
	mov edx,0
	mov dl,sq[esi+5]
	cmp dl,sq[esi+6]
	je da ;return 1
	jmp dif2
	
	dif2:
	mov edx,0
	mov dl,sq[esi+7]
	cmp dl,sq[esi+8]
	je da3
	jmp dif3	
	da3: 
	mov edx,0
	mov dl,sq[esi+8]
	cmp dl,sq[esi+9]
	je da ;return 1
	jmp dif3
	
	dif3:
	mov edx,0
	mov dl,sq[esi+1]
	cmp dl,sq[esi+4]
	je da4
	jmp dif4	
	da4: 
	mov edx,0
	mov dl,sq[esi+4]
	cmp dl,sq[esi+7]
	je da ;return 1
	jmp dif4
	
	dif4:
	mov edx,0
	mov dl,sq[esi+2]
	cmp dl,sq[esi+5]
	je da5
	jmp dif5	
	da5: 
	mov edx,0
	mov dl,sq[esi+5]
	cmp dl,sq[esi+8]
	je da ;return 1
	jmp dif5
	
	dif5:
	mov edx,0
	mov dl,sq[esi+3]
	cmp dl,sq[esi+6]
	je da5
	jmp dif6	
	da6: 
	mov edx,0
	mov dl,sq[esi+6]
	cmp dl,sq[esi+9]
	je da ;return 1
	jmp dif6
	
	
	dif6:
	mov edx,0
	mov dl,sq[esi+1]
	cmp dl,sq[esi+5]
	je da7
	jmp dif7	
	da7: 
	mov edx,0
	mov dl,sq[esi+5]
	cmp dl,sq[esi+9]
	je da ;return 1
	jmp dif7
	
	
	dif7:
	mov edx,0
	mov dl,sq[esi+3]
	cmp dl,sq[esi+5]
	je da8
	jmp dif8	
	da8: 
	mov edx,0
	mov dl,sq[esi+5]
	cmp dl,sq[esi+7]
	je da ;return 1
	jmp dif8
	
	dif8:
	mov ebx,0
	mov bl,validat[esi+1]
	cmp sq[esi+1],bl
	jne doi
	jmp nu
	doi:
	mov ebx,0
	mov bl,validat[esi+2]
	cmp sq[esi+2],bl
	jne trei
	jmp nu
	trei:
	mov ebx,0
	mov bl,validat[esi+3]
	cmp sq[esi+3],bl
	jne patru
	jmp nu
	patru:
	mov ebx,0
	mov bl,validat[esi+4]
	cmp sq[esi+4],bl
	jne cinci
	jmp nu
	cinci:
	mov ebx,0
	mov bl,validat[esi+5]
	cmp sq[esi+5],bl
	jne sase
	jmp nu
	sase:
	mov ebx,0
	mov bl,validat[esi+6]
	cmp sq[esi+6],bl
	jne sapte
	jmp nu
	sapte:
	mov ebx,0
	mov bl,validat[esi+7]
	cmp sq[esi+7],bl
	jne opt
	jmp nu
	opt:
	mov ebx,0
	mov bl,validat[esi+8]
	cmp sq[esi+8],bl
	jne noua
	jmp nu
	noua:
	mov ebx,0
	mov bl,validat[esi+9]
	cmp sq[esi+9],bl
	jne zerou
	jmp nu
	
	;take a lot of care with the tags, all of them are going to be executed
	da:; everything under this tag will be executed --return 1
	mov eax,1
	mov ceva,eax
	mov ESP, EBP
	pop EBP
	ret


	nu:mov eax, -1;;return -1
	mov ceva,eax
	mov ESP, EBP
	pop EBP
	ret
	
	
	zerou: mov eax,0
	mov ceva,eax
	
	
	mov ESP, EBP
	pop EBP
	ret
validare endp





	start:

	
	call validare
	add esp,4
	mov rez,eax
	
	push rez
	push offset format
	call printf
	
	
	push 0
	call exit
	end start