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

EXTERNDEF sumArray:near

.data
array		DWORD	10 Dup(0)
N			DWORD	2

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr array,N,100
		invoke writeArray, addr array, N
		push N
		push offset array
		call sumArray

		invoke writeInteger, eax
		invoke ExitProcess,0

	end main
