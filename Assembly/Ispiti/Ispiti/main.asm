.386
.model flat, c
.data
	X dd 8
	Y dd 3
	Z dd 12
.code
main2 proc
	mov eax, X
	mov ebx, Y
	mov ecx, Z
	mov esi, -1
	gore:
		inc esi
		mov edi, ebx
		inc edi
		shl eax, 2
		mov edx, 0
		div edi
		xor edx, edx
		mov X, eax

		shr ebx, 1
		mov edi, ecx
		shr edi, 2
		add ebx, edi
		mov Y, ebx
		cmp esi, 99
		je izlaz
		cmp X, ebx
		jb izlaz
	jmp gore
	izlaz:
	ret
main2 endp
end main2