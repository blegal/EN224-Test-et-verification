#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <paths.h>
#include <termios.h>
#include <sysexits.h>
#include <sys/param.h>
#include <sys/select.h>
#include <sys/time.h>
#include <time.h>
#include <cassert>
#include <iostream>


using namespace std;

void write_int(const int fileID, const int value)
{
	int wBytes = write( fileID, &value, sizeof(int) );
	assert( wBytes == (sizeof(int)) );
}

int read_int(const int fileID)
{
	int value;
    int rBytes = read( fileID, &value, sizeof(int) );
    assert( rBytes == (sizeof(int)) );
	return value;
}

int PGDC_v2(const int A, const int B)
{
	int N1 = A;
	int N2 = B;
	int reste;
	do
	{
		reste = N1 % N2;
		N1    = N2;
		N2    = reste;
	}while(reste != 0);
	
	return N1;
}


int main (int argc, char * argv []){

	cout << "(II) Initialisation des composants..." << endl;

    int fileDescriptor = -1;
    
    fileDescriptor = open("/dev/ttyUSB1", O_RDWR | O_NOCTTY );
    if(fileDescriptor == -1)
    {
        printf("Impossible d'ouvrir ttyUSB1 !\n");
        return -1;
    }

    struct termios t;
    tcgetattr(fileDescriptor, &t); // recupère les attributs
    cfmakeraw(&t); // Reset les attributs
    t.c_cflag     = CREAD | CLOCAL;     // turn on READ
    t.c_cflag    |= CS8;
    t.c_cc[VMIN]  = 0;
    t.c_cc[VTIME] = 255;     // 5 sec timeout

    cfsetispeed(&t, B921600);
    cfsetospeed(&t, B921600);
    tcsetattr(fileDescriptor, TCSAFLUSH, &t); // envoie le tout au driver    

	int A = 32;
	int B = 3;

	if( argc == 3 )
	{
		A = atoi( argv[1] );
		B = atoi( argv[2] );
	}

 	write_int(fileDescriptor, A);
 	write_int(fileDescriptor, B);

	const int C = read_int(fileDescriptor);

	cout << "PGCD(" << A << ", " << B << ") = " << C << endl;
	cout << "PGCD(" << A << ", " << B << ") = " << PGDC_v2(A,B) << endl;

	for(int a = 1; a < 65535; a += 1)
	{
		for(int b = 1; b < 65535; b += 1)
		{
			if( b%256 == 0 ) cout << "PGCD(" << a << ", " << b << ")" << endl; 
		 	write_int(fileDescriptor, a);
		 	write_int(fileDescriptor, b);
			int hard = read_int(fileDescriptor);
			int soft = PGDC_v2(a,b);
	
			if( hard != soft )
				cout << endl << b << " PGCD(" << a << ", " << b << ") => " << hard << " == " << soft << endl;
		}
	}
    
    return 0;
}
