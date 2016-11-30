/* psmesfet.h
 *   $Revision:   1.6  $
 *   $Author:   DEC  $
 *   $Date:   11 Nov 1996 14:54:12  $ */

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the Parker-Skellern MESFET model *******/
/******** parameters and device equations is the same as for the MOSFET. ****/
/******** See the comments in the files mos.c and m.h for details. **********/

/*
tp		18 Apr 94	creation
eks	18 Jan 95	Removed leading "_" in variable names to avoid problems 
						with C++ compiler
*/

/* Glue definitions for cref modl and inst */
typedef struct {
	struct psv_def  **psv;
	struct bsv_def  **bsv;
	int             ModeFl;  
	} cref;                         /* Circuit REFerence */
typedef struct B_       modl;           /* MODeL parameters */
typedef struct b_       inst;           /* device INSTance parameters */

extern  void    PSinstanceinit(modl *);
extern  double  PSids(cref *,modl *,inst *,double,double,
			double *,double *,double *,double *,double *,double *,double);
extern  void    PScharge(cref *,modl *,inst *,double,double,double *,double *);
extern  void    PSacload(modl *,inst *,double,double,double,double,
					  double *,double *,double *,double *);

#ifdef PSMESFET_C /* PSMESFET_C defined when included from "psmesfet.c" */
/* The following glue definitions need to be changed to suit the specific
   simulator.  */
/* simulator mode flags 
    TRAN_ANAL should be true during transient analysis iteration.
	      (ie. false for other analysis functions and tran 
	      operating point.)
    TRAN_INIT should be true only during the first calculation of the initial 
	      transient analysis time point. It should be false for remaining
	      iterations at that time point and the rest 
	      of the transient analysis.
 */
#define TRAN_ANAL          (ckt->ModeFl == MDTRAN) 
#define TRAN_INIT          NO /* FALSE */ /* (ckt->ModeFl==MDBPTR) already checked
					in gasfet.c  */

/* state variables */
/* initialized when TRAN_ANAL is false */
#define VGSTRAP_BEFORE     ((pv[1])->psv_vgstrap)
#define VGSTRAP_NOW        ((pv[0])->psv_vgstrap)
#define VGDTRAP_BEFORE     ((pv[1])->psv_vgdtrap)
#define VGDTRAP_NOW        ((pv[0])->psv_vgdtrap)
#define POWR_BEFORE        ((pv[1])->psv_pave)
#define POWR_NOW           ((pv[0])->psv_pave)

/* initialized when TRAN_INIT is true or TRAN_ANAL is false */
#define QGS_BEFORE         (B_QCGS(1))
#define QGS_NOW            (B_QCGS(0))
#define QGD_BEFORE         (B_QCGD(1))
#define QGD_NOW            (B_QCGD(0))

/* past terminal potentials used if TRAN_INIT is false and TRAN_ANAL is true */
#define VGS1               (B_VGS(1))
#define VGD1               (B_VGD(1))

/* simulator specific parameters */
#define NVT      (double)(double)model->B_n*BOLTZ/CHARGE*\
		 ModTempGetTnew_K((struct Gen_ *)model,(double)TEMPERATURE+CTOK)
#define STEP    DELTA       /* time step of this transient solution */
#define FOURTH  0.25           /* eldo requires 2.5e-10 for units conversion */

/* model parameters */
/* dc model */
#define BETA    (double)model->B_beta      /* transconductance scaling */
#define DELT    (double)model->B_delta     /* thermal current reduction */
#define IBD     (double)model->B_ibd       /* breakdown current */
#define IS      (double)model->B_is            /* gate reverse saturation current */
#define LAM     (double)model->B_lambda    /* channel length modulation */
#define LFGAM   (double)model->B_lfgam     /* dc drain feedback */
#define LFG1    (double)model->B_lfg1      /* dc drain feedback vgs modulation */
#define LFG2    (double)model->B_lfg2      /* dc drain feedback vgd modulation */
#define MVST    (double)model->B_mvst      /* subthreshold vds modulation */
#define MXI     (double)model->B_mxi       /* saturation index vgs modulation */
#define P       (double)model->B_p         /* power law in controlled resistance */
#define Q       (double)model->B_q         /* power law in controlled current */
#define VBD     (double)model->B_vbd       /* breakdown exponential coef */
#define VBI     (double)model->B_vbi           /* junction built-in potential */
#define VSUB    (double)model->B_vst       /* subthreshold exponential coef */
#define VTO     (double)model->B_vto       /* pinch-off potential */
#define XI      (double)model->B_xi        /* saturation index */
#define Z       (double)model->B_z         /* saturation knee curvature */

/* ac model */
#define ACGAM   (double)model->B_acgam     /* capacitance vds modulation */
#define CGS     (double)model->B_cgs      /* zero bias cgs */
#define CGD     (double)model->B_cgd      /* zero bias cgd */
#define HFETA   (double)model->B_hfeta     /* ac source feedback */
#define HFE1    (double)model->B_hfe1      /* ac source feedback vgd modulation */
#define HFE2    (double)model->B_hfe2      /* ac source feedback vgs modulation */
#define HFGAM   (double)model->B_hfgam     /* ac drain feedback */
#define HFG1    (double)model->B_hfg1      /* ac drain feedback vgs modulation */
#define HFG2    (double)model->B_hfg2      /* ac drain feedback vgd modulation */
#define TAUD    (double)model->B_taud      /* thermal time constant */
#define TAUG    (double)model->B_taug      /* dc ac feedback time constant */
#define XC      (double)model->B_xc        /* cgs reduction at pinch-off */

/* device instance */
#define AREA    here->b_area                   /* area factor of fet */

/* internally derived model parameters */
#define ALPHA   model->B_alpha                 /* cgs cgd reversal interval */
#define D3      model->B_d3                    /* dual power-law parameter */
#define VMAX    (double)model->B_fc            /* forward capacitance potential */
#define XI_WOO  model->B_d1                            /* saturation potential */
#define ZA      model->B_d2                            /* saturation knee parameter */

#define PARAM_CAST (float)

/*  State Variable definitions */

#define sv (ckt->bsv)
#define pv (ckt->psv)


#endif
