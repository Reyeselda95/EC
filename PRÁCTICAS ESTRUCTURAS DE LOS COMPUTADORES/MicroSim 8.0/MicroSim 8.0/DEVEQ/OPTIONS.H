/* options.h
 *   $Revision:   1.32  $
 *   $Author:   DBarksda  $
 *   $Date:   30 May 1997 18:36:14  $ */

#ifndef OPTIONS_H_INCLUDED
#define OPTIONS_H_INCLUDED

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********                Do not change this file                   **********/

struct Dist_Values;

struct options_ {
int
        OpPage,
        OpNoEcho,
        OpNode,
        OpMod,
        OpList,
        OpOpts,
        OpAcct,
        OpBias,
        OpNoReuse,
        OpNoOutMsg,
        OpNoPrbMsg,
        OpNoDigTimChk,
        OpDigFFGenX,
	OpNoICTranslate,
	OpStepGMin,
    OpShowMatrix,

        OpNumDgt,
        OpLimPts,
        OpITL1,
        OpITL2,
        OpITL4,
        OpITL5,
        OpWidth,
        OpDigMnMx,
        OpDigIOLvl,
        OpDigInitState,
        OpMessageLevel,
        OpDigErrLimit,
        OpDigErrDefault;

double
        OpDefL,
        OpDefW,
        OpDefAD,
        OpDefAS,
        OpTNom,
        OpCPTime,
        OpRelTol,
        OpTrTol,
        OpAbsTol,
        OpChgTol,
        OpVnTol,
        OpPivRel,
        OpPivTol,
        OpGMin,
        OpDigFreq,
        OpDigStrF,
        OpDigStrZ,
        OpDigOvrDrv,
	OpDigMnTyScale,
	OpDigTyMxScale,
	OpDigWCScale;

int
        OpInWidth;
struct Dist_Values *OpDist;

} ;

GLOBAL struct options_ options;

#ifdef DEFINE_DEFAULT_OPTIONS

struct options_ Default_Options
= {
    0,      /* nopage */           0,        /* noecho */
    0,      /* node */             0,        /* nomod */
    0,      /* list */             0,        /* opts */
    0,      /* acct */	           0,        /* nobias */
    0,      /* noreuse */
    0,      /* nooutmsg */         0,        /* noprbmsg */
    0,      /* nodigtimchk */      0,        /* digffgenx */
    0,      /* noictranslate */	   0,        /* stepgmin */
    0,      /* showmatrix */


    4,      /* numdigit */         0,        /* limpts */
    150,    /* itl1 */             20,       /* itl2 */
    10,     /* itl4 */             0,        /* itl5 */
    80,     /* width */	           2,        /* digmnmx */   
    1,	    /* digiolevel */       2,        /* diginitstate (X) */
    0,      /* messagelevel */     0,        /* digerrlimit (infinity) */
    20,     /* digerrdefault */


   100.0e-6,/* defl */     100.0e-6, /* defw */
   0.0,     /* defad */    0.0,      /* defas */
   27.0,    /* tnom */     0.0,      /* cptime */
   0.001,   /* reltol*/    7.0,      /* trtol */
   1.0e-12, /* abstol */   0.01e-12, /* chgtol */
   1.0e-6,  /* vntol */    1.0e-3,   /* pivrel */
   1.0e-13, /* pivtol */   1.0e-12,  /* gmin */
   1.0e10,  /* digfreq */  2.0,      /*	digstrf */
   2.0e4,   /* digstrz */  2.5,      /* digovrdrv */
   0.4,	 /* digmntyscale*/ 1.6,      /* digtymxscale */
   1.0,     /* digwcscale*/

   MBUFF,   /* inwidth */
   NULL	    /* default distribution */
};
#endif /* DEFINE_DEFAULT_OPTIONS */

#define NOPAGE options.OpPage
#define NOECHO options.OpNoEcho
#define NODE   options.OpNode
#define NOMOD  options.OpMod
#define LIST   options.OpList
#define OPTS   options.OpOpts
#define ACCT   options.OpAcct
#define NOBIAS options.OpBias
#define NOREUSE  options.OpNoReuse
#define NOOUTMSG options.OpNoOutMsg
#define NOPRBMSG options.OpNoPrbMsg
#define NODIGTIMCHK options.OpNoDigTimChk
#define FFGENX options.OpDigFFGenX
#define NOICTRANSLATE options.OpNoICTranslate
#define STEPGMIN options.OpStepGMin
#define SHOWMATRIX options.OpShowMatrix

#define NUMDGT options.OpNumDgt
#define LIMPTS options.OpLimPts
#define ITL1   options.OpITL1
#define ITL2   options.OpITL2
#define ITL4   options.OpITL4
#define ITL5   options.OpITL5
#define WIDTH  options.OpWidth
#define MESSAGELEVEL options.OpMessageLevel

#ifdef IN_DLL
  typedef double (*PROCGETOPTION)(void);
  MAIN_FUNC PROCGETOPTION fp_GetDEFL;
  MAIN_FUNC PROCGETOPTION fp_GetDEFW;
  MAIN_FUNC PROCGETOPTION fp_GetDEFAD;
  MAIN_FUNC PROCGETOPTION fp_GetDEFAS;
  MAIN_FUNC PROCGETOPTION fp_GetTNOM;
  MAIN_FUNC PROCGETOPTION fp_GetGMIN;
  #define DEFL (*fp_GetDEFL)()
  #define DEFW (*fp_GetDEFW)()
  #define DEFAD (*fp_GetDEFAD)()
  #define DEFAS (*fp_GetDEFAS)()
  #define TNOM (*fp_GetTNOM)()
  #define GMIN (*fp_GetGMIN)()
#else
  MAIN_FUNC double GetDEFL();
  MAIN_FUNC double GetDEFW();
  MAIN_FUNC double GetDEFAD();
  MAIN_FUNC double GetDEFAS();
  MAIN_FUNC double GetTNOM();
  MAIN_FUNC double GetGMIN();
  #define DEFL   options.OpDefL
  #define DEFW   options.OpDefW
  #define DEFAD  options.OpDefAD
  #define DEFAS  options.OpDefAS
  #define TNOM   options.OpTNom
  #define GMIN   options.OpGMin
#endif
#define CPTIME options.OpCPTime
#define RELTOL options.OpRelTol
#define TRTOL  options.OpTrTol
#define ABSTOL options.OpAbsTol
#define CHGTOL options.OpChgTol
#define VNTOL  options.OpVnTol
#define PIVREL options.OpPivRel
#define PIVTOL options.OpPivTol
#define DIGFREQ options.OpDigFreq
#define DIGDRVF options.OpDigStrF
#define DIGDRVZ options.OpDigStrZ
#define DIGOVRDRV options.OpDigOvrDrv
#define DIGMNMX   options.OpDigMnMx
#define DIGIOLVL  options.OpDigIOLvl
#define DIGINITSTATE options.OpDigInitState
#define DIGMNTYSCALE options.OpDigMnTyScale
#define DIGTYMXSCALE options.OpDigTyMxScale
#define DIGWCSCALE   options.OpDigWCScale
#define DIGERRLIMIT options.OpDigErrLimit
#define DIGERRDEFAULT options.OpDigErrDefault

#define INWIDTH options.OpInWidth
#define MININWIDTH      8       /* minimum value of .width in = */
#define	DISTRIB options.OpDist

#endif /* #ifndef OPTIONS_H_INCLUDED */