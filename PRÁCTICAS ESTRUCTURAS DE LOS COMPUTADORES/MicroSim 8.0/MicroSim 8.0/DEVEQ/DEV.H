/* dev.h
 *   $Revision:   1.40  $
 *   $Author:   DBarksda  $
 *   $Date:   30 May 1997 18:36:10  $ */

#ifndef DEV_H_INCLUDED
#define DEV_H_INCLUDED

/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/********		 Do not change this file		   **********/

/*
 * Common device definitions
 */

#define N_TYPE	1
#define P_TYPE	-1

GLOBAL char	*Heads[27];
GLOBAL char	*MHeads[27];
#define AD_HEAD 26      /* Header index for "invisable" analog half
                           of mixed devices */

/* MDLPARM is Model Parameter size (double or float) */
/* FLOAT  casts its parameter to MDLPARM */
/* DOUBLE casts its parameter to double */
/* OMITTED indicates an omitted (defaulted) parameter value.  It is
   initialized to the value DEFAULT */

#define MDLPARM 	float
#define FLOAT(v)	((MDLPARM) (v))
#define DOUBLE(v)	((double) (v))
#define OMITTED 	1.10250E-36
const	MDLPARM	OMIT = FLOAT(OMITTED);

/* array index typedefs: array size may vary with machines */

typedef int CKT_IDX;		/* circuit matrix */
typedef double *MTX_IDX;	/* MatPrm matrix */

#ifdef IN_DLL
  typedef int (*PROCINDXCL)(double**,int,int);
  MAIN_FUNC PROCINDXCL fp_IndxCl;
  #define IndxCl (*fp_IndxCl)
  typedef int (*PROCRESERVE)(int,int);
  MAIN_FUNC PROCRESERVE fp_Reserve;
  #define Reserve (*fp_Reserve)
  typedef CKT_IDX (*PROCINCREMENTNODECOUNT)(void);
  MAIN_FUNC PROCINCREMENTNODECOUNT fp_IncrementNodeCount;
  #define IncrementNodeCount (*fp_IncrementNodeCount)
#else
  MAIN_FUNC int IndxCl(double **Index, int, int);
  MAIN_FUNC int Reserve(int, int);
  MAIN_FUNC CKT_IDX IncrementNodeCount();
#endif

#ifdef	STRESS_STUBS
union StressUnion {
  unsigned long StressFlags;
  struct StressBlock *StressPointer;
  };

#define	STRESS_BLOCK		union StressUnion SU	;
#define	STRESS_BLOCK_FLAGS(p)	( ((struct gen_ *)(p)) -> SU.StressFlags )
#define	STRESS_BLOCK_ADDR(p)	( ((struct gen_ *)(p)) -> SU.StressPointer )

#else	/* NOT STRESS_STUBS */

#define	STRESS_BLOCK

#endif	/* STRESS_STUBS */

/* gen_ is a generic device header
 * Gen_ is a generic model  header
 */

  struct Gen_;
  struct ModTemp;
  struct Nom_;
  struct MCInfo;

  struct gen_	{
    struct gen_ *gen_next;
    char	*gen_name;
    struct Gen_ *gen_model;
    STRESS_BLOCK
    CKT_IDX	gen_N1, /* node 1 */
		gen_N2; /* node 2 */
    };

GLOBAL char *whodunit	/* this will point to gen_name when known */
#ifdef Main_Pgm
= NULL
#endif
;
#define WHODUNIT(loc) (whodunit = (loc) == NULL ? NULL : (loc)->gen_name)
#define FORALLGEN(loc,id) for(loc = (struct gen_ *)Heads[id-'A'], WHODUNIT(loc);\
	 loc != NULL; \
	 loc = loc->gen_next, WHODUNIT(loc))

  struct Gen_	{
    struct Gen_ *Gen_next;
    char	*Gen_name;
    struct Nom_ *Gen_nom;
    STRESS_BLOCK
    struct Gen_ *Gen_ako;	/* ->model to support "AKO:" syntax */
    struct ModTemp *Gen_ModTemp_ptr;
    int 	 Gen_type;	/* N_TYPE or P_TYPE */
    };

/* Nom_ is a header for a model with
 * monte carlo analysis parameters:
 * mcdev = ptr to device's tolerances or NULL;
 * mclot = ptr to model's  tolerances or NULL;
 * updated_model = ptr to updated (global) model.
 * it is important to note that Nom_ does NOT have TEMPERATURE_STORAGE
 * in it!!
 */
  struct Nom_	{
    struct MCInfo *mcdev,
		  *mclot;
    struct Gen_   *updated_model;
    };

/* device capacitor: charge & current values */

struct qi_def {
  double
	qi_q,		/* charge on "plates" */
	qi_i;		/* current thru capacitor */
  };

/* state-vector access: be sure to define
 *
 *	struct sv_type sv[ max. # of prev. states ];
 *
 * then evaluate the matrix elements using the def's below.
 */
#define EVAL_SV0(sv_name,dev_ptr,member) \
	sv_name[0] = dev_ptr->member+JSTVCT

#define EVAL_SV1(sv_name,dev_ptr,member) \
	EVAL_SV0(sv_name,dev_ptr,member),\
	sv_name[1] = JSTVCT == 0 ? dev_ptr->member+MSTVCT-1 : sv_name[0]-1

#define EVAL_SV2(sv_name,dev_ptr,member) \
	EVAL_SV1(sv_name,dev_ptr,member),\
	sv_name[2] = JSTVCT == 1 ? dev_ptr->member+MSTVCT-1 : sv_name[1]-1

#define EVAL_SV3(sv_name,dev_ptr,member) \
	EVAL_SV2(sv_name,dev_ptr,member),\
	sv_name[3] = JSTVCT == 2 ? dev_ptr->member+MSTVCT-1 : sv_name[2]-1

#define EVAL_SV(sv_name,dev_ptr,member) \
	EVAL_SV3(sv_name,dev_ptr,member)	/* redundant (get 'em all) */

#define UPDATE_SV(sv,svold) Update_SV((char**)sv,(char*)&svold,sizeof(*sv[0]))
#define UPDATE_SV0(sv,svold) Update_SV0((char**)sv,(char*)&svold,sizeof(*sv[0]))
#ifdef IN_DLL
  typedef void (*PROCUPDATE_SV)(char** ,char* ,int);
  MAIN_FUNC PROCUPDATE_SV fp_Update_SV;
  MAIN_FUNC PROCUPDATE_SV fp_Update_SV0;
  #define Update_SV (*fp_Update_SV)
  #define Update_SV0 (*fp_Update_SV0)
#else
  MAIN_FUNC void Update_SV(char** sv_name,char* dev_ptr,int size);
  MAIN_FUNC void Update_SV0(char** sv_name,char* dev_ptr,int size);
#endif

/* macros for evaluating polynomials */

#define POLY1(x,k0,k1)		((k1)*(x)+(k0))
#define POLY2(x,k0,k1,k2)	POLY1(x,k0,	 (k2)*(x)+(k1))
#define POLY3(x,k0,k1,k2,k3)	POLY2(x,k0,k1,	 (k3)*(x)+(k2))
#define POLY4(x,k0,k1,k2,k3,k4) POLY3(x,k0,k1,k2,(k4)*(x)+(k3))

#define EULER	1
#define TRAP	2
#define GEAR	3
#define INTEGR8(geq,ieq,cap_val,sv0,sv1,sv2) {\
	sv0.qi_i = DcurDt(sv0.qi_q,sv1.qi_q,sv2.qi_q,sv1.qi_i);\
	ieq = IEq(sv0.qi_i,sv0.qi_q);\
	geq	= GEq(cap_val);\
	}
/* version of INTEGR8 w/o ieq calculation - can be used in place of INTEGR8
 * for most devices
 */
#define INTEGR80(geq,cap_val,sv0,sv1,sv2) {\
	sv0.qi_i = DcurDt(sv0.qi_q,sv1.qi_q,sv2.qi_q,sv1.qi_i);\
	geq	= GEq(cap_val);\
	}

#ifdef IN_DLL
  typedef double (*PROCDCURDT)(double,double,double,double);
  MAIN_FUNC PROCDCURDT fp_DcurDt;
  #define DcurDt (*fp_DcurDt)
  typedef double (*PROCIEQ)(double,double);
  MAIN_FUNC PROCIEQ fp_IEq;
  #define IEq (*fp_IEq)
  typedef double (*PROCGEQ)(double);
  MAIN_FUNC PROCGEQ fp_GEq;
  #define GEq (*fp_GEq)
  typedef void (*PROCFETLIM)(double *,double ,double);
  MAIN_FUNC PROCFETLIM fp_FETlim;
  #define FETlim (*fp_FETlim)
  typedef double (*PROCQSF)(double);
  MAIN_FUNC PROCQSF fp_qsf;
  #define qsf (*fp_qsf)
#else
  MAIN_FUNC double DcurDt(double q0, double q1, double q2, double i1);
  MAIN_FUNC double IEq(double i, double q);
  MAIN_FUNC double GEq(double cap);
  MAIN_FUNC	void FETlim(double *,double ,double );
  MAIN_FUNC double qsf(double);
#endif

/* PNJLIM expansion (using regular logarithms, not the MIN(log(x),10.) kind)
 */
#define PNJLIM(Vnew,Vold,Vte,Vcrit)\
	( Vnew <= (Vcrit) || Vnew <= 0.0 || fabs( Vnew-(Vold) ) <= (Vte)+(Vte)\
	? NO\
	: ( Vnew = ( (Vold) <= 0.\
		? (Vte)*log( Vnew/(Vte) )\
		: ( Vnew <= (Vold)-(Vte)\
			? (Vcrit)\
			: (Vold) + (Vte)*log( 1 + (Vnew-(Vold))/(Vte) )\
		)), YES\
	))

/* tolerance check */

#define TOL(a,b,relval,absval) ( relval * MAX( fabs(a), fabs(b) ) + absval )
#ifdef IN_DLL
  typedef double (*PROCCURRENTTOL)(double,double);
  MAIN_FUNC PROCCURRENTTOL fp_CurrentTOL;
  #define CurrentTOL (*fp_CurrentTOL)
  typedef double (*PROCVOLTAGETOL)(double,double);
  MAIN_FUNC PROCVOLTAGETOL fp_VoltageTOL;
  #define VoltageTOL (*fp_VoltageTOL)
#else
  MAIN_FUNC double CurrentTOL(double a,double b);
  MAIN_FUNC double VoltageTOL(double a,double b);
#endif

/* junction charge & capacitance calculation */
/*
?? ??? 87 pwt	creation
11 Aug 88 pwt	allow grading coefficient, m, to be 1.0 (and beyond)
*/

#define PNJCHG(chg,cap,cjo,vj,pb,fcpb,m,f1,f2,f3)\
	if ( (pb) == 0.) {\
	  SimError(INTERNAL_ERROR+TERMINATE_SIMULATION,\
	       "PNJCHG:  divide by zero in %s", ((struct gen_ *)(Instance))->gen_name);\
	  }\
	else if ( (vj) < (fcpb) ) {\
	  double\
	    arg  = 1-(vj)/(pb),\
	    sarg = (m)==.5 ? 1/sqrt(arg) : pow(arg,-(m));\
	  chg = (cjo)*(pb)*( (m)==1.? -log(arg) : (1-arg*sarg)/(1-(m)) );\
	  cap = (cjo)*sarg;\
	  }\
	else {\
	  chg = (cjo)*( (f1) + ( (f3)*((vj)-(fcpb)) + ( (m)/((pb)+(pb)) )*( (vj)*(vj)-(fcpb)*(fcpb) ) )/(f2) );\
	  cap = (cjo)*( (f3) + (m)*(vj)/(pb) )/(f2);\
	  }
/* to include transit-time capacitance, include this after the macro-call:
 *
 *	chg += TT*ij;
 *	cap += TT*gj;
 */

/* same as PNJCHG, except FC==0 (e.g. bipolar Cjs capacitor) */

#define PNJCHG0(chg,cap,cjo,vj,pb,m)\
	if ( (pb) == 0.) {\
	  SimError(INTERNAL_ERROR+TERMINATE_SIMULATION,\
	       "PNJCHG0:  divide by zero in %s", ((struct gen_ *)(Instance))->gen_name);\
	  }\
	else if ( (vj) < 0.) {\
	  double\
	    arg  = 1-(vj)/(pb),\
	    sarg = (m)==.5 ? 1/sqrt(arg) : pow(arg,-(m));\
	  chg = (cjo)*(pb)*( (m)==1.? -log(arg) : (1-arg*sarg)/(1-(m)) );\
	  cap = (cjo)*sarg;\
	  }\
	else {\
	  chg = (vj)*(cjo)*(1 + (m)*(vj)/((pb)+(pb)));\
	  cap =      (cjo)*(1 + (m)*(vj)/(pb));\
	}

#define EGFET(temp)	(1.16 - ( 7.02E-4 * temp*temp )/( temp + 1108 ))

/* Matrix references */

#define Y_MATRIX(a)	*(Instance->a)
#define AC_MAT_R(a)	*(Instance->a)
#define AC_MAT_I(a)	*(Instance->a + 1)

/* VltVct references */

#define VOLTAGE(a)	Voltage(Instance->a)
#ifdef IN_DLL
  typedef double (*PROCVOLTAGE)(int);
  MAIN_FUNC PROCVOLTAGE fp_Voltage;
  MAIN_FUNC PROCVOLTAGE fp_VoltageI;
  #define Voltage (*fp_Voltage)
  #define VoltageI (*fp_VoltageI)
#else
  MAIN_FUNC double Voltage(int);
  MAIN_FUNC double VoltageI(int);
#endif
GLOBAL double *VltVct, *VltVctI;
#define NGND	1		/* Internal node number for ground */

// macro for repetitious magnitude calculation
#define SUM_SQR(x,y) (((x)*(x))+((y)*(y)))
#define VMAG(node1,node2) \
  SUM_SQR(Voltage(dev->node1)-Voltage(dev->node2), VoltageI(dev->node1)-VoltageI(dev->node2))
#define MIN_INOISE	1e-20	/* lower limit of device noise currents */

/* model parameter macros */

struct	Assoc {
  char	*AssocName;
  char	*AssocAddr;
  MDLPARM  AssocValue;
  char	*AssocTextValue;
  int	AssocType;
#define ASSOCTYPE_FLOAT    0	/* Floating point model Value (default) */
#define ASSOCTYPE_TEXT	   1	/* Text string model value */
  } ;

// functions for setting up default model structures
DLL_FUNC Gen_* GetDefault(int);
DLL_FUNC Assoc* GetAssoc(int);
typedef Gen_* (*PROCGetDefault)(int);
typedef Assoc* (*PROCGetAssoc)(int);
DLL_FUNC PROCGetDefault fp_GetDefault;
DLL_FUNC PROCGetAssoc fp_GetAssoc;
// function to obtain pointer to list of devices present
#ifdef IN_DLL
  typedef gen_* (*PROCGetHeads)(char);
  MAIN_FUNC PROCGetHeads fp_GetHeads;
  #define GetHeads (*fp_GetHeads)
#else
  MAIN_FUNC gen_* GetHeads(char);
#endif

#define ASSOCIATE(sname,value,string)		\
{	string, (char *) (&(BASE . sname)), FLOAT(value), NULL, ASSOCTYPE_FLOAT}

#define ASSOCIATE_TEXT(sname,value,string)		\
{	string, (char *) (&(BASE . sname)), FLOAT(0), value, ASSOCTYPE_TEXT}

#define END_PARMS(dev)							\
{	NULL, NULL, FLOAT(sizeof(BASE)),       NULL, ASSOCTYPE_FLOAT},	 \
{	NULL, NULL, FLOAT(sizeof(struct dev)), NULL, ASSOCTYPE_FLOAT}

/* declarator macros for (double,expr) and (modelpar,expr) pairs */
#define DXPR(d,e)	double d;  struct SP_ExpDef *e
#define MXPR(m,e)	MDLPARM m; struct SP_ExpDef *e
#define SXPR(s,e)	char *s;   struct SP_ExpDef *e

#include	"modtemp.h"

#endif /* #ifndef DEV_H_INCLUDED */