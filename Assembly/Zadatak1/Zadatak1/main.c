#include <stdio.h>

extern short procedura(short m, short* niz, short* rezultat);

void main() {
	short matrica[][4] = {
		{1, -5, -7, -8},
		{9, 4, -2, -7},
		{1, 0, 0, -8},
		{-6, -7, -8, -3},
		{0, -9, 3, 4}
	};
	short M = 4, N = 5;
	short niz[100];
	short novaDimenzija;

	short rezultujuciNiz[100];
	for (int i = 0; i < N; i++) {
		novaDimenzija = procedura(M, matrica[i], niz);
		for (int j = 0; j < novaDimenzija; j++)
			printf("%d ", niz[j]);
		printf("\n");
	}
}