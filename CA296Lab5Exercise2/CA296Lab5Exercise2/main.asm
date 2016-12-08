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
idx			DWORD	0
prev_ans	DWORD	0
prev_num	DWORD	0
cur_ans		DWORD	0
cur_num		DWORD	1
answer		BYTE	"%d! = %d",10,0

.code
	main:nop

		invoke version
		inc cur_ans
		jmp l1

	l0: mov idx,0
		mov eax,cur_num
		mov prev_num,eax
		mov eax, cur_ans
		mov prev_ans,eax
		mov cur_ans,1
		inc cur_num
		
	l1:	inc idx
		mov eax,cur_ans
		mul idx
		mov cur_ans,eax
		mov ebx,cur_num
		cmp idx,ebx
		jl l1
		jmp l2

	l2: cmp edx,0
		je l0

		invoke crt_printf, addr answer, prev_num, prev_ans
		invoke ExitProcess,0

	end main
