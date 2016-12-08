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

EXTERNDEF swap:near

.data
array		DWORD	10 Dup(0)
idx1		DWORD	0
idx2		DWORD	1
N			DWORD	5

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr array,N,100
		invoke writeArray, addr array, N
		push N
		push idx2
		push idx1
		push offset array
		call swap

		invoke writeArray, addr array, N
		invoke ExitProcess,0

	end main
