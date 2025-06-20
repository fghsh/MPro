#include <8051.h>
unsigned int sum=0;

interrupt void isr_ex0(void)
{
    if (sum == 0)
    {   
        sum = 21;  
    }
    else
    {
        sum = 0;
    }
}

void main()
{
    P3 = 0;
    P32 = 1;
    IE = 0x81;
    IT0 = 0x1;
    IP = 0x1;
    while(1)
    {
		
       P36 = 1;
       P36 = 0;
       P2 = P1 + sum;
       
    }
}
