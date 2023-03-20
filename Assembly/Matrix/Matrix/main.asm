.386
.model flat, c
.data
	mat byte 1, 2, 8
		byte 8, 7, 1
		byte 3, 0, 3
		byte 6, 5, 2
	N dd 3
	M dd 4
	rezultat dd ?
.code
main PROC
	
	;obilazak po kolonama

	mov ecx, M
	mov ebx, 0
	mov edx, 0
	PETLJA1:
		mov esi, 0
		PETLJA2:
			add dl, mat[ebx][esi]
			adc dh, 0
			inc esi
			cmp esi, N
		JB PETLJA2
		add ebx, N
	LOOP PETLJA1
	mov rezultat, edx
	ret
main ENDP
END main