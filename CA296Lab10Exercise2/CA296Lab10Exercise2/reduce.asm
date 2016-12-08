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

EXTERNDEF reduce:near

.data
i		DWORD		0

.code
reduce:
		push ebp
		mov ebp, esp
		mov eax, [ebp+8]
		pop ebp
		ret 4
		

end reduce