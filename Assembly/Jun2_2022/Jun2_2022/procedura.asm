.386
.model flat, c
.data
	matrica dd 5, 4, 2, 8
			dd 3, 7, 4, 0
			dd 1, 2, 9, 7
			dd 0, 3, 9, 2
	N dd 4
.stack 4096
.code
uporedi proc
	push ebp
	mov ebp, esp
	push ebx
		mov eax, [ebp+12]	;adresa prvog elementa
		mov ebx, [ebp+8]	;adresa drugog elementa
		cmp eax, ebx
		ja prviveci
		jb drugiveci
		je jednaki
		prviveci:
			mov eax, 2
			jmp kraj
		drugiveci:
			mov eax, 1
			jmp kraj
		jednaki:
			mov eax, 0
	kraj:
	pop ebx
	pop ebp
	ret
uporedi endp
main proc
	mov esi, 0
	mov ecx, N
	petlja1:
		mov ebx, 0
		mov edi, N
		dec edi
		petlja2:	
			mov edx, ebx
			add edx, N
			add edx, N
			add edx, N
			add edx, N
			push matrica[esi][ebx]	;adresa prvog elementa
			push matrica[esi][edx]		;adresa sledeceg elementa
			call uporedi

			;eax je rezultat
			cmp eax, 1
			je zameni
			jmp preskoci
			zameni:
				mov eax, matrica[esi][ebx]
				xchg matrica[esi][edx], eax
				xchg matrica[esi][ebx], eax
			preskoci:
			add ebx, N
			add ebx, N
			add ebx, N
			add ebx, N
			dec edi
			cmp edi, 0
		ja petlja2
		add esi, N
	loop petlja1
	ret
main endp
end main