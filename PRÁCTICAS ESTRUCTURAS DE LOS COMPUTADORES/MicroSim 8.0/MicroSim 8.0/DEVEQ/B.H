/* b.h
 *   $Revision:   1.27  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:12:34  $ */

#ifndef DEV_B_H
#define DEV_B_H

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the GaAsFET model parameters  **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

/* GaAsFET definitions */

/*
pwt	?? Aug 86	creation
pwt	17 Mar 88	implement shared data area in device instance
imw	17 Aug 88	modified to use expressions
pwt	12 Apr 90	put in TriQuint additions
pwt	04 May 90	remove one value saved for bypass calculations
eks	19 Oct 94	add support of level==4 Parker-Skellern mesfet model
eks	29 Sep 95	add support of level==5 TOM-2 model (TOM model ver. 2)
eks	02 Nov 95	removed force print on many parameters
*/

struct bac_def {	/* AC values */
  double		/* capacitances */
	bac_cgs,
	bac_cgd,
	bac_cds;
  };

struct bsv_def {	/* state vector */
  struct qi_def 	/* capacitor charges & currents */
	bsv_cgs,
	bsv_cgd,
	bsv_cds;
  double				/* voltages (mostly) */
	bsv_vgs,
	bsv_vgd,
	bsv_iexds;		/* excess phase current (due to transit time) */
  };

struct psv_def  {	/* (level==4) PS mesfet model state vector defn */
  double
	psv_vgstrap,
	psv_vgdtrap,
	psv_pave;
  };

/* state-vector access */

#define B_QIGS(vect)		(sv[vect]->bsv_cgs)
#define B_QCGS(vect)		(sv[vect]->bsv_cgs.qi_q)
#define B_ICGS(vect)		(sv[vect]->bsv_cgs.qi_i)

#define B_QIGD(vect)		(sv[vect]->bsv_cgd)
#define B_QCGD(vect)		(sv[vect]->bsv_cgd.qi_q)
#define B_ICGD(vect)		(sv[vect]->bsv_cgd.qi_i)

#define B_QIDS(vect)		(sv[vect]->bsv_cds)
#define B_QCDS(vect)		(sv[vect]->bsv_cds.qi_q)
#define B_ICDS(vect)		(sv[vect]->bsv_cds.qi_i)

#define B_VGS(vect)		(sv[vect]->bsv_vgs)
#define B_VGD(vect)		(sv[vect]->bsv_vgd)
#define B_IEXDS(vect)	(sv[vect]->bsv_iexds)

/* device instance */

struct B_;

struct b_ {
  struct b_	*b_next;
  char		*b_name;
  struct B_	*b_model;
  STRESS_BLOCK

  CKT_IDX
	b_D,		/* circuit matrix indices: external nodes */
	b_G,
	b_S;

  int	b_off;

  /* parameter/expression pointer pairs */
  /* MUST FOLLOW b_off */

  DXPR(b_area, bx_area);
  DXPR(b_vds,  bx_vds);   /* IC= */
  DXPR(b_vgs,  bx_vgs);

  CKT_IDX		/* circuit matrix indices: internal nodes */
	b_d,
	b_g,
	b_s;

  MTX_IDX		/* MatPrm indices: conductance terms */
	b_Dd,
	b_gd,
	b_gs,
	b_Ss,
	b_dD,
	b_dg,
	b_ds,
	b_sg,
	b_sS,
	b_sd,
	b_DD,
	b_gg,
	b_SS,
	b_dd,
	b_ss,
	b_GG,
	b_Gg,
	b_gG;

  MTX_IDX		/* MatPrm indices: branch currents */
	b_ig,
	b_id,
	b_is;

  double			/* "current" values */
	bcv_ig, 		/* currents */
	bcv_id,
	bcv_gm, 		/* derivitives */
	bcv_gds,
	bcv_ggs,
	bcv_ggd;

  struct {		/* shared data area */
    struct bac_def	b_ac;				/* AC (capacitance values) */
    struct bsv_def	b_sv[MSTVCT];	/* state vectors (transient values) */
    struct psv_def	p_sv[MSTVCT];	/* (level==4) PS model state vectors */
    }	b_sda;

/* Any additions to the device structure can be added here.  Don't change
   anything above this in the structure! */

  };

/* device model */

struct B_ {
  struct B_	*B_next;
  char		*B_name;
  struct B_	*B_nom;
  STRESS_BLOCK
  struct B_	*B_ako;
  struct ModTemp *B_ModTemp_ptr;

  int	B_type; 	/* device type == N_TYPE only (so far) */

  double		/* reserved: pre-computed values */
	B_f1,		/* = vbi*(1-(1-fc)^(1-m))/(1-m) where m = .5 */
	B_f2,		/* = (1-fc)^(1+m)		where m = .5 */
	B_f3,		/* = 1-fc*(1+m) 		where m = .5 */
	B_vcrit;	/* = n*vt*ln(n*vt/(is*sqrt(2))) */

  /* model parameter/expression pointer pairs */
  MXPR( B_level, Bx_level );
  MXPR( B_vto, Bx_vto );
  MXPR( B_vtotc, Bx_vtotc );
  MXPR( B_vbi, Bx_vbi );
  MXPR( B_alpha, Bx_alpha );
  MXPR( B_b, Bx_b );
  MXPR( B_beta, Bx_beta );
  MXPR( B_betatce, Bx_betatce );
  MXPR( B_lambda, Bx_lambda );
  MDLPARM B_rg;
  MXPR( B_User_rg, Bx_User_rg );
  MDLPARM B_rd;
  MXPR( B_User_rd, Bx_User_rd );
  MDLPARM B_rs;
  MXPR( B_User_rs, Bx_User_rs );
  MXPR( B_cgd, Bx_cgd );
  MXPR( B_cgs, Bx_cgs );
  MXPR( B_cds, Bx_cds );
  MXPR( B_is, Bx_is );
  MXPR( B_tau, Bx_tau );
  MXPR( B_kf, Bx_kf );
  MXPR( B_af, Bx_af );
  MDLPARM B_fc;
  MXPR( B_User_fc, Bx_User_fc );
  MXPR( B_m, Bx_m );
  MXPR( B_n, Bx_n );
  MXPR( B_delta, Bx_delta );	/* TriQuint additions */
  MXPR( B_gamma, Bx_gamma );
  MXPR( B_q, Bx_q );
  MXPR( B_vmax, Bx_vmax );		/* TriQuint request: have vmax be accessable */
  MXPR( B_vdelta, Bx_vdelta );	/* Statz "delta": might as well have this too.. */
  MXPR( B_eg, Bx_eg );
  MXPR( B_xti, Bx_xti );
  MXPR( B_trg1, Bx_trg1 );
  MXPR( B_trd1, Bx_trd1 );
  MXPR( B_trs1, Bx_trs1 );

  /* (level==4) PS mesfet model parameters */
  MXPR( B_p, Bx_p );
  MXPR( B_xc, Bx_xc );
  MXPR( B_vbd, Bx_vbd );
  MXPR( B_ibd, Bx_ibd );
  MXPR( B_xi, Bx_xi );
  MXPR( B_vst, Bx_vst );
  MXPR( B_mvst, Bx_mvst );
  MXPR( B_lfgam, Bx_lfgam );
  MXPR( B_lfg1, Bx_lfg1 );
  MXPR( B_lfg2, Bx_lfg2 );
  MXPR( B_hfgam, Bx_hfgam );
  MXPR( B_hfg1, Bx_hfg1 );
  MXPR( B_hfg2, Bx_hfg2 );
  MXPR( B_hfeta, Bx_hfeta );
  MXPR( B_hfe1, Bx_hfe1 );
  MXPR( B_hfe2, Bx_hfe2 );
  MXPR( B_acgam, Bx_acgam );
  MXPR( B_z, Bx_z );
  MXPR( B_taud, Bx_taud );
  MXPR( B_mxi, Bx_mxi );
  MXPR( B_taug, Bx_taug );
  MXPR( B_d1, Bx_d1 );
  MXPR( B_d2, Bx_d2 );
  MXPR( B_d3, Bx_d3 );

 /* (level==5) TOM model (ver. 2) parameters */
  MXPR( B_gammatc, Bx_gammatc );
  MXPR( B_alphatce, Bx_alphatce );
  MXPR( B_cgstce, Bx_cgstce );
  MXPR( B_cgdtce, Bx_cgdtce );
  MXPR( B_vbitc, Bx_vbitc );
  MXPR( B_ng, Bx_ng );
  MXPR( B_nd, Bx_nd );
  MXPR( B_btrk, BX_btrk );     /* tqs Monte Carlo parameter */
  MXPR( B_dvt, BX_dvt );       /* tqs Monte-Carlo parameter */
  MXPR( B_dvtt, BX_dvtt );     /* tqs Monte-Carlo parameter */
  } ;
												          
#ifdef	B_DEVICE

struct	B_	B_default;

#define BASE	B_default

struct	Assoc	B_Assoc[] = {			/*IGNORE*/ /* for Pre-C */
	ASSOCIATE (B_level,		1.,		"*LEVEL"),	/* force print */
	ASSOCIATE (B_vto,			-2.5,		"*VTO"	),	/* force print */
	ASSOCIATE (B_vtotc,		0.,		"VTOTC" ),
	ASSOCIATE (B_vbi,			1.,		"VBI"	),
	ASSOCIATE (B_alpha,		2.,		"ALPHA"),  
	ASSOCIATE (B_b, 			.3,		"B"	),
	ASSOCIATE (B_beta,		.1,		"*BETA" ),	/* force print */
	ASSOCIATE (B_betatce,	0.,		"BETATCE"),
	ASSOCIATE (B_lambda,		0.,		"LAMBDA"),
	ASSOCIATE (B_User_rg,	0.,		"RG"	),
	ASSOCIATE (B_User_rd,	0.,		"RD"	),
	ASSOCIATE (B_User_rs,	0.,		"RS"	),
	ASSOCIATE (B_cgd,			0.,		"CGD"	),
	ASSOCIATE (B_cgs,			0.,		"CGS"	),
	ASSOCIATE (B_cds,			0.,		"CDS"	),
	ASSOCIATE (B_is,			1E-14,	"IS"	),
	ASSOCIATE (B_tau,			0.,		"TAU"	),
	ASSOCIATE (B_kf,			0.,		"KF"	),
	ASSOCIATE (B_af,			1.,		"AF"	),
	ASSOCIATE (B_User_fc,	.5,		"FC"	),
	ASSOCIATE (B_m, 			.5,		"M"	),
	ASSOCIATE (B_n, 			1.,		"N"	),
	ASSOCIATE (B_delta,		0.,		"DELTA" ),	/* TriQuint add's */
	ASSOCIATE (B_gamma,		0.,		"GAMMA" ),
	ASSOCIATE (B_q, 			2.,		"Q"	),
	ASSOCIATE (B_vmax,		.5,		"VMAX"	),	/* TriQuint req. */
	ASSOCIATE (B_vdelta,		.2,		"VDELTA"),	/* TriQuint req. */
	ASSOCIATE (B_eg,			1.11,		"EG"	),
	ASSOCIATE (B_xti,			0.,		"XTI"	),
	ASSOCIATE (B_trg1,		0.,		"TRG1"	),
	ASSOCIATE (B_trd1,		0.,		"TRD1"	),
	ASSOCIATE (B_trs1,		0.,		"TRS1"	),

/* (level==4) PS mesfet model parameters */
	ASSOCIATE (B_p,			2.,		"P"    ),
	ASSOCIATE (B_xc,			0.,		"XC"   ),
	ASSOCIATE (B_vbd,			1.,		"VBD"  ),
	ASSOCIATE (B_ibd,			0.,		"IBD"  ),
	ASSOCIATE (B_xi,			1000.,	"XI"   ),
	ASSOCIATE (B_vst,			0.,		"VST"  ),
	ASSOCIATE (B_mvst,		0.,		"MVST"  ),
	ASSOCIATE (B_lfgam,		0.,		"LFGAM"),
	ASSOCIATE (B_lfg1,		0.,		"LFG1"),
	ASSOCIATE (B_lfg2,		0.,		"LFG2"),
	ASSOCIATE (B_hfgam,		0.,		"HFGAM"),
	ASSOCIATE (B_hfg1,		0.,		"HFG1"),
	ASSOCIATE (B_hfg2,		0.,		"HFG2"),
	ASSOCIATE (B_hfeta,		0.,		"HFETA"),
	ASSOCIATE (B_hfe1,		0.,		"HFE1"),
	ASSOCIATE (B_hfe2,		0.,		"HFE2"),
	ASSOCIATE (B_acgam,		0.,		"ACGAM"),
	ASSOCIATE (B_z,			0.5,		"Z"   ),
	ASSOCIATE (B_taud,		0.,		"TAUD" ),
	ASSOCIATE (B_mxi,			0.,		"MXI"  ),
	ASSOCIATE (B_taug,		0.,		"TAUG" ),
	ASSOCIATE (B_d1,			3500.,	"d1"   ),
	ASSOCIATE (B_d2,			1.0,		"d2"   ),
	ASSOCIATE (B_d3,			0.,		"d3"   ),

 /* (level==5) TOM-2 model (TOM model ver. 2) parameters */
 	ASSOCIATE (B_gammatc,	0.,		"GAMMATC"),  
 	ASSOCIATE (B_alphatce,	0.,		"ALPHATCE"),  
 	ASSOCIATE (B_cgstce,		0.,		"CGSTCE"),  
 	ASSOCIATE (B_cgdtce,		0.,		"CGDTCE"),  
 	ASSOCIATE (B_vbitc,		0.,		"VBITC"),  
 	ASSOCIATE (B_ng,			1.,		"NG"),          
 	ASSOCIATE (B_nd,			0.,		"ND"),
	ASSOCIATE (B_btrk,		0.,		"BTRK"),  /* tqs M-C parameter */
	ASSOCIATE (B_dvt,			0.,		"DVT" ),  /* tqs M-C parameter */
	ASSOCIATE (B_dvtt,		0.,		"DVTT"),  /* tqs M-C parameter */

	END_PARMS(b_)				/*ENDIGNORE*/
} ;

#undef	BASE
#endif

cmplex b_ACPrb(struct b_ *,double ,int ,int );

// Functions exported to PSpice by Device Equations - do not modify
DLL_FUNC void B_TmpMod(struct B_ *, double, double, double);
DLL_FUNC void B_ModChk(struct B_ *);
DLL_FUNC void b_AddInternalNodes( struct b_ *);
DLL_FUNC int b_MatPtr(struct b_ *);
DLL_FUNC int b_MatLoc(struct b_ *);
DLL_FUNC int b_Load(struct b_ *,int ,int ,int, double );
DLL_FUNC void b_ACLoad(struct b_ *,double );
DLL_FUNC void b_Noise( const struct b_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

// Function types for GetProcAddress()
typedef void (*PROCB_TmpMod)(struct B_ *, double, double, double);
typedef void (*PROCB_ModChk)(struct B_ *);
typedef void (*PROCb_AddInternalNodes)( struct b_ *);
typedef int (*PROCb_MatPtr)(struct b_ *);
typedef int (*PROCb_MatLoc)(struct b_ *);
typedef int (*PROCb_Load)(struct b_ *,int ,int ,int, double );
typedef void (*PROCb_ACLoad)(struct b_ *,double );
typedef void (*PROCb_Noise)( const struct b_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

DLL_FUNC PROCB_TmpMod fp_B_TmpMod;
DLL_FUNC PROCB_ModChk fp_B_ModChk;
DLL_FUNC PROCb_AddInternalNodes fp_b_AddInternalNodes;
DLL_FUNC PROCb_MatPtr fp_b_MatPtr;
DLL_FUNC PROCb_MatLoc fp_b_MatLoc;
DLL_FUNC PROCb_Load fp_b_Load;
DLL_FUNC PROCb_ACLoad fp_b_ACLoad;
DLL_FUNC PROCb_Noise fp_b_Noise;

#endif // DEV_B_H
