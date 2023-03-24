.386
.model flat, c
public calculate
.code
calculate proc
	push ebp
	mov ebp, esp
	pushfd
	push ebx
		mov ecx, [ebp+8]	;adresa teksta
		mov eax, 0
		petlja:
			inc eax
			mov ebx, ecx
			add ebx, eax
			mov bl, [ebx]
			cmp [ecx], bl	;poredi dva susedna karaktera
		je petlja
	pop ebx
	popfd
	pop ebp
	ret
calculate endp
end