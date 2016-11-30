/* $Workfile:   MSLIB.H  $
 * $Revision:   1.181  $
 *   $Author:   swg  $
 *     $Date:   04 Mar 1997 11:19:08  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********                Do not change this file                   **********/

/* MSLIB.H */

#ifndef MSLIB_HEADER_FILE
#define MSLIB_HEADER_FILE

#include "cpudefs.h"
#include "demo.h"
#include "version.h"
#include "fmtflt.h"
#include "mslibmin.h"

#define CHECK_DISK_SPACE
#if defined(CHECK_DISK_SPACE) && defined(PSPICE_WINDOWS)
#define fwrite fWrite
#endif

#ifdef  USE_HUGE                /* use huge versions */
#undef GETMEM
#define GETMEM(a)       GetHugeMem((unsigned long)(a))
#undef FREEMEM
#define FREEMEM(a)      freehugemem((char huge *)(a))
#else
#undef GETMEM
#define GETMEM(a)       GetMem((unsigned int)(a))
#undef FREEMEM
#define FREEMEM(a)      FreeMem(a)
#endif

#ifndef HGE
#ifdef  USE_HUGE
#define HGE     huge            /* "HGE" since "HUGE" is an ANSI item */
#else
#define HGE
#endif
#endif

/* set use of function declaration arguments */

#if CTYPE & ( WINDOWS | HP700 | SUN_4X)
#define  USE_DECL_ARGS
#else
#undef USE_DECL_ARGS
#endif

/* ascii special character definitions  */

#define TAB             '\t'
#define CTRL_C          '\003'
#define BELL            '\007'
#define BS              '\010'
#define LF              '\012'
#define FF              '\014'
#define CR              '\015'
#define ESC             '\033'
#define ST              '\234'
#define GS              '\035'
#define US              '\037'
#define DEL             '\177'
#define EOS             '\0'

/* useful symbol definitions */

#define YES 1
#define  ON 1
#define  NO 0
#define OFF 0

#define MAXEXP  30

/* limiting functions.  EXP() not only prevents overflow, but also avoids
   denormalize exceptions which the 287 does not handle correctly */

#define EXP(a) Expn(a)          /*( (a < -50.) ? 0.0 : exp(MIN(a,50.)) )*/
#define LOG(a) Ln(a)            /*(a < 1.928752e-22) ? -50. : log(a) )*/

#define BATCH           2
#define INTERACTIVE     3

#define NEC_NRM_ATTRIB  0xe1    /* normal video with white text */
#define NEC_REV_ATTRIB  0xe5    /* reverse video with white text */

/* Standard string lengths */

#define MBUFF   133

/* complex typedef (more understandable components than the one in UNIX) */

typedef struct {
  double re, im;
  } cmplex;

/* Macro definitions */

#define ABS(A)          ((A) >= 0  ? (A) :-(A))
#define SQRT(A)         ((A) >= 0  ? sqrt(A) : (0))
#define NINT(A) ((int)(floor((A)+.5)))  /* Nearest integer for A >= 0.0*/

/*
 * These two macros set and clear the nth bit of the given value
 */
#define SetBit( v_p,  n ) ( (*v_p) |= ( (unsigned long)1 << n ))
#define ClearBit( v_p,n ) ( (*v_p) &= ~( (unsigned long)1 << n ))

#if CTYPE & WIN30

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <ctype.h>

#endif
#if CTYPE & (SUN | SUN_4X | OWIN | HP700 )
#include <stdio.h>
#include <string.h>
#include <math.h>

#if CTYPE & (HP700 | OWIN | SUN_4X2)
#include <ctype.h>
#else
#include "sunctype.h"
#endif

#include <malloc.h>
#include <memory.h>
#if CTYPE & (SUN_4X | OWIN | HP700 )
#include <sys/time.h>
#endif
/* would like to include time.h but window_hs.h includes sys/time.h */
#endif
#if CTYPE & XWIN & UNIX
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#endif

#if defined(_MSC_VER) && (CTYPE & WIN30)
#define FP_SEG _FP_SEG
#define FP_OFF _FP_OFF
#endif

/*
 * These symbols from the Microsoft definitions and are repeated here
 *   for other compilers
 */
#define SEEK_SET        0
#define SEEK_CUR        1
#define SEEK_END        2

#define EXIT    exit

/*
 * This definition assures that global variables are defined in
 *   main and declared everywhere else
 */
#ifdef Main_Pgm
#define GLOBAL
#else
#define GLOBAL  extern
#endif

/* The following defines linkage function declaration modifiers to support
 * Device Equations implemented in a DLL. All linkage is static unless
 * USE_DLL is #defined. The remaining #definitions have the following
 * meanings:
 *
 * IN_DLL -      this is #defined if the current target is a DLL, otherwise
 *               the target is the calling application.
 * DLL_FUNC -    indicates that the present function is exported from the DLL
 * MAIN_FUNC -   the present function is imported into the DLL from the main
 *               program
 */
#ifdef USE_DLL
  #ifdef IN_DLL
    #define DLL_FUNC extern "C" __declspec(dllexport)
    #ifdef IN_DLL_MAIN
      #define MAIN_FUNC
    #else
      #define MAIN_FUNC extern
    #endif
  #else // not IN_DLL - in calling program
    #define DLL_FUNC GLOBAL
    #define MAIN_FUNC extern "C" __declspec(dllexport)
  #endif
#else // not USE_DLL
  #define DLL_FUNC GLOBAL
  #define MAIN_FUNC
#endif

#ifndef CONST
#if defined(__cplusplus)
#define CONST const
#else
#define CONST
#endif
#endif

#if CTYPE & WIN30
GLOBAL char CurrentProgramName[_MAX_PATH];
#endif

/* moved this here from graph.h so I can use it in mflush() so the Stmed (& Parts)
 * dialogs don't get titled "Probe"... */
GLOBAL char ProgramNam[20];

/* Global variable for FmtFlt routine replacement character.  If set to other
   than 0, it contains the character that will replace the least non-zero
   digit of every formatted floating point number. */
GLOBAL char Fmt_rplc_char;

#define USEARG(a)       a++;a--;

#if CTYPE & WIN30
#define DELETE_FILE(f)  remove(f)
#endif
#if CTYPE & UNIX
#define DELETE_FILE(f)  unlink(f)
#endif

/* include these here because they might need GLOBAL etc */

#if CTYPE & WIN30
#define REG_AX(xx) xx.x.ax
#define REG_BX(xx) xx.x.bx
#define REG_CX(xx) xx.x.cx
#define REG_DX(xx) xx.x.dx
#define sysint(i,in,out)        int86(i,in,out)
#define sysintx(i,in,out,seg)   int86x(i,in,out,seg)
#endif

#if CTYPE & UNIX
GLOBAL  int             cursor_col;
GLOBAL  int             cursor_row;
GLOBAL  int             ResizeOK;
#endif

#if CTYPE & WIN30
#define OPEN_RB                 "rb"    /* read binary */
#ifndef DIOCHK
#define OPEN_RT                 "rb"    /* read text NOTE: b not t for  control-z bug */
#else
#define OPEN_RT                 "rt"    /* read text for DIOCHK.C only */
#endif
#define OPEN_WB                 "wb"    /* write binary */
#define OPEN_WT                 "wt"    /* write text */
#define OPEN_AB                 "ab"    /* append binary */
#define OPEN_AT                 "at"    /* append text */
#define OPEN_RWB                "r+b"   /* write/read binary (fails if file not exist) */
#define OPEN_WRB                "w+b"   /* write/read binary */
#define OPEN_WRT                "w+t"   /* write/read text */
#endif

#if CTYPE & (UNIX )
#define OPEN_RB                 "r"     /* read binary */
#define OPEN_RT                 "r"     /* read text */
#define OPEN_WB                 "w"     /* write binary */
#define OPEN_WT                 "w"     /* write text */
#define OPEN_AB                 "a"     /* append binary */
#define OPEN_AT                 "a"     /* append text */
#define OPEN_RWB                "r+"    /* write/read binary */
#define OPEN_WRB                "w+"    /* write/read binary */
#define OPEN_WRT                "w+"    /* write/read text */
#endif

#define EXE_PATH_ENV "PATH"

        /* signed characters */
#if CTYPE & (SUN | SUN_4X | OWIN | HP700 )
#define SIGNED
#else
#define SIGNED  signed
#endif

/* function declarations */
#if CTYPE & SUN_4X2
#define stricmp strcasecmp
#endif

        /* BELL.C */
void Bell(void);
        /* CLRSCR.C */
void ClrScr(void );
#if CTYPE & D16
int SetLowMemSelectors(void);
#endif
        /* CMATH */
#ifdef IN_DLL
  typedef cmplex (*PROCCMPLEX)(cmplex,cmplex);
  MAIN_FUNC PROCCMPLEX fp_cadd;
  MAIN_FUNC PROCCMPLEX fp_cadi;
  MAIN_FUNC PROCCMPLEX fp_csub;
  MAIN_FUNC PROCCMPLEX fp_cmul;
  #define cadd (*fp_cadd)
  #define cadi (*fp_cadi)
  #define csub (*fp_csub)
  #define cmul (*fp_cmul)
#else
  MAIN_FUNC cmplex cadd(cmplex ,cmplex );
  MAIN_FUNC cmplex cadi(cmplex ,cmplex );
  MAIN_FUNC cmplex csub(cmplex ,cmplex );
  MAIN_FUNC cmplex cmul(cmplex ,cmplex );
#endif
cmplex cmplx(double ,double );
cmplex cdiv(cmplex ,cmplex );
        /* DELIM.C */
int Delim(char *,char *,char * *);
        /* DSNMVD.C */
void DsNmVd(char *,int);
        /* DSRVVD.C */
void DsRvVd(char *,int,int);
        /* DTOA.C */
int atof2(char *,double *);
#if defined(__cplusplus) && !defined(PSPICE_WINDOWS)
int AtoD(CONST char *String, double *Value, char *Unit=0);
#else
int AtoD(char *String, double *Value, char *Unit);
#endif
void DtoA(double, double, char, int, char *);
void DtoAnice(char *, int, double);
short setAtoDparse(short);
        /* FILATR.C */
int FilAtr(char *,char *,char *,long *,char *,char *);
        /* FILESIZE.C */
FILE *fopenEnv(const char *, const char *, const char *, char *, int);
long FindFileSize(const char *, const char *, char *, int);
#if CTYPE & UNIX
#define _searchenv(name,env,path) FindFileSize(name,env,path,MAX_PATH)
#endif
long FileSize(const char *, const char *);
        /* FMTDSK.C */
void FmtDsk(int ,int (*)[2]);
        /* MSSTRREV.C */
void MSstrrev( char * );
        /* POSCRS.C */
void PosCrs(int ,int );
        /* PTRTOABS.C */
long ptrtoabs(char *);
        /* READOPT.C */
int  ReadOpt(int *,char * *,int ,struct oneopt *);
        /* SCRLDS.C */
void ScrlDs(int );
#ifdef INT13_NOT_OBSOLETE
        /* INT13.ASM */
char INT13(unsigned int, unsigned int, unsigned int, char *);
#endif
        /* SAFEMATH.C */
#ifdef IN_DLL
  typedef double (*PROCEXPN)(double);
  MAIN_FUNC PROCEXPN fp_Expn;
  #define Expn (*fp_Expn)
  MAIN_FUNC PROCEXPN fp_Ln;
  #define Ln (*fp_Ln)
#else
  MAIN_FUNC double Expn(double);
  MAIN_FUNC double Ln(double);
#endif
double Exp2(double,double);
        /* SQZBLN.C */
void SqzBln(char *);
void SqzWSp(char *);
        /* STRBLN.C */
void StrBln2(char *);
        /* STRDIFF.C */
int strdiff(CONST char *, CONST char *);
int strdiff2(CONST char *, CONST char *);
        /* STRUCMP.C */
int StrUCmp(CONST char *,CONST char *);
        /* STRUNCMP.C */
int StrUNCmp(CONST char *,CONST char *,int );
        /* STRUP.C */
void Strup(char *);
        /* STRZERO.C*/
void StrZero( char * );
        /* MISCMWIN.C */
void TellUser( char * );
        /* TIMEDIFF.C */
#if CTYPE & (PC | WIN30)
#if defined(__cplusplus) && defined(__WATCOMC__)
struct timeb;
#endif
int MsTimeDiff(struct timeb *, struct timeb *);
#else
int MsTimeDiff(struct timeval *, struct timeval *);
#endif

    /* WAITSEC.C */
double WaitSec(double );

#if CTYPE & UNIX
void DrwBdr(int, int, int, int, int);
        /* strlwr.c */
char* strlwr(char *);
#endif

#ifdef PSPICE_WINDOWS
#include "wdefines.h"
#undef  WHERE
#define WHERE   wPrintf("\n(File %-12s; Line %4d) ",__FILE__,__LINE__);
#endif


#endif /* MSLIB_HEADER_FILE */
