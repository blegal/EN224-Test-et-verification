#include "stdio.h"
#include "stdlib.h"
#include "math.h"

void store_in_binary(FILE* f, int n)
{
	int i;
	for(i = 0; i < 16; i += 1)
	{
		int bit = (n >> (15 - i)) & 0x01;
		fprintf(f, "%d", bit);
	}
	fprintf(f, "\n");
}

int PGCD(int A, int B)
{
	while( A != B )
	{
		if( A > B ) A = A - B;
		else        B = B - A;
	}
	return A;
}

//
// Generation des valeurs dans l'intervalle [1, 255]
// Sinon cela va etre compliqué en VHDL !
//
int RANDV( )
{
	return (rand() % 254) + 1;
}

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");

	FILE *fA = fopen("data_a.txt", "w");
	if (fA == NULL)
	{
		printf("Impossible d'ouvrir le fichier data_a.txt en mode écriture\n");
		exit(1);
	}

	FILE *fB = fopen("data_b.txt", "w");
	if (fB == NULL)
	{
		printf("Impossible d'ouvrir le fichier data_a.txt en mode écriture\n");
		exit(1);
	}

	FILE *fC = fopen("data_c.txt", "w");
	if (fC == NULL)
	{
		printf("Impossible d'ouvrir le fichier data_a.txt en mode écriture\n");
		exit(1);
	}

	int i;
	for(i = 0; i < 16; i += 1)
	{
		int A = RANDV();
		int B = RANDV();
		int C = PGCD(A, B);
		printf("PGDC(%5d, %5d) = %5d\n", A, B, C);

		store_in_binary(fA, A);
		store_in_binary(fB, B);
		store_in_binary(fC, C);
	}

	fclose( fA );
	fclose( fB );
	fclose( fC );

	printf("(II) End of PGCD program\n");
  return 0;
}
