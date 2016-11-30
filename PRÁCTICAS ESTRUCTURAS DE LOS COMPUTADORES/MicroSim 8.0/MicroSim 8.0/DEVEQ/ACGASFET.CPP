/* acgasfet.c
 *   $Revision:   1.17  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:37:34  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the GaAsFET model parameters  **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#include "mslib.h"
#include "tran.h"
#include "dev.h"
#include "b.h"
#include "mserrors.h"
#include "psmesfet.h"		/* (level==4) PS mesfet model declarations */

void b_ACLoad(	/* Process GaAsFET for AC analysis */
  struct b_ *Instance,	/* device to evaluate */
  double Omega	 	/* 2*pi*frequency */
  )
/*****************************************************************************
* Purpose
*   Process GaAsFET for AC analysis
*
* Returned value
*   None
*
* Discussion
*
* Author
*   whjb  27 Mar 87	created (from code taken from ACLoad)
*   pwt   15 Jul 87	include device forward/reverse mode calculations
*   pwt   03 Nov 87	correct TAU contribution
*   pwt   20 Jan 88	correct d-s conductance (typo) error
*   pwt   04 Mar 88	rename from GfetAC
*   eks   12 Oct 94	add support for level=4 Parker-Skellern MESFET model
*   eks   01 Nov 95	changed PSacload to eliminate compiler warnings
*                       associated with psmesfet.c 
*
*****************************************************************************/
{
double& AREA = (Instance->b_area);	/* device area */
double& GM = (Instance->bcv_gm);	/* active conductances */
double& GDS = (Instance->bcv_gds);
double& GGS = (Instance->bcv_ggs);
double& GGD = (Instance->bcv_ggd);

double& CGS = (Instance->b_sda.b_ac.bac_cgs);	/* capacitances */
double& CGD = (Instance->b_sda.b_ac.bac_cgd);
double& CDS = (Instance->b_sda.b_ac.bac_cds);

MDLPARM& RD = (Instance->b_model->B_rd);	/* passive conductances */
MDLPARM& RG = (Instance->b_model->B_rg);
MDLPARM& RS = (Instance->b_model->B_rs);

MDLPARM& TAU = (Instance->b_model->B_tau);	/* transit time */

  struct bsv_def *sv[1];		/* state vector */
  double gdpr, gspr,
    xgs = Omega*CGS,
    xgd = Omega*CGD,
    xds = Omega*CDS,
    xgm = 0.,
    gm	= GM;
  double PSmesfetGDS=GDS;	/* (level==4) PS mesfet model GDS storage */

  int fwd;				/* forward/reverse mode */

  UPDATE_SV0(sv,Instance->b_sda.b_sv);

  fwd = B_VGS(0) > B_VGD(0) ? YES : NO;

  /* (level==4) PS mesfet model conductance calculation */
  if (NINT((double)((Instance->b_model)->B_level))==4) {
    PSacload(Instance->b_model, Instance, B_VGS(0), B_VGD(0),
		     Instance->bcv_id, Omega, &gm, &xgm, &PSmesfetGDS, &xds);
    if ( TAU != 0.) {
      double
        arg = Omega*TAU,
	     cm  = 1/(1+arg*arg);

      xgm = (xgm - arg*gm)*cm;
      gm  = (xgm*arg + gm)*cm;
      }
    } 
  else {	/* (level==4) PS mesfet model conductance calculation */

    if ( TAU != 0.) {
      double
        arg = Omega*TAU,
        mag = gm/sqrt(1+arg*arg),
        phs = -atan(arg);

      xgm = mag*sin(phs);
      gm	= mag*cos(phs);
      }
    }	/* else (level==4) PS mesfet model */

/* Load matrix */

  AC_MAT_I(b_dg) = ( fwd ?  xgm : -xgm ) - xgd;
  AC_MAT_I(b_ds) = ( fwd ? -xgm :  0.  ) - xds;
  AC_MAT_I(b_dd) = ( fwd ?  0.	:  xgm ) + xgd + xds;

  AC_MAT_I(b_sd) = ( fwd ?  0.	: -xgm ) - xds;
  AC_MAT_I(b_sg) = ( fwd ? -xgm :  xgm ) - xgs;
  AC_MAT_I(b_ss) = ( fwd ?  xgm :  0.  ) + xds + xgs;

  AC_MAT_I(b_gd) = -xgd;
  AC_MAT_I(b_gs) = -xgs;
  AC_MAT_I(b_gg) =  xgd+xgs;

  AC_MAT_R(b_Dd) = AC_MAT_R(b_dD) = -( AC_MAT_R(b_DD) = gdpr = AREA*RD );
  AC_MAT_R(b_Ss) = AC_MAT_R(b_sS) = -( AC_MAT_R(b_SS) = gspr = AREA*RS );
  AC_MAT_R(b_Gg) = AC_MAT_R(b_gG) = -( AC_MAT_R(b_GG) = RG );

/* (level==4) PS mesfet model GDS changed to PSmesfetGDS, 4 places */

  AC_MAT_R(b_ds) = ( fwd ? -gm :  0. ) - PSmesfetGDS;
  AC_MAT_R(b_dg) = ( fwd ?  gm : -gm ) - GGD;
  AC_MAT_R(b_dd) = ( fwd ?  0. :  gm ) + PSmesfetGDS + GGD + gdpr;

  AC_MAT_R(b_sd) = ( fwd ?  0. : -gm ) - PSmesfetGDS;
  AC_MAT_R(b_sg) = ( fwd ? -gm :  gm ) - GGS;
  AC_MAT_R(b_ss) = ( fwd ?  gm :  0. ) + PSmesfetGDS + GGS + gspr;

  AC_MAT_R(b_gd) = -GGD;
  AC_MAT_R(b_gs) = -GGS;
  AC_MAT_R(b_gg) =  GGD + GGS + RG;

  } /* End of ACLoad_B */
