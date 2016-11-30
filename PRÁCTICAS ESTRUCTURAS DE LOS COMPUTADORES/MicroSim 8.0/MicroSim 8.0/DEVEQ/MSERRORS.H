/* mserrors.h
 *   $Revision:   1.11  $
 *   $Author:   DBarksda  $
 *   $Date:   05 Jun 1997 16:11:08  $ */

#ifndef	MSERRORS_H
#define	MSERRORS_H

	/* bit values for the first parameter of SimError() */
	/* SimError will set ErrorFlag and print "ERROR -- "
	   unless otherwise indicated by ... */
#define	TERMINATE_SIMULATION	1	/* abort PSpice with exit(2) */
#define	DISPLAY_ON_STDERR	2	/* also display message to stderr */
#define	INTERNAL_ERROR		4	/* make message be "INTERNAL ERROR" */
#define	WARNING_ONLY		8	/* make message be "WARNING", don't set ErrFlg */
#define	FATAL_ERROR	       16	/* set FatalErrorFlag */
#define	DONT_SET_ERRORFLAG     32	/* don't set ErrorFlag */
#define	IO_ERROR	       64	/* make message be "I/O ERROR" */
#define	INFO_ONLY	      128	/* just print message in .OUT file */
#define MSGVIEW_ONLY      256   // just display in the message viewer

/*
typical usage of SimError:
#include "mserrors.h"
	...
SimError(TERMINATE_SIMULATION + DISPLAY_ON_STDERR,"foo = %d",foo);
*/

  void ReadinError(const char *);
  void ReadinWarning(const char *);
  void ReadinMissingError(const char *);
  void	ReadinExprError( void);
#ifdef IN_DLL
  typedef void (*PROCSIMERROR)(int, const char*, ...);
  MAIN_FUNC PROCSIMERROR fp_SimError;
  #define SimError (*fp_SimError)
  typedef void (*PROCTOOUTFILE)(const char*, ...);
  MAIN_FUNC PROCTOOUTFILE fp_ToOutFile;
  #define ToOutFile (*fp_ToOutFile)
#else
  MAIN_FUNC void SimError(int, const char *, ...);
  MAIN_FUNC void ToOutFile(const char*, ...);
#endif

#define	MODCHK_IN_SP1		1
#define	MODCHK_IN_DC		2
#define	MODCHK_IN_MC		4

#include "msgwin.h"
#endif	/* MSERRORS_H */
