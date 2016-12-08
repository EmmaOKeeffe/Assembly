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
zero_msg	BYTE	'N is zero',10,0
pos_msg		BYTE	'N is positive',10,0
neg_msg		BYTE	'N is negative',10,0

.code
	main:nop

		invoke version
		invoke readInteger
		add x,eax
		cmp eax,0
		je l1
		jl l2
		jg l3

	l1: invoke crt_printf,addr zero_msg
		invoke ExitProcess,0

	l2: invoke crt_printf,addr neg_msg
		invoke ExitProcess,0

	l3: invoke crt_printf,addr pos_msg
		invoke ExitProcess,0

	end main
