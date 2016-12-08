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

EXTERNDEF counts:near

.data
list		DWORD	0
new_array	DWORD	3 Dup(0)
idx			DWORD	0
other		DWORD	0
four		DWORD	4

.code
counts:
		push ebp
		mov ebp, esp
		mov eax,[ebp+12]
		mul four
		mov other,eax

		mov idx,0
		mov eax,[ebp+8]
		mov list,eax

	l1:	mov eax,idx
		add eax, list
		mov ebx,[eax]
		cmp ebx,0
		jl negative
		jg positive
		jmp zero

	negative:
		add [new_array],1
		jmp l2

	positive:
		add [new_array + 8],1
		jmp l2

	zero:
		add [new_array + 4], 1
		jmp l2

	l2:	add idx,4
		mov ecx,other
		cmp idx,ecx
		jl l1


		mov eax, offset new_array
		pop ebp
		ret	8

end counts