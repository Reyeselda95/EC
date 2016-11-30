/* Format types for FmtFlt() */

#define FMTE    0
#define FMTF    1
#define FMTS    2
#define FMTSF   3
#define FMTT    4
#define FMTTF   5
#define FMTU    6
#define FMTUF   7
#define FMTEP   8
#define FMTN    9
#define FMTNF   10

char *FmtFlt(double,int,int);
char *FmtFltPSU(double, char, int);

