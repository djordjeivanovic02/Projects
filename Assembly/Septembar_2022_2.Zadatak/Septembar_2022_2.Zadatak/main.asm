.386
.model flat, c
.data
	mat dd 5, 2, 8, 3, 4
		dd 1, 5, 7, 8, 1
		dd 0, 7, 9, 3, 8
		dd 1, 2, 9, 9, 6
		dd 50, 4, 1, 8, 3
	N dd 5
	Rez dd 0
.stack 4096
.code
izracunaj proc
push ebp
mov ebp, esp
pushfd
push eax
push ebx
push ecx
push edx
	mov eax, 0
	mov ebx, [ebp+12]
	mov ecx, [ebp+8]
	dec ecx
	petlja:
		mov edx, [ebx]
		add eax, edx
		add ebx, 4
	loop petlja
	mov [ebp+12], eax
pop edx
pop ecx
pop ebx
pop eax
popfd
pop ebp
	ret 4
izracunaj endp
main proc
	mov esi, 0
	mov ecx, N
	petlja1:
		mov ebx, 0
		mov edx, mat[ebx][esi]			; vrednost prvog elementa vrste
		add ebx, 4
		mov eax, offset mat
		add eax, ebx
		add eax, esi
		push eax
		push N
		call izracunaj
		pop eax
		cmp edx, eax
		jb manji
		mov edi, N
		sub edi, ecx
		mov Rez, edi
		jmp kraj
		manji:
		add esi, N
		add esi, N
		add esi, N
		add esi, N
	loop petlja1
	kraj:
	ret
main endp
end main