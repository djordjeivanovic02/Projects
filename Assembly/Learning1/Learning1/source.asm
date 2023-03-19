.386
.model flat,c
.data
	niz db 6, 4, 5, 2, 3, 5, 2
	n db 7
	result dword ?
.stack 4096
.code
suma PROC
mov ebp, esp
PUSH ebp
PUSH eax
PUSH ebx
PUSH ecx
PUSH edx
PUSH esi
PUSH edi
	mov esi, [ebp+12]
	mov ebx, [ebp+8]
	mov ecx, [ebx]
	mov ebx, 0
	PONOVI:
		movzx eax, byte ptr [esi]
		add ebx, eax
		inc esi
	LOOP PONOVI
	mov [ebp+12], ebx
POP edi
POP esi
POP edx
POP ecx
POP ebx
POP eax
POP ebp
	ret 8
suma ENDP
main PROC
	PUSH OFFSET niz
	PUSH OFFSET n
	PUSH OFFSET result
	call suma
	POP result
	ret
main ENDP
END main