/* jfet.c
 *   $Revision:   1.25  $
 *   $Author:   DEC  $
 *   $Date:   14 Nov 1996 11:02:04  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the JFET model parameters	   **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#define J_DEVICE

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "j.h"
#include "mserrors.h"

int j_Load(	/* Process JFET for DC and TRANSIENT analyses */
  struct j_ *Instance,	/* a device to evaluate */
  int ModeFl,	/* mode control flag:	see "tran.h" */
  int InitFl,	/* initialization flag: see "tran.h" */
  int LoadFl,	/* NO: bypass MatPrm load if solution unchanged */
  double Tmod           /* temperature of this device */
  )		/* return: did not converge (YES/NO) */
/*****************************************************************************
* Purpose
*   Process JFET for DC and TRANSIENT analyses
*
* Returned value
*   YES if converged, else NO
*
* Discussion
*
* Author
*   pwt	  15 Aug 86	creation
*   pwt	  16 Mar 88	add shared data area to J.H, change source to match
*   pwt	  17 Aug 88	add generation-recombination current effects
*   pwt	  15 Sep 88	add active gate current, due to impact ionization in channel
*   whjb  06 Apr 89	LoadFl==YES forces full recalculation
*   pwt	  15 Apr 89	set T=0 cap. currents
*   sv	  12 Feb 90	add local temperatures to models
*   pwt	  04 May 90	minor speed-up in some calculations
*   pwt	  08 Aug 90	correct IC= for device type
*   pwt	  31 Jul 91	minor correction on gen-rec conductance
*   dec   13-Nov-96     Replaced some globals with calls to Get() functions,
*                       and made current temperature a function parameter
*
*****************************************************************************/
{ struct J_ *model;	/* device model */
  double
    beta,		/* device transconductance */
    isat,		/* junction saturation current */
    vds, vgs, vgd,	/* terminal voltages */
    vte,		/* emission coef. * thermal voltage */
    gm, 		/* forward transconductance */
    gds, ggs, ggd,	/* conductances */
    ggds, gggs,
    ig, id, igd,	/* currents */
    idrain,		/* drain current */
    ig_hat, id_hat,	/* predicted currents */
    cap_gs, cap_gd,	/* junction capacitances */
    type;		/* NJF=+1, PJF=-1 */

  double vt;

  int
    jlim_fl = YES,	/* junction limiting flag: YES, NO */
    pred_fl = NO,	/* pred. calculated  flag: YES, NO */
    nonconv = NO;	/* non-convergence   flag: YES, NO */

/* defines & declarations for state-vector access */

  struct jsv_def *sv[MSTVCT];

  UPDATE_SV(sv,Instance->j_sda.j_sv);

/* defines for model parameter access: simplify code appearance */

#define PARAM(a) ((double)model->a)
#define AF	PARAM(J_af)
#define ALPHA	PARAM(J_alpha)
#define BETA	PARAM(J_beta)
#define CGD	PARAM(J_cgd)
#define CGS	PARAM(J_cgs)
#define FC	PARAM(J_fc)
#define FCPB	FC		/* = fc*pb */
#define F1	PARAM(J_f1)
#define F2	PARAM(J_f2)
#define F3	PARAM(J_f3)
#define IS	PARAM(J_is)
#define ISR	PARAM(J_isr)
#define KF	PARAM(J_kf)
#define LAMBDA	PARAM(J_lambda)
#define M	PARAM(J_m)
#define N	PARAM(J_n)
#define NR	PARAM(J_nr)
#define PB	PARAM(J_pb)
#define RD	PARAM(J_rd)
#define RS	PARAM(J_rs)
#define VCRIT	PARAM(J_vcrit)
#define VK	PARAM(J_vk)
#define VTO	PARAM(J_vto)

#define IG0	(Instance->jcv_ig)
#define ID0	(Instance->jcv_id)

#define GM0	(Instance->jcv_gm)
#define GDS0	(Instance->jcv_gds)
#define GGS0	(Instance->jcv_ggs)
#define GGD0	(Instance->jcv_ggd)
#define GGDS0	(Instance->jcv_ggds)
#define GGGS0	(Instance->jcv_gggs)

#define CGS0	(Instance->j_sda.j_ac.jac_cgs)
#define CGD0	(Instance->j_sda.j_ac.jac_cgd)

#define DevOff	(Instance->j_off)
#define AREA	(Instance->j_area)

/* find the model */

  model = Instance->j_model;

  vt	= Tmod*BOLTZ/CHARGE;
  type	= model->J_type > 0 ? 1.: -1.;

/* some DC model parameters */

  vte = N*vt;

/* initialization */

  if	  ( InitFl==INSTV0 ) {		/* use prev. iteration */
    vgs = ( VOLTAGE(j_G) - VOLTAGE(j_s) )*type;
    vgd = ( VOLTAGE(j_G) - VOLTAGE(j_d) )*type;
    }
  else if ( InitFl==INTRAN ) {		/* use prev. time-step */
    vgs = J_VGS(1);
    vgd = J_VGD(1);
    }
  else if ( InitFl==INOFF &&		/* set "off" devices */
	    DevOff==YES)
    vgs = vgd = 0.;

  else if ( InitFl==ININIT ) {		/* use IC= values */

    if ( ModeFl==MDBPTR && NOSOLV==YES ) {
      vgs = (	 Instance->j_vgs)*type;
      vgd = (vgs-Instance->j_vds)*type;
      }
    else
      vgd = vgs = ( DevOff ? 0.: -1.)*type;
    }
  else {
    double del_vgs, del_vgd, del_vds, del_id, del_ig;

    if ( InitFl==INPRDCT ) {		/* extrapolate value */
      double arg = GetDELTA()/GetDELTAOLD();

      vgs = arg*( J_VGS(1) - J_VGS(2) ) + J_VGS(1);
      vgd = arg*( J_VGD(1) - J_VGD(2) ) + J_VGD(1);

      *sv[0] = *sv[1];
      }
    else {				/* use current value */
      vgs = ( VOLTAGE(j_G) - VOLTAGE(j_s) )*type;
      vgd = ( VOLTAGE(j_G) - VOLTAGE(j_d) )*type;
      }

/* compute new non-linear branch voltage */

    del_vgd = vgd - J_VGD(0);
    del_vgs = vgs - J_VGS(0);
    del_vds = del_vgs - del_vgd;

    del_id = del_vds*GDS0 - del_vgd*GGD0 +
	     ( J_VGS(0) > J_VGD(0) ? del_vgs : del_vgd )*GM0;
    id_hat = del_id + ID0;

    del_ig = del_vgs*GGS0 + del_vgd*GGD0;
    ig_hat = del_ig + IG0;

/* bypass if solution not changed */

    if ( InitFl==INPRDCT && GetDELTA()!=GetDELTAOLD() || LoadFl==YES) ;
    else if ( fabs(del_id)  >= CurrentTOL(id_hat,     ID0) ) ;
    else if ( fabs(del_vgd) >= VoltageTOL(   vgd,J_VGD(0)) ) ;
    else if ( fabs(del_vgs) >= VoltageTOL(   vgs,J_VGS(0)) ) ;
    else if ( fabs(del_ig)  >= CurrentTOL(ig_hat,     IG0) ) ;
    else {
      goto done;
      }
    pred_fl = YES;

/* solution changed: limit non-linear branch voltages */

    jlim_fl  = PNJLIM(vgs,J_VGS(0),vte,VCRIT);
    jlim_fl |= PNJLIM(vgd,J_VGD(0),vte,VCRIT);

    FETlim(&vgs,J_VGS(0),VTO);
    FETlim(&vgd,J_VGD(0),VTO);

    } /* end of initialization */

/* compute DC current & conductances */

  beta = AREA*BETA;
  isat = AREA*IS;
  vds  = vgs-vgd;

/* compute gate junction current & derivatives */

  if ( vgs > -10*vte ) {		/* currents re. vgs */
    double evgs = EXP(vgs/vte);

    ggs = (evgs/vte)*isat;
    ig	= (evgs-1)*isat;
    }
  else {
    ggs = 0.;
    ig	= -isat;
    }

  if ( vgd > -10*vte ) {		/* currents re. vgd */
    double evgd = EXP(vgd/vte);

    ggd = (evgd/vte)*isat;
    igd = (evgd-1)*isat;
    }
  else {
    ggd = 0.;
    igd = -isat;
    }

  if ( ISR==0.) {			/* traditional SPICE leakage */
    ggs += GMIN;
    ggd += GMIN;
    ig	+= GMIN*vgs;
    igd += GMIN*vgd;
    }
  else {				/* gen.-rec. current effects */
    double
      vtr  = NR*vt,
      evjr = EXP(vgs/vtr),
      kv   = 1-vgs/PB,
      fact = kv*kv +.005,
      kw   = pow(fact,M/2),	/* depletion region width factor */
      ki   = kw*AREA*ISR;

    ggs += ki*(evjr/vtr - (evjr-1)*M*kv/(fact*PB));	/* gate-source */
    ig	+= ki*(evjr-1);

    evjr = EXP(vgd/vtr);
    kv	 = 1-vgd/PB;
    fact = kv*kv +.005;
    kw	 = pow(fact,M/2);
    ki	 = kw*AREA*ISR;

    ggd += ki*(evjr/vtr - (evjr-1)*M*kv/(fact*PB));	/* gate-drain */
    igd += ki*(evjr-1);
    }

/* compute drain current & derivatives */

  if ( vds >= 0. ) {			/* forward mode */
    double vgst = vgs-VTO;

    if ( vgst <= 0. )			/* cut-off */
      idrain = gm = gds = ggds = gggs = 0.;
    else {
      double
	beta1 = beta*(1+vds*LAMBDA),
	beta2 = beta1+beta1;

      if ( vds > vgst ) {		/* saturated */
	idrain = beta1*vgst*vgst;
	gm     = beta2*vgst;
	gds    = beta*vgst*vgst*LAMBDA;

	if ( ALPHA==0.) {
	  ggds = gggs = 0.;
	  }
	else {			/* gate current from impact ionization */
	  double
	    vdif = vds - vgst,	/* don't let vdif==0 (careful test for saturation) */
	    vrat = VK/vdif,
	    temp = ALPHA*EXP(-vrat);

	  igd	-= temp*vdif*idrain;
	  ggds	 = temp*( vdif*gds + (1+vrat)*idrain );
	  gggs	 = temp*( vdif*gm  - (1+vrat)*idrain );
	} }
      else {				/* linear */
	idrain = beta1*vds*(vgst+vgst-vds);
	gm     = beta2*vds;
	gds    = beta2*(vgst-vds) + beta*vds*(vgst+vgst-vds)*LAMBDA;
	ggds   =
	gggs   = 0.;
    } } }
  else {				/* reverse mode */
    double vgdt = vgd-VTO;

    if ( vgdt <= 0. )			/* cut-off */
      idrain = gm = gds = ggds = gggs = 0.;
    else {
      double
	beta1  =  beta*(1-vds*LAMBDA),
	beta2  =  beta1+beta1;

      if ( vgdt < -vds ) {		/* saturated */
	idrain = -beta1*vgdt*vgdt;
	gm     =  beta2*vgdt;
	gds    =  beta*vgdt*vgdt*LAMBDA;

	if ( ALPHA==0.) {
	  ggds = gggs = 0.;
	  }
	else {			/* gate current from impact ionization */
	  double
	    vdif = -vds - vgdt, /* don't let vdif==0 (careful test for saturation) */
	    vrat = VK/vdif,
	    temp = ALPHA*EXP(-vrat);

	  ig	+= temp*vdif*idrain;
	  ggds	 = temp*( vdif*gds - (1+vrat)*idrain );
	  gggs	 = temp*( vdif*gm  + (1+vrat)*idrain );
	} }
      else {				/* linear */
	idrain =  beta1*vds*(vgdt+vgdt+vds);
	gm     = -beta2*vds;
	gds    =  beta2*(vgdt+vds) - beta*vds*(vgdt+vgdt+vds)*LAMBDA;
	ggds   =
	gggs   = 0.;
    } } }

  ig += igd;		/* total gate current */
  id  = idrain-igd;	/* total drain current */

/* charge calculations */

  if ( ModeFl==MDTRAN ||
       InitFl==INSTV0 ||
     ( ModeFl==MDBPTR && NOSOLV==YES ) ) {
    double
      cgso = CGS*AREA,		/* scale 0-bias cap. */
      cgdo = CGD*AREA;

    PNJCHG(J_QCGS(0),cap_gs,cgso,vgs,PB,FCPB,M,F1,F2,F3);
    PNJCHG(J_QCGD(0),cap_gd,cgdo,vgd,PB,FCPB,M,F1,F2,F3);

    J_ICGS(0) = 	/* reset, so T=0 results (e.g. Probe) are correct */
    J_ICGD(0) = 0.;

    if ( InitFl==INSTV0) {		/* store small-signal parameters */
      CGS0 = cap_gs;			/* and update the state vector */
      CGD0 = cap_gd;

      goto load;
      }

    if ( !(ModeFl==MDBPTR && NOSOLV==NO) ) {	/* transient analysis */
      double g_eq, i_eq;

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	J_QCGS(2) = J_QCGS(1) = J_QCGS(0);	/* set "old" charges so */
	J_QCGD(2) = J_QCGD(1) = J_QCGD(0);	/* integration works */
	}

      INTEGR8(g_eq,i_eq,cap_gs,J_QIGS(0),J_QIGS(1),J_QIGS(2));
      ggs += g_eq;

      INTEGR8(g_eq,i_eq,cap_gd,J_QIGD(0),J_QIGD(1),J_QIGD(2));
      ggd += g_eq;

      ig  += J_ICGD(0) + J_ICGS(0);
      igd += J_ICGD(0);
      id  -= J_ICGD(0);

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	J_ICGS(1) = J_ICGS(0);			/* set "old" currents so */
	J_ICGD(1) = J_ICGD(0);			/* time-step calc. works */
	}
    } } /* end of charge calculations */

/* check convergence */

  if ( pred_fl && (
	 jlim_fl ||
	 fabs(id_hat-id) > CurrentTOL(id_hat,id) ||
	 fabs(ig_hat-ig) > CurrentTOL(ig_hat,ig)
	 )
       ) nonconv = YES;

load:
  { int fwd = ( vds > 0. ? YES : NO );
    double
      gdpr, gspr,
      ieq_gd =	    igd - ggd*vgd + ( fwd ?	gggs*vgs + ggds*vds : 0.),
      ieq_gs = ig - igd - ggs*vgs + ( fwd ? 0.: gggs*vgd - ggds*vds ),
      ieq_dr = id + igd - gds*vds - gm*( fwd ? vgs : -vgd );

	/* load current vector */

    Y_MATRIX(j_iG) = -type*(ieq_gs + ieq_gd);
    Y_MATRIX(j_id) =  type*(ieq_gd - ieq_dr);
    Y_MATRIX(j_is) =  type*(ieq_gs + ieq_dr);

	/* load conductance matrix */

    Y_MATRIX(j_ds) = ( fwd ? -gm - gggs - ggds :  0. ) - gds;
    Y_MATRIX(j_dG) = ( fwd ?  gm + gggs        : -gm ) - ggd;
    Y_MATRIX(j_dd) = ( fwd ?		  ggds :  gm ) + gds + ggd
		   + ( gdpr = AREA*RD );

    Y_MATRIX(j_sd) = ( fwd ?  0. : -gm - gggs - ggds ) - gds;
    Y_MATRIX(j_sG) = ( fwd ? -gm :  gm + gggs	     ) - ggs;
    Y_MATRIX(j_ss) = ( fwd ?  gm :		ggds ) + gds + ggs
		   + ( gspr = AREA*RS );

    Y_MATRIX(j_Gd) = ( fwd ? -ggds	  : gggs + ggds ) - ggd;
    Y_MATRIX(j_Gs) = ( fwd ?  ggds + gggs :	 - ggds ) - ggs;
    Y_MATRIX(j_GG) = ggd + ggs - gggs;

    if ( LoadFl ) {
      Y_MATRIX(j_dD) = Y_MATRIX(j_Dd) = -( Y_MATRIX(j_DD) = gdpr );
      Y_MATRIX(j_sS) = Y_MATRIX(j_Ss) = -( Y_MATRIX(j_SS) = gspr );
    } }

  J_VGS(0) = vgs;
  J_VGD(0) = vgd;

  IG0  = ig ;
  ID0  = id ;

  GM0	= gm ;
  GDS0	= gds;
  GGS0	= ggs;
  GGD0	= ggd;
  GGDS0 = ggds;
  GGGS0 = gggs;

done:
  return nonconv;
  }


