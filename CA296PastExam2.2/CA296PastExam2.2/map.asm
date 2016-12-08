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


EXTERNDEF mapArray:near

.data
array1		DWORD	0
array2		DWORD	0
lengthy		DWORD	0
i			DWORD	0

.code
	mapArray:
		push ebp
		mov ebp,esp

		mov eax,[ebp+16]
		mov lengthy,eax

		mov eax,[ebp+12]
		mov array2,eax

		mov eax,[ebp+8]
		mov array1,eax


		;while i < length
	l1:	mov eax,i
		shl eax,2
		add eax,[array1]
		mov ebx,[eax]

		mov eax,i
		shl eax,2
		add eax,[array2]
		mov ecx,eax
		mov edx,[ecx]
		invoke convert, ebx

		;swap
		mov [ecx],eax

		;i++
		inc i

		;compare i to length
		mov eax,lengthy
		cmp i,eax
		jl l1

		pop ebp
		ret 12

	end