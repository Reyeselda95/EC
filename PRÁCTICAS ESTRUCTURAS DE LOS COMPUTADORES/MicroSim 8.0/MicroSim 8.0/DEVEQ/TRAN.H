/* tran.h
 *   $Revision:   1.15  $
 *   $Author:   DBarksda  $
 *   $Date:   30 May 1997 18:36:16  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********		 Do not change this file		   **********/

#ifndef TRAN_H_INCLUDED
#define TRAN_H_INCLUDED

/*
 * Declarations for transient analysis.
 */
#define MSTVCT	4		/* Total number of state vectors */
GLOBAL int JSTVCT;

struct PrPlList;

struct TRDef {
  int		TRfl;		/* YES: do transient analysis */
  int		TRUICfl;	/* YES: skip bias point for tran. analysis */
  int		TROpfl; 	/* YES: detailed print of bias point */
  double	TREnd;		/* End time */
  double	TRPrStp;	/* .PRINT and .PLOT step size */
  double	TRSkip; 	/* Time at which to start output */
  double	TRStCl; 	/* Ceiling on internal time step */
  double	TRTime; 	/* Analysis time */
  double	TRDelta;	/* Time step */
  double	TRDelOld[MSTVCT];	/* Past values of TRDelta */
  double	TRThrmVlt;	/* Thermal voltage at current temperature */
  float		TRCurrentTemp;	/* Current Temperature */
  int		TRIntOrd;	/* Order of integration method */
  long		TRNItr; 	/* No. of iterations needed */
  long		TRFrSt; 	/* No. of forward time steps */
  long		TRRvSt; 	/* No. of reverse time steps */
  double	TRSec;		/* Time needed */
  double	TRFourFreq;	/* Fourier frequency */
  struct PrPlList
		*TRFourVar;	/* ptr to list of .FOUR variables */
  int		TRFourNH;	/* Number of Fourier harmonics */
  };
GLOBAL struct TRDef *TRData;
GLOBAL double	AG1, AG2, AG3, AG4;	/* Coefficients for integration */
GLOBAL double AG1ddt, AG2ddt, AG3ddt, AG4ddt;	/* ... for EXOP_DDTs */
GLOBAL double AG1int, AG2int, AG3int, AG4int;	/* ... for EXOP_INTs */

#define TRFLG	(TRData->TRfl)
#ifdef IN_DLL
  typedef int (*PROCGETNOSOLV)(void);
  MAIN_FUNC PROCGETNOSOLV fp_GetNOSOLV;
  #define NOSOLV (*fp_GetNOSOLV)()
  typedef double (*PROCGETDELTA)(void);
  MAIN_FUNC PROCGETDELTA fp_GetDELTA;
  #define GetDELTA (*fp_GetDELTA)
  MAIN_FUNC PROCGETDELTA fp_GetDELTAOLD;
  #define GetDELTAOLD (*fp_GetDELTAOLD)
#else
  MAIN_FUNC int GetNOSOLV(void);
  MAIN_FUNC double GetDELTA(void);
  MAIN_FUNC double GetDELTAOLD(void);
  #define NOSOLV    (TRData->TRUICfl)
  #define DELTA	    (TRData->TRDelta)
  #define DELOLD	(TRData->TRDelOld)
#endif
#define TROPPR	(TRData->TROpfl)
#define TSTOP	(TRData->TREnd)
#define TSTEP	(TRData->TRPrStp)
#define TSTART	(TRData->TRSkip)
#define TMAX	(TRData->TRStCl)
#define TIME	(TRData->TRTime)
#define VT	(TRData->TRThrmVlt)
#define	TEMPERATURE	(TRData->TRCurrentTemp)
#define IORD	(TRData->TRIntOrd)
#define TRITR	(TRData->TRNItr)
#define TRFRSTP (TRData->TRFrSt)
#define TRRVSTP (TRData->TRRvSt)
#define TRTIM	(TRData->TRSec)
#define TRFOURNH	9	/* Default value for TRFourNH */
#define TRFOURMH	100	/* Max value for TRFourNH */

/*
 * Mode controls some options during the iterations
 */
#define MDBPDC	1		/* Small signal bias point calculation */
#define MDBPTR	2		/* Bias point for transient analysis */
#define MDDCSW	3		/* DC Sweep which uses previous step */
#define MDTRAN	4		/* Transient analysis */
#define MDAC	5		/* AC analysis */
/*
 * InitFl controls where the device evaluation code gets its terminal voltages
 *   from.
 */
#define INNORM	1		/* Use VltVct values from last iteration */
#define ININIT	2		/* Use IC= values in device table (transient
				     bias point) or value calculated and
				     stored in model table (reg. bias point) */
#define INOFF	3		/* Use VltVct unless device has OFF flag,
				     then use 0 */
#define INSTV0	4		/* Use STVCT0 (= value used previous iteration) */
#define INTRAN	5		/* Use STVCT1 (= value used previous step) */
#define INPRDCT 6		/* Extrapolate using STVCT2 and STVCT1 */

#endif /* #ifndef TRAN_H_INCLUDED */