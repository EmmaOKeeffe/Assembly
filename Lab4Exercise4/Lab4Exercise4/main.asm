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
idx			DWORD	0                                                                             
p			DWORD	0
nl1			DWORD	0
patternMsg  BYTE	"Please input pattern",0

.code
	main:nop
		
		invoke version
		invoke readIntegerWithMessage, addr patternMsg
		mov p,eax
		invoke setPattern,p

	l0:	mov nl1,0
		mov eax,idx
		cmp eax,32
		inc idx
		je l2

	l1: invoke readRow, nl1
		shl eax,1
		invoke writeRow,nl1,eax
		inc nl1
		mov eax,nl1
		cmp eax,33
		jl l1
		invoke Sleep,500
		je l0

	l2:	invoke ExitProcess,0

	end main