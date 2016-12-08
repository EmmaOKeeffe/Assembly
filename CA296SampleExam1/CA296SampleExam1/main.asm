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
i			DWORD	0
N			DWORD	0
count		DWORD	0


.code
	main:nop

		invoke version
		invoke readInteger
		mov N,eax
		invoke setPattern,N
		mov i,0

	outerLoop:
		cmp i,32
		jae endOuterLoop

		invoke readRow,i

	innerLoop:
		cmp eax,0
		je endInnerLoop
		shr eax,1
		adc count,0

		jmp innerLoop

	endInnerLoop:
		inc i
		jmp outerLoop

	endOuterLoop:
		invoke writeInteger,count
		invoke ExitProcess,0

	end main
