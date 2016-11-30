#include <iostream>
using namespace std;

void CIFRAR (unsigned long* v, unsigned long* k)  { 
	unsigned long y=v [0], z=v [1], sum=0, i=0,    /* inicialización */   
	delta=0x9e3779b9,                          /* constante necesaria */             
	n=32;   /* número de rondas de cifrado */  
	for (i=0; i< n; i++)  { /* Ciclo básico */
	    sum += delta;
		y +=  ((z<<4)+k[0])  xor  (z+sum)  xor  ((z>>5)+k[1]);
		
	    z +=  ((y<<4)+k[2])  xor  (y+sum)  xor  ((y>>5)+k[3]);
	}     /* fin del ciclo */

	v [0]=y;
	v [1]=z;  
	cout << "\nCIFRADO\nv[0] "<<hex<< y<< "\nv[1] " << z << endl; 
}

void DESCIFRAR (unsigned long* v, unsigned long* k)  {
	unsigned long y=v [0], z=v [1], sum=0xc6ef3720, i=0,    /* inicialización */
	delta=0x9e3779b9,        /* constante necesaria */             
	n=1;    /* número de rondas de cifrado */  
	for (i=0; i< n; i++)  { /* Ciclo básico */
		z -=  ((y<<4)+k[2])  xor  (y+sum)  xor  ((y>>5)+k[3]);
		y -=  ((z<<4)+k[0])  xor  (z+sum)  xor  ((z>>5)+k[1]);		
		sum -= delta;                  
	}     /* fin del ciclo */

	v [0]=y;   
	v [1]=z; 
	cout << "\nDESCIFRADO\nv[0] "<< y<< "\nv[1] " << z << endl; 
 
}

main(){
	unsigned long v[2];
	unsigned long k[4];
	int i;
	v[0]=0x7567696d;
	v[1]=0x000a6c65;
	k[0]=0x11111111;
	k[1]=0x22222222;
	k[2]=0x33333333;
	k[3]=0x44444444;
	
	CIFRAR(v,k);
	DESCIFRAR(v,k);
	cin.get();
}
