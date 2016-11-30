/* d.h
 *   $Revision:   1.23  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:13:14  $ */

#ifndef DEV_D_H
#define DEV_D_H

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the diode model parameters    **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

/* Diode definitions */

/*
pwt	?? Aug 86	creation
pwt	16 Mar 88	implement shared data area in device instance
imw	17 Aug 88	expressions
pwt	?? Sep 88	temp. coef.s for RS and IKF
pwt	11 Sep 88	various coef.s re. BV
*/

struct dac_def {	/* AC values */
  double	dac_cj; /* capacitance of junction */
  };

struct dsv_def {	/* state vector */
  struct qi_def dsv_cj; /* junction capacitor charge & current */
  double	dsv_vj; /* voltage across junction */
  };

/* state-vector access */

#define D_QIJ(vect)	(sv[vect]->dsv_cj)
#define D_QCJ(vect)	(sv[vect]->dsv_cj.qi_q)
#define D_ICJ(vect)	(sv[vect]->dsv_cj.qi_i)

#define D_VJ(vect)	(sv[vect]->dsv_vj)

/* device instance */

struct D_;

struct d_ {
  struct d_ *d_next;
  char	    *d_name;
  struct D_ *d_model;
  STRESS_BLOCK

  CKT_IDX		/* circuit matrix indices */
	d_P,		/* P (+) node (anode):	 p-type material */
	d_N;		/* N (-) node (cathode): n-type material */

  int	d_off;

  /* device parameters and expressions */
  /* MUST FOLLOW d_off */
  DXPR(d_area, dx_area);
  DXPR(d_vj,   dx_vj);	/* IC= */

  CKT_IDX		/* circuit matrix indices (internal nodes) */
	d_p;

  MTX_IDX		/* MatPrm indices: conductance terms */
	d_Pp,
	d_Np,
	d_pP,
	d_pN,
	d_PP,
	d_NN,
	d_pp;

  MTX_IDX		/* MatPrm indices: branch currents */
	d_iN,
	d_ip;

  double		/* "current" values */
	dcv_ij, 	/* current thru junction */
	dcv_gj; 	/* equivalent conductance of junction */

  struct {		/* shared data area */
    struct dac_def	d_ac;		/* AC (capacitance values) */
    struct dsv_def	d_sv[MSTVCT];	/* state vectors (transient values) */
    }	d_sda;
  };

/* device model */

struct D_ {
  struct D_ *D_next;
  char	    *D_name;
  struct D_ *D_nom;
  STRESS_BLOCK
  struct D_ *D_ako;
  struct ModTemp *D_ModTemp_ptr;

  double		/* reserved: pre-computed values */
	D_f1,		/* = pb*(1-(1-fc)^(1+m))/(1-m) */
	D_f2,		/* = (1-fc)^(1+m) */
	D_f3,		/* = 1-fc*(1+m) */
	D_vcrit;	/* = n*vt*ln(n*vt/(is*sqrt(2))) */

  /* model parameters and expressions */
  MXPR( D_level,Dx_level);
  MXPR( D_is,	Dx_is	);
  MXPR( D_n,	Dx_n	);
  MXPR( D_isr,	Dx_isr	);
  MXPR( D_nr,	Dx_nr	);
  MXPR( D_ikf,	Dx_ikf	);
  MXPR( D_bv,	Dx_bv	);	/* = computed start of reverse exponential */
  MXPR( D_ibv,	Dx_ibv	);
  MXPR( D_nbv,	Dx_nbv	);
  MXPR( D_ibvl, Dx_ibvl );
  MXPR( D_nbvl, Dx_nbvl );
  MDLPARM D_rs;
  MXPR( D_User_rs,	Dx_User_rs	);	/* = 1/rs */
  MXPR( D_tt,	Dx_tt	);
  MXPR( D_cjo,	Dx_cjo	);
  MXPR( D_vj,	Dx_vj	);
  MXPR( D_m,	Dx_m	);
  MDLPARM D_fc; /* = fc*pb */
  MXPR( D_User_fc,	Dx_User_fc	);
  MXPR( D_eg,	Dx_eg	);
  MXPR( D_xti,	Dx_xti	);
  MXPR( D_tbv1, Dx_tbv1 );
  MXPR( D_tbv2, Dx_tbv2 );
  MXPR( D_tikf, Dx_tikf );
  MXPR( D_trs1, Dx_trs1 );
  MXPR( D_trs2, Dx_trs2 );
  MXPR( D_kf,	Dx_kf	);
  MXPR( D_af,	Dx_af	);
  } ;

#ifdef	D_DEVICE

struct D_	D_default;

#define BASE	D_default

struct	Assoc	D_Assoc[] = {			/*IGNORE*/ /* for Pre-C */
    ASSOCIATE (D_level,	1,	    "LEVEL"	),
	ASSOCIATE (D_is,	1E-14,	"*IS"	),	/* * = force print */
	ASSOCIATE (D_n, 	1.,	"N"	),
	ASSOCIATE (D_isr,	0.,	"ISR"	),	/* recomb. current */
	ASSOCIATE (D_nr,	2.,	"NR"	),	/* recomb. coef. */
	ASSOCIATE (D_ikf,	0.,	"IKF"	),	/* "knee" current */
	ASSOCIATE (D_bv,	0.,	"BV"	),
	ASSOCIATE (D_ibv,	1E-10,	"IBV"	),
	ASSOCIATE (D_nbv,	1.,	"NBV"	),	/* BV ideality coef. */
	ASSOCIATE (D_ibvl,	0.,	"IBVL"	),	/* low-level IBV */
	ASSOCIATE (D_nbvl,	1.,	"NBVL"	),	/* low-level NBV */
	ASSOCIATE (D_User_rs,	0.,	"RS"	),
	ASSOCIATE (D_tt,	0.,	"TT"	),
	ASSOCIATE (D_cjo,	0.,	"CJO"	),
	ASSOCIATE (D_vj,	1.,	"VJ"	),
	ASSOCIATE (D_m, 	.5,	"M"	),
	ASSOCIATE (D_User_fc,	.5,	"FC"	),
	ASSOCIATE (D_eg,	1.11,	"EG"	),
	ASSOCIATE (D_xti,	3.,	"XTI"	),
	ASSOCIATE (D_tbv1,	0.,	"TBV1"	),	/* linear BV tempco */
	ASSOCIATE (D_tbv2,	0.,	"TBV2"	),	/* quad'c BV tempco */
	ASSOCIATE (D_tikf,	0.,	"TIKF"	),	/* IKF temp. coef. */
	ASSOCIATE (D_trs1,	0.,	"TRS1"	),	/* linear RS tempco */
	ASSOCIATE (D_trs2,	0.,	"TRS2"	),	/* quad'c RS tempco */
	ASSOCIATE (D_kf,	0.,	"KF"	),
	ASSOCIATE (D_af,	1.,	"AF"	),
	END_PARMS(d_)				/*ENDIGNORE*/
} ;

#undef	BASE
#endif

cmplex d_ACPrb(struct d_ *,double );

// Functions exported to PSpice by Device Equations - do not modify
DLL_FUNC void D_TmpMod(struct D_ *, double, double, double);
DLL_FUNC void D_ModChk(struct D_ *);
DLL_FUNC void d_AddInternalNodes( struct d_ *);
DLL_FUNC int d_MatPtr(struct d_ *);
DLL_FUNC int d_MatLoc(struct d_ *);
DLL_FUNC int d_Load(struct d_ *,int ,int ,int, double );
DLL_FUNC void d_ACLoad(struct d_ *,double );
DLL_FUNC void d_Noise( const struct d_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

// Function types for GetProcAddress()
typedef void (*PROCD_TmpMod)(struct D_ *, double, double, double);
typedef void (*PROCD_ModChk)(struct D_ *);
typedef void (*PROCd_AddInternalNodes)( struct d_ *);
typedef int (*PROCd_MatPtr)(struct d_ *);
typedef int (*PROCd_MatLoc)(struct d_ *);
typedef int (*PROCd_Load)(struct d_ *,int ,int ,int, double );
typedef void (*PROCd_ACLoad)(struct d_ *,double );
typedef void (*PROCd_Noise)( const struct d_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

DLL_FUNC PROCD_TmpMod fp_D_TmpMod;
DLL_FUNC PROCD_ModChk fp_D_ModChk;
DLL_FUNC PROCd_AddInternalNodes fp_d_AddInternalNodes;
DLL_FUNC PROCd_MatPtr fp_d_MatPtr;
DLL_FUNC PROCd_MatLoc fp_d_MatLoc;
DLL_FUNC PROCd_Load fp_d_Load;
DLL_FUNC PROCd_ACLoad fp_d_ACLoad;
DLL_FUNC PROCd_Noise fp_d_Noise;

#endif // DEV_D_H
