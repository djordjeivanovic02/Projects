.386
.model flat, c
public stepen2
.code
stepen2 PROC
push ebp
mov ebp, esp
pushf
push ecx
mov eax, [ebp+8]
mov ecx, [ebp+12]
shl eax, cl
pop ecx
popf
pop ebp
ret
stepen2 ENDP
END