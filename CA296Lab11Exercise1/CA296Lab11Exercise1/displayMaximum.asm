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

EXTERNDEF displayMaximum:near

.data
first		DWORD		0

.code
displayMaximum:

		mov eax,0
		mov ebx,0
	
		push ebp
		mov ebp,esp
		mov eax,[ebp+12]
		mov first,eax
		mov ebx,[ebp+8]
		cmp first,ebx
		jle l1
		mov eax,first
		jmp exit

	l1:	
		mov eax,ebx
		jmp exit

	exit:
		pop ebp
		ret 8
	
end displayMaximum	
		