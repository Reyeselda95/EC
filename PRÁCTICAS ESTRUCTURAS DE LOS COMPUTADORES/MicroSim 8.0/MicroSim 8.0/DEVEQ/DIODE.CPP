/* diode.c
 *   $Revision:   1.30  $
 *   $Author:   DEC  $
 *   $Date:   13 Nov 1996 15:55:20  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the diode model parameters    **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#define D_DEVICE

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "d.h"
#include "mserrors.h"

int d_Load(	/* Process diode for DC and TRANSIENT analyses */
  struct d_ *Instance,	/* a device to evaluate */
  int ModeFl,		/* mode control flag:	see "tran.h" */
  int InitFl,		/* initialization flag: see "tran.h" */
  int LoadFl,		/* NO: bypass MatPrm load if solution unchanged */
  double Tmod           /* temperature of this device */
  )		/* return: did not converge (YES/NO) */
/*****************************************************************************
* Purpose
*   Process diode for DC and TRANSIENT analyses
*
* Returned value
*   YES if converged, else NO
*
* Discussion
*
* Author
*   pwt	  12 Aug 86	creation
*   pwt	  16 Mar 88	add shared data area to D.H, change source to match
*   pwt	  ?? Jul 88	add high-injection effects
*   pwt	  17 Aug 88	add generation-recombination current effects
*   whjb  06 Apr 89	LoadFl==YES now forces full recalculation
*   pwt	  15 Apr 89	set T=0 cap. current
*   pwt	  11 Sep 89	add enhanced breakdown model
*   sv	  12 Feb 90	add local temperatures to models
*   pwt	  04 May 90	minor housekeeping
*   pwt	  31 Jul 91	minor correction on reverse current and G-R conductance
*   eks	  15 Apr 93	correction of forward current calculation
*   dec   13-Nov-96     Replaced some globals with calls to Get() functions,
*                       and made current temperature a function parameter
*
*****************************************************************************/
{ struct D_ *model;	/* device model */
  double
    vj, 		/* voltage across diode junction */
    ij, 		/* current thru diode */
    ij_hat,		/* predicted current */
    gj, 		/* conductance of diode junction */
    cap_d;		/* junction capacitance */

  int
    jlim_fl = YES,	/* junction limiting flag: YES, NO */
    pred_fl = NO,	/* pred. calculated  flag: YES, NO */
    nonconv = NO;	/* non-convergence   flag: YES, NO */

  double vt;

/* defines & declarations for state-vector access */

  struct dsv_def *sv[MSTVCT];

  UPDATE_SV(sv,Instance->d_sda.d_sv);

/* defines for model parameter access: simplify code appearance */

#define PARAM(a) ((double)model->a)
#define AF	PARAM(D_af)
#define BV	PARAM(D_bv)
#define CJO	PARAM(D_cjo)
#define EG	PARAM(D_eg)
#define FC	PARAM(D_fc)
#define F1	PARAM(D_f1)
#define F2	PARAM(D_f2)
#define F3	PARAM(D_f3)
#define IBV	PARAM(D_ibv)
#define IBVL	PARAM(D_ibvl)
#define IKF	PARAM(D_ikf)
#define IS	PARAM(D_is)
#define ISR	PARAM(D_isr)
#define KF	PARAM(D_kf)
#define M	PARAM(D_m)
#define N	PARAM(D_n)
#define NBV	PARAM(D_nbv)
#define NBVL	PARAM(D_nbvl)
#define NR	PARAM(D_nr)
#define RS	PARAM(D_rs)
#define TT	PARAM(D_tt)
#define VCRIT	PARAM(D_vcrit)
#define VJ	PARAM(D_vj)
#define XTI	PARAM(D_xti)

#define FCVJ	FC	/* = fc*vj */

#define IJ0	(Instance->dcv_ij)
#define GJ0	(Instance->dcv_gj)

#define CJ0	(Instance->d_sda.d_ac.dac_cj)

#define DevOff	(Instance->d_off)
#define AREA	(Instance->d_area)

/* find the model */

  model = Instance->d_model;

  vt	= Tmod*BOLTZ/CHARGE;
/* initialization */

  if	  ( InitFl==INSTV0 )			/* use prev. iteration */
    vj = VOLTAGE(d_p) - VOLTAGE(d_N);

  else if ( InitFl==INTRAN )			/* use prev. time-step */
    vj = D_VJ(1);

  else if ( InitFl==INOFF && DevOff==YES )	/* set "off" devices */
    vj = 0.;

  else if ( InitFl==ININIT ) {			/* use IC= values */
    if ( ModeFl==MDBPTR && NOSOLV==YES )
      vj = Instance->d_vj;
    else
      vj = ( DevOff ? 0.: VCRIT);
    }
  else {
    double del_vj, del_ij;

    if ( InitFl==INPRDCT ) {			/* extrapolate value */
      vj = ( D_VJ(1) - D_VJ(2) )*GetDELTA()/GetDELTAOLD() + D_VJ(1);
      *sv[0] = *sv[1];
      }
    else {					/* use prev. iteration */
      vj = VOLTAGE(d_p) - VOLTAGE(d_N);
      }

/* compute new non-linear branch voltage */

    del_vj = vj - D_VJ(0);
    del_ij = del_vj*GJ0;
    ij_hat = del_ij + IJ0;

/* bypass if solution not changed */

    if ( LoadFl ) ;
    else if ( InitFl==INPRDCT && GetDELTA()!=GetDELTAOLD() ) ;
    else if ( fabs(del_ij) >= CurrentTOL(ij_hat,    IJ0) ) ;
    else if ( fabs(del_vj) >= VoltageTOL(    vj,D_VJ(0)) ) ;
    else {
      goto done;
      }
    pred_fl = YES;

/* solution changed: limit new junction voltage */

    if ( BV==0.|| vj >= 10*vt*MAX(NBV,NBVL)-BV ) {
      double vte = N*vt;

      jlim_fl = PNJLIM(vj,D_VJ(0),vte,VCRIT);
      }
    else {
      double
	vj_now = -(BV+vj),
	vj_old = -(BV+D_VJ(0)),
	vtbv   = NBV*vt,
	tmp    = vtbv * log( vtbv / (ROOT2 * IBV) ),
	vcrit  = MAX(tmp,0.);

      jlim_fl = PNJLIM(vj_now,vj_old,vtbv,vcrit);

      if ( IBVL > 0.) {
	double
	  v2_now = -(BV+vj),
	  vtbvl  = NBVL*vt,
	  tmp	 = vtbvl * log( vtbvl / (ROOT2 * IBVL) ),
	  vcrit  = MAX(tmp,0.);

	jlim_fl |= PNJLIM(v2_now,vj_old,vtbvl,vcrit);

	if ( fabs(vj_old-v2_now) < fabs(vj_old-vj_now) ) vj_now = v2_now;
	}

      vj = -(vj_now+BV);
      }

    } /* end of initialization */

/* compute DC current & conductances */

  { double itmp, vtmp;

    if ( vj >= -10*(vtmp = N*vt) ) {	/* Shockley equation */
      double evj = EXP(vj/vtmp);

      ij   = IS*AREA*(evj-1);
      gj   = IS*AREA*(evj/vtmp);
      }
    else {
      ij = -IS*AREA;
      gj = 0.;
      }

    if ( BV!=0.&&
	 vj<=-MINREAL) {
      double ijr, gjr, k,
	bvj = -(vj+BV);

      if ( bvj >= -35*(vtmp = NBV*vt) ) {	/* UCB SPICE breakdown */
	itmp = EXP(bvj/vtmp)*IBV*AREA;
	ijr  = itmp;
	gjr  = itmp/vtmp;
	}
      else
	ijr =
	gjr = 0.;

      if ( IBVL!=0.&&
	   bvj >= -35*(vtmp = NBVL*vt) ) {	/* low-level breakdown */
	itmp = EXP(bvj/vtmp)*IBVL*AREA;
	ijr += itmp;
	gjr += itmp/vtmp;
	}

      if ( (k = vj/(10*vt)) > -1.) {	/* smooth-fit breakdown current */
	double			/* over -1 < k < 0, note: 0 test implicit */
	  fact = (2*k+3)*k*k;	/* use cubic: 2x^3 + 3x^2 */
				/* derivative: 6x^2 + 6x */
	gjr  = gjr*fact - ijr*6*(k+1)*k*k/vj;	/* do gjr first as ijr used */
	ijr *= fact;		/* note: f*g (d/dx) = f (dg/dx) + g (df/dx) */
	}

      ij -= ijr;
      gj += gjr;
    } }

  if ( IKF!=0. && ij > 0.) {		/* high-injection correction */
    double
      ikf    = IKF*AREA,
      factor = ikf/(ikf + ij),
      sqfctr = sqrt(factor);

    ij *= sqfctr;
    gj *= sqfctr*(factor+1)/2;
    }

  if ( ISR==0.) {			/* GMIN "leakage" */
    gj += GMIN;
    ij += GMIN*vj;
    }
  else {				/* gen.-rec. current effects */
    if (vj >= -10.0 * NR * vt) {
      double
	vtr  = NR*vt,
	evjr = EXP(vj/vtr),
	kv   = 1-vj/VJ,
	fact = kv*kv +.005,
	kw   = pow(fact,M/2),		/* depletion region width factor */
	ki   = kw*AREA*ISR;

      gj += ki*(evjr/vtr - (evjr-1)*M*kv/(fact*VJ));
      ij += ki*(evjr-1);
      }
    else {
      double
	kv   = 1-vj/VJ,
	fact = kv*kv +.005,
	kw   = pow(fact,M/2),		/* depletion region width factor */
	ki   = kw*AREA*ISR;

      gj += ki*M*kv/fact;
      ij += -ki;
      }
    }

/* charge calculations */

  if ( ModeFl==MDTRAN ||
       InitFl==INSTV0 ||
       ModeFl==MDBPTR && NOSOLV==YES ) {
    double cjo = CJO*AREA;		/* scale 0-bias cap. */

    PNJCHG(D_QCJ(0),cap_d,cjo,vj,VJ,FCVJ,M,F1,F2,F3);
    D_QCJ(0) += TT*ij;
    cap_d    += TT*gj;

    D_ICJ(0) = 0.;	/* reset, so T=0 results (e.g. Probe) are correct */

    if ( InitFl==INSTV0 ) {	/* store small-signal parameters */
      CJ0     = cap_d;		/* and update state vector values */

      goto load;
      }

    if ( !(ModeFl==MDBPTR && NOSOLV==NO) ) {	/* transient analysis */
      double g_eq, i_eq;

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	D_QCJ(2) = D_QCJ(1) = D_QCJ(0); 	/* set "old" charges so */
	}					/* integration works */

      INTEGR8(g_eq,i_eq,cap_d,D_QIJ(0),D_QIJ(1),D_QIJ(2));
      gj += g_eq;
      ij += D_ICJ(0);

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	D_ICJ(1) = D_ICJ(0);			/* set "old" currents so */
	}					/* time-step calc. works */
    } } /* end of charge calculations */

/* check convergence */

  if ( pred_fl && (
	 jlim_fl ||
	 fabs(ij_hat-ij) > CurrentTOL(ij_hat,ij)
	 )
       ) nonconv = YES;

load:
  { double gspr;

	/* load current vector */

    Y_MATRIX(d_ip) = -( Y_MATRIX(d_iN) =  ij - gj*vj );

	/* load conductance matrix */

    Y_MATRIX(d_Np) = Y_MATRIX(d_pN) = -( Y_MATRIX(d_NN) = gj );

    Y_MATRIX(d_pp) = gj + ( gspr = AREA*RS );

    if ( LoadFl ) {
      Y_MATRIX(d_Pp) = Y_MATRIX(d_pP) = -( Y_MATRIX(d_PP) = gspr );
    } }

  D_VJ(0) = vj;

  IJ0	  = ij;
  GJ0	  = gj;

done:
  return nonconv;
  }
