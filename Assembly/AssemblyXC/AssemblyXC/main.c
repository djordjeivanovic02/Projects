#include <stdio.h>

extern int stepen2(int osnova, int stepen);

int pomnozi(int prvi, int drugi) {
	_asm {
		mov eax, [ebp+8]
		mov ecx, [ebp+12]
		mul cl
	}
}

void main() {
	int osnova, rezultat;
	short stepen;
	scanf_s("%d", &osnova); 
	scanf_s("%hd", &stepen);
	rezultat = stepen2(osnova, stepen);
	printf("Rezultat je: %d", rezultat);
	rezultat = pomnozi(osnova, stepen);
	printf("Rezultat je: %d", rezultat);
}