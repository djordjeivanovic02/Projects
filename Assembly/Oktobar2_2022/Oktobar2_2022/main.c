#include <stdio.h>
#include <string.h>

extern int calculate(char* text);

void main() {
	char text[100];
	char rezultat[150];
	printf("Unesite tekst: ");
	gets_s(text, 100);
	int x = 0, br=0;
	int i = 0;
	while(i < strlen(text)){
;		char ch = text[i];
		x = calculate(text + i);
		if (x > 2) {
			rezultat[br++] = 48+x;
			rezultat[br++] = ch;
		}
		else {
			for (int j = 0; j < x; j++) {
				rezultat[br++] = ch;
			}
		}
		i += x;
	}

	rezultat[br] = '\0';
	printf(rezultat);
}