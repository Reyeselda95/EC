/* bjt.c
 *   $Revision:   1.36  $
 *   $Author:   DEC  $
 *   $Date:   13 Nov 1996 15:35:04  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the bipolar model parameters  **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

#define Q_DEVICE

#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "q.h"
#include "mserrors.h"

int q_Load(	/* Process bipolar transistor for DC and TRANSIENT analyses */
  struct q_ *Instance,	/* a device to evaluate */
  int ModeFl,		/* mode control flag:	see "tran.h" */
  int InitFl,		/* initialization flag: see "tran.h" */
  int LoadFl,		/* NO: bypass MatPrm load if solution unchanged */
  double Tmod           /* temperature of this device */
  )		/* return: did not converge (YES/NO) */
/*****************************************************************************
* Purpose
*   Process bipolar transistor for DC and TRANSIENT analyses
*
* Returned value
*   YES if converged, else NO
*
* Discussion
*
* Author
*   pwt	  19 Aug 86	creation
*   pwt	  16 Mar 88	add shared data area to Q.H, change source to match
*   whjb  04 Mar 89	Added substrate current to bypass check
*   whjb  06 Apr 89	LoadFl==YES forces full recompute
*   pwt	  15 Apr 89	set T=0 cap. currents
*   pwt	  15 Oct 89	enhancements for quasi-saturation effect
*   pwt	  13 Dec 89	add high-injection parameter NK effect
*   sv	  12 Feb 90	add local temperatures to models.
*   pwt	  04 May 90	minor speed-up in some calculations
*   pwt	  08 Aug 90	apply LoadFl condition to parasitic resistors
*   whjb  23 Aug 91	add geqbx to id_hat calculation
*   pwt	  31 Jul 91	correct NK effect on conductance calculations
*   dec	  01 Apr 93	swapped INTEGR80 for INTEGR8 since ieq not needed
*   dec	  11 May 94	changed exp() to EXP() for charge calculations
*   eks	  16 Feb 95	Changes associated with the added parameter XCJC2.
*   			XCJC2 specifies a portion of the CJC capacitance to
*   			be between external B and C nodes instead of between
*   			external B and internal c nodes.  When XCJC2 is used,
*   			XCJC is ignored.
*   gwb   29 Jul 96     Add corrections to fix XCJC2 implementation.
*   dec   13-Nov-96     Replaced some globals with calls to Get() functions,
*                       and made current temperature a function parameter
*
*****************************************************************************/
{ struct Q_ *model;	/* device model */
  double
    isat,		/* ideal junction saturation current */
    vbc, vbe, vbx, vbx2, vbn, /* voltages */
    vce, vjs,		/* vjs is c-to-S for NPN, b-to-S for PNP */
    vtc, vte, vtn,
    gpi, gmu,		/* conductances: active */
    gm, go, gx,
    gbc, gbe, gjs,
    gnbn, gnbc,
    gbcn, gben,
    geq_cb,		/* equiv. cond. of transit time as funct. of Vbc */
    geq_bx,		/* equiv. cond. of b-x capacitance */
    geq_bx2,		/* equiv. cond. of B-C capacitance */
    geq_bn,		/* equiv. cond. of b-n capacitance */
    gex, iex,		/* excess phase contributions */
    gxn, gxc,		/* quasi-saturation value */
    kqb,		/* base charge factors */
    dkqb_dvbe,
    dkqb_dvbc,
    ic, ib, in, 	/* currents */
    isc, ise, iss,
    ibc, ibe, ijs,
    ibcn, iben,
    ic_hat, ib_hat,	/* predicted currents */
    in_hat,
    type;		/* NPN=+1, PNP=-1 */
#ifdef INC_IJS
  double is_hat;
#endif

  double vt;

  int
    qsat,
    jlim_fl = YES,	/* junction limiting flag: YES, NO */
    pred_fl  = NO,	/* pred. calculated  flag: YES, NO */
    nonconv  = NO;	/* non-convergence   flag: YES, NO */

/* defines & declarations for state-vector access */

  struct qsv_def *sv[MSTVCT];

  UPDATE_SV(sv,Instance->q_sda.q_sv);

/* defines for model parameter access: simplify code appearance */

#define PARAM(a) ((double)model->a)
#define LPNP	(model->Q_lpnp)
#define AF	PARAM(Q_af)
#define BF	PARAM(Q_bf)
#define BR	PARAM(Q_br)
#define CJC	PARAM(Q_cjc)
#define CJE	PARAM(Q_cje)
#define CJS	PARAM(Q_cjs)
#define EG	PARAM(Q_eg)
#define FC	PARAM(Q_fc)
#define GAMMA	PARAM(Q_gamma)
#define IKF	PARAM(Q_ikf)
#define IKR	PARAM(Q_ikr)
#define IRB	PARAM(Q_irb)
#define IS	PARAM(Q_is)
#define ISC	PARAM(Q_isc)
#define ISE	PARAM(Q_ise)
#define ISS	PARAM(Q_iss)
#define ITF	PARAM(Q_itf)
#define KF	PARAM(Q_kf)
#define MJC	PARAM(Q_mjc)
#define MJE	PARAM(Q_mje)
#define MJS	PARAM(Q_mjs)
#define NC	PARAM(Q_nc)
#define NE	PARAM(Q_ne)
#define NF	PARAM(Q_nf)
#define NK	PARAM(Q_nk)
#define NR	PARAM(Q_nr)
#define NS	PARAM(Q_ns)
#define PTF	PARAM(Q_ptf)
#define QCO	PARAM(Q_qco)
#define RB	PARAM(Q_rb)
#define RBM	PARAM(Q_rbm)
#define RC	PARAM(Q_rc)
#define RCO	PARAM(Q_rco)
#define RE	PARAM(Q_re)
#define TF	PARAM(Q_tf)
#define TR	PARAM(Q_tr)
#define VAF	PARAM(Q_vaf)
#define VAR	PARAM(Q_var)
#define VJC	PARAM(Q_vjc)
#define VJE	PARAM(Q_vje)
#define VJS	PARAM(Q_vjs)
#define VO	PARAM(Q_vo)
#define VTF	PARAM(Q_vtf)
#define XCJC	PARAM(Q_xcjc)
#define XCJC2	PARAM(Q_xcjc2)
#define XTB	PARAM(Q_xtb)
#define XTF	PARAM(Q_xtf)
#define XTI	PARAM(Q_xti)

#define FCPE	PARAM(Q_fcpe)
#define F1BE	PARAM(Q_f1be)
#define F2BE	PARAM(Q_f2be)
#define F3BE	PARAM(Q_f3be)
#define FCPC	PARAM(Q_fcpc)
#define F1BC	PARAM(Q_f1bc)
#define F2BC	PARAM(Q_f2bc)
#define F3BC	PARAM(Q_f3bc)
#define VCRIT	PARAM(Q_vcrit)

#define TD	PTF	/* = TF*PF (in radians) */

#define IN0	(Instance->qcv_in)
#define IC0	(Instance->qcv_ic)
#define IB0	(Instance->qcv_ib)
#define IJS0	(Instance->qcv_ijs)

#define GPI0	(Instance->qcv_gpi)
#define GMU0	(Instance->qcv_gmu)
#define GM0	(Instance->qcv_gm)
#define GO0	(Instance->qcv_go)
#define GX0	(Instance->qcv_gx)
#define GJS0	(Instance->qcv_gjs)
#define GEQBN0	(Instance->qcv_gnbeq)	/* change to ~gbneq for consistency */
#define GEQCB0	(Instance->qcv_gcbeq)
#define GEQBX0	(Instance->qcv_gbxeq)
#define GEQBX20	(Instance->qcv_gbx2eq)

#define GNBN0	(Instance->qcv_gnbn)
#define GNBC0	(Instance->qcv_gnbc)

#define CBN0	(Instance->q_sda.q_ac.qac_cbn)
#define CBC0	(Instance->q_sda.q_ac.qac_cbc)
#define CBE0	(Instance->q_sda.q_ac.qac_cbe)
#define CJS0	(Instance->q_sda.q_ac.qac_cjs)
#define CBX0	(Instance->q_sda.q_ac.qac_cBc)
#define CBX20	(Instance->q_sda.q_ac.qac_cBC)

#define DevOff	(Instance->q_off)
#define AREA	(Instance->q_area)

  model = Instance->q_model;		/* find the model */

  vt	= Tmod*BOLTZ/CHARGE;
  type	= model->Q_type > 0 ? 1.: -1.;

/* initialization */

  geq_bx = geq_bx2 = geq_cb = geq_bn = 0.;

  qsat = RCO!=0.? YES : NO;

  if	  ( InitFl==INSTV0 ) {		/* use prev. iteration */
    double
      vb = VOLTAGE(q_b),
      vc = VOLTAGE(q_c);

    vbe = type*( vb - VOLTAGE(q_e) );
    vbc = type*( vb - vc );
    vbn = type*( vb - VOLTAGE(q_n) );
    vbx = type*( VOLTAGE(q_B) - vc );
    vbx2 = type*( VOLTAGE(q_B) - VOLTAGE(q_C) );
    vjs = LPNP
	? type*( vb - VOLTAGE(q_S) )
	: type*( VOLTAGE(q_S) - vc );
    }
  else if ( InitFl==INTRAN ) {		/* use prev. time-step */
    vbe = Q_VBE(1);
    vbc = Q_VBC(1);
    vbn = Q_VBN(1);
    vjs = Q_VJS(1);
    if ( ModeFl==MDTRAN && NOSOLV==YES ) {
      vbx = type*( Instance->q_vbe - Instance->q_vce );
      vbx2 = type*( Instance->q_vbe - Instance->q_vce );
      }
    else {
      vbx = type*( VOLTAGE(q_B) - VOLTAGE(q_c) );
      vbx2 = type*( VOLTAGE(q_B) - VOLTAGE(q_C) );
      }
    }
  else if ( InitFl==INOFF &&		/* set "off" devices */
	    DevOff==YES)
    vbe = vbc = vbn = vjs = vbx = vbx2 = 0.;

  else if ( InitFl==ININIT ) {		/* use IC= values */

    if ( ModeFl==MDBPTR && NOSOLV==YES ) {
      vce = type*Instance->q_vce;
      vbe = type*Instance->q_vbe;
      vbx = vbc = vbn = vbe-vce;
      vbx2 = type*( VOLTAGE(q_B) - VOLTAGE(q_C) );
      vjs = 0.;
      }
    else {
      vbe = ( DevOff ? 0. : VCRIT );
      vbc = vbn = vbx = vbx2 = vjs = 0.;
      }
    }
  else {
    double
      del_vbe, del_vbc, del_vbn, del_vjs, del_vbx, del_vbx2, del_in, del_ic, del_ib;
#ifdef INC_IJS
    double del_is;
#endif

    if ( InitFl==INPRDCT ) {		/* extrapolate value */
      double arg = GetDELTA()/GetDELTAOLD();

      vbe = arg*( Q_VBE(1) - Q_VBE(2) ) + Q_VBE(1);
      vbc = arg*( Q_VBC(1) - Q_VBC(2) ) + Q_VBC(1);
      vbn = arg*( Q_VBN(1) - Q_VBN(2) ) + Q_VBN(1);
      vjs = arg*( Q_VJS(1) - Q_VJS(2) ) + Q_VJS(1);

      *sv[0] = *sv[1];

      vbx = type*( VOLTAGE(q_B) - VOLTAGE(q_c) );
      vbx2 = type*( VOLTAGE(q_B) - VOLTAGE(q_C) );
      }
    else {				/* use current value */
      double
	vb = VOLTAGE(q_b),
	vc = VOLTAGE(q_c);

      vbe = type*( vb - VOLTAGE(q_e) );
      vbc = type*( vb - vc );
      vbn = type*( vb - VOLTAGE(q_n) );
      vbx = type*( VOLTAGE(q_B) - vc );
      vbx2 = type*( VOLTAGE(q_B) - VOLTAGE(q_C) );
      vjs = LPNP
	  ? type*( vb - VOLTAGE(q_S) )
	  : type*( VOLTAGE(q_S) - vc );
      }

/* compute new non-linear branch voltage */

    del_vbe = vbe - Q_VBE(0);
    del_vbc = vbc - Q_VBC(0);
    del_vbn = vbn - Q_VBN(0);
    del_vjs = vjs - Q_VJS(0);
    del_vbx = vbx - Q_VBX(0);
    del_vbx2 = vbx2 - Q_VBX2(0);

    del_ic =   del_vbe*(GM0+GO0)
	     - del_vbc*(GMU0+GNBC0+GO0)
	     - del_vbn*GNBN0
	     - (   LPNP ? 0. :	del_vjs*GJS0 )
	     - ( MDTRAN ? del_vbx*GEQBX0 : 0.)
	     - ( MDTRAN ? del_vbx2*GEQBX20 : 0.);

    ic_hat = del_ic + IC0;

    del_ib =   del_vbe*GPI0
	     + del_vbc*(GMU0+GEQCB0)
	     + (  LPNP	? del_vjs*GJS0	 : 0.)
	     + ( MDTRAN ? del_vbn*GEQBN0 : 0.);

    ib_hat = del_ib + IB0;

    if ( qsat ) {
      del_in =	 del_vbc*GNBC0
	       + del_vbn*( GNBN0 - ( MDTRAN ? GEQBN0 : 0.));
      in_hat = del_in + IN0;
      }
    else
      in_hat = del_in = 0.;

#ifdef INC_IJS
    del_is = del_vjs*GJS0;
    is_hat = del_is + IJS0;
#endif

/* bypass if solution not changed */

    if ( LoadFl ) ;
    else if ( InitFl==INPRDCT && GetDELTA()!=GetDELTAOLD() ) ;
    else if ( qsat &&
	      fabs(del_in)  >= CurrentTOL(in_hat,     IN0) ) ;
    else if ( fabs(del_ic)  >= CurrentTOL(ic_hat,     IC0) ) ;
    else if ( fabs(del_vbc) >= VoltageTOL(   vbc,Q_VBC(0)) ) ;
    else if ( fabs(del_vbe) >= VoltageTOL(   vbe,Q_VBE(0)) ) ;
    else if ( qsat &&
	      fabs(del_vbn) >= VoltageTOL(   vbn,Q_VBN(0)) ) ;
    else if ( fabs(del_vjs) >= VoltageTOL(   vjs,Q_VJS(0)) ) ;
    else if ( fabs(del_ib)  >= CurrentTOL(ib_hat,     IB0) ) ;
#ifdef INC_IJS
    else if ( fabs(del_is)  >= CurrentTOL(is_hat,    IJS0) ) ;
#endif
    else {
      goto done;
      }
    pred_fl = YES;

/* solution changed: limit new junction voltages */

    vtn = NF*vt;

    jlim_fl  = PNJLIM(vbe,Q_VBE(0),vtn,VCRIT);
    jlim_fl |= PNJLIM(vbc,Q_VBC(0),vtn,VCRIT);

    if (  qsat	) jlim_fl |= PNJLIM(vbn,Q_VBN(0),vtn,VCRIT);
    if ( ISS!=0.) jlim_fl |= PNJLIM(vjs,Q_VJS(0),vtn,VCRIT);

    } /* end of initialization */

/* compute DC current & derivatives */

  isat = AREA*IS;
  ise  = AREA*ISE;
  isc  = AREA*ISC;
  iss  = AREA*ISS;
  vte  = NE*vt;
  vtc  = NC*vt;
  vtn  = NF*vt;

  if ( vbe > -10*vtn ) {		/* b-e "active" */
    double evbe = EXP(vbe/vtn);

    gbe = (evbe/vtn)*isat + GMIN;
    ibe = (evbe-1)*isat + vbe*GMIN;

    if ( ise==0. )
      gben = iben = 0.;
    else {
      double evben = EXP(vbe/vte);

      gben = (evben/vte)*ise;
      iben = (evben-1)*ise;
    } }
  else {				/* b-e reverse bias */
    gbe  = GMIN;
    ibe  = vbe*GMIN - isat;
    gben = 0.;
    iben = ( ise==0. ? 0. : -ise );
    }

  vtn = NR*vt;
  if ( vbc > -10*vtn ) {		/* b-c "active" */
    double evbc = EXP(vbc/vtn);

    gbc = (evbc/vtn)*isat + GMIN;
    ibc = (evbc-1)*isat + vbc*GMIN;

    if ( isc==0. )
      gbcn = ibcn = 0.;
    else {
      double evbcn = EXP(vbc/vtc);

      gbcn = (evbcn/vtc)*isc;
      ibcn = (evbcn-1)*isc;
    } }
  else {				/* b-c reverse bias */
    gbc  = GMIN;
    ibc  = vbc*GMIN - isat;
    gbcn = 0.;
    ibcn = ( isc==0. ? 0. : -isc );
    }

  if ( iss==0. ) {			/* no diode (SPICE compatible) */
    gjs = ijs = 0.;
    }
  else {
    vtn = NS*vt;
    if ( vjs > -10*vtn ) {		/* substrate junction "active" */
      double evjs = EXP(vjs/vtn);

      gjs = (evjs/vtn)*iss + GMIN;
      ijs = (evjs-1)*iss + vjs*GMIN;
      }
    else {				/* substrate junction reverse bias */
      gjs = GMIN;
      ijs = vjs*GMIN - iss;
    } }

  { double				/* determine base charge terms */
      kq1 = 1/(1 - vbc*VAF - vbe*VAR);

    kqb = kq1;
    dkqb_dvbc = kq1*kqb*VAF;
    dkqb_dvbe = kq1*kqb*VAR;

    if ( IKF!=0. || IKR!=0.) {
      double arg, darg, 		/* due to MODCHK: */
	oikf = IKF/AREA,		/* IKF is really 1/ikf */
	oikr = IKR/AREA,		/* IKR is really 1/ikr */
	kq2  = ibe*oikf + ibc*oikr;

      arg = 1+4*kq2;
      if ( arg<=0.) darg = arg = 1.;	/* erronious situation */
      else {				/* darg = arg^(NK-1) */
	if ( NK==.5 )
	  darg = ( arg = sqrt( darg = arg) )/darg;
	else
	  darg = ( arg = pow(  darg = arg, NK) )/darg;
	}

      kqb	= kq1*(1+arg)*.5;
      dkqb_dvbc = kq1*(kqb*VAF + oikr*gbc*darg*2*NK);
      dkqb_dvbe = kq1*(kqb*VAR + oikf*gbe*darg*2*NK);
    } }

  if ( ModeFl==MDTRAN && TD!=0.) {	/* Weil's approximation for */
    double				/* excess phase applied with */
      arg1  = GetDELTA()/TD, 		/* backward Euler integration */
      arg2  = 3*arg1,
      denom = ( arg1 *= arg2 ) + arg2 + 1,
      arg3  = arg1/denom;

    gex = arg3*gbe;
    iex = arg3*ibe;

    if ( InitFl==INTRAN )		/* set-up initial current */
      Q_IEXBC(2) = Q_IEXBC(1) = ibe/kqb;

    ic = ( Q_IEXBC(1)*( 1 + GetDELTA()/GetDELTAOLD() + arg2 ) -
	   Q_IEXBC(2)*GetDELTA()/GetDELTAOLD() )/denom;

    Q_IEXBC(0) = ic + iex/kqb;
    }
  else {
    ic	= 0.;
    gex = gbe;
    iex = ibe;
    }

  { double				/* combine currents and determine */
      arg1 = ibc/BR + ibcn,		/* DC incremental conductances */
      arg2 = (iex-ibc)/kqb;

    ic += arg2 - arg1;
    ib	= ibe/BF + iben + arg1;

    gpi = gbe/BF + gben;
    gmu = gbc/BR + gbcn;
    go	= (gbc + arg2*dkqb_dvbc)/kqb;
    gm	= (gex - arg2*dkqb_dvbe)/kqb - go;
    }

  if ( RB==0.) gx = 0.; 		/* determine base resistance */
  else {
    if ( IRB==0.) gx = RBM + (RB-RBM)/kqb;
    else {
      double
	arg1 = ib/(AREA*IRB),
	arg2;

      if ( arg1<=1E-16 ) gx = RB;	/* too small re. 1.0 */
      else {
	arg1 = arg1*14.59025044449664;	/* (ib/ibr)*(12/pi)^2 */

	arg2 = .25*TWOPI*(sqrt(1+arg1)-1)/sqrt(arg1);

	arg1 = tan(arg2);

	gx   = RBM + (RB-RBM)*(arg1-arg2)*3/(arg2*arg1*arg1);
      } }
    gx = AREA/gx;
    }

  if ( qsat ) { 			/* quasi-saturation */
    double
      rco = RCO/AREA;

    gxc = GAMMA*EXP(vbc/vt);
    gxn = GAMMA*EXP(vbn/vt);

    if ( vbc==vbn ) {
      in   = 0.;
      gnbn = -(
      gnbc = (gxn/(2*(qsf(gxn)+2)) + 1)/rco );
      }
    else {
      double
	vnc  = vbc-vbn,
	tmp  = fabs(vnc)+VO,
	rtmp = rco*tmp,
	qsbn = qsf(gxn),
	qsbc = qsf(gxc),
	sign = vnc>0.? 1.: -1.;

      in   = ( vt*( (qsbc-qsbn) + log((qsbn+2)/(qsbc+2)) ) + vnc )*VO/rtmp;

      gnbc = (gxc/(2*(qsbc+2)) + 1)*VO/rtmp - sign*in/tmp;

      gnbn = sign*in/tmp - (gxn/(2*(qsbn+2)) + 1)*VO/rtmp;
    } }
  else
    in = gnbc = gnbn = 0.;

/* charge calculations */

  if ( ModeFl==MDTRAN ||
       InitFl==INSTV0 ||
     ( ModeFl==MDBPTR && NOSOLV==YES ) ) {
    double
      cbn, cbc, cbco, cbe, cbx, cbxo, cbx2, cbx2o, cjs,
      cbeo = AREA*CJE,		/* scale 0-bias cap. */
      ctot = AREA*CJC,
      cjso = AREA*CJS,
      itf  = AREA*ITF;
    if (XCJC2 !=1.) {
      cbco = ctot*XCJC2;
      cbxo = 0.;
      cbx2o = ctot -cbco;
      }
    else {
      cbco = ctot*XCJC;
      cbxo = ctot-cbco;
      cbx2o = 0.;
      }

    if ( TF!=0. && vbe > 0.) {
      double argtf = 0., arg2 = 0., arg3 = 0.;

      if ( XTF!=0.) {
	argtf = XTF;
	if ( VTF!=0.) argtf *= EXP(vbc*VTF);
	arg2 = argtf;
	if ( itf!=0. ) {
	  double temp = ibe/(ibe+itf);

	  argtf = argtf*temp*temp;
	  arg2	= argtf*(3-temp-temp);
	  }
	arg3 = ibe*argtf*VTF;
	}
      ibe    = ibe*(1+argtf)/kqb;
      gbe    = (gbe*(1+arg2) - ibe*dkqb_dvbe)/kqb;
      geq_cb = (arg3-ibe*dkqb_dvbc)*TF/kqb;
      }

    PNJCHG(Q_QCBE(0),cbe,cbeo,vbe,VJE,FCPE,MJE,F1BE,F2BE,F3BE);
    Q_QCBE(0) += ibe*TF;
    cbe       += gbe*TF;

    PNJCHG(Q_QCBC(0),cbc,cbco,vbc,VJC,FCPC,MJC,F1BC,F2BC,F3BC);
    Q_QCBC(0) += ibc*TR;
    cbc       += gbc*TR;

    PNJCHG(Q_QCBX(0),cbx,cbxo,vbx,VJC,FCPC,MJC,F1BC,F2BC,F3BC);

    PNJCHG(Q_QCBX2(0),cbx2,cbx2o,vbx2,VJC,FCPC,MJC,F1BC,F2BC,F3BC);

    PNJCHG0(Q_QCJS(0),cjs,cjso,vjs,VJS,MJS);

    if ( qsat ) {			/* quasi-saturation */
      double
	qco = AREA*QCO,
	tmp = .5*qco/vt;

      Q_QCBN(0)  = qco*(qsf(gxn)-.5*GAMMA);
      Q_QCBC(0) += qco*(qsf(gxc)-.5*GAMMA);

      cbn  = gxn*tmp/sqrt(1+gxn);
      cbc += gxc*tmp/sqrt(1+gxc);
      }
    else
      cbn = Q_QCBN(0) = 0.;

    Q_ICBN(0) = 	/* reset, so T=0 results (e.g. Probe) are correct */
    Q_ICBC(0) =
    Q_ICBE(0) =
    Q_ICJS(0) =
    Q_ICBX(0) =
    Q_ICBX2(0) = 0.;

    if ( InitFl==INSTV0) {		/* store small-signal parameters */
      CBN0 = cbn;			/* and update the state vector */
      CBC0 = cbc;
      CBE0 = cbe;
      CJS0 = cjs;
      CBX0 = cbx;
      CBX20 = cbx2;

      goto load;
      }

    if ( !(ModeFl==MDBPTR && NOSOLV==NO) ) {	/* transient analysis */
      double g_eq;

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	Q_QCBN(2) = Q_QCBN(1) = Q_QCBN(0);	/* set "old" charges so */
	Q_QCBC(2) = Q_QCBC(1) = Q_QCBC(0);	/* integration works */
	Q_QCBE(2) = Q_QCBE(1) = Q_QCBE(0);
	Q_QCJS(2) = Q_QCJS(1) = Q_QCJS(0);
	Q_QCBX(2) = Q_QCBX(1) = Q_QCBX(0);
	Q_QCBX2(2) = Q_QCBX2(1) = Q_QCBX2(0);
	}

      geq_cb = GEq(geq_cb);;

      INTEGR80(geq_bn,cbn,Q_QIBN(0),Q_QIBN(1),Q_QIBN(2));

      INTEGR80(g_eq,cbc,Q_QIBC(0),Q_QIBC(1),Q_QIBC(2));
      gmu +=  g_eq;

      INTEGR80(g_eq,cbe,Q_QIBE(0),Q_QIBE(1),Q_QIBE(2));
      gpi +=  g_eq;

      INTEGR80(g_eq,cjs,Q_QIJS(0),Q_QIJS(1),Q_QIJS(2));
      gjs +=  g_eq;
      ijs +=  Q_ICJS(0);

      INTEGR80(geq_bx,cbx,Q_QIBX(0),Q_QIBX(1),Q_QIBX(2));

      INTEGR80(geq_bx2,cbx2,Q_QIBX2(0),Q_QIBX2(1),Q_QIBX2(2));

      ib += Q_ICBC(0) + Q_ICBE(0);
      ic -= Q_ICBC(0);

      if ( InitFl==INTRAN ) {			/* for 1st transient step: */
	Q_ICBN(1) = Q_ICBN(0);			/* set "old" currents so */
	Q_ICBC(1) = Q_ICBC(0);			/* time-step calc. works */
	Q_ICBE(1) = Q_ICBE(0);
	Q_ICJS(1) = Q_ICJS(0);
	Q_ICBX(1) = Q_ICBX(0);
	Q_ICBX2(1) = Q_ICBX2(0);
	}
    } } /* end of charge calculations */

/* check convergence */

  if ( pred_fl && (
	 jlim_fl ||

	 qsat && fabs(in_hat-in) > CurrentTOL(in_hat,in) ||

	 fabs(ic_hat-ic) > CurrentTOL(ic_hat,ic) ||
	 fabs(ib_hat-ib) > CurrentTOL(ib_hat,ib)
	 )
       ) nonconv = YES;

load:
  { double
      gcpr, gepr,
      ieq_nc = qsat ? type*( in - vbc*gnbc - vbn*gnbn ) : 0.,
      ieq_cb = type*( ic - vbe*(gm+go) + vbc*(gmu+go) ),
      ieq_be = type*( ic + ib - vbe*(gm+go+gpi) + vbc*(go-geq_cb) ),
      ieq_js = type*( ijs - vjs*gjs )*( LPNP ? -1 : 1 ),
      ieq_bx = ModeFl==MDTRAN ? type*( Q_ICBX(0) - vbx*geq_bx ) : 0.,
      ieq_bx2 = ModeFl==MDTRAN ? type*( Q_ICBX2(0) - vbx2*geq_bx2 ) : 0.,
      ieq_bn = ModeFl==MDTRAN ? type*( Q_ICBN(0) - vbn*geq_bn ) : 0.;

	/* load current vector */

    Y_MATRIX(q_iB) = -ieq_bx - ieq_bx2;
    Y_MATRIX(q_ic) = ( LPNP ? 0.: ieq_js ) - ieq_cb + ieq_nc + ieq_bx;
    Y_MATRIX(q_ib) = ( LPNP ? ieq_js : 0.) + ieq_cb - ieq_be - ieq_bn;
    Y_MATRIX(q_ie) =  ieq_be;
    Y_MATRIX(q_iS) = -ieq_js;
    Y_MATRIX(q_in) =  ieq_bn - ieq_nc;
    Y_MATRIX(q_iC) =  ieq_bx2;

	/* load conductance matrix */

    Y_MATRIX(q_Bb) = Y_MATRIX(q_bB) = -gx;

    if (XCJC2 < 1.) {
        Y_MATRIX(q_BC) = Y_MATRIX(q_CB) = -geq_bx2;
        Y_MATRIX(q_BB) = gx + geq_bx2;
        }
    else if (XCJC < 1.) {
        Y_MATRIX(q_Bc) = Y_MATRIX(q_cB) = -geq_bx;
        Y_MATRIX(q_BB) = gx + geq_bx;
        }
    else
        Y_MATRIX(q_BB) = gx;

    if ( QCO > 0.) {
      Y_MATRIX(q_bn) = -geq_bn;
	  }

    Y_MATRIX(q_bc) = -gmu - geq_cb;
    Y_MATRIX(q_be) = -gpi;
    Y_MATRIX(q_bb) = ( LPNP ? gjs : 0.) + gx + gmu + gpi + geq_cb + geq_bn;

    Y_MATRIX(q_cn) =  gnbn;
    Y_MATRIX(q_nc) = -gnbc;
    Y_MATRIX(q_nb) =  gnbn - geq_bn + gnbc;
    Y_MATRIX(q_nn) = -gnbn + geq_bn + ( gcpr = AREA*RC );
    Y_MATRIX(q_CC) =  gcpr + geq_bx2;

    Y_MATRIX(q_cb) =  gm - gmu - gnbn - gnbc;
    Y_MATRIX(q_ce) = -gm - go;
    Y_MATRIX(q_cc) = ( LPNP ? 0.: gjs ) + gmu + go + geq_bx + gnbc;

    Y_MATRIX(q_eb) = -gm - gpi - geq_cb;
    Y_MATRIX(q_ec) = -go + geq_cb;
    Y_MATRIX(q_ee) =  gm + go + gpi + ( gepr = AREA*RE );

    Y_MATRIX(q_Sj) = Y_MATRIX(q_jS) = -( Y_MATRIX(q_SS) = gjs );

    if ( LoadFl ) {
      Y_MATRIX(q_Cn) = Y_MATRIX(q_nC) = -gcpr;
      Y_MATRIX(q_Ee) = Y_MATRIX(q_eE) = -( Y_MATRIX(q_EE) = gepr );
    } }

#ifdef DEBUG
printf("\n*** %s at time = %g",Instance->q_name,TIME);
printf("\n  q_Bb = %g",Y_MATRIX(q_Bb));
printf("\n  q_bB = %g",Y_MATRIX(q_bB));
printf("\n  q_BB = %g",Y_MATRIX(q_BB));
printf("\n  q_bb = %g",Y_MATRIX(q_bb));
printf("\n  q_Bc = %g",Y_MATRIX(q_Bc));
printf("\n  q_BC = %g",Y_MATRIX(q_BC));
printf("\n  q_bc = %g",Y_MATRIX(q_bc));
printf("\n  q_be = %g",Y_MATRIX(q_be));
printf("\n  q_cB = %g",Y_MATRIX(q_cB));
printf("\n  q_CB = %g",Y_MATRIX(q_CB));
printf("\n  q_cb = %g",Y_MATRIX(q_cb));
printf("\n  q_Cc = %g",Y_MATRIX(q_Cc));
printf("\n  q_cC = %g",Y_MATRIX(q_cC));
printf("\n  q_CC = %g",Y_MATRIX(q_CC));
printf("\n  q_cc = %g",Y_MATRIX(q_cc));
printf("\n  q_ce = %g",Y_MATRIX(q_ce));
printf("\n  q_eb = %g",Y_MATRIX(q_eb));
printf("\n  q_ec = %g",Y_MATRIX(q_ec));
printf("\n  q_Ee = %g",Y_MATRIX(q_Ee));
printf("\n  q_eE = %g",Y_MATRIX(q_eE));
printf("\n  q_EE = %g",Y_MATRIX(q_EE));
printf("\n  q_ee = %g",Y_MATRIX(q_ee));
printf("\n  q_iB = %g",Y_MATRIX(q_iB));
printf("\n  q_ib = %g",Y_MATRIX(q_ib));
printf("\n  q_iC = %g",Y_MATRIX(q_iC));
printf("\n  q_ic = %g",Y_MATRIX(q_ic));
printf("\n  q_ie = %g",Y_MATRIX(q_ie));
printf("\n  q_iS = %g",Y_MATRIX(q_iS));
printf("\n  q_jS = %g",Y_MATRIX(q_jS));
printf("\n  q_Sj = %g",Y_MATRIX(q_Sj));
printf("\n  q_SS = %g",Y_MATRIX(q_SS));
#endif

  Q_VBE(0) = vbe;
  Q_VBC(0) = vbc;
  Q_VJS(0) = vjs;
  Q_VBN(0) = vbn;
  Q_VBX(0) = vbx;
  Q_VBX2(0) = vbx2;

  IN0  = in;
  IC0  = ic;
  IB0  = ib;
  IJS0 = ijs;

  GPI0 = gpi;
  GMU0 = gmu;
  GM0  = gm;
  GO0  = go;
  GX0  = gx;
  GJS0 = gjs;

  GEQBX0 = geq_bx;
  GEQBX20 = geq_bx2;
  GEQBN0 = geq_bn;
  GEQCB0 = geq_cb;

  GNBN0  = gnbn;
  GNBC0  = gnbc;

done:
  return nonconv;
  }
