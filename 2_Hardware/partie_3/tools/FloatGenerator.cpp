//# FloatGenerator.cpp -- A program for generating a large number of random 
//#                       float values. This program has been design to allow
//#	the generation of large testbench files.
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
#include <time.h>

int main( int argc, char **argv ){

	time_t seconds;
	time( &seconds );
	srand( (unsigned int) seconds);

	if( argc != 2 ){
		printf("Help :\n");
		printf("  ./FloatGenerator NumberOfData\n");
		printf("    NumberOfData = the number of float data you need.\n");
		return -1;
	}

	int n = atoi( argv[1] );

	for(int i=0; i<n; i++){
		float a = (float)rand();
		float b = (float)rand();
		float c = a / b;
		if( ((int)rand())%3 == 1 ){
			c = c * ((unsigned char)rand());
		}
		if( ((int)rand())%3 == 1 ){
			c = -c;
		}
		printf("%f\n", c);
	}
	
	return 1;
}
