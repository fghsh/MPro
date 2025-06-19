#include <8051.h> 

void tput(unsigned char c1) 
{ 
    SBUF = c1;  
    while(!TI); 
    TI = 0;  
}

void main() 
{  
    int i; 

    unsigned char *src = (unsigned char *)0x50; //  0x50

    //  "ivan1234"
    src[0] = 'i';
    src[1] = 'v';
    src[2] = 'a';
    src[3] = 'n';
    src[4] = '1';
    src[5] = '2';
    src[6] = '3';
    src[7] = '4';

    TMOD = 0x20;     
    TH1 = 0xFD;      
    PCON = 0x80;     
    TR1 = 1;         
    SCON = 0x40;     

    for(i = 0; i < 8; i++)  
    { 
        tput(src[i]); 
    } 

    while(1){} 
}
