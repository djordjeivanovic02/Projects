#include <stdio.h>

int prebroji(short* niz, short dim, short n) {
	_asm {
		mov edx, 1
		mov cx, n
		shl edx, cl
		sub edx, 1; maska

		; mov cx, dim
		mov cx, dim
		mov esi, 0
		mov ebx, 0
		petlja:
			mov eax, niz[esi]		; element niza
			and eax, edx
			cmp eax, edx
			jne preskoci
			inc ebx
			preskoci:
			add esi, 2
		loop petlja
		mov eax, ebx
	}
}

void main() {
	short niz[100] = { 79, 5, 47, 29, 15 };
	short dim = 5;
	short n = 4;
	short rezultat = 0;

	rezultat = prebroji(niz, dim, n);
	printf("%d", rezultat);
}