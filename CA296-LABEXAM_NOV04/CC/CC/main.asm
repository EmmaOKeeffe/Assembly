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
pat			DWORD	0
x			DWORD	31
y			DWORD	0
msg			BYTE	'Please input a pattern number',0

.code
	main:nop
		invoke readIntegerWithMessage,addr msg
		invoke setPattern,eax

	l1:	cmp x,-1
		jl exit
		invoke readRow,y
		mov ebx,1
		mov ecx,x
		shl ebx,CL
		not ebx
		and eax,ebx
		invoke writeRow,y,eax
		inc y
		dec x
		invoke Sleep,200
		jmp l1

	exit:	
		invoke ExitProcess,0

	end main
