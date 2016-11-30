/* $Workfile:   MSLIBMIN.H  $
 * $Revision:   1.2  $
 *   $Author:   swg  $
 *     $Date:   04 Mar 1997 11:19:30  $ */

#include "demo.h"

#define MAXREAL     1e30
#define MINREAL     1e-30
#define MAX(A,B)    ((A) > (B) ? (A) : (B))
#define MIN(A,B)    ((A) < (B) ? (A) : (B))

/*
 * This definition assures that global variables are defined in
 *   main and declared everywhere else
 */
#ifdef Main_Pgm
#define GLOBAL
#else
#define GLOBAL  extern
#endif

int   mprintf(char* format, ... );
void  mflush(void);
void  StrBln(char *);

/* for ReadOpt() options' structure */
/* note, `present' field is last so don't bother initializing */
struct oneopt {
    char*   name;       /* eg. "Wp" */
    int     nargs;      /* # args expected */
    char**  args;       /* must be space for `nargs' pointers */
    int     present;    /* 1 if seen, 0 otherwise */
};

