/*   $Workfile:   cpudefs.h  $
 *   $Revision:   1.20  $
 *   $Author:   JMM  $
 *   $Date:   17 Oct 1996 09:52:44  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********		 Do not change this file		   **********/

#ifndef CPUDEFS_H
#define CPUDEFS_H

/* machine definitions */

#define PC_DOS	1		/* PC with DOS */
#define PC_OS2	(1<<1)		/* OBSOLETE: PC with OS/2 */
#define PC_D16	(1<<2)		/* PC with DOS/16M (extended memory) */
#define NEC_DOS (1<<3)		/* NEC-PC with DOS (98xx) */
#define NEC_OS2 (1<<4)		/* OBSOLETE: NEC-PC with OS/2 */
#define NEC_D16 (1<<5)		/* NEC-PC with DOS/16M (ext. memory) */

#ifndef MSIM_MFC                /* MFC has its own defines for MAC which collide */
#define MAC	(1<<6)		/* may be a machine group later */
#endif

#define OWIN1	(1<<7)		/* OpenWindows on SunOS 4.1.x */
#define OWIN2	(1<<8)		/* Sun Solaris 2.1 */
#define VAX	(1<<9)		/* OBSOLETE: may be a machine group later */
#define SUN_4X2 (1<<10) 	/* Sun Solaris 2.1 */
#define MWIN	(1<<11) 	/* Microsoft Windows on PC */
#define SUN_4X1  (1<<12)	 /* Sun-4 X windows */
#define NEC_MWIN (1<<13)	/* Microsoft Windows on NEC */
#define HP70W	 (1<<14)	/* Hewlett Packard 700 for motif*/
#define HP70X	 (1<<15)	/* Hewlett Packard 700 for X windows*/

#define APOLLO	(1L<<16)	/* OBSOLETE */
#define SUN_4	(1L<<17)	/* OBSOLETE: Sun4, SunView */
#define PMAX	(1L<<18)	/* OBSOLETE: DECstation 3100 (MIPS RISC) */

/* machine group definitions */

#define HP700   ( HP70W | HP70X ) 		/* all hp700 */
#define SUN_4X	(SUN_4X1| SUN_4X2)		/* Sun-4 X windows */
#define DOS	(PC_DOS | NEC_DOS)		/* has DOS calls */
#define OS2	(PC_OS2 | NEC_OS2)		/* OBSOLETE: needs OS/2 API stuff */
#define D16	(PC_D16 | NEC_D16)		/* uses DOS/16M system */
#define PC	(DOS	| OS2	  | D16 )	/* uses Microsoft C */
#define NEC	(NEC_DOS| NEC_D16 | NEC_OS2)	/* same as above */
#define SUN	(SUN_4) 			/* OBSOLETE: Sun-4/SunView */
#define OWIN	(OWIN1 | OWIN2 | HP70W) 	/* Sun OpenWindows */
#define UNIX	(SUN	| SUN_4X | PMAX | OWIN | HP700) /* ?case sensitive input */

#define XWIN	(PMAX	| VAX | SUN_4X | HP70X )/* supports XWindows */
#define WINDOWS (MWIN	| NEC_MWIN | OWIN)	/* C++,event driven window system*/
#define WIN30	(MWIN	| NEC_MWIN )		/* Any MicroSoft 3.0 Windows */
#define VIRTUALMEM (D16 | WINDOWS | UNIX)	/* Virtual Memory systems */
#if 0
#define INT32	(PMAX	| VAX | SUN | SUN_4X | HP700 | WIN30) /* int type is 32 bits */
#endif
#define INT16	(PC	| NEC /* | MAC */ )		/* int type is 16 bits */

/* backward compatible definitions */

#define CTPC		PC_DOS	/* IBM-PC with DOS */
#define CTVAX		VAX	/* DEC VAX (includes MicroVAX) */
#define CTSUN		SUN	/* Sun workstation */
#define CTMAC		MAC	/* Apple MacIntosh II (AZTEK-c (from Manx) compiler) */
#define CTNEC		NEC_DOS /* NEC 98xx */
#define CTPC_OS2	PC_OS2	/* IBM-PC with OS/2 */
#define CTNEC_OS2	NEC_OS2 /* NEC-PC with OS/2 */

/* example use, old way (which still works!):
 *
 *	#if CTYPE==CTPC || CTYPE==CTNEC || ...
 *
 * new way:
 *
 *	#if CTYPE & ( PC | MAC )	... any PC and Mac
 *
 *	#if CTYPE & ( PC ^ NEC_OS2 )	... any PC except NEC-OS/2 (has to be
 *						in group to work properly)
 *
 *	#if CTYPE & ~MAC		... i.e. CTYPE!=CTMAC
 */

#define VAX_CLASS_1   1      /* Everything below 8800 */
#define VAX_CLASS_2   2      /* 8800 and above */

#define CMSUN3	1
#define CMSUN4	2
#define CMVAX	3
#define CMAPOLLO	4

#endif
