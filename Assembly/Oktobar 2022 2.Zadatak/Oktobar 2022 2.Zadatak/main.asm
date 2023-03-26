.386
.model flat, c
.data
	mat dd 5, 2, 8, 3, 1
		dd 1, 4, 7, 8, 15
		dd 0, 7, 9, 3, 8
		dd 1, 2, 9, 9, 6
		dd 5, 4, 1, 8, 8
	N dd 5
	Rez dd 0
.stack 4096
.code
procedura proc
push ebp
mov ebp, esp
pushfd
push eax
push ebx
push ecx
	mov eax, 0
	mov ebx, [ebp+12]
	mov ecx, [ebp+8]
	petlja:
		add eax, [ebx]
		add ebx, 4
	loop petlja
	mov [ebp+12], eax
pop ecx
pop ebx
pop eax
popfd
pop ebp
	ret 4
procedura endp
main proc
	mov esi, 0
	mov ecx, N
	mov ebx, N
	mov eax, offset mat
	push eax
	push N
	call procedura
	pop eax
	mov edi, eax
	add esi, N
	add esi, N
	add esi, N
	add esi, N
	dec ecx
	petlja2:
		mov ebx, N
		mov eax, offset mat
		add eax, esi
		push eax
		push N
		call procedura
		pop eax
		cmp eax, edi
		jae preskoci
		sub ebx, ecx
		mov Rez, ebx
		mov edi, eax
		preskoci:
		add esi, N
		add esi, N
		add esi, N
		add esi,N
	loop petlja2
	ret
main endp
end main