/* mos3.c
 *   $Revision:   1.19  $
 *   $Author:   DEC  $
 *   $Date:   14 Nov 1996 13:50:16  $ */

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"

/* these are set in MOS3eval and used there, and later in MOS3cap */

static double
	Cox,
	Eta,
	Short,
	Narrow,
	Qspof;

#define PARAM(a)	((double)Model->a)
#define DELTA_MOS	PARAM(M_delta)
#define ETA		PARAM(M_eta)
#define GAMMA		PARAM(M_gamma)
#define KAPPA		PARAM(M_kappa)
#define KP		PARAM(M_kp)
/* #define LAMBDA		PARAM(M_lambda) */
#define xdsquare	PARAM(M_xdsquare)
#define LD		PARAM(M_ld)
#define NFS		PARAM(M_nfs)
#define PHI		PARAM(M_phi)
#define THETA		PARAM(M_theta)
#define TOX		PARAM(M_tox)
#define TYPE		(Model->M_type)
#define UO		PARAM(M_uo)
#define VBI		PARAM(M_vbi)
#define VMAX		PARAM(M_vmax)
#define XD		PARAM(M_xd)
#define XJ		PARAM(M_xj)

void MOS3eval(
struct M_ *Model,		/* (R) pointer to model parameters */
double Len,			/* (R) effective device size */
double Wid,			/* (R) effective device size */
double Mdev,			/* (R) effective device size */
double Vgs,			/* (R) terminal voltages */
double Vds,			/* (R) terminal voltages */
double Vbs,			/* (R) terminal voltages */
double *Von,			/* (W) characteristic voltages */
double *Vdsat,			/* (W) characteristic voltages */
double *Id,			/* (W) drain current */
double *Gds,			/* (W) conductances */
double *Gm,			/* (W) conductances */
double *Gmbs,			/* (W) conductances */
double *Cggb,			/* (W) capacitances */
double *Cgdb,			/* (W) capacitances */
double *Cgsb,			/* (W) capacitances */
double *Cbgb,			/* (W) capacitances */
double *Cbdb,			/* (W) capacitances */
double *Cbsb,			/* (W) capacitances */
double *Qgate,			/* (W) charges */
double *Qchan,			/* (W) charges */
double *Qbulk,                  /* (W) charges */
double *NoiseBeta,              /* (W) noise beta */
double Tmod)                    /* (R) temperature */
/*****************************************************************************
* Purpose
*   Evaluate MOS level 3 (semi-empirical, small geometry) model
*
* Returned value
*   None
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
*   pwt  - 28 Aug 86 - creation
*   pwt  - 10 Oct 87 - re-work as part of BSIM addition
*   pwt  - 05 Jan 88 - parameter M_tox now oxide thickness, not Cox
*   pwt  - 15 Apr 89 - add device multiplier, to fix narrow-channel calculation
*   whjb - 12 Jun 89 - Made use of EXP() macro
*   sv	 - 12 Feb 90 - add local temperatures to models.
*   whjb - 04 Mar 91 - Corrected bug in weak inversion code
*   gwb  - 16 May 96 - Fix derivative error in channel length modulation
*   gwb  - 15 Aug 96 - additions for new mosfet noise model
*   dec  - 14 Nov 96 - temperature now passed in as function argument
*
*****************************************************************************/

{
/* Local variables */

  double
    vgsx, vdsx, 		/* voltages */
    beta, gds0, gdsx,
    vth,			/* threshold voltage & derivatives */
    dvtdvd, dvtdvb,
    vpof,			/* pinch-off voltage */
    cdo, cd1, cdnorm,		/* drain currents factors */
    dcodvb,			/* & derivatives */
    onxl,			/* = 1/Len */
    fgate, onfg, us,		/* mobility vs. gate voltage factors */
    dfgdvg, dfgdvd, dfgdvb,	/* & derivatives */
    vdsc, onvdsc,		/* saturation voltage factors */
    dvsdvg, dvsdvd, dvsdvb,	/* & derivatives */
    fdrain,			/* Vmax related currents */
    dfddvg, dfddvd, dfddvb,	/* & derivatives */
    xn, dxndvb, 		/* weak inversion: Von = Vth + xn*VT */
    dvodvb, dvodvd,
    dfsdvb,			/* short-channel effect derivatives */
    fbody, onfbdy, dfbdvb,	/* body effect & derivatives */
    qbonco, dqbdvb,		/* bulk charge & derivatives */
    phibs, sqphbs, dsqdvb;	/* factors & derivatives */
  double vt;

  static double 	/* empirical constants */
    coeff0 =  0.0631353,
    coeff1 =  0.8013292,
    coeff2 = -0.01110777;

  /* prevent compiler warnings */
  USEARG(Cggb);
  USEARG(Cbgb);
  USEARG(Cgsb);
  USEARG(Cbsb);

  vt   = Tmod*BOLTZ/CHARGE;
/* note: charge flag == NO ... charge calculations are never done!
 *
 * after tests are running, (maybe) use code similar to MOS2 flag setting
 * NOTE: I have noticed problems with the values of VPOF and VDSAT1
 */

  beta	 = KP*Wid/Len;
  Cox	 = Wid*Len*EPSOX/TOX;
  Narrow = DELTA_MOS/(Wid/Mdev);

  *NoiseBeta = beta;

/* reference Id equations to source and charge equations to bulk */

  *Vdsat = *Qgate = *Qchan = *Qbulk = *Cgdb = *Cbdb = 0.;

  onxl = 1/Len;
  Eta  = ETA*onxl*onxl*onxl;

/* square root term */

  if ( Vbs > 0. ) {
    double sqphis = sqrt(PHI);

    sqphbs = sqphis/(1 + Vbs/(PHI+PHI) );
    phibs  = sqphbs*sqphbs;
    dsqdvb = -.5*phibs/(PHI*sqphis);
    }
  else {
    phibs  = PHI-Vbs;
    sqphbs = sqrt(phibs);
    dsqdvb = -.5/sqphbs;
    }

/* short-channel effect factor */

  if ( XJ == 0. || XD == 0. ) {
    dfsdvb = 0.;
    Short  = 1.;
    }
  else {
    double
      wps    = XD*sqphbs,
      onxj   = 1/XJ,
      xjonxl = XJ*onxl,
      djonxj = LD*onxj,
      wponxj = wps*onxj,
      wconxj = (coeff2*wponxj + coeff1)*wponxj + coeff0,
      arga   = wconxj + djonxj,
      argc   = wponxj/( 1 + wponxj ),
      argb   = sqrt( 1 - argc*argc ),
      dwpdvb = XD*dsqdvb,
      dadvb  = ( coeff1 + coeff2*( wponxj + wponxj ))*dwpdvb*onxj,
      dbdvb  = -argc*argc*( 1 - argc )*dwpdvb/(argb*wps);

    dfsdvb = -xjonxl*( dadvb*argb + arga*dbdvb );
    Short  = 1 - xjonxl*( arga*argb - djonxj );
    }

  { double				/* threshold voltage effects */
      gammas, fbodys, vbix;

/* body effect*/

    gammas = GAMMA*Short;
    fbodys = .25*gammas/sqphbs;
    fbody  = fbodys + Narrow;
    onfbdy = 1/( 1 + fbody );
    dfbdvb = -fbodys*dsqdvb/sqphbs + fbodys*dfsdvb/Short;
    qbonco = gammas*sqphbs + Narrow*phibs;
    dqbdvb = gammas*dsqdvb + GAMMA*dfsdvb*sqphbs - Narrow;

/* static feedback effect */

    vbix = TYPE*VBI - Eta*Vds;

/* threshold voltage */

    vth    = vbix + qbonco;
    dvtdvd = -Eta;
    dvtdvb = dqbdvb;
    }

/* joint weak inversion and strong inversion */

  *Von = vth;
  if ( NFS == 0.) {

    if ( Vgs <= *Von ) {		/* cut-off region */
      *Id = *Gm = *Gds = *Gmbs = 0.;

      Qspof = 0.;

      return;		/*** done ***/
    } }
  else {
    double
/*	csonco = CHARGE*NFS*Len*Wid/Cox,*/
/*	csonco = CHARGE*NFS/COX,*/
      csonco = CHARGE*NFS*TOX/EPSOX,
      cdonco = .5*qbonco/phibs;

    xn	   = 1 + csonco + cdonco;
    *Von   = vth + vt*xn;
    dxndvb = .5*dqbdvb/phibs - qbonco*dsqdvb/(phibs*sqphbs);
    dvodvd = dvtdvd;
    dvodvb = dvtdvb + vt*dxndvb;
    }

/* device is on */

  vgsx = MAX(Vgs,*Von);

/* mobility modulation by gate voltage */

  onfg	 = 1 + THETA*(vgsx-vth);
  fgate  = 1/onfg;
  us	 =  UO*fgate;
  dfgdvg = -THETA*fgate*fgate;
  dfgdvd = -dfgdvg*dvtdvd;
  dfgdvb = -dfgdvg*dvtdvb;

/* saturation voltage */

  *Vdsat =
  vpof	 = (vgsx-vth)*onfbdy;

  if ( VMAX > 0.) {
    double arga, argb, dvsdga;

    vdsc   = Len*VMAX/us;
    onvdsc = 1/vdsc;
    arga   = ( vgsx - vth )*onfbdy;
    argb   = sqrt( arga*arga + vdsc*vdsc );
    *Vdsat = arga + vdsc - argb;
    dvsdga = ( 1 - arga/argb )*onfbdy;
    dvsdvg = dvsdga - ( 1 - vdsc/argb )*vdsc*dfgdvg*onfg;
    dvsdvd = -dvsdvg*dvtdvd;
    dvsdvb = -dvsdvg*dvtdvb - arga*dvsdga*dfbdvb;
    }
  else {
    dvsdvg = onfbdy;
    dvsdvd = -dvsdvg*dvtdvd;
    dvsdvb = -dvsdvg*dvtdvb - (*Vdsat)*dfbdvb*onfbdy;
    }

/* current factors in linear region */

  vdsx = MIN(Vds,*Vdsat);
  if ( vdsx == 0. ) {			/* special case of Vds = 0 */
    *Id = *Gm = *Gmbs = 0.;
    beta *= fgate;
    *Gds  = beta*(vgsx-vth);
    if ( NFS != 0. && Vgs < *Von )
      *Gds *= EXP((Vgs - *Von)/(vt*xn));

    Qspof = 0.;

    return;	/* done */
    }

  cdo	 = vgsx - vth - .5*( 1 + fbody )*vdsx;
  dcodvb = -dvtdvb - .5*dfbdvb*vdsx;

/* normalized drain current */

  cdnorm = cdo*vdsx;
  *Gm	 = vdsx;
  *Gds	 = -dvtdvd*vdsx;
  gdsx	 = vgsx - vth - ( 1 + fbody )*vdsx;
  *Gmbs  = dcodvb*vdsx;

/* drain current without velocity saturation effect */

  cd1	= beta*cdnorm;
  beta *= fgate;
  *Id	= beta*cdnorm;
  *Gm	= beta*(*Gm)  + dfgdvg*cd1;
  *Gds	= beta*(*Gds);
  gdsx	= beta*(gdsx) + dfgdvd*cd1;
  *Gmbs = beta*(*Gmbs);

/* velocity saturation factor */

  if ( VMAX != 0.) {
    double arga, fd2;

    fdrain = 1/( 1 + vdsx*onvdsc );
    fd2    = fdrain*fdrain;
    arga   = fd2*vdsx*onvdsc*onfg;
    dfddvg = -dfgdvg*arga;
    dfddvd = -dfgdvd*arga - fd2*onvdsc;
    dfddvb = -dfgdvb*arga;

/* drain current with velocity saturation effect */

    *Gm   = fdrain*(*Gm)   + dfddvg**Id;
    *Gds  = fdrain*(*Gds);
    gdsx  = fdrain*(gdsx)  + dfddvd**Id;
    *Gmbs = fdrain*(*Gmbs) + dfddvb**Id;
    *Id   = fdrain*(*Id);
    beta *= fdrain;
    }

/* channel length modulation */

  if ( Vds > *Vdsat && (VMAX == 0. || xdsquare != 0.) ) {
    double delxl, dldvd, ddldvg, ddldvd, ddldvb;

    if ( VMAX == 0.) {
      delxl  = sqrt(KAPPA*(Vds - *Vdsat)*xdsquare);
      dldvd  = .5*delxl/(Vds - *Vdsat);
      ddldvg = 0.;
      ddldvd = -dldvd;
      ddldvb = 0.;
      }
    else {
      double
	idsat,
	gdsat, gdoncd, gdonfd, gdonfg,
	emax,  emoncd, emongd,
	dgdvg,	dgdvd,	dgdvb,
	demdvg, demdvd, demdvb, dldem,
	arga, argb, argc;

      idsat  = *Id;
      gdsat  = idsat*( 1 - fdrain )*onvdsc;
      gdsat  = MAX(1E-12,gdsat);
      gdoncd = gdsat/idsat;
      gdonfd = gdsat/( 1 - fdrain );
      gdonfg = gdsat*onfg;
      dgdvg  = gdoncd*(*Gm)   - gdonfd*dfddvg + gdonfg*dfgdvg;
      dgdvd  = gdoncd*(*Gds)  - gdonfd*dfddvd + gdonfg*dfgdvd;
      dgdvb  = gdoncd*(*Gmbs) - gdonfd*dfddvb + gdonfg*dfgdvb;

      emax   = KAPPA*idsat*onxl/gdsat;
      emoncd = emax/idsat;
      emongd = emax/gdsat;
      demdvg = emoncd*(*Gm)   - emongd*dgdvg;
      demdvd = emoncd*(*Gds)  - emongd*dgdvd;
      demdvb = emoncd*(*Gmbs) - emongd*dgdvb;

      arga   = .5*emax*xdsquare;
      argc   = KAPPA*xdsquare;
      argb   = sqrt( arga*arga + argc*(Vds - *Vdsat) );
      delxl  = argb - arga;
      dldvd  = argc/(argb+argb);
      dldem  = .5*( arga/argb - 1 )*xdsquare;
      ddldvg = dldem*demdvg;
      ddldvd = dldem*demdvd - dldvd;
      ddldvb = dldem*demdvb;
      }

/* punch through approximation */

    if ( delxl > .5*Len ) {
      double arga;

      delxl  = Len - .25*Len*Len/delxl;
      arga   = 4*(Len-delxl)*(Len-delxl)/(Len*Len);
      ddldvg *= arga;
      ddldvd *= arga;
      ddldvb *= arga;
      dldvd  *= arga;
      }

/* saturation region */

    { double diddl,
	dlonxl = delxl*onxl,
	xlfact = 1/( 1 - dlonxl );

      *Id   *= xlfact;
      diddl  = *Id/(Len-delxl);
      *Gm    = xlfact*(*Gm)   + diddl*ddldvg;
      *Gds   = xlfact*(*Gds);
      gds0   = xlfact*(gdsx)  + diddl*ddldvd;
      *Gmbs  = xlfact*(*Gmbs) + diddl*ddldvb;
      *Gm   += gds0*dvsdvg;
      *Gmbs += gds0*dvsdvb;
      gdsx   = gds0*dvsdvd + diddl*dldvd;
      }

    }
  *Gds += gdsx;

/* finish strong inversion case */

  if ( Vgs < *Von ) {			/* weak inversion */
    double gms, gmw,
    onxn  = 1/xn,
    argg  = onxn/vt,
    argt  = (Vgs - *Von)*argg,
    expg  = EXP(argt),
    cdson = *Id;

    *Id = cdson*expg;
    gmw = *Id*argg;
    gms = *Gm*expg;
    *Gm = gmw;
    if ( Vds > *Vdsat )
      *Gm += gds0*dvsdvg*(*Id/cdson);

    *Gds  = (*Id/cdson)*(*Gds)	+ (gms-gmw)*dvodvd;
    *Gmbs = (*Id/cdson)*(*Gmbs) + (gms-gmw)*dvodvb - gmw*(Vgs - *Von)*onxn*dxndvb;
    }

/* charge computation */

  Qspof = 0.;

  } /* done */
