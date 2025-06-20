#include <8051.h>
void msec (int x) 
{
	while(x-->0) 
	{
		TH0 = (-200)>>8; 
		TL0=-200;  
		TR0=1;
		do;
		while(TF0==0);
		TF0=0; 
		TR0=0; 
	}
}

void ts (int step) 
{
	TH0 = (-200)>>8;
	P2=P2+step;
	TL0=-200; 
	P2=P2+step;
	TR0=1;
	P2=P2+step;
	while(TF0==0)
	{	
		P2=P2+step;
	}
	TF0=0; 
	TR0=0; 
}

void main()
{
	TMOD=0x1;
	//U=256

	P2=0;
	msec(1);
	ts(8);
	msec(1);

	P2=128;
	ts(-4);
	msec(1);

}
