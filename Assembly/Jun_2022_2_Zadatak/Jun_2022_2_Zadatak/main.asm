.386
.model flat, c
.data
	N dd 7
	mat dd 7 dup(0)
		dd 7 dup(0)
		dd 7 dup(0)
		dd 7 dup(0)
		dd 7 dup(0)
		dd 7 dup(0)
		dd 7 dup(0)
	niz dd 5, 8, 3, 2, 7, 0
.stack
.code
kopiraj proc
	push ebp
	mov ebp, esp
	pushfd
	push eax
	push ebx
	mov ebx, [ebp+12]
	mov eax, [ebp+8]				; adresa elementa niza
	mov eax, [eax]
	mov [ebx], eax				; u matricu upisemo vresnot elementa
	pop ebx
	pop eax
	popfd
	pop ebp
	ret
kopiraj endp
main proc
	mov ebx, 0
	mov ecx, N
	dec ecx
	mov edx, offset niz				; adresa pocetka niza
	petlja1:
		mov esi, 0
		mov edi, 0
		petlja2:
			cmp [edx], dword ptr 0
			jne preskoci
			mov edx, offset niz		; resetujemo niz na pocetak
			preskoci:
			inc edi
			mov eax, offset mat
			add eax, ebx
			add eax, esi
			push eax				; adresa elementa matrice
			push edx				; adresa elementa niza
			call kopiraj
			add esi, N
			add esi, N
			add esi, N
			add esi, N
			add edx, 4
			cmp edi, N
		jb petlja2
		add ebx, 4
	loop petlja1
	ret
main endp
end main