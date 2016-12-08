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
hex			DWORD	020h
idx			DWORD	0
max			DWORD	80h
nl			DWORD	10,0

.code
	main:nop

		invoke version

	l1: cmp idx,16
		je l2

		inc idx
		invoke crt_printf, addr hex

		inc hex
		cmp hex, 80h
		jl l1

		invoke crt_printf, addr nl
		invoke ExitProcess,0

	l2:	mov idx,0
		invoke crt_printf, addr nl
		jmp l1

	end main
