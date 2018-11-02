//# Float2Bin.cpp -- A program for convert floatting point value to their
//#                  IEEE-754 binary representation and vice versa. This
//#  program works in command line mode or using files containing the values
//#  to convert depending of your needs.
//#
//#
//#
//# Copyright (C) 2005 Bertrand LE GAL, FRANCE.
//#
//# This program is free software; you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation; either version 2 of the License, or
//# (at your option) any later version.
//#
//# This program is distributed in the hope that it will be useful, but
//# WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//# General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program; if not, write to the Free Software
//# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//#
//# Correspondence concerning this software should be addressed as follows:
//# Bertrand LE GAL
//# mailto : bertrand.legal@free.fr

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>

bool getBitValue( float n, int bit ){
	int   *q = (int*)&n;
	int MASK = (0x0001) << bit;
	bool r = ((*q & MASK) != 0);
	return r;
}

float setBitValue( float n, int bit, char value){
	int   *q = (int*)&n;
	if( value == '1' ){
		int MASK = (0x0001) << bit;
		*q = *q + MASK;
	}
	return n;
}

void Convert2Binary(float n, char *text){
	for(int i=31; i>=0; i--){
		text[31-i] = '0' + (char)getBitValue(n, i);
	}
	text[32] = 0;
}

float Convert2Float(char *text ){
	float n = 0;

	if( text[32] == 10 ) text[32] = 0;
	if( text[32] == 13 ) text[32] = 0;

	if( strlen(text) != 32 ){
		printf("  ERROR : bad length (%d bits) for a IEE-754 number (32 bits)\n", strlen(text));
		for(int j=0; j<(int)strlen(text); j++){
			printf("%d - ", (int)text[j]);
		} printf("END\n");
	}
	for(int i=31; i>=0; i--){
		n = setBitValue(n, 31-i, text[i]);
	}
	return n;
}

#ifndef __OPTIMIZE__
  #define OPTIMISATION false
#else
  #define OPTIMISATION true
#endif

int main( int argc, char **argv ){
	char  number[64];
	FILE  *file;

	if( OPTIMISATION == true ){
		printf("WARNING THIS PROGRAM WAS COMPILED USING COMPILER\n");
		printf("OPTIMISATIONS, THIS CAN PRODUCE CORRUPTED RESULTS IN\n");
		printf("BINARY TO FLOAT CONVERSION !\n");
	}

	if( (argc < 3) || (argc > 4) ){
		printf("Help :\n");
		printf("  ./Float2Bin -[float/bin] NumberToConvert\n");
		printf("  ./Float2Bin -file -[float/bin] FileName\n");
		return -1;
	}

	if( argc == 3 ){
		if( strcmp(argv[1], "-bin") == 0 ){
			strcpy(number, argv[2]);
			printf("Converting a binary number to a float :\n");
			float v = Convert2Float( number );
			printf("  IEEE 754 Binary Number   = %s\n", number);
			printf("  Signe of the number      = %c\n", number[0]);
			printf("  Exposant of the number   = ");
			for(int i=1;i<=8;i++){ printf("%c", number[i]); }
			printf("\n");
			printf("  Mantisse of the number   = ");
			for(int i=9;i<=31;i++){ printf("%c", number[i]); }
			printf("\n");
			printf("  -----------------------------\n");
			printf("  Float Number after conv. = %f\n", v);

		}else if( strcmp(argv[1], "-float") == 0 ){
			printf("Converting a float number to a binary representation :\n");
			Convert2Binary( atof(argv[2]), number);
			printf("  Number to convert      = %f\n", atof(argv[2]));
			printf("  Signe of the number    = %c\n", number[0]);
			printf("  Exposant of the number = ");
			for(int i=1;i<=8;i++){ printf("%c", number[i]); }
			printf("\n");
			printf("  Mantisse of the number = ");
			for(int i=9;i<=31;i++){ printf("%c", number[i]); }
			printf("\n");
			printf("  -----------------------------\n");
			printf("  IEEE 754 Binary Number = %s\n", number);

		}else{
			printf("Command not bind : %s\n", argv[1]);
		}
	}

	if( argc == 3 ){
			return 1;
	}

	file = fopen( argv[3], "r");
	if( file == NULL ){
    	printf("  ERROR : problem opening file !\n");
  	}

	char tampon[128000];
	char* lecture;
	do{ 
    	lecture = fgets(tampon, 128000, file);
    	if( lecture != NULL ){
    		
    		if( strcmp(argv[2], "-float") == 0 ){
	    		Convert2Binary( atof(tampon), number);
    			printf("%s\n", number);
    			
    		}else if( strcmp(argv[2], "-bin") == 0 ){
    			tampon[strlen(tampon)-1] = 0;
	    		float val = Convert2Float( tampon );
    			printf("%f\n", val);
    		}
    		
    	}
	}while( lecture != NULL);
	
	printf("\n");
	
	return 1;
}
