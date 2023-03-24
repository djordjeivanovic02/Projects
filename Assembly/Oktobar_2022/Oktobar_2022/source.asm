.386
.model flat, c
.data
	N dd 5
	Suma dd ?
.code
main proc
	mov ebx, N
	mov edi, 1
	mov esi, 0

	gore:
		cmp edi, N
		ja dole
		mov eax, ebx
		mul edi
		xor edx, 0
		mov ecx, edi
		dec ecx
		shr eax, cl
		add esi, eax
		xor edx, 0
		inc edi
		jmp gore
	dole:
	mov Suma, esi
main endp
end main