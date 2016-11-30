/* j.h
 *   $Revision:   1.23  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:14:18  $ */

#ifndef DEV_J_H
#define DEV_J_H

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the JFET model parameters	   **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.	   **********/

/* Junction FET definitions */

/*
pwt	?? Aug 86	creation
pwt	17 Mar 88	implement shared data area in device instance
pwt	11 Apr 88	add parameter: "M" (junction grading factor)
imw	17 Aug 88	expressions
pwt	10 Oct 88	add reverse leakage parameters
pwt	04 May 90	remove one value saved for bypass calculations
*/

struct jac_def {	/* AC values */
  double		/* capacitances */
	jac_cgs,
	jac_cgd;
  };

struct jsv_def {	/* state vector */
  struct qi_def 	/* junction capacitor charges & currents */
	jsv_cgs,
	jsv_cgd;
  double		/* voltages */
	jsv_vgs,
	jsv_vgd;
  };

/* state-vector access */

#define J_QIGS(vect)	(sv[vect]->jsv_cgs)
#define J_QCGS(vect)	(sv[vect]->jsv_cgs.qi_q)
#define J_ICGS(vect)	(sv[vect]->jsv_cgs.qi_i)

#define J_QIGD(vect)	(sv[vect]->jsv_cgd)
#define J_QCGD(vect)	(sv[vect]->jsv_cgd.qi_q)
#define J_ICGD(vect)	(sv[vect]->jsv_cgd.qi_i)

#define J_VGS(vect)	(sv[vect]->jsv_vgs)
#define J_VGD(vect)	(sv[vect]->jsv_vgd)

/* device instance */

struct J_;

struct j_ {
  struct j_ *j_next;
  char	    *j_name;
  struct J_ *j_model;
  STRESS_BLOCK

  CKT_IDX		/* circuit matrix indices: external nodes */
	j_D,
	j_G,
	j_S;

  int	j_off;

  /* device parameters and expressions */
  /* MUST FOLLOW j_off */
  DXPR( j_area, jx_area);
  DXPR( j_vds,	jx_vds);
  DXPR( j_vgs,	jx_vgs);

  CKT_IDX		/* circuit matrix indices: internal nodes */
	j_d,
	j_s;

  MTX_IDX		/* MatPrm indices: conductance terms */
	j_Dd,
	j_Gd,
	j_Gs,
	j_Ss,
	j_dD,
	j_dG,
	j_ds,
	j_sG,
	j_sS,
	j_sd,
	j_DD,
	j_GG,
	j_SS,
	j_dd,
	j_ss;

  MTX_IDX		/* MatPrm indices: branch currents */
	j_iG,
	j_id,
	j_is;

  double		/* "current" values */
	jcv_ig, 	/* currents */
	jcv_id,
	jcv_gm, 	/* derivitives */
	jcv_gds,
	jcv_ggs,
	jcv_ggd,
	jcv_ggds,
	jcv_gggs;

  struct {		/* shared data area */
    struct jac_def	j_ac;		/* AC (capacitance values) */
    struct jsv_def	j_sv[MSTVCT];	/* state vectors (transient values) */
    }	j_sda;
  };

/* device model */

struct J_ {
  struct J_ *J_next;
  char	    *J_name;
  struct J_ *J_nom;
  STRESS_BLOCK
  struct J_ *J_ako;
  struct ModTemp *J_ModTemp_ptr;

  int	J_type; 	/* device type == N_TYPE or P_TYPE */

  double		/* reserved: pre-computed values */
	J_f1,		/* = pb*(1-(1-fc)^(1-m))/(1-m) */
	J_f2,		/* = (1-fc)^(1+m) */
	J_f3,		/* = 1-fc*(1+m) */
	J_vcrit;	/* = vt*ln(vt/(is*sqrt(2))) */

  /* model parameters and expressions */
  MXPR( J_level,Jx_level);
  MXPR( J_vto,	Jx_vto);
  MXPR( J_beta, Jx_beta);
  MXPR( J_lambda,Jx_lambda);
  MXPR( J_is,	Jx_is);
  MXPR( J_n,	Jx_n);
  MXPR( J_isr,	Jx_isr);
  MXPR( J_nr,	Jx_nr);
  MXPR( J_alpha,Jx_alpha);
  MXPR( J_vk,	Jx_vk);
  MDLPARM J_rd;
  MXPR( J_User_rd,	Jx_User_rd);		/* = 1/rd */
  MDLPARM J_rs;
  MXPR( J_User_rs,	Jx_User_rs);		/* = 1/rs */
  MXPR( J_cgd,	Jx_cgd);
  MXPR( J_cgs,	Jx_cgs);
  MXPR( J_m,	Jx_m);
  MXPR( J_pb,	Jx_pb);
  MDLPARM J_fc; 	/* = fc*pb */
  MXPR( J_User_fc,	Jx_User_fc);
  MXPR( J_vtotc,Jx_vtotc);
  MXPR( J_betatce,Jx_betatce);
  MXPR( J_xti,	Jx_xti);
  MXPR( J_kf,	Jx_kf);
  MXPR( J_af,	Jx_af);
  } ;

#ifdef	J_DEVICE

struct	J_	J_default;

#define BASE	J_default

struct	Assoc	J_Assoc[] = {			/*IGNORE*/ /* for Pre-C */
    ASSOCIATE (J_level,	1,	    "LEVEL"	),
	ASSOCIATE (J_vto,	-2.,	"*VTO"	),	/* force print */
	ASSOCIATE (J_beta,	1E-4,	"*BETA" ),	/* force print */
	ASSOCIATE (J_lambda,	0.,	"LAMBDA"),
	ASSOCIATE (J_is,	1E-14,	"IS"	),
	ASSOCIATE (J_n, 	1.,	"N"	),
	ASSOCIATE (J_isr,	0.,	"ISR"	),	/* recomb. current */
	ASSOCIATE (J_nr,	2.,	"NR"	),	/* recomb. coef. */
	ASSOCIATE (J_alpha,	0.,	"ALPHA" ),	/* ionization coef. */
	ASSOCIATE (J_vk,	0.,	"VK"	),	/* ionization knee */
	ASSOCIATE (J_User_rd,	0.,	"RD"	),
	ASSOCIATE (J_User_rs,	0.,	"RS"	),
	ASSOCIATE (J_cgd,	0.,	"CGD"	),
	ASSOCIATE (J_cgs,	0.,	"CGS"	),
	ASSOCIATE (J_m, 	.5,	"M"	),
	ASSOCIATE (J_pb,	1.,	"PB"	),
	ASSOCIATE (J_User_fc,	.5,	"FC"	),
	ASSOCIATE (J_vtotc,	0.,	"VTOTC" ),
	ASSOCIATE (J_betatce,	0.,	"BETATCE"),
	ASSOCIATE (J_xti,	3.,	"XTI"	),
	ASSOCIATE (J_kf,	0.,	"KF"	),
	ASSOCIATE (J_af,	1.,	"AF"	),
	END_PARMS(j_)				/*ENDIGNORE*/
} ;

#undef	BASE
#endif

cmplex j_ACPrb(struct j_ *,double ,int ,int );

// Functions exported to PSpice by Device Equations - do not modify
DLL_FUNC void J_TmpMod(struct J_ *, double, double, double);
DLL_FUNC void J_ModChk(struct J_ *);
DLL_FUNC void j_AddInternalNodes( struct j_ *);
DLL_FUNC int j_MatPtr(struct j_ *);
DLL_FUNC int j_MatLoc(struct j_ *);
DLL_FUNC int j_Load(struct j_ *,int ,int ,int, double );
DLL_FUNC void j_ACLoad(struct j_ *,double );
DLL_FUNC void j_Noise( const struct j_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

// Function types for GetProcAddress()
typedef void (*PROCJ_TmpMod)(struct J_ *, double, double, double);
typedef void (*PROCJ_ModChk)(struct J_ *);
typedef void (*PROCj_AddInternalNodes)( struct j_ *);
typedef int (*PROCj_MatPtr)(struct j_ *);
typedef int (*PROCj_MatLoc)(struct j_ *);
typedef int (*PROCj_Load)(struct j_ *,int ,int ,int, double );
typedef void (*PROCj_ACLoad)(struct j_ *,double );
typedef void (*PROCj_Noise)( const struct j_ *, double, double, double *, double *, double *,
  double *, double *, double *, double * );

DLL_FUNC PROCJ_TmpMod fp_J_TmpMod;
DLL_FUNC PROCJ_ModChk fp_J_ModChk;
DLL_FUNC PROCj_AddInternalNodes fp_j_AddInternalNodes;
DLL_FUNC PROCj_MatPtr fp_j_MatPtr;
DLL_FUNC PROCj_MatLoc fp_j_MatLoc;
DLL_FUNC PROCj_Load fp_j_Load;
DLL_FUNC PROCj_ACLoad fp_j_ACLoad;
DLL_FUNC PROCj_Noise fp_j_Noise;

#endif // DEV_J_H
