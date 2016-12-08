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

EXTERNDEF exchange:near

.data

.code
exchange:
		push ebp
		mov ebp,esp

		mov eax, [ebp+8]
		mov ecx, [eax]

		mov ebx, [ebp+12]
		mov edx, [ebx]

		mov [ebx], ecx
		mov [eax], edx

		pop ebp
		ret 8

end exchange