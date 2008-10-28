#include <stdio.h>
#include <stdlib.h>

typedef enum {
    A1 = 0,
    A2,
    A3,
    A4,
    A5
} sheet;

void printSheets (sheet ev[5])
{
    printf("A1: %d A2: %d A3: %d A4: %d A5: %d %c\n", ev[0], ev[1], ev[2], ev[3], ev[4], ((ev[0] + ev[1] + ev[2] + ev[3] + ev[4]) == 1 && ev[4] != 1) ? '*' : ' ');
}

double expectedOneSheets (sheet ev[5]) {
    double onePulls = 0.0;
    int totalSheets = ev[0] + ev[1] + ev[2] + ev[3] + ev[4];
    if (totalSheets == 0) return 0.0;
    if (totalSheets == 1) {
        if (ev[4] == 0) {
            onePulls = 1.0;
        }
    }
//    printSheets(ev);
    int ii;
    for (ii = 0; ii <= A5; ii++) {
        if (ev[ii]) {
            sheet *tmpSht = malloc(5 * sizeof(sheet));
            // copy the sheet array
            int jj;
            for (jj = 0; jj < 5; jj++) {
                tmpSht[jj] = ev[jj];
            }
            // pull the sheet out
            tmpSht[ii]--;
            jj = ii;
            while (++jj <= A5) {
                tmpSht[jj]++; 
            }
            onePulls += expectedOneSheets(tmpSht) * (ev[ii]/(double)totalSheets);
            free(tmpSht);
        }
    }
    return onePulls;
}

int main (int argc, char *argv[])
{
    sheet ev[5] = {0, 1, 1, 1, 1}; 
    double expected = expectedOneSheets(ev);
    printf("Expected number of pulls: %0.6f\n", expected);
    return 0;
}
