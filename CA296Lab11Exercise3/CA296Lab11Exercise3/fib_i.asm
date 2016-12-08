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

EXTERNDEF fib_i:near

.data
n			DWORD	0
x			DWORD	0
y			DWORD	1
idx			DWORD	0

.code
fib_i:
		push ebp
		mov ebp,esp
		mov eax,[ebp+8]
		mov n,eax

	l1:	inc idx
		mov ebx,y
		add x,ebx
		mov eax,x
		mov y,eax
		mov x,ebx
		mov ecx,n
		cmp ecx,idx
		ja l1

	l2: mov eax,y
		pop ebp
		ret 4

end fib_i