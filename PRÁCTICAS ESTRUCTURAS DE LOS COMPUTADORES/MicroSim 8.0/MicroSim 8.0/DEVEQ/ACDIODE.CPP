/* acdiode.c
 *   $Revision:   1.10  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:34:28  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the diode model parameters    **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.     **********/

#include "mslib.h"
#include "tran.h"
#include "dev.h"
#include "d.h"

void d_ACLoad(	/* Process diode for AC analysis */
  struct d_ *Instance,	/* device to evaluate */
  double Omega		/* 2*pi*frequency */
  )
/*****************************************************************************
* Purpose
*   Process diode for AC analysis
*
* Returned value
*   None
*
* Discussion
*
* Author
*   whjb  24 Mar 87	created (from code taken from ACLoad)
*   pwt	  06 Aug 87	re-written
*   pwt	  04 Mar 88	re-named
*
*****************************************************************************/
{
double& GD = (Instance->dcv_gj);		/* diode conductance */
double& CJ = (Instance->d_sda.d_ac.dac_cj);	/* diode capacitance */

  double gspr;	/* area-scaled series cond. */

/* Stuff terms into matrix */

  AC_MAT_I(d_Np) = AC_MAT_I(d_pN) = -(
  AC_MAT_I(d_NN) = AC_MAT_I(d_pp) = Omega*CJ );

  AC_MAT_R(d_Np) = AC_MAT_R(d_pN) = -GD;
  AC_MAT_R(d_NN) = GD;

  AC_MAT_R(d_Pp) = AC_MAT_R(d_pP) = -(
  AC_MAT_R(d_PP) = gspr = Instance->d_area * Instance->d_model->D_rs );

  AC_MAT_R(d_pp) = gspr + GD;

  } /* End ACLoad_D */
