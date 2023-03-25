.386
.model flat, c
.data
	N dw 6
	Sum dd 0
.code
main proc
	mov bx, 2
	mov ecx, 0
	petlja:
		cmp bx, N
		ja dole
			movzx ebx, bx
			mov eax, ebx
			add eax, ebx
			add eax, ebx
			inc eax				; 3n+1
			mov esi, eax

			mov eax, ebx
			add eax, ebx
			inc eax				; 2n+1
			mov edi, eax

			mov eax, ebx
			mul edi				; edx:eax n(2n+1)
			mul esi				; edx:eax n(2n+1)(3n+1)
			
			mov esi, ebx
			inc esi				; n+1
			div esi				; eax i ostatak edx

			mov esi, eax
			mov eax, ebx
			mov di, 2
			xor edx, edx
			div di				; ax i ostatak dx
			
			cmp dx, 0
			je paran
				sub ecx, esi
				jmp izlaz
			paran:
				add ecx, esi
			izlaz:
				mov Sum, ecx
		inc bx
	jmp petlja
	dole:
	ret
main endp
end main