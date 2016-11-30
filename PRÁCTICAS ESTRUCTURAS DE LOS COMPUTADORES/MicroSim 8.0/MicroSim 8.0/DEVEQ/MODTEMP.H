/* modtemp.h
 *   $Revision:   1.10  $
 *   $Author:   DEC  $
 *   $Date:   02 May 1997 16:37:48  $ */

#ifndef MODTEMP_H
#define MODTEMP_H

GLOBAL	int	ModTempPrintControl;
#define MODTEMP_PRINT_NORMAL		0
#define MODTEMP_PRINT_CHANGED		1
#define MODTEMP_PRINT_HEADER		2
#define MODTEMP_PRINT_RESET_HEADER	4
#define MODTEMP_PRINT_SUBHEADER 	8

GLOBAL	int	ModTempMode;
#define MODTEMPMODE_NORMAL		0
#define MODTEMPMODE_TNEW_IS_TNOM	(MODTEMPMODE_NORMAL+1)
#define MODTEMPMODE_TOLD_IS_TNOM	(MODTEMPMODE_TNEW_IS_TNOM+1)
#define	MODTEMPMODE_TMEASURED_IS_TNOM (MODTEMPMODE_TOLD_IS_TNOM+1)

GLOBAL	double	ModTempCurrentParamValue;

struct SP_ExpDef;

struct	ModTemp {
	MXPR	(ModTemp_Measured,   ModTemp_Measured_x);	/* measured (TNOM) */
	MXPR	(ModTemp_Abs,	     ModTemp_Abs_x);		/* current */
	MXPR	(ModTemp_Rel_Global, ModTemp_Rel_Global_x);	/* current = this + .TEMP/.STEP TEMP */
	MXPR	(ModTemp_Rel_Local,  ModTemp_Rel_Local_x);	/* current = this + AKO's ModTemp_Abs */
	double	ModTemp_Current;				/* what we're at now */
	double	ModTemp_LastPrintedCurrent;			/* last one printed out */
	double	ModTemp_LastPrintedMeasured;			/* last one printed out */
	short	ModTemp_flags;
	};	/* struct ModTemp */

#define MODTEMP_MEASURED_PRESENT	1
#define MODTEMP_ABS_PRESENT		2
#define MODTEMP_REL_GLOBAL_PRESENT	4
#define MODTEMP_REL_LOCAL_PRESENT	8

#define MODTEMP_MEASURED_NAME		"T_Measured"
#define MODTEMP_ABS_NAME		"T_Abs"
#define MODTEMP_REL_GLOBAL_NAME 	"T_Rel_Global"
#define MODTEMP_REL_LOCAL_NAME		"T_Rel_Local"

#define NOT_A_MODTEMP			0
#define MODTEMP_VALID			1
#define MODTEMP_INVALID 		2

struct ModTemp *ModTempCreator(struct ModTemp *modtemp_p);
void	ModTempDestructor(struct Gen_ *model_p);
int	ModTempProcessKeywords(struct ModTemp *modtemp_p);
#ifdef IN_DLL
  typedef double (*PROCMODTEMPGETTNOM_C)(Gen_*, double);
  MAIN_FUNC PROCMODTEMPGETTNOM_C fp_ModTempGetTnom_C;
  #define ModTempGetTnom_C (*fp_ModTempGetTnom_C)
#else
  MAIN_FUNC double	ModTempGetTnom_C(struct Gen_ *model_p, double default_value);
#endif
int	ModTempPrintSubTitle(struct Gen_ *model_p, FILE *OutFile);
void NewLine(int);
void Print_Name(void *, int *, int, FILE *);
void TmpModInitReport();
#ifdef IN_DLL
  typedef void (*PROCTmpModReport)(char*, MDLPARM);
  typedef void (*PROCTmpModEndReport)(void);
  MAIN_FUNC PROCTmpModReport fp_TmpModReport;
  MAIN_FUNC PROCTmpModEndReport fp_TmpModEndReport;
  #define TmpModReport (*fp_TmpModReport)
  #define TmpModEndReport (*fp_TmpModEndReport)
#else
  MAIN_FUNC void TmpModReport(char*, MDLPARM);
  MAIN_FUNC void TmpModEndReport(void);
#endif
double	ModTempGetTnew_K(struct Gen_ *model_p, double default_value);
double	ModTempGetTold_K(struct Gen_ *model_p, double default_value);
void	ModTempSetTold_K(struct Gen_ *model_p, double new_value);
int	ModTempExists(struct Gen_ *model_p);
int	ModTempGetMode(void);
int	ModTempSetMode(int NewValue);
void	ModTempModelFixup(struct Gen_ *Model, struct Gen_ *refer);
int	ModTempGetPrintControl(void);
int	ModTempSetPrintControl(int NewValue);
int	ModTempTestPrintedValues(struct Gen_ *model_p);
void	ModTempSetPrintedValues(struct Gen_ *model_p);
double	ModTempSetValue(double new_value);
#endif	/* MODTEMP_H */
