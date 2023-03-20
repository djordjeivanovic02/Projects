.386
.model flat, c
.data
	mat word 5, 8, 2, 1
		word 3, 4, 7, 9
		word 1, 0, 3, 8
		word 7, 2, 1, 1
	M dd 4
	rezultat word 4 DUP(0)
.stack 4096
.code
calculate proc
	mov ebp, esp
PUSH ebp
PUSH eax
PUSH ebx
PUSH ecx
PUSH edx
PUSH esi
PUSH edi
	; esi, ebx, ecx ne koristi
	mov eax, [ebp+12]		;adresa matrice
	mov edi, [ebp+8]
	mov edi, [edi]			;vrednost M
	mov edx, [ebp+4]		;adresa rezultata
	mov esi, 0
	mov ecx, edi
	PUSH ebp
	PONOVI1:
		mov ebp, 0
		mov ebx, 0
		PUSH ecx
		mov ecx, edi
		PONOVI2:
			PUSH eax
				add eax, esi
				add eax, ebx
				mov eax, [eax]
				movzx eax, ax
				add ebp, eax
			POP eax
			add ebx, 2
		LOOP PONOVI2
		add edx, 2
		mov [edx], ebp
		POP ecx
		add esi, edi
		add esi, edi
	LOOP PONOVI1
	POP ebp
	sub edx, 6
	mov [ebp+12], edx
POP edi	
POP esi
POP edx
POP ecx
POP ebx
POP eax
POP ebp
	ret 8
calculate endp
main3 proc
	mov eax, OFFSET rezultat
	PUSH OFFSET mat
	PUSH OFFSET M
	PUSH OFFSET rezultat
	call calculate
	POP word ptr rezultat
	ret
main3 endp
end main3