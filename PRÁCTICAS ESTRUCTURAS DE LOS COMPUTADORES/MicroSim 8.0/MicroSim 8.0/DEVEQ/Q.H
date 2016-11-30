/* q.h
 *   $Revision:   1.28  $
 *   $Author:   SV  $
 *   $Date:   27 Feb 1997 13:06:04  $ */

#ifndef DEV_Q_H
#define DEV_Q_H

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the bipolar model parameters  **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

/* bipolar transistor definitions */

/*
pwt	?? Aug 86	creation
pwt	17 Mar 88	implement shared data area in device instance
imw	17 Aug 88	expressions
pwt	10 Oct 89	add quasi-saturation data
pwt	13 Dec 89	add high-injection parameter NK
eks	16 Feb 95	Added parameter XCJC2 to specify a portion of the CJC
			capacitance to be between external B and C nodes
			instead of between external B and internal c nodes.
			When XCJC2 is used, XCJC is ignored.
*/

struct qac_def {	/* AC values */
  double		/* capacitances */
	qac_cbn,
	qac_cbc,
	qac_cbe,
	qac_cjs,
	qac_cBc,
	qac_cBC,
	qac_cteq;	/* equiv. transit capacitance */
  };

struct qsv_def {	/* state vector */
  struct qi_def 	/* capacitor charges & currents */
	qsv_cbn,
	qsv_cbc,
	qsv_cbe,
	qsv_cjs,
	qsv_cBc,
	qsv_cBC;
  double		/* voltages (mostly) */
	qsv_vbn,
	qsv_vbc,
	qsv_vbe,
	qsv_vjs,
	qsv_vbx,
	qsv_vbx2,
	qsv_iteq;	/* excess phase current */
  };

/* state-vector access */

#define Q_QIBN(vect)	(sv[vect]->qsv_cbn)
#define Q_QCBN(vect)	(sv[vect]->qsv_cbn.qi_q)
#define Q_ICBN(vect)	(sv[vect]->qsv_cbn.qi_i)

#define Q_QIBC(vect)	(sv[vect]->qsv_cbc)
#define Q_QCBC(vect)	(sv[vect]->qsv_cbc.qi_q)
#define Q_ICBC(vect)	(sv[vect]->qsv_cbc.qi_i)

#define Q_QIBE(vect)	(sv[vect]->qsv_cbe)
#define Q_QCBE(vect)	(sv[vect]->qsv_cbe.qi_q)
#define Q_ICBE(vect)	(sv[vect]->qsv_cbe.qi_i)

#define Q_QIJS(vect)	(sv[vect]->qsv_cjs)
#define Q_QCJS(vect)	(sv[vect]->qsv_cjs.qi_q)
#define Q_ICJS(vect)	(sv[vect]->qsv_cjs.qi_i)

#define Q_QIBX(vect)	(sv[vect]->qsv_cBc)
#define Q_QCBX(vect)	(sv[vect]->qsv_cBc.qi_q)
#define Q_ICBX(vect)	(sv[vect]->qsv_cBc.qi_i)

#define Q_QIBX2(vect)	(sv[vect]->qsv_cBC)
#define Q_QCBX2(vect)	(sv[vect]->qsv_cBC.qi_q)
#define Q_ICBX2(vect)	(sv[vect]->qsv_cBC.qi_i)

#define Q_VBE(vect)	(sv[vect]->qsv_vbe)
#define Q_VBC(vect)	(sv[vect]->qsv_vbc)
#define Q_VBN(vect)	(sv[vect]->qsv_vbn)
#define Q_VJS(vect)	(sv[vect]->qsv_vjs)
#define Q_VBX(vect)	(sv[vect]->qsv_vbx)
#define Q_VBX2(vect)	(sv[vect]->qsv_vbx2)
#define Q_IEXBC(vect)	(sv[vect]->qsv_iteq)

/* device instance */

struct Q_;

struct q_ {
  struct q_ *q_next;
  char	    *q_name;
  struct Q_ *q_model;
  STRESS_BLOCK

  CKT_IDX		/* circuit matrix indices: external nodes */
	q_C,
	q_B,
	q_E,
	q_S;

  int	q_off;

  /* device parameters and expressions */
  /* MUST FOLLOW q_off */
  DXPR( q_area,  qx_area);
  DXPR( q_vbe,	 qx_vbe);   /* IC= */
  DXPR( q_vce,	 qx_vce);

  CKT_IDX		/* circuit matrix indices: internal nodes */
	q_n,
	q_c,
	q_b,
	q_e;

  MTX_IDX		/* MatPrm indices: conductance terms */
	q_CC,
	q_Cn,		/* formerly q_Cc */
	q_CB,
	q_cn,
	q_cc,
	q_cb,
	q_cB,
	q_ce,
	q_nC,		/* formerly q_cC */
	q_nn,
	q_nc,
	q_nb,
	q_bn,
	q_bc,
	q_bb,
	q_bB,
	q_be,
	q_Bc,
	q_Bb,
	q_BC,
	q_BB,
	q_ec,
	q_eb,
	q_ee,
	q_eE,
	q_Ee,
	q_EE,
	q_jS,
	q_Sj,
	q_SS;

  MTX_IDX		/* MatPrm indices: branch currents */
	q_in,
	q_ic,
	q_ib,
	q_ie,
	q_iS,
	q_iC,
	q_iB;

  double		/* "current" values */
	qcv_in, 	/* branch currents */
	qcv_ic,
	qcv_ib,
	qcv_ijs,
	qcv_gpi,	/* derivitives */
	qcv_gmu,
	qcv_gm,
	qcv_go,
	qcv_gx,
	qcv_gjs,
	qcv_gnbn,
	qcv_gnbc,
	qcv_gnbeq,
	qcv_gcbeq,
	qcv_gbxeq,
	qcv_gbx2eq;

  struct {		/* shared data area */
    struct qac_def	q_ac;		/* AC (capacitance values) */
    struct qsv_def	q_sv[MSTVCT];	/* state vectors (transient values) */
    }	q_sda;
  };

/* device model */

struct Q_ {
  struct Q_ *Q_next;
  char	    *Q_name;
  struct Q_ *Q_nom;
  STRESS_BLOCK
  struct Q_ *Q_ako;
  struct ModTemp *Q_ModTemp_ptr;

  int	Q_User_type,	/* device type == N_TYPE (npn) or P_TYPE (pnp) */
	Q_lpnp; 	/* Cjs hooked to base ? YES : NO */
  int	Q_type; 	/* device type == N_TYPE (npn) or P_TYPE (pnp) */

  double		/* reserved: pre-computed values */
	Q_fcpe, 	/* = fc*vje */
	Q_f1be, 	/* = vje*(1-(1-fc)^(1-mje))/(1-mje) */
	Q_f2be, 	/* = (1-fc)^(1+mje) */
	Q_f3be, 	/* = 1-fc*(1+mje) */
	Q_fcpc, 	/* = fc*vjc */
	Q_f1bc, 	/* = vjc*(1-(1-fc)^(1-mjc))/(1-mjc) */
	Q_f2bc, 	/* = (1-fc)^(1+mjc) */
	Q_f3bc, 	/* = 1-fc*(1+mjc) */
	Q_vcrit;	/* = vt*ln(vt/(is*sqrt(2))) */

   /* model parameters and expressions */
  MXPR( Q_level,Qx_level);
  MXPR( Q_is,	Qx_is);
  MXPR( Q_eg,	Qx_eg);
  MXPR( Q_bf,	Qx_bf);
  MXPR( Q_nf,	Qx_nf);
  MDLPARM Q_vaf;
  MXPR( Q_User_vaf,	Qx_User_vaf);	/* = 1/vaf */
  MDLPARM Q_ikf;
  MXPR( Q_User_ikf,	Qx_User_ikf);	/* = 1/ikf */
  MDLPARM Q_ise;
  MXPR( Q_User_ise,	Qx_User_ise);
  MXPR( Q_ne,	Qx_ne);
  MXPR( Q_br,	Qx_br);
  MXPR( Q_nr,	Qx_nr);
  MDLPARM Q_var;
  MXPR( Q_User_var,	Qx_User_var);	/* = 1/var */
  MDLPARM Q_ikr;
  MXPR( Q_User_ikr,	Qx_User_ikr);	/* = 1/ikr */
  MDLPARM Q_isc;
  MXPR( Q_User_isc,	Qx_User_isc);
  MXPR( Q_nc,	Qx_nc);
  MXPR( Q_nk,	Qx_nk);
  MDLPARM Q_iss;	/* rev. sat. current for substrate junction */
  MXPR( Q_User_iss,	Qx_User_iss);	/* rev. sat. current for substrate junction */
  MXPR( Q_ns,	Qx_ns); 	/* emission coefficient for substrate junction */
  MXPR( Q_rb,	Qx_rb); 	/***** NOT 1/rb  *****/
  MXPR( Q_rbm,	Qx_rbm);	/***** NOT 1/rbm *****/
  MXPR( Q_User_rbm,	Qx_User_rbm);
  MXPR( Q_irb,	Qx_irb);
  MDLPARM Q_re;
  MXPR( Q_User_re,	Qx_User_rbe);	/* = 1/re */
  MDLPARM Q_rc;
  MXPR( Q_User_rc,	Qx_User_rc);		/* = 1/rc */
  MXPR( Q_cje,	Qx_cje);
  MXPR( Q_vje,	Qx_vje);
  MXPR( Q_mje,	Qx_mje);
  MXPR( Q_cjc,	Qx_cjc);
  MXPR( Q_vjc,	Qx_vjc);
  MXPR( Q_mjc,	Qx_mjc);
  MXPR( Q_xcjc, Qx_xcjc);
  MXPR( Q_xcjc2, Qx_xcjc2);
  MXPR( Q_cjs,	Qx_cjs);
  MXPR( Q_vjs,	Qx_vjs);
  MXPR( Q_mjs,	Qx_mjs);
  MDLPARM Q_fc;
  MXPR( Q_User_fc,	Qx_User_fc);
  MXPR( Q_tf,	Qx_tf);
  MXPR( Q_xtf,	Qx_xtf);
  MDLPARM Q_vtf;
  MXPR( Q_User_vtf,	Qx_User_vtf);
  MXPR( Q_itf,	Qx_itf);
  MDLPARM Q_ptf;
  MXPR( Q_User_ptf,	Qx_User_ptf);
  MXPR( Q_tr,	Qx_tr);
  MXPR( Q_qco,	Qx_qco);
  MXPR( Q_rco,	Qx_rco);
  MXPR( Q_vo,	Qx_vo);
  MXPR( Q_gamma,Qx_gamma);
  MXPR( Q_xtb,	Qx_xtb);
  MXPR( Q_xti,	Qx_xti);
  MXPR( Q_trb1, Qx_trb1);		/* temp. coef: 1st order correction for RB */
  MXPR( Q_trb2, Qx_trb2);		/* temp. coef: 2nd order correction for RB */
  MXPR( Q_trm1, Qx_trm1);		/* temp. coef: 1st order correction for RBM */
  MXPR( Q_trm2, Qx_trm2);		/* temp. coef: 2nd order correction for RBM */
  MXPR( Q_tre1, Qx_tre1);		/* temp. coef: 1st order correction for RE */
  MXPR( Q_tre2, Qx_tre2);		/* temp. coef: 2nd order correction for RE */
  MXPR( Q_trc1, Qx_trc1);		/* temp. coef: 1st order correction for RC */
  MXPR( Q_trc2, Qx_trc2);		/* temp. coef: 2nd order correction for RC */
  MXPR( Q_kf,	Qx_kf);
  MXPR( Q_af,	Qx_af);
  } ;

#ifdef Q_DEVICE

struct	Q_	Q_default;

#define BASE	Q_default

struct	Assoc	Q_Assoc[] = {			/*IGNORE*/ /* for Pre-C */
    ASSOCIATE (Q_level,	1,	    "LEVEL"	),
	ASSOCIATE (Q_is,	1E-16,	"*IS"	),	/* force print */
	ASSOCIATE (Q_eg,	1.11,	"EG"	),
	ASSOCIATE (Q_bf,	100.,	"*BF"	),	/* force print */
	ASSOCIATE (Q_nf,	1.,	"*NF"	),	/* force print */
	ASSOCIATE (Q_User_vaf,	0.,	"VAF"	),
	ASSOCIATE (Q_User_ikf,	0.,	"IKF"	),
	ASSOCIATE (Q_User_ise,	0.,	"ISE"	),
	ASSOCIATE (Q_ne,	1.5,	"NE"	),
	ASSOCIATE (Q_br,	1.,	"*BR"	),	/* force print */
	ASSOCIATE (Q_nr,	1.,	"*NR"	),	/* force print */
	ASSOCIATE (Q_User_var,	0.,	"VAR"	),
	ASSOCIATE (Q_User_ikr,	0.,	"IKR"	),
	ASSOCIATE (Q_User_isc,	0.,	"ISC"	),
	ASSOCIATE (Q_nc,	2.,	"NC"	),
	ASSOCIATE (Q_nk,	.5,	"NK"	),	/* high-injection exponent */
	ASSOCIATE (Q_User_iss,	0.,	"ISS"	),
	ASSOCIATE (Q_ns,	1.,	"NS"	),
	ASSOCIATE (Q_rb,	0.,	"RB"	),
	ASSOCIATE (Q_User_rbm,	0.,	"RBM"	),
	ASSOCIATE (Q_irb,	0.,	"IRB"	),
	ASSOCIATE (Q_User_re,	0.,	"RE"	),
	ASSOCIATE (Q_User_rc,	0.,	"RC"	),
	ASSOCIATE (Q_cje,	0.,	"CJE"	),
	ASSOCIATE (Q_vje,	.75,	"VJE"	),
	ASSOCIATE (Q_mje,	.33,	"MJE"	),
	ASSOCIATE (Q_cjc,	0.,	"CJC"	),
	ASSOCIATE (Q_vjc,	.75,	"VJC"	),
	ASSOCIATE (Q_mjc,	.33,	"MJC"	),
	ASSOCIATE (Q_xcjc,	1.,	"XCJC"	),
	ASSOCIATE (Q_xcjc2,	1.,	"XCJC2"	),
	ASSOCIATE (Q_cjs,	0.,	"CJS"	),
	ASSOCIATE (Q_vjs,	.75,	"VJS"	),
	ASSOCIATE (Q_mjs,	0.,	"MJS"	),
	ASSOCIATE (Q_User_fc,	.5,	"FC"	),
	ASSOCIATE (Q_tf,	0.,	"TF"	),
	ASSOCIATE (Q_xtf,	0.,	"XTF"	),
	ASSOCIATE (Q_User_vtf,	0.,	"VTF"	),
	ASSOCIATE (Q_itf,	0.,	"ITF"	),
	ASSOCIATE (Q_User_ptf,	0.,	"PTF"	),
	ASSOCIATE (Q_tr,	0.,	"TR"	),
	ASSOCIATE (Q_qco,	0.,	"QCO"	),	/* epi charge */
	ASSOCIATE (Q_rco,	0.,	"RCO"	),	/* epi resistance */
	ASSOCIATE (Q_vo,	10.,	"VO"	),	/* epi carrier velocity */
	ASSOCIATE (Q_gamma,	1e-11,	"GAMMA" ),	/* epi doping factor */
	ASSOCIATE (Q_xtb,	0.,	"XTB"	),
	ASSOCIATE (Q_xti,	3.,	"XTI"	),
	ASSOCIATE (Q_trb1,	0.,	"TRB1"	),
	ASSOCIATE (Q_trb2,	0.,	"TRB2"	),
	ASSOCIATE (Q_trm1,	0.,	"TRM1"	),
	ASSOCIATE (Q_trm2,	0.,	"TRM2"	),
	ASSOCIATE (Q_tre1,	0.,	"TRE1"	),
	ASSOCIATE (Q_tre2,	0.,	"TRE2"	),
	ASSOCIATE (Q_trc1,	0.,	"TRC1"	),
	ASSOCIATE (Q_trc2,	0.,	"TRC2"	),
	ASSOCIATE (Q_kf,	0.,	"KF"	),
	ASSOCIATE (Q_af,	1.,	"AF"	),
	END_PARMS(q_)				/*ENDIGNORE*/
} ;

#undef	BASE
#endif

#ifdef	UnAlias_Def

static char *Q_alias[] = {
	"PT", "XTI",
	"VA", "VAF",
	"IK", "IKF",
	"C2", "ISE",
	"VB", "VAR",
	"C4", "ISC",
	"PE", "VJE",
	"ME", "MJE",
	"PC", "VJC",
	"MC", "MJC",
	"CCS","CJS",
	"PS", "VJS",
	"MS", "MJS",
	"" };
#endif

cmplex q_ACPrb(struct q_ *,double ,int ,int );

// Functions exported to PSpice by Device Equations - do not modify
DLL_FUNC void Q_TmpMod(struct Q_ *, double, double, double);
DLL_FUNC void Q_ModChk(struct Q_ *);
DLL_FUNC void q_AddInternalNodes( struct q_ *);
DLL_FUNC int q_MatPtr(struct q_ *);
DLL_FUNC int q_MatLoc(struct q_ *);
DLL_FUNC int q_Load(struct q_ *,int ,int ,int, double );
DLL_FUNC void q_ACLoad(struct q_ *,double );
DLL_FUNC void q_Noise( const struct q_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

// Function types for GetProcAddress()
typedef void (*PROCQ_TmpMod)(struct Q_ *, double, double, double);
typedef void (*PROCQ_ModChk)(struct Q_ *);
typedef void (*PROCq_AddInternalNodes)( struct q_ *);
typedef int (*PROCq_MatPtr)(struct q_ *);
typedef int (*PROCq_MatLoc)(struct q_ *);
typedef int (*PROCq_Load)(struct q_ *,int ,int ,int, double );
typedef void (*PROCq_ACLoad)(struct q_ *,double );
typedef void (*PROCq_Noise)( const struct q_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

DLL_FUNC PROCQ_TmpMod fp_Q_TmpMod;
DLL_FUNC PROCQ_ModChk fp_Q_ModChk;
DLL_FUNC PROCq_AddInternalNodes fp_q_AddInternalNodes;
DLL_FUNC PROCq_MatPtr fp_q_MatPtr;
DLL_FUNC PROCq_MatLoc fp_q_MatLoc;
DLL_FUNC PROCq_Load fp_q_Load;
DLL_FUNC PROCq_ACLoad fp_q_ACLoad;
DLL_FUNC PROCq_Noise fp_q_Noise;

#endif // DEV_Q_H
