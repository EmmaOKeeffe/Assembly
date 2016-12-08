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
x			DWORD	0
y			DWORD	1
n			DWORD	0
idx			DWORD	0
solution	BYTE	'fib(%d) = %d',10,0


.code
	main:nop

		invoke version
		invoke readInteger
		mov n,eax
		cmp eax,0
		jl l2
		jmp l1

	l3:	invoke readInteger
		mov n,eax
		cmp eax,0
		jl l2
		jmp l1



	l1:	inc idx
		mov ebx,y
		add x,ebx
		mov eax,x
		mov y,eax
		mov x,ebx
		mov ecx,n
		cmp ecx,idx
		ja l1
		cmp ecx,idx
		je l4

	l4:	invoke crt_printf, addr solution, n, y
		jmp l3

	l2: invoke ExitProcess,0
		

	end main
