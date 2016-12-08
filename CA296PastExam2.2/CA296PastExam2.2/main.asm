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

EXTERNDEF mapArray:near

.data
array1			DWORD	10 Dup(0)
array2			DWORD	10 Dup(0)
N				DWORD	10

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr array1, N, 50
		invoke writeArray, addr array1, N
		invoke writeArray, addr array2, N
		push N
		push offset array2
		push offset array1
		call mapArray
		invoke writeArray, addr array1, N
		invoke writeArray, addr array2, N

		invoke ExitProcess,0

	end main
