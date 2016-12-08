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

EXTERNDEF displayMaximum:near

.data
x			DWORD	0
y			DWORD	0
msg			BYTE	"Please Input an Integer",0

.code
	main:nop

		invoke version


		invoke readIntegerWithMessage, addr msg
		mov x,eax
		invoke readIntegerWithMessage, addr msg
		mov y,eax
		
		push eax
		mov eax, x
		push eax
		call displayMaximum

		invoke writeInteger, eax

		invoke ExitProcess,0

	end main
