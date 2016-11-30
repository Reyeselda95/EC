/* mos4.c
 *   $Revision:   1.27  $
 *   $Author:   DEC  $
 *   $Date:   14 Nov 1996 13:52:44  $ */

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"

#define PARAM(a)	((double)Model->a)
#define VDD		PARAM(BSIM_vdd)
#define BSIM_phi0	M_phi
#define BSIM_eta0	M_eta
#define BSIM_tox	M_tox

/* #define DEBUG */	/* debug print every iteration */
/* #define DEBUG1 */	/* debug print after DEBUG_TIME */
#define DEBUG_TIME	4.0e-6

#ifdef	DEBUG
#define DB_GO
#endif
#ifdef	DEBUG1
#define DB_GO		if ( TIME >= DEBUG_TIME )
#endif

void MOS4eval(
struct M_ *Model,	/* (R) pointer to model parameters */
double Len,		/* (R) device size */
double Wid,		/* (R) device size */
double Mdev,		/* (R) device size */
double Vgs,		/* (R) terminal voltages */
double Vds,		/* (R) terminal voltages */
double Vbs,		/* (R) terminal voltages */
double *Von,		/* (W) characteristic voltages */
double *Vdsat,		/* (W) characteristic voltages */
double *Id,		/* (W) drain current */
double *Gds,		/* (W) device conductances */
double *Gm,		/* (W) device conductances */
double *Gmbs,		/* (W) device conductances */
int Charge,		/* (R) YES: do charge calculations */
double *Cggb,		/* (W) capacitances */
double *Cgdb,		/* (W) capacitances */
double *Cgsb,		/* (W) capacitances */
double *Cdgb,		/* (W) capacitances */
double *Cddb,		/* (W) capacitances */
double *Cdsb,		/* (W) capacitances */
double *Cbgb,		/* (W) capacitances */
double *Cbdb,		/* (W) capacitances */
double *Cbsb,		/* (W) capacitances */
double *Qg,		/* (W) charges */
double *Qd,		/* (W) charges */
double *Qb,		/* (W) charges */
double *NoiseBeta,	/* (W) noise beta */
double Tmod)        /* (R) temperature */
/*****************************************************************************
* Purpose
*   Evaluate MOS level 4 (BSIM: Berkeley Short-Channel IGFET Model) model
*
* Returned value
*   Number of convergence checks which failed
*
*  Discussion
*   LdFrc controls whether this routine does a full or a partial load.
*   For LdFrc==YES MatPrm is zeroed and then all devices put in their
*   contributions.  For LdFrc==NO, the matrix is not zeroed and only
*   those devices which need to (which have changed) overwrite their
*   matrix terms.  In both cases, at the end of this routine MatPrm
*   is copied into MatWrk and all MatPrm's overflow terms are added
*   into the correct positions of MatWrk.  MatWrk is then ready for
*   the matrix solving routines.
*
* Author
*   pwt  - 30 Dec 87 - creation
*   pwt  - 10 Mar 88 - bug fix re. Burr-Brown beta-site
*   pwt  - 15 Apr 89 - add device multiplier, to fix delta Width parameter calc.
*   whjb - 12 Jun 89 - Made use of EXP() macro
*   sv	 - 12 Feb 90 - add local temperatures to models.
*   dec  - 11 May 94 - changed remaining exp()'s to EXP()'s
*   gwb  - 21 Sep 94 - limit vdvt to prevent floating-point overflow.
*   gwb  - 15 Aug 96 - additions for new mosfet noise model
*   dec  - 14 Nov 96 - temperature now passed in as function argument
*
*****************************************************************************/

{
/* Local variables */

double
    vgst, vpb, sqrt_vpb,
    G, dG_dvbs,
    A, dA_dvbs,
    ugs, dugs_dvbs,
    uds, duds_dvbs, duds_dvds,
    eta, deta_dvbs, deta_dvds,
    dvth_dvbs, dvth_dvds,
    cox = 3.453e-13/(PARAM(BSIM_tox)*1e-4), /* tox in microns, cox in F/cm^2 */
    cox_wl = cox*Wid/Len,
    betaZero = cox_wl*Model->BSIM_mobZero;



  double vt;


/* device parameter set-up: this is done once in SPICE3, but every time in
 * PSpice to save storage and facilitate Monte Carlo, parameter sweeps, etc.
 */

#define BSIMsetup(a0,aL,aW) (Model->a0 + Model->aL*olen + Model->aW*owid)

  double
    olen = (1e-6)/Len,		/* in 1/micron */
    owid = (1e-6)/(Wid/Mdev),	/* in 1/micron */
    vfb  = BSIMsetup(	BSIM_vfb0,	BSIM_vfbL,	BSIM_vfbW ),
    phi  = BSIMsetup(	BSIM_phi0,	BSIM_phiL,	BSIM_phiW ),
    K1	 = BSIMsetup(	BSIM_K10,	BSIM_K1L,	BSIM_K1W ),
    K2	 = BSIMsetup(	BSIM_K20,	BSIM_K2L,	BSIM_K2W );

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"Enter BSIM \n");
#endif

  vt   = Tmod*BOLTZ/CHARGE;
  if ( phi < .1) phi = .1;
  if ( K1  < 0.) K1  = 0.;
  if ( K2  < 0.) K2  = 0.;

  *Von = /* vt0 = */ vfb + phi + K1*sqrt(phi) - K2*phi;

  { double
      ugsB = BSIMsetup( BSIM_ugsB0, BSIM_ugsBL, BSIM_ugsBW );

    ugs  = BSIMsetup( BSIM_ugs0, BSIM_ugsL, BSIM_ugsW );
    ugs += ugsB*Vbs;
    if ( ugs <= 0.)
      ugs = dugs_dvbs = 0.;
    else
      dugs_dvbs = ugsB;
    }

  { double
      udsB = BSIMsetup( BSIM_udsB0, BSIM_udsBL, BSIM_udsBW ),
      udsD = BSIMsetup( BSIM_udsD0, BSIM_udsDL, BSIM_udsDW );

    uds  = BSIMsetup( BSIM_uds0, BSIM_udsL, BSIM_udsW );
    uds += udsB*Vbs + udsD*(Vds-VDD);
    if ( uds <= 0.)
      uds = duds_dvbs = duds_dvds = 0.;
    else {
      uds      *= olen;
      duds_dvbs = udsB*olen;
      duds_dvds = udsD*olen;
    } }

  { double
      etaB = BSIMsetup( BSIM_etaB0, BSIM_etaBL, BSIM_etaBW ),
      etaD = BSIMsetup( BSIM_etaD0, BSIM_etaDL, BSIM_etaDW );

    eta  = BSIMsetup( BSIM_eta0, BSIM_etaL, BSIM_etaW );
    eta += etaB*Vbs + etaD*(Vds-VDD);
    if ( eta <= 0.)
      eta = deta_dvds = deta_dvbs = 0.;
    else if ( eta > 1.) {
      eta = 1.;
      deta_dvds = deta_dvbs = 0.;
      }
    else {
      deta_dvds = etaD;
      deta_dvbs = etaB;
    } }

  vpb	  = Vbs < 0. ? phi - Vbs : phi;
  sqrt_vpb = sqrt( vpb );

  *Von = vfb + phi + K1*sqrt_vpb - K2*vpb - eta*Vds;
  vgst = Vgs - *Von;

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"  BSIM: phi,Von,vgst,vpb %14.5e%14.5e%14.5e%14.5e \n",
                     phi,*Von,vgst,vpb);
#endif

  dvth_dvds = -(eta + deta_dvds*Vds);
  dvth_dvbs = K2 - .5*K1/sqrt_vpb - deta_dvbs*Vds;

  G = 1 - 1/(1.744 + .8364*vpb);
  A = 1 + .5*G*K1/sqrt_vpb;
  A = MAX( A, 1.);	/* Modified */
  dG_dvbs = -.8364*(1-G)*(1-G);
  dA_dvbs = .25*K1/sqrt_vpb*(2*dG_dvbs + G/vpb);

  if ( vgst < 0.) {    /* cutoff */
    *Id = *Gds = *Gm = *Gmbs = 0.;
    *Vdsat = 0.;
    }
  else {	/* Quadratic Interpolation for Beta0 (Beta @ vgs=0, vds=Vds) */
    double
      beta, dbeta_dvgs, dbeta_dvds, dbeta_dvbs,
      beta0, dbeta0_dvds, dbeta0_dvbs,
      beta_vds_0, dbetaVdd_dvds,
      term1, K,
      betaZeroB = cox_wl*BSIMsetup( BSIM_mobZeroB0, BSIM_mobZeroBL, BSIM_mobZeroBW ),
      betaVdd	= cox_wl*BSIMsetup( BSIM_mobVdd0,   BSIM_mobVddL,   BSIM_mobVddW ),
      betaVddB	= cox_wl*BSIMsetup( BSIM_mobVddB0,  BSIM_mobVddBL,  BSIM_mobVddBW ),
      betaVddD	= cox_wl*BSIMsetup( BSIM_mobVddD0,  BSIM_mobVddDL,  BSIM_mobVddDW );

    if ( betaVddD < 0.) betaVddD = 0.;

    beta_vds_0 = betaZero + betaZeroB*Vbs;
    betaVdd   += betaVddB*Vbs;
    dbetaVdd_dvds = MAX( betaVddD, 0.); /* Modified */

    if ( Vds > VDD ) {
      beta0	  = betaVdd + dbetaVdd_dvds*(Vds-VDD);
      dbeta0_dvds = dbetaVdd_dvds;
      dbeta0_dvbs = betaVddB;
      }
    else {
      double
	vdd_sq = VDD*VDD,
	C1 = (-betaVdd + beta_vds_0 + dbetaVdd_dvds*VDD)/vdd_sq,
	C2 = 2*(betaVdd - beta_vds_0)/VDD - dbetaVdd_dvds,
	dbeta_vds_0_dvbs = betaZeroB,
	dbetaVdd_dvbs	 = betaVddB,
	dC1_dvbs = (dbeta_vds_0_dvbs - dbetaVdd_dvbs)/vdd_sq,
	dC2_dvbs = -2*dC1_dvbs*VDD;

      beta0	  = (C1*Vds + C2)*Vds + beta_vds_0;
      dbeta0_dvds = 2*C1*Vds + C2;
      dbeta0_dvbs = (dC1_dvbs*Vds + dC2_dvbs)*Vds + dbeta_vds_0_dvbs;
      }

    { double arg  = 1/MAX(1 + ugs*vgst, 1.);

      beta = beta0*arg ;
      dbeta_dvgs = -beta*ugs*arg;
      dbeta_dvds = dbeta0_dvds*arg - dbeta_dvgs*dvth_dvds ;
      dbeta_dvbs = (dbeta0_dvbs + beta*ugs*dvth_dvbs - beta*vgst*dugs_dvbs)*arg;

      *NoiseBeta = beta;

      }

    { double vc = uds*vgst/A;

      if ( vc < 0.) vc = 0.;
      term1 = sqrt(1 + 2*vc);
      K     = .5*(1 + vc + term1);
      }
/*  *Vdsat = MAX(vgst/(A + uds*vgst), 0.);*/
    *Vdsat = MAX(vgst/(A*sqrt(K)), 0.);

    if ( Vds < *Vdsat ) {			/* triode region */
      double
/*	arg1 = 1 + uds*Vds, */
	arg1 = MAX(1+uds*Vds, 1.),
	arg2 = vgst - .5*A*Vds;

      *Id   = beta*arg2*Vds/arg1;
      *Gm   = ( dbeta_dvgs*arg2*Vds + beta*Vds )/arg1;
      *Gds  = ( dbeta_dvds*arg2*Vds +
		beta*(vgst - Vds*dvth_dvds - A*Vds) -
		*Id*(Vds*duds_dvds + uds)
		)/arg1;
      *Gmbs = ( dbeta_dvbs*arg2*Vds +
		beta*Vds*(-dvth_dvbs - .5*Vds*dA_dvbs) -
		*Id*Vds*duds_dvbs
		)/arg1;

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"  BSIM Triode: id, gds,gm,gmbs %19.10e%19.10e%19.10e%19.10e \n",
                        *Id,*Gds,*Gm,*Gmbs);
#endif

      }
    else {				/* saturation region */
      double
	args1 = 1 + 1/term1,
	args2 = vgst/A/K,
	args3 = args2*vgst,
	dvc_dvgs = uds/A,
	dvc_dvds = vgst*duds_dvds/A - dvc_dvgs*dvth_dvds,
	dvc_dvbs = (vgst*duds_dvbs - uds*(dvth_dvbs + vgst*dA_dvbs/A))/A,
	dK_dvc	= .5*args1,
	dK_dvgs = dK_dvc*dvc_dvgs,
	dK_dvds = dK_dvc*dvc_dvds,
	dK_dvbs = dK_dvc*dvc_dvbs;

      *Id   = .5*args3*beta;
      *Gm   = .5*args3*dbeta_dvgs + args2*beta - *Id*dK_dvgs/K;
      *Gds  = .5*args3*dbeta_dvds - args2*beta*dvth_dvds - *Id*dK_dvds/K;
      *Gmbs = .5*args3*dbeta_dvbs - args2*beta*dvth_dvbs - *Id*(dA_dvbs/A + dK_dvbs/K);

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"  BSIM Sat: id, gds,gm,gmbs %19.10e%19.10e%19.10e%19.10e \n",
                        *Id,*Gds,*Gm,*Gmbs);
#endif

    } }

/* subthreshold calculations */
      {
      double
      N0 = BSIMsetup( BSIM_subthSlope0,  BSIM_subthSlopeL,  BSIM_subthSlopeW );

      if ( (!( N0 >= 200.)) && (vgst < 4) ) {
	double
	  NB	 = BSIMsetup( BSIM_subthSlopeB0, BSIM_subthSlopeBL, BSIM_subthSlopeBW ),
	  ND	 = BSIMsetup( BSIM_subthSlopeD0, BSIM_subthSlopeDL, BSIM_subthSlopeDW ),
	  N	 = N0 + NB*Vbs + ND*Vds,	/* subthreshold slope */
	  factor=0;

	if( vgst < 3.5	  )
	      factor=1;
	else if (vgst < 4)
	      factor=8-2*vgst;

	if ( N < .5 ) N = .5;
	if ( Vds>0.) {
	  double
	    arg      = -Vds/vt,
	    warg1    = EXP(arg),
	    wds      = arg<=-1E-5 ? 1 - warg1 : -arg*(arg*.5 + 1),
	    wgs      = EXP(vgst/(N*vt)),
	    vdvt     = MIN(Vds/(vt*.1),100.0),
	    warg2    = vt*vt*betaZero*6.04965,
	    ilimit   = vt*vt*betaZero*4.5,
	    ilimit_t = ilimit*tanh(vdvt),
	    iexp     = warg2*wgs*wds,
	    temp1    = ilimit_t/(ilimit_t + iexp),
	    terms    = (wgs * (-ND*vgst - N*dvth_dvds))/(vt*N*N),
	    coshvdvt_inv = 1/((EXP(vdvt)+EXP(-vdvt)) *0.5),
	    temp3    = (coshvdvt_inv*coshvdvt_inv*(1/(vt*.1))),
	    uu	     = iexp+ilimit*tanh(vdvt),
	    diedvd   = warg2*(terms*wds + wgs*warg1/vt);

	  temp1 *= temp1;
	  *Id	+= factor*iexp*ilimit_t/(ilimit_t + iexp);
	  terms  = tanh(vdvt);
	  *Gds	+= (( factor*ilimit*ilimit*(terms/uu)*(terms/uu)*diedvd ) +
		    ( factor*ilimit*( (iexp/uu)*(iexp/uu) )*temp3  ));
	  *Gm	+= factor*temp1*iexp/(N*vt);
	  *Gmbs += factor*temp1*iexp*(dvth_dvbs + vgst*NB/N)/(N*vt);

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"  BSIM Subth: id, gds,gm,gmbs %19.10e%19.10e%19.10e%19.10e \n",
                        *Id,*Gds,*Gm,*Gmbs);
  DB_GO fprintf(OUTFILE,"  BSIM Subth: N,factor        %14.5e%14.5e \n",
                        N,factor);
#endif

	  }
	}
      }

/* limiting of some DC values */
  if (*Id > 0)
  if ( *Id   < 0.) *Id	 = 0.;
  if ( *Gm   < 0.) *Gm	 = 0.;
  if ( *Gds  < 0.) *Gds  = 0.;
  if ( *Gmbs < 0.) *Gmbs = 0.;

/* charge calculations */

  if ( Charge==NO ) {
    *Qg = *Qd = *Qb =
    *Cggb = *Cgsb = *Cgdb =
    *Cdgb = *Cdsb = *Cddb =
    *Cbgb = *Cbsb = *Cbdb = 0.;
    }
  else {
    double
      cgbb, cdbb, cbbb,
      co4v15 = 4./15.,
      wl_cox = cox*Wid*Len*1e4, /* F */
      vth0 = vfb + phi + K1*sqrt_vpb,
      vgst = Vgs - vth0,
      arg1 = A*Vds,
      arg2 = vgst - .5*arg1,
      arg3 = Vds - arg1,
      arg5 = arg1*arg1,
      dvth_dvbs = -.5*K1/sqrt_vpb,
      dA_dvbs	= .5*K1*(.5*G/vpb - .8364*(1-G)*(1-G))/sqrt_vpb,
      ent	= MAX(arg2,1e-8),
      dent_dvds = -.5*A,
      dent_dvbs = -(dvth_dvbs + .5*Vds*dA_dvbs),
      vcom = vgst*vgst/6 - .125*arg1*vgst + .025*arg5,
      vds_pinchoff = MAX( vgst/A, 0.),
      vgb     = Vgs - Vbs,
      vgb_vfb = vgb - vfb;

/* 0/100 partitioning for drain/source charges at the saturation region*/

    if ( PARAM(BSIM_xpart) >= 1.) {

      if ( vgb_vfb < 0.) {		/* accumulation region */
	*Qg = wl_cox*vgb_vfb;
	*Qb = -*Qg;
	*Qd = 0.;

	*Cggb = wl_cox;
	*Cgdb = *Cgsb = 0.;
	*Cbgb = -wl_cox;
	*Cbdb = *Cbsb = 0.;
	*Cdgb = *Cddb = *Cdsb = 0.;
	}
      else if ( Vgs < vth0 ) {		/* subthreshold region */
	double yf,yf1;
	if (Vgs > vth0-.1) {
	  yf1 = -10*Vgs+10*vth0;
	  yf  = -yf1+1;
	  *Qg = yf*wl_cox*(Vgs - vfb - phi ) + yf1*.5*wl_cox*K1*K1*(-1 + sqrt(1 + 4*vgb_vfb/(K1*K1)) );
	  *Cggb = yf*wl_cox + yf1*wl_cox/sqrt(1 + 4*vgb_vfb/(K1*K1));
	  }
	else {
	  *Cggb = wl_cox/sqrt(1 + 4*vgb_vfb/(K1*K1));
	  *Qg = .5*wl_cox*K1*K1*(-1 + sqrt(1 + 4*vgb_vfb/(K1*K1)) );
	  }

	*Qb = -*Qg;
	*Qd = 0.;

	*Cgdb = *Cgsb = 0.;
	*Cbgb = -*Cggb;
	*Cbdb = *Cbsb = 0.;
	*Cdgb = *Cddb = *Cdsb = 0.;

	}
      else if ( Vds < vds_pinchoff ) {	/* triode region  */
	double
	  argt1, argt2, argt3, argt5, argt7, argt8, argt9;

	argt1 = 12*ent*ent;
	argt2 = 1 - A;
	argt3 = arg1*Vds;
      /*argt4 = vcom/(ent*ent*ent); never used */
	if ( ent > 1e-8) {
	  argt5 = arg1/ent;
	/*argt6 = vcom/(ent*ent); never used */
	  }
	else {
	  argt5 = 2.;
	/*argt6 = 4./15.; never used */
	  }
	argt7 = argt5/12;
	argt8 = 6*ent;
	argt9 = .125*argt5*argt5;

	*Qg =  wl_cox*(Vgs - vfb - phi - .5*Vds + Vds*argt7);
	*Qb =  wl_cox*(-vth0 + vfb + phi + .5*arg3 - arg3*argt7);
	*Qd = -wl_cox*(.5*vgst - .75*arg1 + .125*arg1*argt5);

	*Cggb = wl_cox*(1 - argt3/argt1);
	*Cgdb = wl_cox*(-.5 + arg1/argt8 - argt3*dent_dvds/argt1);
	 cgbb = wl_cox*(Vds*Vds*dA_dvbs*ent - argt3*dent_dvbs)/argt1;
	*Cgsb = -(*Cggb + *Cgdb + cgbb);

	*Cbgb = wl_cox*argt3*argt2/argt1;
	*Cbdb = wl_cox*argt2*(.5 - arg1/argt8 + argt3*dent_dvds/argt1);
	 cbbb = -wl_cox*(dvth_dvbs + .5*Vds*dA_dvbs +
		Vds*Vds*((1 - 2*A)*dA_dvbs*ent - argt2*A*dent_dvbs)/argt1);
	*Cbsb = -(*Cbgb + *Cbdb + cbbb);

	*Cdgb = -wl_cox*(.5 - argt9);
	*Cddb = wl_cox*(.75*A - .25*A*arg1/ent + argt9*dent_dvds);
	 cdbb = wl_cox*(.5*dvth_dvbs + Vds*dA_dvbs*(.75 - .25*argt5) + argt9*dent_dvbs);
	*Cdsb = -(*Cdgb + *Cddb + cdbb);
	}
      else if ( Vds >= vds_pinchoff ) { /* saturation region */
	double
	  args1 = 1/(3*A);

	*Qg = wl_cox*(Vgs - vfb - phi - vgst*args1);
	*Qb = wl_cox*(vfb + phi - vth0 + (1-A)*vgst*args1);
	*Qd = 0.;

	*Cggb = wl_cox*(1-args1);
	*Cgdb = 0.;
	 cgbb = wl_cox*args1*(dvth_dvbs + vgst*dA_dvbs/A);
	*Cgsb = -(*Cggb + *Cgdb + cgbb);

	*Cbgb = wl_cox*(args1 - 1./3.);
	*Cbdb = 0.;
	 cbbb = -wl_cox*((2./3.+ args1)*dvth_dvbs + vgst*args1*dA_dvbs/A);	/* Modified */
	*Cbsb = -(*Cbgb + *Cbdb + cbbb);

	*Cdgb = *Cddb = *Cdsb = 0.;
      } }

/* 40/60 partitioning for drain/source charges at the saturation region*/

    else {				/* ChannelChargePartionFlag < 1 */

      if ( vgb_vfb < 0.) {		/* accumulation region */
	*Qg = wl_cox*vgb_vfb;
	*Qb = -*Qg;
	*Qd = 0.;

	*Cggb = wl_cox;
	*Cgdb = *Cgsb = 0.;
	*Cbgb = -wl_cox;
	*Cbdb = *Cbsb = 0.;
	*Cdgb = *Cddb = *Cdsb = 0.;
	}
      else if ( Vgs < vth0 ) {		/* subthreshold region */
	double yf,yf1;
	if (Vgs > vth0-.1) {
	  yf1 = -10*Vgs+10*vth0;
	  yf  = -yf1+1;
	  *Qg = yf*wl_cox*(Vgs - vfb - phi ) + yf1*.5*wl_cox*K1*K1*(-1 + sqrt(1 + 4*vgb_vfb/(K1*K1)) );
	  *Cggb = yf*wl_cox + yf1*wl_cox/sqrt(1 + 4*vgb_vfb/(K1*K1));
	  }
	else {
	  *Cggb = wl_cox/sqrt(1 + 4*vgb_vfb/(K1*K1));
	  *Qg = .5*wl_cox*K1*K1*(-1 + sqrt(1 + 4*vgb_vfb/(K1*K1)) );
	  }

	*Qb = -*Qg;
	*Qd = 0.;

	*Cgdb = *Cgsb = 0.;
	*Cbgb = -*Cggb;
	*Cbdb = *Cbsb = 0.;
	*Cdgb = *Cddb = *Cdsb = 0.;

	}
      else if ( Vds < vds_pinchoff ) {	/* triode region */
	double
	  argt1, argt2, argt3, argt4, argt5, argt6, argt7, argt8;

	argt1 = 12*ent*ent;
	argt2 = 1 - A;
	argt3 = arg1*Vds;
	argt4 = vcom/(ent*ent*ent);
	if ( ent > 1e-8 ) {
	  argt5 = arg1/ent;
	  argt6 = vcom/(ent*ent);
	  }
	else {
	  argt5 = 2.;
	  argt6 = 4./15.;
	  }
	argt7 = argt5/12;
	argt8 = 6*ent;

	*Qg =  wl_cox*(Vgs - vfb - phi - .5*Vds + Vds*argt7);
	*Qb =  wl_cox*(-vth0 + vfb + phi + .5*arg3 - arg3*argt7);
	*Qd = -wl_cox*(.5*(vgst-arg1) + arg1*argt6);

	*Cggb =  wl_cox*(1 - argt3/argt1);
	*Cgdb =  wl_cox*(-.5 + arg1/argt8 - argt3*dent_dvds/argt1);
	 cgbb =  wl_cox*(Vds*Vds*dA_dvbs*ent - argt3*dent_dvbs)/argt1;
	*Cgsb = -(*Cggb + *Cgdb + cgbb);

	*Cbgb =  wl_cox*argt3*argt2/argt1;
	*Cbdb =  wl_cox*argt2*(.5 - arg1/argt8 + argt3*dent_dvds/argt1);
	 cbbb = -wl_cox*(dvth_dvbs + .5*Vds*dA_dvbs +
		Vds*Vds*((1 - 2*A)*dA_dvbs*ent - argt2*A*dent_dvbs)/argt1);
	*Cbsb = -(*Cbgb + *Cbdb + cbbb);

	*Cdgb = -wl_cox*(.5 + arg1*(4*vgst - 1.5*arg1)/argt1 - 2*arg1*argt4);
	*Cddb =  wl_cox*(.5*A + 2*arg1*dent_dvds*argt4 -
		A*(2*vgst*vgst - 3*arg1*vgst + .9*arg5)/argt1);
	 cdbb =  wl_cox*(.5*dvth_dvbs + .5*Vds*dA_dvbs + 2*arg1*dent_dvbs*argt4 -
		   Vds*( 2*vgst*vgst*dA_dvbs - 4*A*vgst*dvth_dvbs -
		     3*arg1*vgst*dA_dvbs + 1.5*A*arg1*dvth_dvbs +.9*arg5*dA_dvbs
		     )/argt1);
	*Cdsb = -(*Cdgb + *Cddb + cdbb);
	}
      else if ( Vds >= vds_pinchoff ) { /* saturation region */
	double
	  args1 = 1/(3*A);

	*Qg =  wl_cox*(Vgs - vfb - phi - vgst*args1);
	*Qb =  wl_cox*(vfb + phi - vth0 + (1-A)*vgst*args1);
	*Qd = -co4v15*wl_cox*vgst;

	*Cggb = wl_cox*(1-args1);
	*Cgdb = 0.;
	 cgbb = wl_cox*args1*(dvth_dvbs + vgst*dA_dvbs/A);
	*Cgsb = -(*Cggb + *Cgdb + cgbb);

	*Cbgb = wl_cox*(args1 - 1./3.);
	*Cbdb = 0.;
	 cbbb = -wl_cox*((2./3.+ args1)*dvth_dvbs + vgst*args1*dA_dvbs/A);
	*Cbsb = -(*Cbgb + *Cbdb + cbbb);

	*Cdgb = -co4v15*wl_cox;
	*Cddb = 0.;
	 cdbb = co4v15*wl_cox*dvth_dvbs;
	*Cdsb = -(*Cdgb + *Cddb + cdbb);
    } } }

#ifdef DB_GO
  DB_GO fprintf(OUTFILE,"  BSIM: id, gds,gm,gmbs      %19.10e%19.10e%19.10e%19.10e \n",
                        *Id,*Gds,*Gm,*Gmbs);
  DB_GO fprintf(OUTFILE,"  BSIM Gate : Cggb,Cgdb,Cgsb %19.10e%19.10e%19.10e \n",
                        *Cggb,*Cgdb,*Cgsb);
  DB_GO fprintf(OUTFILE,"  BSIM Bulk : Cbgb,Cbdb,Cbsb %19.10e%19.10e%19.10e \n",
                        *Cbgb,*Cbdb,*Cbsb);
  DB_GO fprintf(OUTFILE,"  BSIM Drain: Cdgb,Cddb,Cdsb %19.10e%19.10e%19.10e \n",
                        *Cdgb,*Cddb,*Cdsb);
  DB_GO fprintf(OUTFILE,"Exit BSIM \n");
#endif

  } /* done */

void MOS4cap(
double Vgd,			/* (R) Terminal voltages */
double Vgs,			/* (R) Terminal voltages */
double Vgb,			/* (R) Terminal voltages */
double CgdOvl,			/* (R) Overlap capacitances */
double CgsOvl,			/* (R) Overlap capacitances */
double CgbOvl,			/* (R) Overlap capacitances */
double *Qgat,			/* (R/W) Charges */
double *Qsub,			/* (R/W) Charges */
double *Qdrn,			/* (R/W) Charges */
double *Qsrc,			/* (R/W) Charges */
double *Cggb,			/* (R/W) Capacitances */
double *Cgdb,			/* (R/W) Capacitances */
double *Cgsb,			/* (R/W) Capacitances */
double *Cbgb,			/* (R/W) Capacitances */
double *Cbdb,			/* (R/W) Capacitances */
double *Cbsb,			/* (R/W) Capacitances */
double *Cdgb,			/* (R/W) Capacitances */
double *Cddb,			/* (R/W) Capacitances */
double *Cdsb,			/* (R/W) Capacitances */
double *Csgb,			/* (R/W) Capacitances */
double *Csdb,			/* (R/W) Capacitances */
double *Cssb)			/* (R/W) Capacitances */
/*****************************************************************************
* Purpose
*   Calculate MOS4 total terminal charges and capacitances, incl. overlap
*
* Returned value
*   None
*
* Author
*   pwt  - 31 Dec 87 - creation
*   pwt  - 19 Feb 88 - bug (see MOS.C: MOScap)
*   gwb  - 21 Sep 94 - corrected capacitor mapping calulation order.
*
*****************************************************************************/

{

  *Csgb = -(*Cggb + *Cbgb + *Cdgb + CgsOvl);
  *Csdb = -(*Cgdb + *Cbdb + *Cddb);
  *Cssb = -(*Cgsb + *Cbsb + *Cdsb - CgsOvl);

  *Cdgb = *Cdgb - CgdOvl;
  *Cddb = *Cddb + CgdOvl;

  *Cggb = *Cggb + CgdOvl + CgsOvl + CgbOvl;
  *Cgdb = *Cgdb - CgdOvl;
  *Cgsb = *Cgsb - CgsOvl;

  *Cbgb = *Cbgb - CgbOvl;

  { double				/* calc. total terminal charge */
      qgd = CgdOvl * Vgd,
      qgs = CgsOvl * Vgs,
      qgb = CgbOvl * Vgb;

    *Qgat += qgd + qgs + qgb;
    *Qsub -= qgb;
    *Qdrn -= qgd;
    *Qsrc = -(*Qgat + *Qsub + *Qdrn);
    }
  } /* done */

