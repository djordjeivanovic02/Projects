.386
.model flat,c
.data
	X word 0ffffh
	Y word 20
	Z word 5
.code
main proc
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov ax, X
	mov bx, Y
	mov cx, Z
	gore:
		mov dx, bx
		dec dx		; Y-1
		mul dx		; dx:ax
		add ax, 10
		movzx edx, dx
		mov edi, edx	; visi deo u edi
		movzx eax, ax
		mov esi, eax	; nizi deo

		add cx, bx
		adc ecx, 0
		dec ecx
		mov eax, ecx
		mul eax			; edx:eax
		mov edx, edi

		mov edi, eax
		mov eax, esi

		div edi
		mov edx, 0; dx:ax
		mov X, ax


		shr bx, 1
		inc bx
		mov Y, bx

		cmp X, 0
		je izlaz
		cmp Y, 1
		jbe izlaz
	jmp gore
	izlaz:
	ret
main endp
end main