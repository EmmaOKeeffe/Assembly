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
y			DWORD	0
z			DWORD	0
message     BYTE	'%d + %d = %d',0
bmessage	BYTE	'Press OK to continue'
caption     BYTE	'Welcome to CA296',0

.code
	main:nop

		invoke version
		invoke readInteger
		add x,eax
		add z,eax
		invoke readInteger
		add y,eax
		add z,eax
		invoke crt_printf, ADDR message, x, y, z

		invoke MessageBox,0,ADDR bmessage,ADDR caption,MB_OK


		invoke ExitProcess,0

	end main
