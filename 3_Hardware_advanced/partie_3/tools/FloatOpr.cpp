//# FloatOpr.cpp -- A program to compute floatting point operations 
//#                 between large files.
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

int main( int argc, char **argv ){
	FILE  *file_1;
	FILE  *file_2;

	if( argc != 4 ){
		printf("Help :\n");
		printf("  ./FloatOpr -[add/sub/mult] FileName_1 FileName_2\n");
		return -1;
	}

	

	file_1 = fopen( argv[2], "r");
	if( file_1 == NULL ){
    	printf("  ERROR : problem opening file (%s)!\n", argv[2]);
  	}

	file_2 = fopen( argv[3], "r");
	if( file_2 == NULL ){
    	printf("  ERROR : problem opening file (%s)!\n", argv[3]);
  	}

	char t1[128];
	char t2[128];
	char* l1, *l2;
	do{ 
    	l1 = fgets(t1, 128, file_1);
    	l2 = fgets(t2, 128, file_2);
    	if( (l1 != NULL) && (l2 != NULL) ){
    		if( strcmp(argv[1], "-add") == 0 ){
    			float r = atof(t1) + atof(t2);
    			printf("%f\n", r);

    		}else if( strcmp(argv[1], "-sub") == 0 ){
    			float r = atof(t1) - atof(t2);
    			printf("%f\n", r);

    		}else if( strcmp(argv[1], "-mult") == 0 ){
    			float r = atof(t1) * atof(t2);
    			printf("%f\n", r);

    		}else{
    			printf("  ERROR : unknow operation (%s)\n", argv[2]);
    			return -1;
    		}
    	}
	}while( (l1 != NULL) && (l2 != NULL) );
	
	return 1;
}
