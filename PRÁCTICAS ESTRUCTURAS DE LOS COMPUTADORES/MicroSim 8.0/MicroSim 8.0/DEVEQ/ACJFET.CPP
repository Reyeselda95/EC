/* acjfet.c
 *   $Revision:   1.14  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:36:24  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the JFET model parameters	   **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#include "mslib.h"
#include "tran.h"
#include "dev.h"
#include "j.h"

void j_ACLoad(	/* Process JFET for AC analysis */
  struct j_ *Instance,	/* device to evaluate */
  double Omega	 	/* 2*pi*frequency */
  )
/*****************************************************************************
* Purpose
*   Process JFET for AC analysis
*
* Returned value
*   None
*
* Discussion
*
* Author
*   whjb  26 Mar 87	created (from code taken from ACLoad)
*   pwt   16 Jul 87	correct for forward/reverse device operation
*   pwt   06 Aug 87	re-written
*   pwt   04 Mar 88	rename from JfetAC
*   pwt   20 Sep 88	include changes to JFET.C ("copy" matrix load from JFET.C)
*
*****************************************************************************/
{
double& AREA = (Instance->j_area);	/* device area */
double& GM = (Instance->jcv_gm);	/* active conductances */
double& GDS = (Instance->jcv_gds);
double& GGS = (Instance->jcv_ggs);
double& GGD = (Instance->jcv_ggd);
double& GGDS = (Instance->jcv_ggds);
double& GGGS = (Instance->jcv_gggs);

double& CGS = (Instance->j_sda.j_ac.jac_cgs);	/* capacitances */
double& CGD = (Instance->j_sda.j_ac.jac_cgd);

MDLPARM& RD = (Instance->j_model->J_rd);	/* passive conductances */
MDLPARM& RS = (Instance->j_model->J_rs);

  struct jsv_def *sv[1];		/* state vector */
  double gdpr, gspr, xgd, xgs;
  int fwd;				/* forward/reverse mode */

  UPDATE_SV0(sv,Instance->j_sda.j_sv);

  fwd = J_VGS(0) > J_VGD(0) ? YES : NO;

/* load matrix */

  AC_MAT_I(j_Gd) = AC_MAT_I(j_dG) = -( AC_MAT_I(j_dd) = xgd = Omega*CGD );
  AC_MAT_I(j_Gs) = AC_MAT_I(j_sG) = -( AC_MAT_I(j_ss) = xgs = Omega*CGS );

  AC_MAT_I(j_GG) = xgd+xgs;

  AC_MAT_R(j_dD) = AC_MAT_R(j_Dd) = -( AC_MAT_R(j_DD) = gdpr = AREA*RD );
  AC_MAT_R(j_ds) = ( fwd ? -GM - GGGS - GGDS :	0. ) - GDS;
  AC_MAT_R(j_dG) = ( fwd ?  GM + GGGS	     : -GM ) - GGD;
  AC_MAT_R(j_dd) = ( fwd ?		GGDS :	GM ) + GDS + GGD + gdpr;

  AC_MAT_R(j_sS) = AC_MAT_R(j_Ss) = -( AC_MAT_R(j_SS) = gspr = AREA*RS );
  AC_MAT_R(j_sd) = ( fwd ?  0. : -GM - GGGS - GGDS ) - GDS;
  AC_MAT_R(j_sG) = ( fwd ? -GM :  GM + GGGS	   ) - GGS;
  AC_MAT_R(j_ss) = ( fwd ?  GM :	      GGDS ) + GDS + GGS + gspr;

  AC_MAT_R(j_Gd) = ( fwd ? -GGDS	: GGGS + GGDS ) - GGD;
  AC_MAT_R(j_Gs) = ( fwd ?  GGDS + GGGS :      - GGDS ) - GGS;
  AC_MAT_R(j_GG) = GGD + GGS - GGGS;

  } /* End of ACLoad_J */
