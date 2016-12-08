; Preamble
;

.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF sumArray:near

.data
list		DWORD	0
idx			DWORD	0
total		DWORD	0
other		DWORD	0
four		DWORD	4

.code
sumArray:

		push ebp
		mov ebp,esp
		mov eax,[ebp+12]
		mul four
		mov other,eax
	
		mov idx,0
		mov eax,[ebp+8]
		mov list,eax

	l1:	mov eax,idx
		add eax, list
		mov ebx,[eax]
		invoke map,ebx
		add total,eax
		add idx,4
		mov ecx,other
		cmp idx,ecx
		jl l1

	
		mov eax,total
		pop ebp
		ret	8

end sumArray