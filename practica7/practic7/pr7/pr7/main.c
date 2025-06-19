#include <htc.h>

unsigned int tmpCnt;

void imp(unsigned int cnt)
{
    do { } while (TF2 == 0);
    TF2 = 0;
    P10 = 1;
    while (cnt != 0) cnt--;
    P10 = 0;
}

void main()
{
    // ???????? tmpCnt ??? Qmin=50% ? Qmax=70% ??? F=11 ??? (?????????)
    unsigned int QminCnt = 1315; // 50%
    unsigned int QmaxCnt = 1841; // 70% (???????? 1.4 * 1315)

    P0 = 0;
    P2 = 0;
    P1 = 0xFE;

    // ????????? ??????? 2 ??? F=11 ???
    RCAP2H = 0x4086;
    RCAP2L = 0x4086;
    T2CON &= 0xFC;
    ET2 = 1;
    EA = 1;
    T2CON |= 0x4;

    while (1)
    {
        if (P0 == 1)
        {
            tmpCnt = QminCnt; // 50%
        }
        else if (P2 == 1)
        {
            tmpCnt = QmaxCnt; // 70%
        }
        imp(tmpCnt);
    }
}
