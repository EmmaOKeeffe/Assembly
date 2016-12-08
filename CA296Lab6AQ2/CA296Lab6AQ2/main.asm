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
array		DWORD	0
N			DWORD	0
idx			DWORD	0
total		DWORD	0
other		DWORD	0
four		DWORD	4

.code
	main:nop

		invoke version
		invoke readInteger
		mov N,eax
		invoke allocate,N
		mov array,eax
		invoke writeArray, addr array, N
		mov eax,N
		mul four
		mov other,eax
	
		mov idx,0

	l1:	mov eax,idx
		mov ebx,array[eax]
		add total,ebx
		add idx,4
		mov ecx,other
		cmp idx,ecx
		jl l1

	finish:
		invoke writeInteger,total
		invoke ExitProcess,0

	end main
