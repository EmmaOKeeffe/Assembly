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
num			DWORD	0
ans			DWORD	0
idx			DWORD	1
patternMsg  BYTE	"Please input an integer",0
answer		BYTE	"%d! = %d",10,0

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr patternMsg
		mov num,eax
		cmp eax, 0
		je l2
		inc ans

	l1: mov eax,ans
		mul idx
		mov ans,eax
		inc idx
		mov ebx,num
		cmp idx,ebx
		jle l1

	l2:	invoke crt_printf,addr answer,num,ans
		invoke ExitProcess,0

	end main
