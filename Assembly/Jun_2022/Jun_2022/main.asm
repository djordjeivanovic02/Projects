.386
.model flat,c
.data
	X dd 10
	N dd 8
	p db 3
	suma dd ?
.code
main proc
	mov ebx, 0	;suma
	mov edi, 0	;k
	mov ch, p
	petlja:
		inc edi
		mov esi, edi	;esi<=k
		mov dl, 32
		sub dl, p
		mov cl, dl		;pomeraj
		shl esi, cl
		shr esi, cl
		mov eax, X
		add eax, esi	;gornji deo

		mov cl, ch		;cl<=p
		mov esi, edi	;esi<=k
		shr esi, cl
		shl esi, cl
		mov edx, X
		sub edx, esi	;donji deo
		
		mov esi, edx
		mov edx, 0
		div esi			;edx:eax/esi

		add ebx, eax	;ebx=>suma
		cmp edi, N
	jb petlja
	mov suma, ebx
	ret
main endp
end main