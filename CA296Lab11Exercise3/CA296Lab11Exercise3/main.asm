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

EXTERNDEF fib_i:near

.data
z			DWORD	0
msg		    BYTE	'Please Input an Integer',0
ans			BYTE	'fib(%d) = %d',10,0

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr msg
		mov z,eax
		push eax
		call fib_i

		invoke crt_printf, addr ans, z, eax
		invoke ExitProcess,0

	end main
