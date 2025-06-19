#include <8051.h>
void sec (int x){
	while(x-->0) {
		TH0 = (-1250)>>8;
		TL0=-1250;
		TR0 = 1;
		do;
		while(TF0==0); 
		TF0=0; 
		TR0=0;
	}
}

void main() {
	int i = 4;
	unsigned char array[5];

	TMOD=0x1;
 
	array[0] = 0x0; 
	array[1] = 0x5;
	array[2] = 0xA;
	array[3] = 0x50;
	array[4] = 0xA0;
	
	while(1){
		i++;
		switch(i)
		{
			case 1:
				P1 = array[1];
				sec(5);
				break;
			case 2:
				P1 = array[2];
				sec(2);
				break;
			case 3:
				P1 = array[3];
				sec(2);
				break;
			case 4:
				P1 = array[4];
				sec(5);
				break;
			case 5:
				P1=array[0];
				sec(2);
				i = 0;

		}
		
	}
}