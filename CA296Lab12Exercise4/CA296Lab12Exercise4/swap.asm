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

EXTERNDEF swap:near

.data
four		DWORD	4
old_array	DWORD	0
idx1		DWORD	0
idx2		DWORD	0 

.code
swap:
		push ebp
		mov ebp,esp

		mov eax, [ebp+8]
		mov old_array,eax

		mov eax,[ebp+16]
		mul four
		add eax,old_array
		mov idx2,eax

		mov eax,[ebp+12]
		mul four
		add eax,old_array
		mov idx1,eax

	l1:	mov eax, [idx1]
		cmp eax, [idx2]
		jl l2
		jmp finish

	l2: 
		mov ecx,idx2
		mov ecx, [ecx]
		mov edx, idx1
		mov eax, [edx]
		mov [edx], ecx

		mov ecx, idx2
		mov [ecx],eax
		
	
	finish:
		pop ebp
		ret 16

end swap