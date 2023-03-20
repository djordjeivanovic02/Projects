.386
.model flat, c
.data
	;matrica definisana po vrstama
	mat byte 5, 8, 2, 1
		byte 3, 4, 7, 9
		byte 1, 0, 3, 8
		byte 7, 2, 1, 1
	M dd 4
	rezultat dd ?
.code
main2 PROC
	;pretraga po kolonama
	mov ecx, OFFSET mat
	mov esi, 0
	PONOVI1:
		mov edx, 0
		mov eax, esi
		mov ebx, M
		mul bl
		movzx eax, al

		mov edx, 0
		mov edx, OFFSET mat
		add edx, esi
		add edx, eax

		mov ebx, M
		dec ebx
		sub ebx, esi
		mov eax, ebx
		mov ebx, M
		mul bl
		movzx eax, al
		mov edi, eax

		mov ecx, 0
		mov ecx, OFFSET mat
		add ecx, esi
		add ecx, edi

		mov ebx, 0
		mov bl, byte ptr [edx]
		XCHG [ecx], bl
		XCHG bl, [edx]

		inc esi
		cmp esi, M
	JB PONOVI1
	mov rezultat, edx
	ret
main2 ENDP
END main2