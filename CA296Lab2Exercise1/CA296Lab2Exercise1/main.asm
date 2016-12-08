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
caption     BYTE	'Welcome to CA296',0
max_msg		BYTE	'%d',10,0

.code
	main:nop

		invoke version
		invoke readInteger
		add x,eax
		invoke readInteger
		cmp x,eax
		jg l1
		jl l2

	l1:	invoke crt_printf,addr max_msg,x
		invoke ExitProcess,0

	l2:	invoke crt_printf,addr max_msg,eax
		invoke ExitProcess,0
			

	end main
