; Preamble

.586
.model flat,stdcall

option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF display:near

.data
i			DWORD	0
msg			BYTE	'%d',10,0

.code
display: 

	l1:
		cmp i, 20
		jge l2
		mov eax, i
		shl eax, 2
		invoke crt_printf, addr msg, eax
		inc i
		jmp l1
		
	l2: ret
	
end display
