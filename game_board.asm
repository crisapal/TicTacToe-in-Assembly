.386
.model flat, stdcall

includelib msvcrt.lib
extern printf: proc
extern exit: proc
extern scanf:proc

public start

.data
game DB "o123456789",0
msg1 DB "   Let's play TicTacToe!",0,10
msg2 DB 10,"Player 1  (X)  - Player 2  (O) ",0,10
msg3 DB 10,9,"X starts!",0
msg4 DB 10,9,"     |     |     ",0,10
msg5 DB 10,9,"_____|_____|_____",0,10
format DB 10,9,"  %c  |  %c  |  %c ",0
endl DB 10,10,10,10," ",0




player DB 1
i DB 0
option DB 0
mark DB 0




.code

board MACRO game

mov EAX,0
lea ESI, game
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





;;;;;; int main in C/C++
start:
board game
;;;;syscall to refresh my game- not available in ASM
;lea ESI,game
;;push dword ptr[esi+2]







push 0
	call exit
end start