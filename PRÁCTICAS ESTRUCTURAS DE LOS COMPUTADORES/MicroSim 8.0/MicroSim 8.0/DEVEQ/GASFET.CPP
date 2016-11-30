/* gasfet.c
 *   $Revision:   1.34  $
 *   $Author:   DEC  $
 *   $Date:   11 Feb 1997 09:37:44  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the GaAs FET model parameters **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#define B_DEVICE

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "b.h"
#include "mserrors.h"
#include "psmesfet.h"		/* (level==4) PS mesfet model declarations */

static double
  GaAs2cap(struct B_ *,double,double,double,double,double,double *,double *);

int b_Load(	/* Process GaAsfet for DC and TRANSIENT analyses */
  struct b_ *Instance,	/* a device to evaluate */
  int ModeFl,			/* mode control flag:	see "tran.h" */
  int InitFl,			/* initialization flag: see "tran.h" */
  int LoadFl,			/* NO: bypass MatPrm load if solution unchanged */
  double Tmod           /* temperature of this device */
  )		/* return: did not converge (YES/NO) */
/*****************************************************************************
* Purpose
*   Process GaAsfet for DC and TRANSIENT analyses
*
* Returned value
*   YES if converged, else NO
*
* Discussion
*
* Author
*   pwt	  15 Aug 86	creation
*   pwt	  ?? Jul 87	add Raytheon model (level==2)
*   pwt	  02 Nov 87	correct usage of TAU (transit time)
*   pwt	  16 Mar 88	add shared data area to J.H, change source to match
*   pwt	  07 Mar 89	correct sign on reverse gm for Raytheon model
*   whjb  06 Apr 89	LoadFl==YES forces full recalculation
*   pwt	  15 Apr 89	set T=0 cap. current
*   sv 	  12 Feb 90	add local temperatures to models.
*   pwt	  12 Apr 90	add TriQuint model (level==3)
*   pwt	  04 May 90	minor speed-up in some calculations
*   pwt	  08 Aug 90	correct IC= for device type
*   pwt	  07 Nov 90	add VMAX and VDELTA for TriQuint
*   eks	  13 Jan 93	fix TriQuint model errors (non-scaling & negative gds)
*   dec	  11 May 94	replaced exp() w/ EXP()
*   eks	  12 Oct 94	add support for level=4 Parker-Skellern MESFET model
*   eks	  29 Sep 95	add support for level=5 TOM-2 model (TOM model ver. 2)
*   eks	  01 Nov 95	Changed PSinstanceinit to eliminate compiler warnings
*   dec   13-Nov-96     Replaced some globals with calls to Get() functions,
*                       and made current temperature a function parameter
*   dec   11 Feb 97     Fixed a 7.2 bug with state vector rotation for level 4
*
*****************************************************************************/
{ struct B_ *model;	/* device model */
  double
    beta,				/* device transconductance */
    isat,				/* junction saturation current */
    vds, vgs, vgd,	/* terminal voltages */
    vte,					/* effective thermal voltage */
    gm,					/* forward transconductance */
    gds, ggs, ggd,	/* conductances */
    ig, id, igd,		/* currents */
    idrain,				/* drain current */
    ig_hat, id_hat,	/* predicted currents */
    cgs, cgd, cds,	/* device capacitances */
    type;				/* +1 (so far) */

  double vt;
  double delvto = 0.0;

  int
    level,
    jlim_fl = YES,	/* junction limiting flag: YES, NO */
    pred_fl = NO,	/* pred. calculated  flag: YES, NO */
    nonconv = NO;	/* non-convergence   flag: YES, NO */

/* defines & declarations for state-vector access */

  cref pssv;                    /* (level==4) PS model parameter struct */
  struct psv_def *pv[MSTVCT];   /* (level==4) PS model extra state vectors */
  struct bsv_def *sv[MSTVCT];

  UPDATE_SV(sv,Instance->b_sda.b_sv);

/* defines for model parameter access: simplify code appearance */

#define PARAM(a) ((double)model->a)
#define AF		PARAM(B_af)
#define ALPHA	PARAM(B_alpha)
#define B		PARAM(B_b)
#define BETA	PARAM(B_beta)
#define CDS		PARAM(B_cds)
#define CGD		PARAM(B_cgd)
#define CGS		PARAM(B_cgs)
#define DELT	PARAM(B_delta)	/* TriQuint "delta" */
#define FC		PARAM(B_fc)
#define FCPB	FC		/* = fc*vbi */
#define F1		PARAM(B_f1)
#define F2		PARAM(B_f2)
#define F3		PARAM(B_f3)
#define GAMMA	PARAM(B_gamma)
#define IS		PARAM(B_is)
#define KF		PARAM(B_kf)
#define LAMBDA	PARAM(B_lambda)
#define LEVEL	PARAM(B_level)
#define M		PARAM(B_m)
#define N		PARAM(B_n)
#define Q		PARAM(B_q)
#define RD		PARAM(B_rd)
#define RG		PARAM(B_rg)
#define RS		PARAM(B_rs)
#define TAU		PARAM(B_tau)
#define VBI		PARAM(B_vbi)
#define VCRIT	PARAM(B_vcrit)
#define VDELTA	PARAM(B_vdelta)	/* Statz "delta" */
#define VMAX	PARAM(B_vmax)
#define VTO		PARAM(B_vto)
#define NG		PARAM(B_ng)
#define ND		PARAM(B_nd)
#define BTRK	PARAM(B_btrk)		/* Triquint's MC Kludge */
#define DVT		PARAM(B_dvt)		/* Triquint's MC Kludge */
#define DVTT	PARAM(B_dvtt)		/* Triquint's MC Kludge */

#define IG0		(Instance->bcv_ig)
#define ID0		(Instance->bcv_id)
#define IGD0	(Instance->bcv_igd)
#define GM0		(Instance->bcv_gm)
#define GDS0	(Instance->bcv_gds)
#define GGS0	(Instance->bcv_ggs)
#define GGD0	(Instance->bcv_ggd)

#define CGS0	(Instance->b_sda.b_ac.bac_cgs)
#define CGD0	(Instance->b_sda.b_ac.bac_cgd)
#define CDS0	(Instance->b_sda.b_ac.bac_cds)

#define DevOff	(Instance->b_off)
#define AREA	(Instance->b_area)

  model = Instance->b_model;		/* find the model */

  vt	= Tmod*BOLTZ/CHARGE;
  type	= model->B_type > 0 ? 1.: -1.;
  level = NINT(LEVEL);
  if ( level==3 || level==5 ) delvto = DVT + DVTT;

/* initialization */

  if	  ( InitFl==INSTV0 ) {		/* use prev. iteration */
    vgs = ( VOLTAGE(b_g) - VOLTAGE(b_s) )*type;
    vgd = ( VOLTAGE(b_g) - VOLTAGE(b_d) )*type;
    }
  else if ( InitFl==INTRAN ) {		/* use prev. time-step */
    vgs = B_VGS(1);
    vgd = B_VGD(1);
    }
  else if ( InitFl==INOFF && DevOff==YES )	/* set "off" devices */
    vgs = vgd = 0.;

  else if ( InitFl==ININIT ) {		/* use IC= values */

    if ( ModeFl==MDBPTR && NOSOLV==YES ) {
      vgs = (	 Instance->b_vgs)*type;
      vgd = (vgs-Instance->b_vds)*type;
      }
    else
      vgd = vgs = ( DevOff ? 0.: -1.);
    }
  else {
    double del_vgs, del_vgd, del_vds, del_id, del_ig;

    if ( InitFl==INPRDCT ) {		/* extrapolate value */
      double arg = GetDELTA()/GetDELTAOLD();

      vgs = arg*( B_VGS(1) - B_VGS(2) ) + B_VGS(1);
      vgd = arg*( B_VGD(1) - B_VGD(2) ) + B_VGD(1);
      *sv[0] = *sv[1];
      }
    else {				/* use current value */
      vgs = ( VOLTAGE(b_g) - VOLTAGE(b_s) )*type;
      vgd = ( VOLTAGE(b_g) - VOLTAGE(b_d) )*type;
      }

/* compute new non-linear branch voltage */

    del_vgd = vgd - B_VGD(0);
    del_vgs = vgs - B_VGS(0);
    del_vds = del_vgs - del_vgd;

    del_id = del_vds*GDS0 - del_vgd*GGD0 +
	     ( B_VGS(0) > B_VGD(0) ? del_vgs : del_vgd )*GM0;
    id_hat = del_id + ID0;

    del_ig = del_vgs*GGS0 + del_vgd*GGD0;
    ig_hat = del_ig + IG0;

/* bypass if solution not changed */

    if ( InitFl==INPRDCT && GetDELTA()!=GetDELTAOLD() || LoadFl==YES ) ;
    else if ( fabs(del_id)  >= CurrentTOL(id_hat,     ID0) ) ;
    else if ( fabs(del_vgd) >= VoltageTOL(   vgd,B_VGD(0)) ) ;
    else if ( fabs(del_vgs) >= VoltageTOL(   vgs,B_VGS(0)) ) ;
    else if ( fabs(del_ig)  >= CurrentTOL(ig_hat,     IG0) ) ;
    else {
      goto done;
      }
    pred_fl = YES;

/* solution changed: limit non-linear branch voltages */

    jlim_fl  = PNJLIM(vgs,B_VGS(0),vt,VCRIT);
    jlim_fl |= PNJLIM(vgd,B_VGD(0),vt,VCRIT);

    FETlim(&vgs,B_VGS(0), ( level==3 || level==5 ? VTO + delvto : VTO ));
    FETlim(&vgd,B_VGD(0), ( level==3 || level==5 ? VTO + delvto : VTO ));

    } /* end of initialization */

/* compute DC current and derivatives */

  if ( level==4 ) {				/* (level==4) PS mesfet model - dc call */
    UPDATE_SV(pv,Instance->b_sda.p_sv);
    pssv.psv = pv;
    pssv.bsv = sv;
    pssv.ModeFl = ModeFl;
    PSinstanceinit(model);
    vds = vgs-vgd;
    if (vds < 0.0) {
	   idrain = -PSids(&pssv, model, Instance, vgd, vgs, 
			   &igd, &ig, &ggd, &ggs, &gm, &gds, Tmod);
      } 
	 else {
	   idrain =  PSids(&pssv, model, Instance, vgs, vgd,
			   &ig, &igd, &ggs, &ggd, &gm, &gds, Tmod);
    	}
    ig += igd;
    } 
  else {                        /* else (level==4) PS mesfet model */

    beta= (level==3 || level==5 ? BETA+BTRK*delvto : AREA*BETA);
    isat	= AREA*IS;
    vte	= N*vt;
    vds	= vgs-vgd;

    if ( vgs > -10*vte ) {		/* currents re. vgs */
      double evgs = EXP(vgs/vte);

      ggs = (evgs/vte)*isat + GMIN;
      ig	= (evgs - 1)*isat + vgs*GMIN;
      }
    else {
      ggs = GMIN;
      ig	= ggs*vgs - isat;
      }

    if ( vgd > -10*vte ) {		/* currents re. vgd */
      double evgd = EXP(vgd/vte);

      ggd = (evgd/vte)*isat + GMIN;
      igd = (evgd - 1)*isat + vgd*GMIN;
      }
    else {
      ggd = GMIN;
      igd = ggd*vgd - isat;
      }

    ig += igd;

/* compute drain current & derivatives */

    if ( vds >= 0.) {			/* forward mode */
      double vgst = vgs-VTO;

      if ( level==3 || level==5 ) vgst += (GAMMA*vds - delvto);	/* TriQuit correction */

      if ( vgst <= 0. && (( level != 5 ) || ( NG+ND*vds == 0. )))	/* cut-off */
        idrain = gm = gds = 0.;
      else {
        double
	     vgstsq = vgst*vgst,
	     prod   = 1 + vds*LAMBDA,
	     betap  = prod*beta;

        if ( level==1 ) { 		/* Curtice: linear & saturated */
			 double arg = tanh(vds*ALPHA);

	       idrain = betap*vgstsq*arg;
	       gm     = 2*betap*vgst*arg;
	       gds    = beta*vgstsq*arg*LAMBDA + betap*vgstsq*(1-arg*arg)*ALPHA;
	       } 
        else if ( level==2 ) {		/* Raytheon model */
	       double arg = 1 + vgst*B;

	       if ( vds < 3/ALPHA ) {		/* Raytheon: linear */
	         double
	           afact = 1 - vds*ALPHA/3,
	           lfact = 1 - afact*afact*afact;

	         idrain = betap*vgstsq*lfact/arg;
	         gm	 = betap*vgst*(1+arg)*lfact/(arg*arg);
	         gds	 = beta*vgstsq*(afact*afact*prod*ALPHA + lfact*LAMBDA)/arg;
	         }
	       else {				/* Raytheon: saturated */
	         idrain = betap*vgstsq/arg;
	         gm	 = betap*vgst*(1+arg)/(arg*arg);
	         gds	 = beta*vgstsq*LAMBDA/arg;
	       } 
		  }
        else if ( level==3 ) {			/* TriQuint model */

    	    if ( vds < 3/ALPHA ) {			/* TriQuint: linear */
	         double
	           afact   = 1 - vds*ALPHA/3,
	           lfact   = 1 - afact*afact*afact,
	           lnvgst  = log(vgst),
	           izero   = beta*EXP(Q*lnvgst)*lfact,
	           gmzero  = Q*beta*EXP((Q-1)*lnvgst)*lfact,
	           gdszero = beta*EXP((Q-1)*lnvgst)*(lfact*Q*GAMMA
		                  + ALPHA*afact*afact*vgst),
	           pfact   = 1/(1+DELT*vds*izero),
	           idrainu = izero*pfact;		/* idrain per unit area */

	         gm	 = gmzero*pfact*pfact*AREA;
	         gds	 = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
	         idrain = idrainu*AREA;
	         }
	       else {							/* TriQuint: saturated */
	         double
	           lnvgst  = log(vgst),
	           izero   = beta*EXP(Q*lnvgst),
	           gmzero  = Q*beta*EXP((Q-1)*lnvgst),
	           gdszero = Q*GAMMA*beta*EXP((Q-1)*lnvgst),
	           pfact   = 1/(1+DELT*vds*izero),
	           idrainu = izero*pfact;			  /* idrain per unit area */

	         gm	 = gmzero*pfact*pfact*AREA;
	         gds	 = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
	         idrain = idrainu*AREA;
	       }
		  }
        else if ( level==5 ) {			/* TOM-2 Model */
		    double 
			   afact = ALPHA*vds,
			   lfact = afact/sqrt(1.0+afact*afact),
			   vst = vt*(NG+ND*vds),
			   ovefact = EXP(vgst/Q/vst)+1.0,
			   vg1 = Q*vst*LOG(ovefact),
			   izero = beta*pow(vg1,Q)*lfact,
			   gmzero = Q*beta*pow(vg1,Q-1.0)*lfact/(EXP(-vgst/Q/vst)+1.0),
			   mfact = sqrt(1.0+afact*afact),
			   mfact1 = mfact*mfact*mfact,
			   gdszero = gmzero*(GAMMA-ND*vgst/(NG+ND*vds))
					      + Q*izero*ND/(NG+ND*vds)
					      + ALPHA*beta*pow(vg1,Q)/mfact1, 
			   pfact = 1.0/(1.0+DELT*vds*izero),
			   idrainu = izero*pfact;
		    gm = gmzero*pfact*pfact*AREA;
		    gds = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
		    idrain = idrainu*AREA; 
          } 
        } 
      }
    else {				/* reverse mode */
      double vgdt = vgd-VTO;

      if ( level==3 || level==5 ) vgdt -= (GAMMA*vds + delvto);	/* TriQuit correction */

      if ( vgdt <= 0. && (( level != 5 ) || ( NG+ND*vds == 0.)))	/* cut-off */
        idrain = gm = gds = 0.;
      else {
        double
          vgdtsq = vgdt*vgdt,
	       prod   = 1 - vds*LAMBDA,
	       betap  = prod*beta;

        if ( level==1 ) { 		/* Curtice: linear & saturated */
	       double arg = tanh(-vds*ALPHA);

	       idrain = -betap*vgdtsq*arg;
	       gm     = 2*betap*vgdt*arg;
	       gds    = beta*vgdtsq*arg*LAMBDA + betap*vgdtsq*(1-arg*arg)*ALPHA;
	       }
        else if ( level==2 ) {		/* Raytheon model */
	       double arg = 1 + vgdt*B;

	       if ( -vds < 3/ALPHA ) { 	/* Raytheon: linear */
	         double
	           afact = 1 + vds*ALPHA/3,
	           lfact = 1 - afact*afact*afact;

	         idrain = -betap*vgdtsq*lfact/arg;
	         gm	 = betap*vgdt*(1+arg)*lfact/(arg*arg);
	         gds	 = beta*vgdtsq*(afact*afact*prod*ALPHA + lfact*LAMBDA)/arg;
	         }
	       else {				/* Raytheon: saturated */
	         idrain = -betap*vgdtsq/arg;
	         gm	 = betap*vgdt*(1+arg)/(arg*arg);
	         gds	 = beta*vgdtsq*LAMBDA/arg;
	       }
        }
        else if ( level==3 ) {				/* TriQuint model */

	       if ( -vds < 3/ALPHA ) { 			/* TriQuint: linear */
	         double
	           afact   = 1 + vds*ALPHA/3,
	           lfact   = 1 - afact*afact*afact,
	           lnvgdt  = log(vgdt),
	           izero   = beta*EXP(Q*lnvgdt)*lfact,
	           gmzero  = Q*beta*EXP((Q-1)*lnvgdt)*lfact,
	           gdszero = beta*EXP((Q-1)*lnvgdt)*(lfact*Q*GAMMA
		                 + ALPHA*afact*afact*vgdt),
	           pfact   = 1/(1-DELT*vds*izero),	/* power correction */
	           idrainu = -izero*pfact;			/* idrain per unit area */

	         gm	 = gmzero*pfact*pfact*AREA;
	         gds	 = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
	         idrain = idrainu*AREA;
	         }
	       else {								/* TriQuint: saturated */
	         double
	           lnvgdt  = log(vgdt),
	           izero   = beta*EXP(Q*lnvgdt),
	           gmzero  = Q*beta*EXP((Q-1)*lnvgdt),
	           gdszero = Q*GAMMA*beta*EXP((Q-1)*lnvgdt),
	           pfact   = 1/(1-DELT*vds*izero),
	           idrainu = -izero*pfact;			/* idrain per unit area */

	         gm	 = gmzero*pfact*pfact*AREA;
	         gds	 = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
	         idrain = idrainu*AREA;
	       }
        }
	     else if ( level==5 ) {				/* TOM-2 Model */
          double 
 		      afact = -ALPHA*vds,
		      lfact = afact/sqrt(1.0+afact*afact),
		      vst = vt*(NG-ND*vds),
		      ovefact = EXP(vgdt/Q/vst)+1.0,
		      vg1 = Q*vst*log(ovefact),
		      izero = beta*pow(vg1,Q)*lfact,
		      gmzero = Q*beta*pow(vg1,Q-1.0)*lfact/(EXP(-vgdt/Q/vst)+1.0),
		      mfact = sqrt(1.0+afact*afact),
		      mfact1 = mfact*mfact*mfact,
		      gdszero = gmzero*(GAMMA-ND*vgdt/(NG-ND*vds))
					      + Q*izero*ND/(NG-ND*vds)
					      + ALPHA*beta*pow(vg1,Q)/mfact1,
		      pfact = 1.0/(1.0-DELT*vds*izero),
		      idrainu = izero*pfact;

		    gm = gmzero*pfact*pfact*AREA;
		    gds = (gdszero*pfact*pfact - DELT*idrainu*idrainu)*AREA;
		    idrain = -idrainu*AREA; 
          }
        }
      }
    } /* else (level==4) PS mesfet model */

  if ( ModeFl==MDTRAN && TAU!=0.) {	/* Weil's approximation for */
    double				/* time delay applied with */
      arg1  = GetDELTA()/TAU,		/* backward Euler integration */
      arg2  = 3*arg1,
      denom = ( arg1 *= arg2 ) + arg2 + 1,
      arg3  = arg1/denom;

    if ( InitFl==INTRAN )		/* set-up initial current */
      B_IEXDS(2) = B_IEXDS(1) = idrain;

    idrain *= arg3;
    gm	   *= arg3;

    id = ( B_IEXDS(1)*( 1 + GetDELTA()/GetDELTAOLD() + arg2 ) -
	   B_IEXDS(2)*GetDELTA()/GetDELTAOLD() )/denom;

    B_IEXDS(0) = id + idrain;
    }
  else
    id = 0.;

  id += idrain-igd;				/* equiv. drain current */

/* charge calculations */

  if ( ModeFl==MDTRAN ||
       InitFl==INSTV0 ||
     ( ModeFl==MDBPTR && NOSOLV==YES ) ) {
    double
      cgso = CGS*AREA,			/* scale 0-bias cap. */
      cgdo = CGD*AREA,
      cdso = CDS*AREA;

    if ( level==4 ) {			/* else (level==4) PS mesfet model */
      pssv.ModeFl = ModeFl;
      PScharge(&pssv, model, Instance, vgs, vgd, &cgs,&cgd);
      } 
    else {                   /* else (level==4) PS mesfet model */

      if ( level==1 ) {
        PNJCHG(B_QCGS(0),cgs,cgso,vgs,VBI,FCPB,M,F1,F2,F3);
        PNJCHG(B_QCGD(0),cgd,cgdo,vgd,VBI,FCPB,M,F1,F2,F3);
        }
      else {
        double
	       vcap = 1/ALPHA,
	       qgga = GaAs2cap(model,vgs,vgd,vcap,cgso,cgdo,&cgs,&cgd),
	       qggb = GaAs2cap(model,B_VGS(1),vgd,vcap,cgso,cgdo,NULL,NULL),
          qggc = GaAs2cap(model,vgs,B_VGD(1),vcap,cgso,cgdo,NULL,NULL),
	       qggd = GaAs2cap(model,B_VGS(1),B_VGD(1),vcap,cgso,cgdo,NULL,NULL);

        if ( ModeFl==INTRAN )	/* set-up for initial charge equation */
          B_QCGS(1) = B_QCGD(1) = qgga;

          B_QCGS(0) = .5*(qgga-qggb + qggc-qggd) + B_QCGS(1);
          B_QCGD(0) = .5*(qgga-qggc + qggb-qggd) + B_QCGD(1);
        }
      } /* else (level==4) PS mesfet model */

    B_QCDS(0) = cdso*vds;
    cds = cdso;

    B_ICGS(0) = 	/* reset, so T=0 results (e.g. Probe) are correct */
    B_ICGD(0) =
    B_ICDS(0) = 0.;

    if ( InitFl==INSTV0 ) {		/* store small-signal parameters */
      CGS0 = cgs;			/* and update the state vector */
      CGD0 = cgd;
      CDS0 = cds;

      goto load;
      }

    if ( !(ModeFl==MDBPTR && NOSOLV==NO) ) {	/* transient analysis */
      double g_eq, i_eq;

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	     B_QCGS(2) = B_QCGS(1) = B_QCGS(0);	/* set "old" charges so */
	     B_QCGD(2) = B_QCGD(1) = B_QCGD(0);	/* integration works */
	     B_QCDS(2) = B_QCDS(1) = B_QCDS(0);
	     }

      INTEGR8(g_eq,i_eq,cgs,B_QIGS(0),B_QIGS(1),B_QIGS(2));
      ggs  += g_eq;

      INTEGR8(g_eq,i_eq,cgd,B_QIGD(0),B_QIGD(1),B_QIGD(2));
      ggd  += g_eq;

      INTEGR8(g_eq,i_eq,cds,B_QIDS(0),B_QIDS(1),B_QIDS(2));
      gds  += g_eq;

      ig  += B_ICGD(0) + B_ICGS(0);
      igd += B_ICGD(0);
      id  += B_ICDS(0) - B_ICGD(0);

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
        B_ICGS(1) = B_ICGS(0);			/* set "old" currents so */
        B_ICGD(1) = B_ICGD(0);			/* time-step calc. works */
        B_ICDS(1) = B_ICDS(0);
        }
      }
    } /* end of charge calculations */

/* check convergence */

  if ( pred_fl && (
	 jlim_fl ||
	 fabs(id_hat-id) > CurrentTOL(id_hat,id) ||
	 fabs(ig_hat-ig) > CurrentTOL(ig_hat,ig)
	 )
       ) nonconv = YES;

load:
  { int xfwd = ( vds > 0. ? YES : NO );
    double
      gdpr, gspr,
      ieq_gd =	    igd - ggd*vgd,
      ieq_gs = ig - igd - ggs*vgs,
      ieq_dr = id + igd - gds*vds - gm*( xfwd ? vgs : -vgd );

	/* load current vector */

    Y_MATRIX(b_ig) = -type*(ieq_gs + ieq_gd);
    Y_MATRIX(b_id) =  type*(ieq_gd - ieq_dr);
    Y_MATRIX(b_is) =  type*(ieq_gs + ieq_dr);

	/* load conductance matrix */


    Y_MATRIX(b_ds) = ( xfwd ? -gm :  0. ) - gds;
    Y_MATRIX(b_dg) = ( xfwd ?  gm : -gm ) - ggd;
    Y_MATRIX(b_dd) = ( xfwd ?  0. :  gm ) + gds + ggd + ( gdpr = AREA*RD );

    Y_MATRIX(b_sd) = ( xfwd ?  0. : -gm ) - gds;
    Y_MATRIX(b_sg) = ( xfwd ? -gm :  gm ) - ggs;
    Y_MATRIX(b_ss) = ( xfwd ?  gm :  0. ) + gds + ggs + ( gspr = AREA*RS );

    Y_MATRIX(b_gd) = -ggd;
    Y_MATRIX(b_gs) = -ggs;
    Y_MATRIX(b_gg) =  ggd + ggs + RG;

    if ( LoadFl ) {
      Y_MATRIX(b_dD) = Y_MATRIX(b_Dd) = -( Y_MATRIX(b_DD) = gdpr );
      Y_MATRIX(b_Ss) = Y_MATRIX(b_sS) = -( Y_MATRIX(b_SS) = gspr );
      Y_MATRIX(b_Gg) = Y_MATRIX(b_gG) = -( Y_MATRIX(b_GG) = RG );
      }
    }

  B_VGS(0) = vgs;
  B_VGD(0) = vgd;

  IG0 = ig ;
  ID0 = id ;

  GM0  = gm ;
  GDS0 = gds;
  GGS0 = ggs;
  GGD0 = ggd;

done:
  return nonconv;
  }

static double GaAs2cap(	/* calculate channel charge for Raytheon model */
struct B_ *model,
double	 vgs,
double	 vgd,
double	 vcap,
double	 cgso,
double	 cgdo,
double	 *p_cgs,
double	 *p_cgd)
/* Author
  pwt	87-07-00	creation (after SPICE3A7)
  pwt	87-10-29	correct Cgd formula, re-work code for speed
  pwt	07 Nov 90	pass in *model instead of model parameters
*/

{ double ext, qroot, qggval,
    veroot = sqrt( (vgs - vgd)*(vgs - vgd) + vcap*vcap ),
    veff1  = .5*(veroot + vgs + vgd),
    veff2  = veff1 - veroot,
    level  = NINT(LEVEL),
    vtoeff  = ( level==3 || level==5 ? VTO + DVT + DVTT : VTO ),
    vnroot = sqrt( (veff1 - vtoeff)*(veff1 - vtoeff) + VDELTA*VDELTA ),
    vnew1  = .5*(vnroot + veff1 + vtoeff),
    vnew3  = vnew1;

  if ( vnew1 < VMAX )
    ext = 0.;
  else {
    vnew1 = VMAX;
    ext   = (vnew3-VMAX)/sqrt(1-VMAX/VBI);
    }
  qroot  = sqrt(1 - vnew1/VBI),
  qggval = cgso*(2*VBI*(1-qroot) + ext) + cgdo*veff2;

  if ( p_cgs!=NULL && p_cgd!=NULL ) {	/* calculate capacitances */
    double
      par1   = .5*(1 + (veff1-vtoeff)/vnroot),
      cgsx   = par1*cgso/qroot,
      cfact  = (vgs-vgd)/veroot,
      cplus  = .5*(1 + cfact),
      cminus = cplus - cfact;

    *p_cgs = cgsx*cplus  + cgdo*cminus;
    *p_cgd = cgsx*cminus + cgdo*cplus;
    }

  return qggval;
  }


