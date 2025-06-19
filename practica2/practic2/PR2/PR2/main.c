#include <8051.h>

void main()
{
    unsigned char i, j;
    unsigned char massiv[11] =
    {
        0xC0, //0
        0xF9, //1
        0xA4, //2
        0xB0, //3
        0x99, //4
        0x92, //5
        0x82, //6
        0xF8, //7
        0x80, //8
        0x90, //9
        0xFF  //exit
    };

    P2 = massiv[9]; // ???????? ? 9
    P3 = 0;
    unsigned char k = 9;

    while(1)
    {
        for(i = 0; i < 10; i++)
        {
            if(P3 == 0)
            {
                for(j = 0; j < 100; j++)
                    continue;
            }
            else
            {
                if(k > 0)
                    k--;
                else
                    k = 9;
                P2 = massiv[k];
                for(j = 0; j < 100; j++)
                    continue;
            }
        }
    }
}
