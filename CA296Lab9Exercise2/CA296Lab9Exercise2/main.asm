;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
count			DWORD	0
i				DWORD	0
amount			DWORD	0

.code
	main:nop

		invoke version
		mov eax, 0
		
	l1:
		mov count,0 
		invoke readInteger
		cmp eax, 0
		jl l2

	l4:
		mov i, esp
		mov ebx, count
		add i, ebx
		mov ecx,i
		cmp [ecx], eax
		je l1
		cmp i, ebp
		je l3
		
		add count, 4
		jmp l4

	l3: 
		inc amount
		push eax
		jmp l1

	l2:
		pop eax
		invoke writeInteger, eax
		dec amount
		cmp amount, 0
		je exit
		jmp l2

	exit:
		invoke ExitProcess,0

	end main
