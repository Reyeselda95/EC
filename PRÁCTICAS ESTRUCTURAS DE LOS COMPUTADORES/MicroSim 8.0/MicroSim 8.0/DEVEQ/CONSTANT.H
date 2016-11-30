/* constant.h
 *   $Revision:   1.8  $
 *   $Author:   DBarksda  $
 *   $Date:   30 May 1997 18:36:10  $ */


/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********                Do not change this file                   **********/

#ifndef CONSTANT_H_INCLUDED
#define CONSTANT_H_INCLUDED

/*
 * Physical constants
 */
const double CHARGE	= 1.6021918e-19;              /* Charge on an electron */
const double BOLTZ 	= 1.3806226e-23;              /* Boltzmann's constant */
const double CTOK	= 273.15e0;                   /* 0 deg. C in deg. Kelvin */
const double EPS0	= 8.854214871e-12;            /* Permittivity of free space */
const double EPSSIL	= 11.7e0*EPS0;                /* Permittivity of silicon */
const double EPSOX 	= 3.9e0*EPS0;                 /* Permittivity of oxide */
const double TWOPI 	= 8.0e0*atan2(1.0e0,1.0e0);   /* Twice PI */
const double RAD	= 360.0e0/TWOPI;              /* Degrees per radian */
const double LOG2	= log(2.0e0);                 /* Log base e of 2 */
const double LOG10 	= log(10.0e0);                /* Log base e of 10 */
const double ROOT2 	= sqrt(2.0e0);                /* Square root of 2 */
const double NI		= 1.45e16;                    /* Intrinsic concentration */

#endif /* #ifndef CONSTANT_H_INCLUDED */