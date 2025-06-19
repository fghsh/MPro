#include <8051.h>
void main()
{
	unsigned int i, j;
	unsigned int t, t_;
	unsigned int c, p;

	unsigned int h, tempI, tempJ;

	unsigned char row[3]={
		0x6, //110 
		0x5, //101
		0x3  //011
	};
	unsigned char column[5]={
		0x1E, //11110
		0x1D, //11101
		0x1B, //11011
		0x17, //10111
		0xF   //01111		
	};
	unsigned char *key[3][5]={
		{"1","4","7","10","13"}, 
		{"2","5","8","11","14"},
		{"3","6","9","12","15"}	
	};
	unsigned char *test="lol";
	P2=0x0;
	P0=0x7;

	P1 = 0x38; 
	P3 = 0x1; 
	P3 = 0x0; 
	P1 = 0x80; 
	P3 = 0x1;
	P3 = 0x0; 
	
	tempI = 99;
	tempJ = 99;
	h = 0;
	while(1){
		P2=0x0;
		P0=0x7;

		for(j=0; j<5; j++){
				
			P2=column[j];

			for(i=0; i<3; i++){
				if(P0==row[i]){ 
					c=1;
					for(p=0;p<4;p++)
						if(P0!=row[i])
							c=0;
					if(tempI == i && tempJ == j)
						h++;
					else
						h=0;
					if(c && (h==0 || h>4)){
						if(j>2) t_ = 2; else t_ = 1;
						for(t=0;t<t_;t++){	
							P1 = key[i][j][t]; 
							P3 = 0x3; 
							P3 = 0x2;
						}
						tempI = i;
						tempJ = j;
					}
				}
			}
		}
	}
}