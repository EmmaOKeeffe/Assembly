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
array		DWORD	10 Dup(0)
max			DWORD	0
idx			DWORD	0

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr array,10,100
		invoke writeArray, addr array, 10
		mov idx,0

		
	l1:	mov eax,idx
		mov ebx,array[eax]
		cmp ebx,max
		jg l2
		jmp l3

	l2:	mov max,ebx
		jmp l3
		
	l3: add idx,4
		cmp idx,40
		jge finish
		jmp l1

	finish:
		invoke writeInteger,max
		invoke ExitProcess,0

	end main
