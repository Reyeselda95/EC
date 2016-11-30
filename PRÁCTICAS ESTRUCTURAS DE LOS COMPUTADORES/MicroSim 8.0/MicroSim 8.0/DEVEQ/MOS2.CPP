/* mos2.c
 *   $Revision:   1.23  $
 *   $Author:   DEC  $
 *   $Date:   14 Nov 1996 13:45:16  $ */

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"

/* these are set in MOS2eval and used there, and later in MOS2cap */

static double
	Cox,
	Gamasd,
	Qspof,
	Vbin,
	Vth;

#define PARAM(a)	((double)Model->a)
#define DELTA_MOS	PARAM(M_delta)
#define GAMMA		PARAM(M_gamma)
#define KP		PARAM(M_kp)
#define LAMBDA		PARAM(M_lambda)
#define NEFF		PARAM(M_neff)
#define NFS		PARAM(M_nfs)
#define NSUB		PARAM(M_nsub)
#define PB		PARAM(M_pb)
#define PHI		PARAM(M_phi)
#define TOX		PARAM(M_tox)
#define TYPE		(Model->M_type)
#define UCRIT		PARAM(M_ucrit)
#define UEXP		PARAM(M_uexp)
#define UO		PARAM(M_uo)
#define VBI		PARAM(M_vbi)
#define VBP		UCRIT		/* = bypass voltage (level 2) */
#define VMAX		PARAM(M_vmax)
#define XD		PARAM(M_xd)
#define XJ		PARAM(M_xj)

void MOS2eval(			/*TITLE*/
struct M_ *Model,		  /* (pointer to) model */
double Len,			  /* effective device size */
double Wid,			  /* effective device size */
double Mdev,			  /* effective device size */
double Vgs,			  /* terminal voltages */
double Vds,			  /* terminal voltages */
double Vbs,			  /* terminal voltages */
double *Von, 			  /* (pointer to) device voltages (returned) */
double *Vdsat,		 	  /* (pointer to) device voltages (returned) */
double *Id,			  /* (pointer to) drain current (returned) */
double *Gds,			  /* (pointer to) device conductances (returned) */
double *Gm,			  /* (pointer to) device conductances (returned) */
double *Gmbs,			  /* (pointer to) device conductances (returned) */
int Charge,			  /* do charge calculations (YES/NO) */
double *Cggb,			  /* (pointer to) device capacitances (returned) */
double *Cgdb,			  /* (pointer to) device capacitances (returned) */
double *Cgsb,			  /* (pointer to) device capacitances (returned) */
double *Cbgb,			  /* (pointer to) device capacitances (returned) */
double *Cbdb,			  /* (pointer to) device capacitances (returned) */
double *Cbsb,			  /* (pointer to) device capacitances (returned) */
double *Qgate,			  /* (pointer to) device charges (returned) */
double *Qchan,			  /* (pointer to) device charges (returned) */
double *Qbulk,                    /* (pointer to) device charges (returned) */
double *NoiseBeta,                /* (W) noise beta */
double Tmod)                      /* temperature */
/*****************************************************************************
* Purpose
*   evaluate MOS level 2 (analytical, one-dimensional) model
*
* History
* 86-08-22 pwt	- creation
* 87-10-07 pwt	- re-work as part of BSIM addition
* 88-01-05 pwt	- parameter M_tox now oxide thickness, not Cox
* 89-01-25 swg	- limit v2 and v1 in quartic eqn. solution, even more
*		  than they were, to prevent VAX floating point overflow.
*		  Also limit sarg3.
*		- Init Gmbs in one case where it wasn't
* 89-04-15 pwt	- add device multiplier, to fix narrow-channel calculation
* 89-06-12 whjb - Made use of EXP() macro
* 90-02-12 sv	- add local temperatures to models.
* whjb 04 Mar 91 - Corrected bug in weak inversion and in mobility modulation
* whjb 08 Jun 91 - Corrected bug in derivative of "body" in linear and sat.
* pwt  26 Jun 91 - remove divide-by-zero problem, analytically, in sub-thres.
* gwb  15 Aug 96 - additions for new mosfet noise model
* dec  14 Nov 96 - temperature now passed in as function argument
*
*****************************************************************************/
{
/* Local variables */

  double
	temp,
	lambda,
	vgst, vgsx, vpof, vdsat1,
	eta, factor,
	beta1,			/* effective beta (kp') */
	ufact, ueff,		/* mobility */
	dudvgs, dudvbs, dudvds,
	xn, dxndvb, dxndvd,	/* weak inversion: Von = Vth + xn*VT */
	dodvbs, dodvds,
	argg,			/* = 1/(xn*VT) */
	body, dbdvds,
	sphi, sphi3,		/* phi^(1/2) & phi^(3/2) */
	sarg, barg,		/* charge effects */
	sarg3,
	dsrgdb, d2sdb2, 	/* 1st & 2nd derivatives */
	dbrgdb, d2bdb2,
	gammad,
	dgddvb, dgdvds, dgdvbs,
	dgddb2,
	dsdvgs, dsdvbs,
	bsarg, dbsrdb,		/* effective channel length args. */
	bodys, gdbdvs,
	dldvgs, dldvds, dldvbs,
	clfact,
	gdbdv;
  double vt;

  static double 	/* arrays for scattering limited velocity evaluation */
    sig1[] = { 0., 1., -1.,  1., -1. },
    sig2[] = { 0., 1.,	1., -1., -1. };

/* Code */
  vt   = Tmod*BOLTZ/CHARGE;
  Cox  = Wid*Len*EPSOX/TOX;

/* compute some useful quantities */

  sphi	 = sqrt(PHI);
  sphi3  = sphi*PHI;
  lambda = LAMBDA;			/* gets re-evaluated (sometimes) */

  if ( Vbs > 0. ) {
    sarg   = sphi/(1 + .5*Vbs/PHI);
    temp   = -sarg/sphi3;
    dsrgdb = .5*temp*sarg;
    d2sdb2 = dsrgdb*temp;
    }
  else {
    temp   = PHI-Vbs;
    sarg   = sqrt(temp);
    dsrgdb = -.5/sarg;
    d2sdb2 =  .5*dsrgdb/temp;
    }

  if ( Vds-Vbs < 0. ) {
    barg   = sphi/(1 + .5*(Vbs-Vds)/PHI);
    temp   = -barg/sphi3;
    dbrgdb = .5*temp*barg;
    d2bdb2 = dbrgdb*temp;
    }
  else {
    temp   = PHI+Vds-Vbs;
    barg   = sqrt(temp);
    dbrgdb = -.5/barg;
    d2bdb2 =  .5*dbrgdb/temp;
    }

/* calculate threshold voltage */

  if ( GAMMA <= 0. || NSUB  <= 0. ) {	/* no short-channel effects */
    Gamasd = gammad = GAMMA;
    dgddvb = dgdvds = dgddb2 = 0.;
    }
  else {				/* short channel effect w/Vds != 0. */
    if ( XJ > 0.) {
      double argxs, argss, args;
      double argxd, argsd, argd;
      double dbxws, dbxwd;
      double dbargs, dbargd;
      double xws, xwd;

      xws    = XD*sarg; 		/* depletion charge effect: source */
      argxs  = 1+2*xws/XJ;
      args   = sqrt(argxs);
      argss  = (args-1)*.5*XJ/Len;

      xwd    = XD*barg; 		/* depletion charge effect: drain */
      argxd  = 1+2*xwd/XJ;
      argd   = sqrt(argxd);
      argsd  = (argd-1)*.5*XJ/Len;
      Gamasd = (1-argsd-argss)*GAMMA;

      dbxws  = XD*dsrgdb;		/* derivatives of corrections */
      dbargs = .5*dbxws/(Len*args);

      dbxwd  = XD*dbrgdb;
      dbargd = .5*dbxwd/(Len*argd);
      dgdvds = dbargd*GAMMA;

      dgddb2 = .5*GAMMA*XD/Len*(
		 ( d2sdb2 + dsrgdb*dsrgdb*XD/(XJ*argxs) )/args
		 +
		 ( d2bdb2 + dbrgdb*dbrgdb*XD/(XJ*argxd) )/argd
		 );

      dgddvb = -GAMMA*(dbargs+dbargd);
      }
    else {
      dgdvds = dgddb2 = dgddvb = 0.;
      Gamasd = gammad = GAMMA;
    } }

/*** this section only useful if DELTA > 0 ***/
/*factor = .125*DELTA_MOS*TWOPI*EPSSIL/Cox*Len; <- confusing, but correct */
  factor = (TWOPI*DELTA_MOS*EPSSIL*TOX)/(8*EPSOX*Wid/Mdev);
	/* narrow channel effect */
  eta	 = 1+factor;
  Vbin	 = TYPE*VBI + factor*(PHI-Vbs);
  *Von	 = Vbin + Gamasd*sarg;
  Vth	 = *Von;
  *Vdsat = 0.;

  if ( NFS == 0. ||
       Cox    == 0. ) {
    vgst = Vgs - *Von;
    if ( vgst <= 0. ) { 	/* cut-off region */
      *Gds = 0.;
      goto L1050;
    } }
  else {
    double cdonco = factor - Gamasd*dsrgdb - dgddvb*sarg;

/*    xn = 1 + cdonco + CHARGE*NFS/Cox*Wid*Len;*/
/*    xn    = 1 + cdonco + CHARGE*NFS/COX;*/
    xn	  = 1 + cdonco + CHARGE*NFS*TOX/EPSOX;
    temp  = xn*vt;
    *Von += temp;
    vgst  = Vgs - *Von;
    argg  = 1/temp;
    }

/* compute some more useful quantities */

  body	 = barg*barg*barg - ( sarg3 = sarg*sarg*sarg );
  dbdvds = 2*barg*barg*(-dbrgdb);	/* dbrgdb = -dbdvbs */
  gammad = Gamasd;
  dgdvbs = dgddvb;
  gdbdv  = 2*gammad*( barg*barg*dbrgdb - sarg*sarg*dsrgdb );
  dodvbs = -factor + dgdvbs*sarg + gammad*dsrgdb;
  if ( NFS != 0. && Cox != 0. ) {
    dxndvb = 2*dgdvbs*dsrgdb + gammad*d2sdb2 + dgddb2*sarg;
    dodvbs = dxndvb*vt + dodvbs;
    dxndvd = dgdvds*dsrgdb;
    dodvds = dxndvd*vt + dgdvds*sarg;
    }

/* evaluate effective mobility and its derivatives */

  if ( Cox != 0. && vgst > VBP ) {
    ufact  = pow( VBP/vgst, UEXP);
    ueff   = ufact*UO;
    temp   = ufact*UEXP/vgst;
    dudvgs = -temp;
    dudvbs = temp*dodvbs;
    dudvds = 0.;
    }
  else {
    ufact  = 1.;
    ueff   = UO;
    dudvgs = dudvbs = dudvds = 0.;
    }

/* evaluate Vd(sat) & derivatives according to Grove-Frohman equation */

/*** re-visit (? re-code) this section ***/

  vgsx	 = Vgs;
  gammad = Gamasd/eta;
  dgdvbs = dgddvb;

  if ( NFS != 0. && Cox != 0. ) vgsx = MAX(Vgs,*Von);

  if ( gammad <= 0. ) {
    vpof   = MAX( eta*Vds + Vbin,  0.);
    *Vdsat = MAX( (vgsx-Vbin)/eta, 0.);
    vdsat1 = MAX( (vpof-Vbin)/eta, 0.);
    dsdvgs = 1.;
    dsdvbs = 0.;
    }
  else {
    double
      gammd2 = gammad*gammad,
      argv   = (vgsx-Vbin)/eta + PHI - Vbs;

    if ( argv <= 0. ) {
      vpof  = Vth;
      *Vdsat = vdsat1 = dsdvgs = dsdvbs = 0.;
      }
    else {
      double arg = sqrt( 1 + 4*argv/gammd2 );

      *Vdsat = (vgsx-Vbin)/eta + .5*gammd2*(1.-arg);
      *Vdsat = MAX(*Vdsat, 0.);
      if ( Charge == YES ) {
	double
	  arg1	= gammd2/(eta*eta),
	  arg2	= Vds - .5*arg1,
	  argsq = (arg2 + .5*arg1 + PHI - Vbs)*arg1, /* <- isn't this
	  argsq = (    Vds	  + PHI - Vbs)*arg1,	<- THIS ? */
	  argv1;

	if ( argsq < 0.) vpof = Vth;
	else		 vpof = Vbin + eta*( arg2 + .5*arg1 + sqrt(argsq));

	argv1 = (vpof-Vbin)/eta + PHI - Vbs;
	if ( argv1 > 0.) {
	  arg1	 = sqrt( 1 + 4*argv1/gammd2 );
	  vdsat1 = (vpof-Vbin)/eta + .5*gammd2*(1-arg1);
	  vdsat1 = MAX( vdsat1, 0. );
	  }
	else
	  vdsat1 = 0.;
	}
      dsdvgs = ( 1- 1/arg )/eta;
      dsdvbs = ( gammad*(1-arg) + 2*argv/(gammad*arg) )/eta*dgdvbs + 1/arg + factor*dsdvgs;
    } }

/* store Vd(sat) as above in vpof (pinch-off voltage ) */

/* evaluate Vd(sat) & derivatives
   according to Baum's theory of scattering velocity saturation */

/*** re-visit (? re-code) this section: solution to quartic eqn.
	? separate routine ***/

  if ( VMAX > 0.) {
    int i, iknt, j, jknt;
    double xvalid, a3, b3, y3, delta4, a4[5], b4[5], x4[9], poly4[9];
    double xv, v2, v1, a1, b1, c1, d1, a, b, c, r, s, s2, p, p0, p2, sarg3lim;

      xv = VMAX*Len/ueff;
      v2 = PHI - Vbs;
      /* limit v2, v1, and sarg3 so the following calculations do not exceed
	 the vax floating point range (1.7e38) */
      if (fabs(v2) > 5e2) v2 = (v2 > 0. ? 5e2 : -5e2);
      v1 = (vgsx-Vbin)/eta + v2;
      if (fabs(v1) > 5e2) v1 = (v1 > 0. ? 5e2 : -5e2);

      a1 = gammad/.75;
      b1 = -2*(v1+xv);
      c1 = -2*gammad*xv;
      if (fabs(sarg3) > 1e8) sarg3lim = (sarg3 > 0. ? 1e8 : -1e8);
      else		     sarg3lim = sarg3;
      d1 =  2*v1*(v2+xv) - v2*v2 - a1*sarg3lim;

      a  = -b1;
      b  =  a1*c1 - 4*d1;
      c  = -d1*( a1*a1 - 4*b1 ) - c1*c1;

      r  = -a*a/3 + b;
      s  = 2*a*a*a/27 - a*b/3 + c;

      s2 = s*s;
      p  = s2/4 + r*r*(r/27);
      p0 = fabs(p);
      p2 = sqrt(p0);

    if ( p < 0. ) {
      double
	ro = pow( sqrt( s2/4 + p0 ), 1./3.),
	fi = atan(-2*p2/s);

      y3 = 2*ro*cos(fi/3) - a/3;
      }
    else {
      double
	p3 = pow( fabs( -s/2 + p2 ), 1./3.),
	p4 = pow( fabs( -s/2 - p2 ), 1./3.);

      y3 = p3 + p4 - a/3;
      }

    iknt = 0;
    a3 = sqrt( a1*a1/4 - b1 + y3 );
    b3 = sqrt( y3*y3/4 - d1 );

    for ( i = 1; i <= 4; i++ ) {	/* start index @ 1 (even in C) */

      a4[i]  = a1/2 + sig1[i]*a3;
      b4[i]  = y3/2 + sig2[i]*b3;

      delta4 = a4[i]*a4[i]/4 - b4[i];

      if ( delta4 < 0.) continue;

      x4[++iknt] = -a4[i]/2 + sqrt(delta4);
      x4[++iknt] = -a4[i]/2 - sqrt(delta4);
      }

    jknt = 0;
    for ( j = 1; j <= iknt; j++) {

      if ( x4[j] <= 0. ) continue;

      poly4[j] = POLY4(x4[j],d1,c1,b1,a1,1);

      if ( fabs(poly4[j]) > 1E-6 ) continue;

      xvalid = ++jknt <= 1 ? x4[j] : MIN( xvalid, x4[j] );
      }

    if ( jknt > 0 ) *Vdsat = xvalid*xvalid + Vbs - PHI;
    }

/* evaluate effective channel length & derivatives */

  if ( Vds == 0.) {

L610:
    dldvgs =
    dldvds =
    dldvbs = 0.;

    }
  else {
    double dldsat;

    gammad = Gamasd;

    if ( Vbs - *Vdsat > 0. ) {
      bsarg  = sphi/(1+ .5*(Vbs - *Vdsat)/PHI);
      dbsrdb = -.5*bsarg*bsarg/sphi3;
      }
    else {
      bsarg  = sqrt(*Vdsat-Vbs+PHI);
      dbsrdb = -.5/bsarg;
      }

    bodys  = bsarg*bsarg*bsarg - sarg3;
    gdbdvs = 2*gammad*( bsarg*bsarg*dbsrdb - sarg*sarg*dsrgdb );

    if ( VMAX > 0.) {
      double xls, xlfact,
	xdv    = XD/sqrt(NEFF),
	xlv    = xdv*VMAX/(2*ueff),
	argv   = (vgsx-Vbin)/eta - *Vdsat,
	vqchan = argv - gammad*bsarg,
	dqdsat = gammad*dbsrdb - 1,
	vl     = VMAX*Len,
	dfunds = vl*dqdsat - ueff*vqchan,
	dfundg = (vl - ueff*(*Vdsat))/eta,
	dfundb = -vl*( 1 + dqdsat - factor/eta )
		 + ueff*( gdbdvs - dgdvbs*bodys/1.5 )/eta;

      dsdvgs = -dfundg/dfunds;
      dsdvbs = -dfundb/dfunds;

      if ( NSUB==0.|| LAMBDA > 0.) goto L610;

      argv   = Vds - *Vdsat;
      if (argv >= 0.0) {
	xls    = sqrt( argv + xlv*xlv );
	xlfact = (xdv/Len)/Vds;
	lambda = xlfact*( xls - xlv );
	dldsat = xdv/(2*Len*xls);
	}
      else {
	lambda = dldsat = 0.0;
	}
      }
    else {
      double arg, argv, sargv, xlfact;

      if ( NSUB==0.|| LAMBDA > 0.) goto L610;

      argv   = (Vds - *Vdsat)/4;
      sargv  = sqrt( 1 + argv*argv );
      arg    = sqrt( argv + sargv );
      xlfact = (XD/Len)/Vds;
      lambda = xlfact*arg;
      dldsat = lambda*Vds/(8*sargv);
      }

    dldvgs = dldsat*dsdvgs;
    dldvds = dldsat - lambda;
    dldvbs = dldsat*dsdvbs;
    }

/* limit channel shortening at punch-through */

  {
/*  xwb    = XD*sbiarg; 	moved from above */

    double xleff,
      xwb    = XD*sqrt(PB),
      xld    = Len-xwb;

    clfact = 1 - lambda*Vds;
    xleff  = clfact*Len;
    dldvds = -lambda-dldvds;

    if ( NSUB == 0.) xwb = .25E-6;

    if ( xleff < xwb ) {
      double dfact,
	deltal = lambda*Vds*Len;

      xleff  = xwb/( 1 + (deltal-xld)/xwb );
      clfact = xleff/Len;

      dfact   = xleff*xleff/(xwb*xwb);
      dldvgs *= dfact;
      dldvds *= dfact;
      dldvbs *= dfact;
    } }

/* evaluate effective beta (effective k') */

  beta1 = (ufact/clfact)*KP*Wid/Len;

  *NoiseBeta = beta1;

/* test for mode of operation and branch appropriately */

  gammad = Gamasd;
  dgdvbs = dgddvb;

/*if (vds.gt.1.0d-8) goto 730 */
  if ( Vds > 0. ) {			/* forward operation */

    if ( Vgs <= *Von ) {		/* sub-threshold region */

      if ( *Vdsat <= 0. ) {
	*Gds = 0.;
	if ( Vgs <= Vth ) goto L1050;
	*Id = *Gm = *Gmbs = 0.;
	}
      else {
	double cdson, gdson, gbson, didvds, gmw, argt, expg, arg;
	double vdson = MIN(*Vdsat,Vds);

	if ( Vds > *Vdsat ) {
	  barg	 = bsarg;
	  dbrgdb = dbsrdb;
	  body	 = bodys;
	  gdbdv  = gdbdvs;
	  }
	cdson  = beta1*( (*Von - Vbin - .5*eta*vdson)*vdson - gammad*body/1.5);
	didvds = beta1*(*Von - Vbin - eta*vdson - gammad*barg);

	gdson  = -cdson*dldvds/clfact - beta1*dgdvds*body/1.5;
	if ( Vds < *Vdsat ) gdson = gdson + didvds;

	gbson  = -cdson*dldvbs/clfact + beta1*( dodvbs*vdson + factor*vdson - dgdvbs*body/1.5 - gdbdv );
	if ( Vds > *Vdsat ) gbson = gbson + didvds*dsdvbs;

	argt = argg*(Vgs - *Von);
	expg = EXP(argg*(Vgs - *Von));
	/* check expg value to avoid underflow or overflow in later use */
	if (expg < MINREAL) expg = 0.0;
	arg = cdson*( dudvgs/ufact - dldvgs/clfact );
	*Gm = arg + beta1*(*Vdsat);
	if (Vds > *Vdsat)
	  *Gm += beta1*(*Von - Vbin - eta*(*Vdsat) - gammad*bsarg)*dsdvgs;

	*Id = cdson*expg;
	gmw = *Id*argg;
	*Gm = gmw;
	if ( Vds > *Vdsat )
	  *Gm = gmw + didvds*dsdvgs*expg;

	*Gds  = gdson*expg - *Gm*dodvds - gmw*(Vgs - *Von)*dxndvd/xn;
	*Gmbs = gbson*expg - *Gm*dodvbs - gmw*(Vgs - *Von)*dxndvb/xn;
      } }
    else if ( Vds > *Vdsat ) {		/* saturation region */
      double arg;

      *Id   = beta1*( ( Vgs - Vbin - eta*(*Vdsat)/2 )*(*Vdsat) - gammad*bodys/1.5 );
      arg   = *Id*( dudvgs/ufact - dldvgs/clfact );
      *Gm   = arg + beta1*(*Vdsat) + beta1*( Vgs - Vbin - eta*(*Vdsat) - gammad*bsarg)*dsdvgs;
      *Gds  = -*Id*dldvds/clfact - beta1*dgdvds*bodys/1.5;
      arg   = *Id*( dudvbs/ufact - dldvbs/clfact );
      *Gmbs = arg - beta1*( gdbdvs + dgdvbs*bodys/1.5 - factor*(*Vdsat) ) + beta1*( Vgs - Vbin - eta*(*Vdsat) - gammad*bsarg )*dsdvbs;
      }
    else {				/* linear region */
      double arg;

      *Id   = beta1*( ( Vgs - Vbin - eta*Vds/2 )*Vds - gammad*body/1.5 );
      arg   = *Id*( dudvgs/ufact - dldvgs/clfact );
      *Gm   = arg + beta1*Vds;
      arg   = *Id*( dudvds/ufact - dldvds/clfact );
      *Gds  = arg + beta1*( Vgs - Vbin - eta*Vds - gammad*dbdvds - dgdvds*body/1.5 );
      arg   = *Id*( dudvbs/ufact - dldvbs/clfact );
      *Gmbs = arg - beta1*( gdbdv + dgdvbs*body/1.5 - factor*Vds );
      }

/* compute charges for "on" region */

    if ( Charge == YES ) {
      if ( Vgs > Vth ) {
	Mqspof(Model,Vds,Vbs,Vgs,vpof,*Von,*Vdsat,vdsat1,Cggb,Cgdb,Cgsb,Cbgb,Cbdb,Cbsb,Qgate,Qchan,Qbulk);
	}
      else {
	MOS2cap(Model,Vds,Vbs,Vgs,*Vdsat,Cggb,Cgdb,Cgsb,Cbgb,Cbdb,Cbsb,Qgate,Qchan,Qbulk);
	Qspof = 0.;
      } }
    else
      *Qgate = *Qbulk = *Qchan = Qspof = 0.;
    }
  else {				/* reverse operation */
    if ( Vgs > *Von )
      *Gds = beta1*( Vgs - Vbin - gammad*sarg );

    else if ( NFS == 0. || Cox == 0. )
      *Gds = 0.;

    else {
      double argt = argg*(Vgs - *Von);

      argt = EXP(argt);

      *Gds = beta1*(*Von - Vbin - gammad*sarg)*argt;
      }
L1050:
    *Id = *Gm = *Gmbs = 0.;
    if ( Charge == YES ) {
      MOS2cap(Model,Vds,Vbs,Vgs,*Vdsat,Cggb,Cgdb,Cgsb,Cbgb,Cbdb,Cbsb,Qgate,Qchan,Qbulk);
      Qspof = 0.;
      }
    else
      *Qgate = *Qbulk = *Qchan = Qspof = 0.;
    }

  } /* end MOS2eval */


void MOS2cap(			     /*TITLE*/
struct M_  *Model,
double Vds,
double Vbs,
double Vgs,
double Vdsat,
double *Cggb,
double *Cgdb,
double *Cgsb,
double *Cbgb,
double *Cbdb,
double *Cbsb,
double *Qgate,
double *Qchan,
double *Qbulk)
/*****************************************************************************
* Purpose
*   calculate MOS level 2 capacitance and charge
*
* Returned value
*   none
*
* Discussion
*   none
*
* Author
*   PWT - 29 Aug 86 - creation
*   PWT   10 Oct 87 - re-work as part of BSIM addition
*
*****************************************************************************/
{
/* Local variables */
  double vgb, vg;

/* Code */
/* initialize charges */

  *Qgate = *Qbulk = 0.;

/* reference voltages for charge computation */

  vgb = Vgs - Vbs;
  vg  = vgb - Vbin + PHI;

/* determine operating region */

  if ( Vgs > Vth ) {			/* "on" region */
    double
      vbd, vd, vsat,
      vs, vs2, vsp5, vs1p5,
      ve, ve2, vep5, ve1p5,
      term0, term1, term2, term3, term4, term5, term6, term7,
      term10, term11, term12,
      term20, term21, term22,
      argn, argd,
      dvedvd,
      dgndve, dddve,
      dgndvs, dddvs;

    vbd = Vbs - Vds;
    vd	= MAX( PHI - vbd, 1e-8);

    vs	  = MAX( PHI - Vbs, 1e-8);
    vs2   = vs*vs;
/*  vs3   = vs2*vs;	never used */
/*  vs5   = vs3*vs2;	never used */
    vsp5  = sqrt(vs);
    vs1p5 = vsp5*vs;
/*  vs2p5 = vs1p5*vs;	never used */

    vsat = Vdsat + vs;

    if ( vd < vsat ) {
      ve     = vd;
      dvedvd = 1.;
/*    dvedvg = 0.;	never used */
      }
    else {
      ve     = vsat;
      dvedvd = 0.;
/*    dvedvg = 0.;	never used */
      }
    ve2   = ve*ve;
/*  ve3   = ve2*ve;	never used */
/*  ve5   = ve2*ve3;	never used */
    vep5  = sqrt(ve);
    ve1p5 = vep5*ve;
/*  ve2p5 = ve1p5*ve;	never used */

    term0  = ve + vs;
    term1  = vep5 + vsp5;
    term2  = vep5*vsp5;
    term3  = ve2 + vs2;
    term4  = ve*vs;
    term5  = term0*term1;
    term6  = (term3 + term4) + term2*term0;
    term7  = (term3 + term4)*term1;
    term10 = vep5 + .5*vsp5;
    term11 = 1.5*ve + vsp5*term10;
    term12 = 2*ve1p5 + vsp5*term11;
    term20 = .5*vep5 + vsp5;
    term21 = 1.5*vs + vep5*term20;
    term22 = 2*vs1p5 + vep5*term21;
    argn   = .5*vg*term5 - .4*Gamasd*term6 - term7/3;
    argd   = vg*term1 - Gamasd*( term0 + term2 )/1.5 - .5*term1*term0;
/*  argd2  = argd*argd;
 *** never used */

    *Qgate = Cox*( vg - argn/argd );
    dgndve = .5*vg*term11 - .4*Gamasd*term12 - (2.5*ve2 + vsp5*term12)/3;
    dddve  = .5*vg - Gamasd*term10/1.5 - .5*term11;
/*  dqgdve = -Cox/argd*( dgndve - ( vg - *Qgate/Cox )*dddve );
 *** never used */
    dgndvs = .5*vg*term21 - .4*Gamasd*term22 - ( 2.5*vs2 + vep5*term22 )/3;
    dddvs  = .5*vg - Gamasd*term20/1.5 - .5*term21;

    *Cgdb  = -Cox/(argd*vep5)*( dgndve - ( vg - *Qgate/Cox )*dddve )*dvedvd;
    *Cgsb  = -Cox/(argd*vsp5)*( dgndvs - ( vg - *Qgate/Cox )*dddvs );
    *Cggb  = Cox*( 1 - term1/argd*( .5*term0 - vg + *Qgate/Cox ) );

    argn   = vg*( term0 + term2 )/1.5 - .5*Gamasd*term5 - .4*term6;
    dgndve = vg*term10/1.5 - .5*Gamasd*term11 - .4*term12;
    dgndvs = vg*term20/1.5 - .5*Gamasd*term21 - .4*term22;

    *Qbulk = -Gamasd*Cox*argn/argd;

    *Cbdb  = -Cox/(vep5*argd)*( *Qbulk/Cox*dddve + Gamasd*dgndve )*dvedvd;
    *Cbsb  = -Cox/(vsp5*argd)*( *Qbulk/Cox*dddvs + Gamasd*dgndvs );
    *Cbgb  = -Cox/argd*( Gamasd*( term0 + term2 )/1.5 + *Qbulk/Cox*term1 );
    }
  else {				/* "off" region */

    if ( vg > 0. ) {
      double
	gamma2 = .5*Gamasd,
	sqarg  = sqrt( gamma2*gamma2 + vg );

      *Qgate = Gamasd*Cox*( sqarg - gamma2 );
      *Cggb  = .5*Cox*Gamasd/sqarg;
      }
    else {
      *Qgate = Cox*vg;
      *Cggb  = Cox;
      }
    *Qbulk = -*Qgate;
    *Cbgb  = -*Cggb;
    *Cgdb  =  *Cgsb = *Cbdb = *Cbsb = 0.;
    }

  *Qchan = -( *Qgate + *Qbulk );

  } /* end MOS2cap */
