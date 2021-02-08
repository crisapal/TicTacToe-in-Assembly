.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf:proc
extern scanf:proc
public start

.data

;;;;;;;;;;;;;;;;;main data and validation info

sq db "o123456789",0
validat DB "o123456789",0
ceva dd 0 ;;;;;;;;;;;;;; local var for function call
rez dd 0 ;;;;;;;;;;;validation result
formatul db "%c",0

;;;;;;;;;;;board game messages
msg1 DB "   Let's play TicTacToe!",0,10
msg2 DB 10,"Player1  (X)  - Player2  (O) ",0,10
msg3 DB 10,9,"X starts!",0
msg4 DB 10,9,"     |     |     ",0,10
msg5 DB 10,9,"_____|_____|_____",0,10
format DB 10,9,"  %c  |  %c  |  %c ",0
endl DB 10,10,10," ",0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;game variables - players switch
player_turn db " Player %d, press a digit:",0
choice dd 0
player dd 1
invalid db 10,9,"Wrong move!",10,10,10,10,0
mark db 'Z'
win db "Player %d won the game!",0
lose db 9,"Equality",0
formatuld db "%d",0

.code

;;;;;;;;;;;;;;;;;;;;;;;; Validation Func for each square
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
	je da6
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
	
	;take a lot of care with the tags, all of them are executing
	da: ; everything under this one will be executed--return 1
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;; board game




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
board MACRO sq

mov EAX,0
lea ESI, sq
add ESI,3



push offset msg1
call printf
add ESP, 4

push offset msg2
call printf
add ESP, 4


push offset msg3
call printf
add ESP, 4

push offset msg4
call printf
add ESP, 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
push offset format
call printf
add ESP, 16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
push offset msg5
call printf
add ESP, 4


push offset msg4
call printf
add ESP, 4


;;;;;;;;;;;;;;;;;;;;;;;;;
add ESI, 5
push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
push offset format
call printf
add ESP, 16
;;;;;;;;;;;;;;;;;;;;;;;;;


push offset msg5
call printf
add ESP, 4

push offset msg4
call printf
add ESP, 4

add ESI,5

push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
sub ESI,1
push dword ptr[esi]
push offset format
call printf
add ESP, 16

push offset msg4
call printf
add ESP, 4

push offset endl
call printf 
add ESP,4



endm


;;;;;;;;;;;;;;;;;; int main - "Like" =DDD

	start:
	
	
	    mov ecx,rez	
		dowhile:         ; do while like in C
		
		board sq ; calling the board to load
			
		and player,1 ; choosing who's turn is now
		cmp player,0
		je par
		mov player,1
		jmp impar
		par: mov player,2
	
		impar:
		push player
		push offset player_turn
		call printf 
		add esp,8
		
		push offset choice ; == &choice in C
		push offset formatuld
		call scanf
		add ESP, 8
		
		;;;;;marking the square with x/o according to the player's move
	
		mov ebx,0
		mov esi,0
		lea ESI, sq
		
		
		cmp player,1
		je este
		mov bl, 'O'
		jmp nu_este
		este:
		mov bl, 'X'
		nu_este:
		
		cmp choice,1
		je este1
		jmp nueste1
		
		este1:
		mov al,'1'
		cmp [esi+1],al
		je este11
		jmp nueste1
		este11: mov [esi+1],bl
		jmp final
		
		nueste1:
		cmp choice,2
		je este2
		jmp nueste2
		
		este2:
		mov al,'2'
		cmp [esi+2],al
		je este22
		jmp nueste2
		este22: mov [esi+2],bl
		jmp final
		
		nueste2:
		cmp choice,3
		je este3
		jmp nueste3
		este3:
		mov al,'3'
		cmp [esi+3],al
		je este33
		jmp nueste3
		este33: mov [esi+3],bl
		jmp final
		
		nueste3:
		cmp choice,4
		je este4
		jmp nueste4
		
		este4:
		mov al,'4'
		cmp [esi+4],al
		je este44
		jmp nueste4
		este44: mov [esi+4],bl
		jmp final
		
		nueste4:
		cmp choice,5
		je este5
		jmp nueste5
		este5:
		mov al,'5'
		cmp [esi+5],al
		je este55
		jmp nueste5
		este55: mov [esi+5],bl
		jmp final
		
		nueste5:
		cmp choice,6
		je este6
		jmp nueste6
		este6:
		mov al,'6'
		cmp [esi+6],al
		je este66
		jmp nueste6
		este66:
		mov [esi+6],bl
		jmp final
		
		
		nueste6:
		cmp choice,7
		je este7
		jmp nueste7
		este7:
		mov al,'7'
		cmp [esi+7],al
		je este77
		jmp nueste7
		este77: mov [esi+7],bl
		jmp final
		
			nueste7:
		cmp choice,8
		je este8
		jmp nueste8
		este8:
		mov al,'8'
		cmp [esi+8],al
		je este88
		jmp nueste8
		este88: mov [esi+8],bl
		jmp final
			
			nueste8:
		cmp choice,9
		je este9
		jmp nueste9
		este9:
		mov al,'9'
		cmp [esi+9],al
		je este99
		jmp nueste9
		este99: mov [esi+9],bl
		jmp final
		nueste9:
		
		push offset invalid
		call printf
		add esp,4
		sub player,1
		final:
		
		push offset endl
		call printf 
		add esp,4
			
		push offset endl
		call printf 
		add esp,4

		push ceva
		call validare
		add esp,4
		mov rez,eax
		add player,1
		
		mov ecx,rez
        cmp ecx,-1    ; Check wether cx is 1
        je dowhile   ; End loop if equal
	
		board sq
		
		cmp rez,1
		je win
		jmp lose
		win:
		sub player,1
		push player
		push offset win
		call printf 
		add esp,8
		jmp win1
		
		lose:
		
		push offset lose
		call printf
		add esp,4
	
		win1:
	
	
	push 0
	call exit
	end start