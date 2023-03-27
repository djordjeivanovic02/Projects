.386
.model flat, c
.data
	X dd 0ffffffffh
	N dw 0ffffh
	p db 5
	Sum dd 0
.code
main proc
	mov bx, 4
	petlja:
		mov ax, bx
		mov dx, 0ffffh
		mov cl, p
		shl dx, cl
		xor ax, dx
		shl ax, 1
		mov cx, ax
		movzx ecx, cx
		mov eax, X
		add eax, ecx
		mov esi, eax			; delilac

		mov ax, bx
		mov cl, 16
		sub cl, p
		shl ax, cl
		shr ax, cl
		shl ax, 1
		mov cx, ax
		movzx ecx, cx
		mov eax, X
		sub eax, ecx			; deljenik

		mov edx, 0
		div esi					; eax ceo deo, edx ostatak
		add Sum, eax

		inc bx
		cmp bx, N
	jb petlja
	ret
main endp
end main