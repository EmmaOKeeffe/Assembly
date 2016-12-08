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
idx			DWORD	0

.code
	main:nop

		invoke version
		invoke readInteger
		mov x,eax
		cmp eax,0
		jle l2

	l1:	invoke writeInteger,idx
		mov eax,x
		inc idx
		cmp eax,idx
		je l2
		
		jmp l1

	l2:	invoke ExitProcess,0

	end main