.386
.model flat, c

PUBLIC procedura

.code
procedura PROC
	push ebp
	mov ebp, esp
	pushfd
	push ebx
	push ecx
	push edx
	push edi
	push esi

	mov ebx, [ebp+12]		; adresa vrste matrice
	mov cx, [ebp+8]			; M
	mov edi, [ebp+16]		; rezultantni niz
	mov eax, 0				; broj elemenata rezultujuceg niza

	petlja:
		cmp word ptr [ebx], 0
		jnl preskoci
			mov dx, [ebx]
			mov [edi+eax*2], dx
			inc eax
		preskoci:
		add ebx, 2
	loop petlja

	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	popfd
	pop ebp
	ret
procedura ENDP
end