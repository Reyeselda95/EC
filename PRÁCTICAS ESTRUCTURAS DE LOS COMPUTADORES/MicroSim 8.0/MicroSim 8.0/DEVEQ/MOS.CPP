/* mos.c
 *   $Revision:   1.59  $
 *   $Author:   GWB  $
 *   $Date:   18 Jun 1997 18:13:38  $ */
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The definitions below access the device and model data   **********/
/******** structures that are defined in the file m.h.  When the   **********/
/******** routine MOSfet is called, it is passed a pointer to the  **********/
/******** device structure.  From the device structure is gotten   **********/
/******** a pointer to the model structure.  The overall structure **********/
/******** of the subroutines and model parameters is the same as   **********/
/******** the UC Berkeley Spice 2G.6.                              **********/
 
/******** To add a model parameter and equations that use that     **********/
/******** parameter, make the appropriate changes to the file m.h  **********/
/******** and to this file (mos.c).  See the comments in m.h for   **********/
/******** instructions on making changes there.                    **********/
 
#define M_DEVICE
 
#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"
#include "mserrors.h"
 
static void MOSpnjc(double *, double *, double, double, double, double, double);
static void Yangcap(struct M_ *, double, double, double, double, double,
                double, double, double, double *, double *, double *, double *,
                double *, double *, double *, double *, double *, double *,
                double *, double *, double *, double *, double *, double *);
 
//#define BSIM3_DEBUG
//#define BSIM3_ONCE
//#define BSIM3_LOAD
//#define SPICE3_LOGIC
 
/* #define DEBUG */                    /* debug print every iteration         */
/* #define DEBUG1 */                   /* debug print after DEBUG_TIME        */
#define DEBUG_TIME      4.0e-6
 
#ifdef  DEBUG
#define DB_GO
#endif
#ifdef  DEBUG1
#define DB_GO           if ( TIME >= DEBUG_TIME )
#endif
 
static double
            Cox,
            Xqc;
 
/* defines for device parameter access: simplify code appearance */
 
#define PARAM_DEV(a)    (Instance->a)
#define DevAd           PARAM_DEV(m_ad)
#define DevAs           PARAM_DEV(m_as)
#define DevGbpr         PARAM_DEV(m_rb)  /* = 1/rb                            */
#define DevGdpr         PARAM_DEV(m_rd)  /* = 1/rd                            */
#define DevGgpr         PARAM_DEV(m_rg)  /* = 1/rg                            */
#define DevGspr         PARAM_DEV(m_rs)  /* = 1/rs                            */
#define DevIdsat        PARAM_DEV(m_idsat)
#define DevIssat        PARAM_DEV(m_issat)
#define DevL            PARAM_DEV(m_l)
#define DevMode         PARAM_DEV(m_mode)
#define DevM            PARAM_DEV(m_m)
#define DevOff          PARAM_DEV(m_off)
#define DevPd           PARAM_DEV(m_pd)
#define DevPs           PARAM_DEV(m_ps)
#define DevVbs          PARAM_DEV(m_vbs)
#define DevVds          PARAM_DEV(m_vds)
#define DevVdsat        PARAM_DEV(m_vdsat)
#define DevVgs          PARAM_DEV(m_vgs)
#define DevVon          PARAM_DEV(m_von)
#define DevW            PARAM_DEV(m_w)
#define DevXqc          PARAM_DEV(m_xqc)
#define DevUeff         PARAM_DEV(m_BSIM3ueff)
#define DevQinv         PARAM_DEV(m_BSIM3qinv)
#define DevTconst       PARAM_DEV(m_BSIM3tconst)
#define DevNOI          PARAM_DEV(m_noi)
 
#define DXPART          (DevMode>0 ? 0.4 : 0.6)
#define SXPART          (DevMode>0 ? 0.6 : 0.4)
 
/* defines for model parameter access: simplify code appearance
 *      note: since the parameters are available to all routines in this file
 *      they are preceeded with "Mod"
 */
#define PARAM_MOD(a)    ((double)Model->a)
#define ModCbd          PARAM_MOD(M_cbd)
#define ModCbs          PARAM_MOD(M_cbs)
#define ModCgbo         PARAM_MOD(M_cgbo)
#define ModCgdo         PARAM_MOD(M_cgdo)
#define ModCgso         PARAM_MOD(M_cgso)
#define ModCj           PARAM_MOD(M_cj)
#define ModCjsw         PARAM_MOD(M_cjsw)
#define ModFc           PARAM_MOD(M_fc)
#define ModGamma        PARAM_MOD(M_gamma)
#define ModGdspr        PARAM_MOD(M_rds)  /* = 1/Rds                          */
#define ModKp           PARAM_MOD(M_kp)
#define ModL            PARAM_MOD(M_l)
#define ModLambda       PARAM_MOD(M_lambda)
#define ModLd           PARAM_MOD(M_ld)
#define ModLevel        NINT(PARAM_MOD(M_level))
#define ModMj           PARAM_MOD(M_mj)
#define ModMjsw         PARAM_MOD(M_mjsw)
#define ModN            PARAM_MOD(M_n)
#define ModPb           PARAM_MOD(M_pb)
#define ModPbsw         PARAM_MOD(M_pbsw)
#define ModPhi          PARAM_MOD(M_phi)
#define ModTox          PARAM_MOD(M_tox)
#define ModTt           PARAM_MOD(M_tt)
#define ModVbi          PARAM_MOD(M_vbi)
#define ModVinit        PARAM_MOD(M_vinit)
#define ModVto          PARAM_MOD(M_vto)
#define ModW            PARAM_MOD(M_w)
#define ModWd           PARAM_MOD(M_wd)
#define ModXqc          PARAM_MOD(M_xqc)
#define ModNlev         PARAM_MOD(M_nlev)
#define ModGdsnoi       PARAM_MOD(M_gdsnoi)
#define ModDio          PARAM_MOD(M_diomod)
 
int m_Load(
        struct m_ *Instance,     /* (R) a device to evaluate                  */
        int ModeFl,              /* (R) mode control flag: see "tran.h"       */
        int InitFl,              /* (R) initialization flag: see "tran.h"     */
        int LoadFl,              /* NO: bypass MatPrm load if sol'n unchanged */
        double Tmod              /* temperature of this device                */
    )
/*****************************************************************************
* Purpose
*   Process MOSFETs for DC and TRANSIENT analyses
*
* Returned value
*   YES/NO: did/not converge
*
* Author
*   pwt  - 20 Aug 86 - creation
*   pwt  - ?? Oct 87 - many changes to split MOS models into separate files
*   pwt  - ?? Nov 87 - re-do junction cap. using square-root if "mj" = .5
*   pwt  - 29 Dec 87 - re-do junction cap. using sidewall potential "pbsw"
*   pwt  - 02 Mar 88 - add transit time cap. and emission coef. to junctions
*   pwt  - 16 Mar 88 - add shared data area to M.H, change source to match
*   pwt  - 21 Mar 88 - protect PNJLIM calculations from IS==0.0
*   pwt  - 06 Oct 88 - add "M" (multiplier) to device calculations
*   whjb - 06 Apr 89 - LoadFl==YES now forces full recalculation
*   pwt  - 15 Apr 89 - set T=0 cap. currents
*   whjb - 25 Aug 89 - corrected cgs, cgd calculation just after CMeyer call
*   sv   - 12 Feb 90 - add local temperatures to models.
*   pwt  - 04 May 90 - remove values saved for bypass calculations
*   pwt  - 08 Aug 90 - apply LoadFl condition to parasitic resistors
*   jmh  - 13 Jun 91 - correct Ward-Dutton charge mapping re. bulk junctions
*   whjb - 20 Jun 92 - replace Meyer by Yang model; consolidated cap. code
*   eks  - 06 Aug 92 - fix charge injection error at drain & source when M>1
*   dec  - 01 Apr 93 - swapped INTEGR80 for INTEGR8 since ieq not needed
*   gwb  - 14 Sep 95 - remove Level=5 BSIM3 code
*   gwb  - 15 Aug 96 - additions for new mosfet noise model
*   dec  - 13-Nov-96 - Replaced some globals with calls to Get() functions,
*                      and made current temperature a function parameter
*   dec  - 13 Jun 97 - additions for BSIM3 version 3.0,
*                      Level=7 (gwb modifications).
*
*****************************************************************************/
 
{
/* Local variables */
 
    struct M_ *Model;                  /* device's model                      */
    double
            vds, vgs, vbs, vgd, vbd,   /* voltages                            */
            vgb, von, vdsat, vte,
            ibs, ibd, id, idr,         /* currents                            */
            gbd, gbs, gds, gm, gmbs,   /* conductances                        */
            gbbs, gbgs, gbds,
            cddb, cdgb, cdsb,          /* non-reciprocal capacitances         */
            cgdb, cggb, cgsb,
            csdb, csgb, cssb,
            cbdb, cbgb, cbsb,
            cqdb, cqsb, cqgb, cqbb,
            ieq_qg, ieq_qb, ieq_qd,
            qdrn, qgate, qsrc,
            qbulk, qcheq, qchan,
            gcddb, gcdgb, gcdsb,       /* non-rec. cap. equiv. conductances   */
            gcgdb, gcggb, gcgsb,
            gcsdb, gcsgb, gcssb,
            gcbdb, gcbgb, gcbsb,
            id_hat, ib_hat,            /* predicted currents                  */
            covlgs, covlgd, covlgb,    /* overlap capacitances                */
            xfact,                     /* extrapolation factor                */
            type;                      /* NMOS=+1, PMOS=-1                    */
    double  ueff, qinv, evbs, evbd;
    bsim3SizeDependParam * pParam = Instance->pParam;
 
    int     level;
 
    double  vt;
    double  alpha, noise_beta, noise_factor;
 
    double  Qdef;
    double  cqcheq, cqdef, gcqbb, gcqdb, gcqgb, gcqsb, gqdef;
    double  isub;
 
    int
            charge,                    /* flag that charge calc. be done      */
            jlim_fl = YES,             /* junction limiting flag: YES, NO     */
            pred_fl = NO,              /* pred. calculated  flag: YES, NO     */
            nonconv = NO;              /* non-convergence   flag: YES, NO     */
 
/* defines & declarations for state-vector access */
 
    struct msv_def *sv[MSTVCT];
 
    UPDATE_SV(sv, Instance->m_sda.m_sv);
 
#define ID0     (Instance->mcv_id)
#define IBS0    (Instance->mcv_ibs)
#define IBD0    (Instance->mcv_ibd)
 
#define GM0     (Instance->mcv_gm)
#define GDS0    (Instance->mcv_gds)
#define GMBS0   (Instance->mcv_gmbs)
#define GBD0    (Instance->mcv_gbd)
#define GBS0    (Instance->mcv_gbs)
#define GTAU0   (Instance->mcv_gtau)
#define GTG0    (Instance->mcv_gtg)
#define GTD0    (Instance->mcv_gtd)
#define GTS0    (Instance->mcv_gts)
#define GTB0    (Instance->mcv_gtb)
 
#define CGGB0   (Instance->m_sda.m_ac.mac_cggb)
#define CGDB0   (Instance->m_sda.m_ac.mac_cgdb)
#define CGSB0   (Instance->m_sda.m_ac.mac_cgsb)
#define CBGB0   (Instance->m_sda.m_ac.mac_cbgb)
#define CBDB0   (Instance->m_sda.m_ac.mac_cbdb)
#define CBSB0   (Instance->m_sda.m_ac.mac_cbsb)
#define CDGB0   (Instance->m_sda.m_ac.mac_cdgb)
#define CDDB0   (Instance->m_sda.m_ac.mac_cddb)
#define CDSB0   (Instance->m_sda.m_ac.mac_cdsb)
#define CSGB0   (Instance->m_sda.m_ac.mac_csgb)
#define CSDB0   (Instance->m_sda.m_ac.mac_csdb)
#define CSSB0   (Instance->m_sda.m_ac.mac_cssb)
#define CQDB0   (Instance->m_sda.m_ac.mac_cqdb)
#define CQSB0   (Instance->m_sda.m_ac.mac_cqsb)
#define CQGB0   (Instance->m_sda.m_ac.mac_cqgb)
#define CQBB0   (Instance->m_sda.m_ac.mac_cqbb)
#define CBD0    (Instance->m_sda.m_ac.mac_cbd)
#define CBS0    (Instance->m_sda.m_ac.mac_cbs)
#define CGB0    (Instance->m_sda.m_ac.mac_cgbo)
#define CGD0    (Instance->m_sda.m_ac.mac_cgdo)
#define CGS0    (Instance->m_sda.m_ac.mac_cgso)
 
/* initialization */
 
#ifdef DB_GO
  DB_GO ToOutFile("Enter MOS \n");
#endif
 
    Model = Instance->m_model;         /* find the model                      */
    int     capMod = (int) Model->BSIM3_CAPMOD;
    int     nqsMod = (ModLevel == 7 && Model->BSIM3_NQSMOD != 0.0);
 
    vt = Tmod * BOLTZ / CHARGE;
    type = Model->M_type > 0 ? 1. : -1.;
 
    if (InitFl == INSTV0) {            /* use prev. iteration                 */
        double
            vs = VOLTAGE(m_s);
 
        vds = (VOLTAGE(m_d) - vs) * type;
        vgs = (VOLTAGE(m_g) - vs) * type;
        vbs = (VOLTAGE(m_b) - vs) * type;
        Qdef = VOLTAGE(m_q);
    }
    else if (InitFl == INTRAN) {       /* use prev. time-step                 */
        vds = M_VDS(1);
        vgs = M_VGS(1);
        vbs = M_VBS(1);
        Qdef = M_QDUMP(1);
    }
    else if (InitFl == INOFF &&        /* set "off" devices                   */
            DevOff == YES)
        vds = vgs = vbs = Qdef = 0.;
 
    else if (InitFl == ININIT) {       /* use IC= values                      */
        Qdef = 0.0;
 
        if (ModeFl == MDBPTR && NOSOLV == YES) {
            vds = DevVds * type;
            vgs = DevVgs * type;
            vbs = DevVbs * type;
        }
 
#ifdef SPICE3_LOGIC
        else if ( DevOff==NO ) {
            vds = .1;
            vgs = ModVto*type + .1;
            vbs = 0.0;
        }
#else
        else if (DevOff == NO) {
            vds = 0.;
            vgs = ModVto * type;
            vbs = ModVinit;
        }
#endif
        else
            vds = vgs = vbs = Qdef = 0.;
    }
    else {
        double del_vbs, del_vbd, del_vgs, del_vgd, del_vds, del_id, del_ib;
 
        if (InitFl == INPRDCT) {       /* extrapolate value                   */
            xfact = GetDELTA() / GetDELTAOLD();
 
            vds = xfact * (M_VDS(1) - M_VDS(2)) + M_VDS(1);
            vgs = xfact * (M_VGS(1) - M_VGS(2)) + M_VGS(1);
            vbs = xfact * (M_VBS(1) - M_VBS(2)) + M_VBS(1);
            Qdef = xfact * (M_QDUMP(1) - M_QDUMP(2)) + M_QDUMP(1);
            *sv[0] = *sv[1];
        }
        else {                         /* use current value                   */
            double
            vs = VOLTAGE(m_s);
 
            vds = (VOLTAGE(m_d) - vs) * type;
            vgs = (VOLTAGE(m_g) - vs) * type;
            vbs = (VOLTAGE(m_b) - vs) * type;
            Qdef = VOLTAGE(m_q);
        }
 
/* compute new non-linear branch voltage */
 
        del_vds = vds - M_VDS(0);
        del_vgs = vgs - M_VGS(0);
        del_vgd = del_vgs - del_vds;
        del_vbs = vbs - M_VBS(0);
        del_vbd = del_vbs - del_vds;
 
        del_id = M_VDS(0) >= 0.
            ? del_vds * GDS0 + del_vgs * GM0 - del_vbd * GBD0
                + del_vbs * GMBS0
            : del_vds * GDS0 - del_vgd * GM0 - del_vbd * GBD0
                + del_vbd * GMBS0;
        id_hat = del_id + ID0;
 
        del_ib = del_vbd * GBD0 + del_vbs * GBS0;
        ib_hat = del_ib + IBS0 + IBD0;
 
/* bypass if solution not changed */
/* note: check order based on frequency analysis of test suite circuits */
 
        if (LoadFl);
        else if (InitFl == INPRDCT && GetDELTA() != GetDELTAOLD());
        else if (fabs(del_vds) >= VoltageTOL(vds, M_VDS(0)));
        else if (fabs(del_vgd) >= VoltageTOL(vgs - vds, M_VGS(0) - M_VDS(0)));
        else if (fabs(del_vgs) >= VoltageTOL(vgs, M_VGS(0)));
        else if (fabs(del_vbd) >= VoltageTOL(vbs - vds, M_VBS(0) - M_VDS(0)));
        else if (fabs(del_vbs) >= VoltageTOL(vbs, M_VBS(0)));
        else if (fabs(del_id) >= CurrentTOL(id_hat, ID0));
        else if (fabs(del_ib) >= CurrentTOL(ib_hat, IBS0 + IBD0));
        else {
            goto done;
        }
        pred_fl = YES;
 
/* solution changed: limit non-linear branch voltages */
 
        vgd = vgs - vds;
        vbd = vbs - vds;
        vgb = vgs - vbs;
        von = DevVon * type;
        FETlim(&vgs, M_VGS(0), von);
        FETlim(&vgd, M_VGS(0) - M_VDS(0), von);
        vds = vgs - vgd;
        vte = ModN * vt;
 
        if (vds >= 0.) {
            if (DevIssat > 0.) {
                double vcrit = vte * log(vte / (DevIssat * DevM * ROOT2));
 
                jlim_fl = PNJLIM(vbs, M_VBS(0), vte, vcrit);
            }
        }
        else {
            if (DevIdsat > 0.) {
                double vcrit = vte * log(vte / (DevIdsat * DevM * ROOT2));
 
                jlim_fl = PNJLIM(vbd, M_VBS(0) - M_VDS(0), vte, vcrit);
                vbs = vbd + vds;
            }
        }
    }                                  /* end of initialization               */
 
/* compute DC current and derivatives */
 
    vgd = vgs - vds;
    vbd = vbs - vds;
    vgb = vgs - vbs;
    vte = ModN * vt;
    DevMode = vds >= 0. ? 1 : -1;
 
    if (vbs > -10 * vte) {
        if (ModDio == 2.0)             /* Spice3 diode                        */
            evbs = vbs > 0.5 ? EXP(0.5 / vte) : EXP(vbs / vte);
        else                           /* PSpice diode                        */
            evbs = EXP(vbs / vte);
 
        gbs = (evbs / vte) * DevIssat * DevM + GMIN * DevM;
        ibs = (evbs - 1) * DevIssat * DevM + vbs * GMIN * DevM;
    }
    else {
        gbs = GMIN * DevM;
        ibs = gbs * vbs - DevIssat * DevM;
    }
 
    if (vbd > -10 * vte) {
        if (ModDio == 2.0)             /* Spice3 diode                        */
            evbd = vbd > 0.5 ? EXP(0.5 / vte) : EXP(vbd / vte);
        else                           /* PSpice diode                        */
            evbd = EXP(vbd / vte);
 
        gbd = (evbd / vte) * DevIdsat * DevM + GMIN * DevM;
        ibd = (evbd - 1) * DevIdsat * DevM + vbd * GMIN * DevM;
    }
    else {
        gbd = GMIN * DevM;
        ibd = gbd * vbd - DevIdsat * DevM;
    }
 
/* decide if models need to calculate device charges */
 
    level = ModLevel;
 
    if (ModeFl == MDTRAN || InitFl == INSTV0) {
        if (level == 1 ||              /* when to use Yang model              */
                level == 2 && ModXqc >.5 ||
                level == 3 ||
                level == 4 && PARAM_MOD(BSIM_xpart) < 0.)
            charge = NO;
        else
            charge = YES;
    }
    else
        charge = NO;
 
/* compute drain current and derivatives (evaluate device models) */
 
    {
        double
            len = DevL - ModLd * (level == 4 ? 1e-6 : 2.),
            wid = (DevW - ModWd * (level == 4 ? 1e-6 : 2.)) * DevM;
 
        /* save for Yangcap */
        Cox = ModTox == 0. ? 0. : wid * len * EPSOX / ModTox;
 
        if (level == 7) {
            Instance->BSIM3cgso = pParam->BSIM3cgso;
            Instance->BSIM3cgdo = pParam->BSIM3cgdo;
            covlgs = Instance->BSIM3cgso;
            covlgd = Instance->BSIM3cgdo;
            covlgb = Instance->pParam->BSIM3cgbo;
        }
        else {
            covlgs = ModCgso * wid;
            covlgd = ModCgdo * wid;
            covlgb = ModCgbo * len;
        }
 
        switch (level) {
        case 1 :                       /* MOS1: Shichman-Hodges               */
            if (DevMode > 0) MOS1eval(
                    Model, len, wid, vgs, vds, vbs, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, &noise_beta);
            else MOS1eval(
                    Model, len, wid, vgd, - vds, vbd, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, &noise_beta);
            break;
        case 2 :                       /* MOS2: analytic                      */
            Xqc = ModXqc;
            if (DevMode > 0) MOS2eval(
                    Model, len, wid, DevM, vgs, vds, vbs, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgdb, &cgsb, &cbgb,
                    &cbdb, &cbsb, &qgate, &qchan, &qbulk, &noise_beta, Tmod);
            else MOS2eval(
                    Model, len, wid, DevM, vgd, - vds, vbd, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgsb, &cgdb, &cbgb,
                    &cbsb, &cbdb, &qgate, &qchan, &qbulk, &noise_beta, Tmod);
            break;
        case 3 :                       /* MOS3: semi-empirical                */
            if (DevMode > 0) MOS3eval(
                    Model, len, wid, DevM, vgs, vds, vbs, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &qgate, &qchan, &qbulk, &noise_beta, Tmod);
            else MOS3eval(
                    Model, len, wid, DevM, vgd, - vds, vbd, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &qgate, &qchan, &qbulk, &noise_beta, Tmod);
            break;
        case 4 :                       /* MOS4: BSIM                          */
            if (DevMode > 0) MOS4eval(
                    Model, len, wid, DevM, vgs, vds, vbs, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgdb, &cgsb, &cdgb,
                    &cddb, &cdsb, &cbgb, &cbdb, &cbsb, &qgate, &qdrn, &qbulk,
                    &noise_beta, Tmod);
            else MOS4eval(
                    Model, len, wid, DevM, vgd, - vds, vbd, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgsb, &cgdb, &csgb,
                    &cssb, &csdb, &cbgb, &cbsb, &cbdb, &qgate, &qsrc, &qbulk,
                    &noise_beta, Tmod);
            break;
        case 5 :                       /* BSIM3 Version 1.0                   */
            /* Version 1.0 (Level=5) is obsolete */
            break;
        case 6 :                       /* BSIM3 Version 2.0                   */
            if (DevMode > 0) {
                MOS6eval(
                    Model, len, wid, DevM, vgs, vds, vbs, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgdb, &cgsb, &cdgb,
                    &cddb, &cdsb, &cbgb, &cbdb, &cbsb, &qgate, &qdrn, &qbulk,
                    &noise_beta, Tmod);
            }
            else {
                MOS6eval(
                    Model, len, wid, DevM, vgd, - vds, vbd, &von, &vdsat, &idr,
                    &gds, &gm, &gmbs, charge, &cggb, &cgsb, &cgdb, &csgb,
                    &cssb, &csdb, &cbgb, &cbsb, &cbdb, &qgate, &qsrc, &qbulk,
                    &noise_beta, Tmod);
            }
            break;
        case 7 :                       /* BSIM3 Version 3.0                   */
            if (DevMode > 0) {
                MOS7eval(
                    Model, len, wid, DevM, vgs, vds, vbs, &von, &vdsat, &idr,
                    &ibs, &isub, &gds, &gm, &gmbs, &gbbs, &gbgs, &gbds,
                    &GTAU0, charge, &cggb, &cgdb, &cgsb, &cdgb, &cddb, &cdsb,
                    &cbgb, &cbdb, &cbsb, &cqdb, &cqsb, &cqgb, &cqbb, &qgate,
                    &qdrn, &qbulk, &qcheq, &noise_beta, &ueff, &qinv,
                    &DevTconst, pParam, Tmod);
 
            }
            else {
                MOS7eval(
                    Model, len, wid, DevM, vgd, -vds, vbd, &von, &vdsat, &idr,
                    &ibd, &isub, &gds, &gm, &gmbs, &gbbs, &gbgs, &gbds,
                    &GTAU0, charge, &cggb, &cgsb, &cgdb, &csgb, &cssb, &csdb,
                    &cbgb, &cbsb, &cbdb, &cqsb, &cqdb, &cqgb, &cqbb, &qgate,
                    &qsrc, &qbulk, &qcheq, &noise_beta, &ueff, &qinv,
                    &DevTconst, pParam, Tmod);
            }
            DevUeff = ueff;
            DevQinv = qinv;
            break;
        default :;
        }
    }
 
/* save values for next iteration */
 
    DevVon = von * type;
    DevVdsat = vdsat * type;
 
    if (ModXqc <=.5) DevXqc = Xqc;
 
    if (DevMode > 0) {
        if (ModNlev == (float) 3.0) {
            if (vds <= vdsat) {
                alpha = 1.0 - vds / vdsat;
                noise_factor = (1.0 + alpha + alpha * alpha)
                    * ModGdsnoi / (1.0 + alpha);
            }
            else {
                noise_factor = ModGdsnoi;
            }
            DevNOI = noise_beta * MAX(vgs - von, 0.0) * noise_factor;
        }
    }
    else {
        if (ModNlev == (float) 3.0) {
            if (- vds <= vdsat) {
                alpha = 1.0 + vds / vdsat;
                noise_factor = (1.0 + alpha + alpha * alpha)
                    * ModGdsnoi / (1.0 + alpha);
            }
            else {
                noise_factor = ModGdsnoi;
            }
            DevNOI = noise_beta * MAX(vgd - von, 0.0) * noise_factor;
        }
    }
 
/* compute equivalent drain current source */
 
    id = DevMode * idr + vds * ModGdspr * DevM - ibd;
    gds = gds + ModGdspr * DevM;
 
/* charge calculations */
 
    if (ModeFl == MDTRAN ||
            InitFl == INSTV0 ||
            (ModeFl == MDBPTR && NOSOLV == YES)) {
        double
            cap_bd = 0.,               /* junction capacitances               */
            cap_bs = 0.,
            vgb = vgs - vbs;
 
        M_QCBD(0) = M_QCBS(0) = 0.;
 
/* calculate values for depletion capacitors */
 
        if (ModCbd != 0. ||
                ModCbs != 0.) {
            MOSpnjc(&M_QCBD(0), &cap_bd, ModCbd * DevM, vbd, ModPb,
                ModFc, ModMj);
            MOSpnjc(&M_QCBS(0), &cap_bs, ModCbs * DevM, vbs, ModPb,
                ModFc, ModMj);
        }
        else if (ModCj != 0.) {
            MOSpnjc(&M_QCBD(0), &cap_bd, ModCj * DevAd * DevM, vbd, ModPb,
                ModFc, ModMj);
            MOSpnjc(&M_QCBS(0), &cap_bs, ModCj * DevAs * DevM, vbs, ModPb,
                ModFc, ModMj);
        }
 
        if (ModCjsw != 0.) {
            MOSpnjc(&M_QCBD(0), &cap_bd, ModCjsw * DevPd * DevM, vbd, ModPbsw,
                ModFc, ModMjsw);
            MOSpnjc(&M_QCBS(0), &cap_bs, ModCjsw * DevPs * DevM, vbs, ModPbsw,
                ModFc, ModMjsw);
        }
 
        if (ModTt != 0.) {             /* include transit time effects        */
            M_QCBD(0) += ModTt * ibd; cap_bd += ModTt * gbd;
            M_QCBS(0) += ModTt * ibs; cap_bs += ModTt * gbs;
        }
 
        M_ICBD(0) =         /* reset, so T=0 results (e.g. Probe) are correct */
        M_ICBS(0) = 0.;
 
        if (! (ModeFl == MDBPTR && NOSOLV == NO)) {  /* transient analysis    */
            double g_eq;
 
/* calculate equivalent conductances and currents for depletion capacitors */
 
            if (InitFl == INTRAN) {                /* for 1st transient step: */
                M_QCBD(2) = M_QCBD(1) = M_QCBD(0); /* set "old" charges so    */
                M_QCBS(2) = M_QCBS(1) = M_QCBS(0); /* integration works       */
            }
 
            INTEGR80(g_eq, cap_bd, M_QIBD(0), M_QIBD(1), M_QIBD(2));
            gbd += g_eq;
            ibd += M_ICBD(0);
            id -= M_ICBD(0);
 
            INTEGR80(g_eq, cap_bs, M_QIBS(0), M_QIBS(1), M_QIBS(2));
            gbs += g_eq;
            ibs += M_ICBS(0);
 
            if (InitFl == INTRAN) {    /* for 1st transient step:             */
                M_ICBD(1) = M_ICBD(0); /* set "old" currents so               */
                M_ICBS(1) = M_ICBS(0); /* time-step calc. works               */
            }
        }                              /* end of junction charge calculations */
 
/* Intrinsic charge calculations */
 
        if (charge == NO) {            /*** Yang-Chatterjee cap. model **     */
            if (DevMode == 1)
                Yangcap(Model, vgs, vgd, vgb, von, vdsat, covlgs, covlgd,
                    covlgb, &qsrc, &qdrn, &qgate, &qbulk,
                    &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &cdgb, &cddb, &cdsb, &csgb, &csdb, &cssb);
            else
                Yangcap(Model, vgd, vgs, vgb, von, vdsat, covlgd, covlgs,
                    covlgb, &qdrn, &qsrc, &qgate, &qbulk,
                    &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &csgb, &cssb, &csdb, &cdgb, &cdsb, &cddb);
        }
        else if (level == 4) {         /*** BSIM charge model **              */
            if (DevMode > 0)
                MOS4cap(vgd, vgs, vgb, covlgd, covlgs, covlgb,
                    &qgate, &qbulk, &qdrn, &qsrc,
                    &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &cdgb, &cddb, &cdsb, &csgb, &csdb, &cssb);
            else
                MOS4cap(vgs, vgd, vgb, covlgs, covlgd, covlgb,
                    &qgate, &qbulk, &qsrc, &qdrn,
                    &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &csgb, &cssb, &csdb, &cdgb, &cdsb, &cddb);
        }
 
        /* BSIM3 Version 1.0 - Level=5 is obsolete*/
 
        else if (level == 6) {         /*** BSIM3 charge model Version 2.0 ** */
            if (DevMode > 0)
                MOS6cap(vgd, vgs, vgb, covlgd, covlgs, covlgb,
                    &qgate, &qbulk, &qdrn, &qsrc,
                    &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &cdgb, &cddb, &cdsb, &csgb, &csdb, &cssb);
            else
                MOS6cap(vgs, vgd, vgb, covlgs, covlgd, covlgb,
                    &qgate, &qbulk, &qsrc, &qdrn,
                    &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &csgb, &cssb, &csdb, &cdgb, &cdsb, &cddb);
        }
        else if (level == 7) {         /*** BSIM3 charge model Version 3.0 ** */
            if (DevMode > 0)
                MOS7cap(capMod, pParam->BSIM3ckappa, pParam->BSIM3weffCV,
                    vgd, vgs, vgb, pParam->BSIM3cgdl, pParam->BSIM3cgsl,
                    covlgd, covlgs, covlgb, &qgate, &qbulk, &qdrn, &qsrc,
                    &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &cdgb, &cddb, &cdsb, &csgb, &csdb, &cssb,
                    cqgb, cqbb, cqdb, cqsb, DevTconst, Qdef,
                    &GTG0, &GTB0, &GTD0, &GTS0);
            else
                MOS7cap(capMod, pParam->BSIM3ckappa, pParam->BSIM3weffCV,
                    vgs, vgd, vgb, pParam->BSIM3cgsl, pParam->BSIM3cgdl,
                    covlgs, covlgd, covlgb, &qgate, &qbulk, &qsrc, &qdrn,
                    &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &csgb, &cssb, &csdb, &cdgb, &cdsb, &cddb,
                    cqgb, cqbb, cqsb, cqdb, DevTconst, Qdef,
                    &GTG0, &GTB0, &GTS0, &GTD0);
        }
        else {                         /*** Ward-Dutton charge model **       */
            if (DevMode > 0)
                MOScap(
                    vgd, vgs, vgb, covlgd, covlgs, covlgb,
                    &cggb, &cgdb, &cgsb, &cbgb, &cbdb, &cbsb,
                    &cdgb, &cddb, &cdsb, &csgb, &csdb, &cssb,
                    &qdrn, &qgate, &qsrc, &qbulk, &qchan);
            else
                MOScap(
                    vgs, vgd, vgb, covlgs, covlgd, covlgb,
                    &cggb, &cgsb, &cgdb, &cbgb, &cbsb, &cbdb,
                    &csgb, &cssb, &csdb, &cdgb, &cdsb, &cddb,
                    &qsrc, &qgate, &qdrn, &qbulk, &qchan);
        }
 
        M_QCG(0) = qgate;
        M_QCD(0) = qdrn;
        M_QCB(0) = qbulk;
 
        M_ICG(0) =          /* reset, so T=0 results (e.g. Probe) are correct */
        M_ICD(0) =
        M_ICB(0) = 0.;
 
        /* added by Mansun 11/1/93 */
 
        if (nqsMod) {
            M_QCHEQ(0) = qcheq;
            M_QDUMP(0) = Qdef;
 
            // set "old" charges so integration works
            if (InitFl == INTRAN) {
                M_QCHEQ(2) = M_QCHEQ(1) = M_QCHEQ(0);
                M_QDUMP(2) = M_QDUMP(1) = M_QDUMP(0);
            }
 
            double geq;
            INTEGR80(geq, 0.0, M_QICHEQ(0), M_QICHEQ(1), M_QICHEQ(2));
            gcqgb = GEq(cqgb);
            gcqdb = GEq(cqdb);
            gcqsb = GEq(cqsb);
            gcqbb = GEq(cqbb);
            cqcheq = M_ICHEQ(0)
                - (gcqgb * vgb - gcqdb * vbd - gcqsb * vbs)
                + (GTG0 * vgb - GTD0 * vbd - GTS0 * vbs);
            INTEGR8(gqdef, cqdef, 1.0, M_QIDUMP(0), M_QIDUMP(1), M_QIDUMP(2));
 
            // set "old" currents so time-step calc. works
            if (InitFl == INTRAN) {
                M_ICHEQ(1) = M_ICHEQ(0);
                M_IDUMP(1) = M_IDUMP(0);
                M_IQB(1) = M_IQB(0);
                M_IQG(1) = M_IQG(0);
                M_IQD(1) = M_IQD(0);
            }
        }
        else {
            gqdef = cqdef = 0.0;
        }
 
/* End added by Mansun 11/1/93 */
 
        if (InitFl == INSTV0) {        /* store small-signal parameters       */
            /* and update the state vector */
            CGGB0 = cggb; CGDB0 = cgdb; CGSB0 = cgsb;
            CBGB0 = cbgb; CBDB0 = cbdb; CBSB0 = cbsb;
            CDGB0 = cdgb; CDDB0 = cddb; CDSB0 = cdsb;
            CSGB0 = csgb; CSDB0 = csdb; CSSB0 = cssb;
            CQDB0 = cqdb; CQSB0 = cqsb; CQGB0 = cqgb; CQBB0 = cqbb;
            CBD0 = cap_bd;
            CBS0 = cap_bs;
 
            cqcheq = cqdef = 0.0;
 
            gcdgb = gcddb = gcdsb =
            gcsgb = gcsdb = gcssb =
            gcggb = gcgdb = gcgsb =
            gcbgb = gcbdb = gcbsb =
            gcqdb = gcqsb = gcqgb = gcqbb =
            ieq_qg = ieq_qb = ieq_qd = 0.;
 
            GTG0 = GTD0 = GTS0 = GTB0 = 0.0;
            gqdef = 0.0;
 
            goto load;
        }
 
        if (! (ModeFl == MDBPTR && NOSOLV == NO)) {  /* transient analysis    */
            double g_eq;
 
            if (InitFl == INTRAN) {              /* for 1st transient step:   */
                M_QCG(2) = M_QCG(1) = M_QCG(0);  /* set "old" charges so      */
                M_QCD(2) = M_QCD(1) = M_QCD(0);  /* integration works         */
                M_QCB(2) = M_QCB(1) = M_QCB(0);
            }
 
            INTEGR80(g_eq, 0., M_QICG(0), M_QICG(1), M_QICG(2));
            ieq_qg = M_ICG(0) -(gcggb = GEq(cggb)) * vgb
                + (gcgdb = GEq(cgdb)) * vbd
                + (gcgsb = GEq(cgsb)) * vbs;
            if (nqsMod) ieq_qg += (GTG0 * vgb - GTD0 * vbd - GTS0 * vbs);
 
            INTEGR80(g_eq, 0., M_QICD(0), M_QICD(1), M_QICD(2));
            ieq_qd = M_ICD(0) -(gcdgb = GEq(cdgb)) * vgb
                + (gcddb = GEq(cddb)) * vbd
                + (gcdsb = GEq(cdsb)) * vbs;
            if (nqsMod) ieq_qd -= DXPART * (GTG0 * vgb - GTD0 * vbd
                        - GTS0 * vbs);
 
            INTEGR80(g_eq, 0., M_QICB(0), M_QICB(1), M_QICB(2));
            ieq_qb = M_ICB(0) -(gcbgb = GEq(cbgb)) * vgb
                + (gcbdb = GEq(cbdb)) * vbd
                + (gcbsb = GEq(cbsb)) * vbs;
 
            gcsgb = GEq(csgb);
            gcsdb = GEq(csdb);
            gcssb = GEq(cssb);
 
            if (InitFl == INTRAN) {    /* for 1st transient step:             */
                M_ICG(1) = M_ICG(0);   /* set "old" currents so               */
                M_ICD(1) = M_ICD(0);   /* time-step calc. works               */
                M_ICB(1) = M_ICB(0);
            }
        }                       /* end of calculations for transient analysis */
 
    }                                  /* end of all charge calculations      */
    else {
        cqcheq = cqdef = 0.0;
 
        gcdgb = gcddb = gcdsb =
        gcsgb = gcsdb = gcssb =
        gcggb = gcgdb = gcgsb =
        gcbgb = gcbdb = gcbsb =
        gcqdb = gcqsb = gcqgb = gcqbb =
        ieq_qg = ieq_qb = ieq_qd = 0.;
 
        GTG0 = GTD0 = GTS0 = GTB0 = 0.0;
        gqdef = 0.0;
        if (nqsMod) {
            GTAU0 = 16.0 * pParam->BSIM3u0temp * Model->BSIM3vtm
                / pParam->BSIM3leff / pParam->BSIM3leff;
        }
        else
            GTAU0 = 0.0;
    }
 
/* check convergence */
 
    if (pred_fl && (
                jlim_fl ||
                fabs(id_hat - id) > CurrentTOL(id_hat, id) ||
                fabs(ib_hat - (ibs + ibd)) > CurrentTOL(ib_hat, (ibs + ibd))
            )
        ) nonconv = YES;
 
load:
    {
        int fwd = (DevMode > 0 ? YES : NO);
        double
            ggpr, gdpr, gspr, gbpr,
            ieq_bs = ibs - gbs * vbs,
            ieq_bd = ibd - gbd * vbd,
            idr_eq = fwd
                ? idr - (gm * vgs + (gds - ModGdspr * DevM) * vds
                        + gmbs * vbs)
                : - (idr - (gm * vgd - (gds - ModGdspr * DevM) * vds +
                        gmbs * vbd));
 
        if (level != 7) {             /* load all model levels except level=7 */
 
            /* load current vector */
 
            Y_MATRIX(m_ig) = - type * ieq_qg;
            Y_MATRIX(m_ib) = - type * (ieq_bs + ieq_bd + ieq_qb);
            Y_MATRIX(m_id) = - type * (idr_eq - ieq_bd + ieq_qd);
            Y_MATRIX(m_is) = type * (idr_eq + ieq_bs + ieq_qd + ieq_qb
                    + ieq_qg);
 
            /* load conductance matrix */
 
            Y_MATRIX(m_gd) = gcgdb;
            Y_MATRIX(m_gs) = gcgsb;
            Y_MATRIX(m_gb) = - gcggb - gcgdb - gcgsb;
            Y_MATRIX(m_gg) = gcggb
                + (ggpr = DevGgpr * DevM);
 
            Y_MATRIX(m_dg) = (fwd ? gm : - gm) + gcdgb;
            Y_MATRIX(m_ds) = (fwd ? - gm - gmbs : 0.) + gcdsb - gds;
            Y_MATRIX(m_db) = (fwd ? gmbs : - gmbs) - gcddb - gcdgb - gcdsb
                - gbd;
            Y_MATRIX(m_dd) = (fwd ? 0. : gm + gmbs) + gcddb + gds + gbd
                + (gdpr = DevGdpr * DevM);
 
            Y_MATRIX(m_sg) = (fwd ? - gm : gm) + gcsgb;
            Y_MATRIX(m_sd) = (fwd ? 0. : - gm - gmbs) + gcsdb - gds;
            Y_MATRIX(m_sb) = (fwd ? - gmbs : gmbs) - gcssb - gcsgb - gcsdb
                - gbs;
            Y_MATRIX(m_ss) = (fwd ? gm + gmbs : 0.) + gcssb + gds + gbs
                + (gspr = DevGspr * DevM);
 
            Y_MATRIX(m_bg) = gcbgb;
            Y_MATRIX(m_bd) = gcbdb - gbd;
            Y_MATRIX(m_bs) = gcbsb - gbs;
            Y_MATRIX(m_bb) = gbd + gbs - gcbgb - gcbdb - gcbsb
                + (gbpr = DevGbpr * DevM);
 
            if (LoadFl) {
                Y_MATRIX(m_gG) = Y_MATRIX(m_Gg) = - (Y_MATRIX(m_GG) = ggpr);
                Y_MATRIX(m_dD) = Y_MATRIX(m_Dd) = - (Y_MATRIX(m_DD) = gdpr);
                Y_MATRIX(m_sS) = Y_MATRIX(m_Ss) = - (Y_MATRIX(m_SS) = gspr);
                Y_MATRIX(m_bB) = Y_MATRIX(m_Bb) = - (Y_MATRIX(m_BB) = gbpr);
            }
        }
        else {                         /*  load level=7                       */
            double dxpart = DXPART, sxpart = SXPART;
 
            ieq_bs += GMIN * vbs + (fwd ? isub : 0.0);
            ieq_bd += GMIN * vbd + (fwd ? 0.0 : isub);
 
            /* load current vector */
 
            Y_MATRIX(m_ig) = - type * ieq_qg;
            Y_MATRIX(m_ib) = - type * (ieq_bs + ieq_bd + ieq_qb);
            Y_MATRIX(m_id) = - type * (idr_eq - ieq_bd + ieq_qd);
            Y_MATRIX(m_is) = type * (idr_eq + ieq_bs + ieq_qd + ieq_qb
                    + ieq_qg);
 
            /* load conductance matrix */
 
            Y_MATRIX(m_gd) = gcgdb - GTD0;
            Y_MATRIX(m_gs) = gcgsb - GTS0;
            Y_MATRIX(m_gb) = - gcggb - gcgdb - gcgsb - GTB0;
            Y_MATRIX(m_gg) = gcggb + (ggpr = DevGgpr * DevM) - GTG0;
 
            Y_MATRIX(m_dg) = (fwd ? gm : gbgs - gm) + gcdgb
                + dxpart * GTG0;
            Y_MATRIX(m_ds) = (fwd ? - gm - gmbs : gbds) + gcdsb - gds
                + dxpart * GTS0;
            Y_MATRIX(m_db) = (fwd ? gmbs : gbbs - gmbs) - gcddb - gcdgb
                - gcdsb - gbd
                + dxpart * GTB0;
            Y_MATRIX(m_dd) = (fwd ? 0. : gm + gmbs - gbds - gbgs - gbbs)
                + gcddb + gds + gbd + (gdpr = DevGdpr * DevM)
                + dxpart * GTD0;
 
            Y_MATRIX(m_sg) = (fwd ? gbgs - gm : gm) + gcsgb
                + sxpart * GTG0;
            Y_MATRIX(m_sd) = (fwd ? gbds : - gm - gmbs) + gcsdb - gds
                + sxpart * GTD0;       // Spice3 Compatibility (adds Gbd term)
            Y_MATRIX(m_sb) = (fwd ? gbbs - gmbs : gmbs) - gcssb - gcsgb
                - gcsdb - gbs + sxpart * GTB0;
            Y_MATRIX(m_ss) = (fwd ? gm + gmbs - gbds - gbgs - gbbs : 0.)
                + gcssb + gds + gbs + (gspr = DevGspr * DevM)
                + sxpart * GTS0;
 
            Y_MATRIX(m_bg) = gcbgb - gbgs;
            Y_MATRIX(m_bd) = (fwd ? - gbds : gbds + gbgs + gbbs) + gcbdb - gbd;
            Y_MATRIX(m_bs) = (fwd ? gbds + gbgs + gbbs : - gbds) + gcbsb - gbs;
            Y_MATRIX(m_bb) = gbd + gbs - gcbgb - gcbdb - gcbsb
                + (gbpr = DevGbpr * DevM) - gbbs;
 
            if (nqsMod) {
 
                Y_MATRIX(m_iq) = type * cqcheq - cqdef; // Spice3 compatibility
 
                Y_MATRIX(m_qq) = gqdef + GTAU0;
                Y_MATRIX(m_dq) = dxpart * GTAU0;
                Y_MATRIX(m_sq) = sxpart * GTAU0;
                Y_MATRIX(m_gq) = - GTAU0;
 
                Y_MATRIX(m_qg) = - gcqgb + GTG0;
                Y_MATRIX(m_qd) = - gcqdb + GTD0;
                Y_MATRIX(m_qs) = - gcqsb + GTS0;
                Y_MATRIX(m_qb) = - gcqbb + GTB0;
            }
 
            if (LoadFl) {
                Y_MATRIX(m_gG) = Y_MATRIX(m_Gg) = - (Y_MATRIX(m_GG) = ggpr);
                Y_MATRIX(m_dD) = Y_MATRIX(m_Dd) = - (Y_MATRIX(m_DD) = gdpr);
                Y_MATRIX(m_sS) = Y_MATRIX(m_Ss) = - (Y_MATRIX(m_SS) = gspr);
                Y_MATRIX(m_bB) = Y_MATRIX(m_Bb) = - (Y_MATRIX(m_BB) = gbpr);
            }
        }
 
    }
 
    M_VDS(0) = vds;
    M_VGS(0) = vgs;
    M_VBS(0) = vbs;
 
    ID0 = id;
    IBS0 = ibs;
    IBD0 = ibd;
 
    GM0 = gm;
    GDS0 = gds;
    GMBS0 = gmbs;
    GBD0 = gbd;
    GBS0 = gbs;
 
done :
 
#ifdef DB_GO
  DB_GO ToOutFile("Exit MOS \n");
#endif
#ifdef BSIM3_DEBUG
ToOutFile("EXIT MOS\n");
#endif
#ifdef BSIM3_ONCE
  exit(1);
#endif
 
    return nonconv;
}
 
static void MOSpnjc(
                double *chg,      /* (W) charge                               */
                double *cap,      /* (W) capacitance                          */
                double cjo,       /* (R) zero-bias capacitance                */
                double vj,        /* (R) junction bias                        */
                double pb,        /* (R) p-n potential                        */
                double fc,        /* (R) forward-bias capacitance coefficient */
                double mj)        /* (R) junction grading coefficient         */
/*****************************************************************************
* Purpose
*   Calculate p-n junction charge and capacitance
*
* Returned value
*   None
*
*  Discussion
*    Charge and capacitance is calculated and added to the pointed-to value,
*    so be sure to initialize these values.  This is done so sidewall values
*    may be added to the area values.
*
* Author
*   pwt  - 29 Dec 87 - creation
*   pwt  - 12 Aug 88 - allow grading coefficient, mj, to be 1.0 (and beyond).
*
*****************************************************************************/
 
{
 
    if (vj <= fc * pb) {
        double
            arg = 1 - vj / pb,
        sarg = mj ==.5 ? 1 / sqrt(arg) : pow(arg, - mj);
 
        *chg += cjo * pb * (mj == 1. ? - log(arg)
                : (1 - arg * sarg) / (1 - mj));
        *cap += cjo * sarg;
    }
    else {
        double
            arg = 1 - fc,
            varg = (vj - fc * pb) / arg,
            xarg = varg / pb,
            sarg = mj ==.5 ? sqrt(arg) : pow(arg, 1 - mj);
 
        *chg += cjo * (pb * (mj == 1. ? - log(arg) : (1 - sarg) / (1 - mj))
                + (1 +.5 * xarg * mj) * varg * sarg);
        *cap += cjo * (1 + xarg * mj) * sarg / arg;
    }
}
 
void MOS1eval(
         struct M_ *Model,             /* (R) device model                    */
         double Len,                   /* (R) device size                     */
         double Wid,                   /* (R) device size                     */
         double Vgs,                   /* (R) terminal voltages               */
         double Vds,                   /* (R) terminal voltages               */
         double Vbs,                   /* (R) terminal voltages               */
         double *Von,                  /* (W) device characteristic voltages  */
         double *Vdsat,                /* (W) device characteristic voltages  */
         double *Id,                   /* (W) drain current                   */
         double *Gds,                  /* (W) device conductances             */
         double *Gm,                   /* (W) device conductances             */
         double *Gmbs,                 /* (W) device conductances             */
         double *NoiseBeta)            /* (W) noise beta                      */
/*****************************************************************************
* Purpose
*   Evaluate MOS level 1 (Shichman-Hodges) model
*
* Returned value
*   None
*
* Author
*   pwt  - 22 Aug 86 - creation
*   pwt  - 10 Oct 87 - re-work as part of BSIM addition
*   gwb  - 15 Aug 96 - additions for new mosfet noise model
*
*****************************************************************************/
 
{
/* Local variables */
 
    double
            sarg, vgst,
            beta = ModKp * Wid / Len;
 
    *NoiseBeta = beta;
 
    if (Vbs > 0.) {
        sarg = sqrt(ModPhi);
        sarg = sarg -.5 * Vbs / sarg;
        sarg = MAX(sarg, 0.);
    }
    else
        sarg = sqrt(ModPhi - Vbs);
 
    *Von = ModGamma * sarg + ModVbi * (Model->M_type);
    vgst = Vgs - *Von;
    *Vdsat = MAX(vgst, 0.);
 
    if (vgst > 0.) {
        double betap = beta * (ModLambda * Vds + 1);
 
        if (vgst > Vds) {              /* linear region                       */
            *Gm = betap * Vds;
            *Id = *Gm * (vgst -.5 * Vds);
            *Gds = betap * (vgst - Vds) + beta * ModLambda * Vds
                * (vgst -.5 * Vds);
        }
        else {                         /* saturated region                    */
            *Gm = betap * vgst;
            *Id = *Gm *.5 * vgst;
            *Gds =.5 * ModLambda * beta * vgst * vgst;
        }
        *Gmbs = (sarg > 0. ? *Gm *.5 * ModGamma / sarg : 0.);
    }
    else                               /* cut-off region                      */
        *Gm = *Gds = *Gmbs = *Id = 0.;
 
}                                      /* done                                */
 
 
void MOScap(
         double Vgd,                   /* (R) terminal voltages               */
         double Vgs,                   /* (R) terminal voltages               */
         double Vgb,                   /* (R) terminal voltages               */
         double Covlgd,                /* (R) overlap capacitances            */
         double Covlgs,                /* (R) overlap capacitances            */
         double Covlgb,                /* (R) overlap capacitances            */
         double *Cggb,                 /* (R/W) capacitances                  */
         double *Cgdb,                 /* (R/W) capacitances                  */
         double *Cgsb,                 /* (R/W) capacitances                  */
         double *Cbgb,                 /* (R/W) capacitances                  */
         double *Cbdb,                 /* (R/W) capacitances                  */
         double *Cbsb,                 /* (R/W) capacitances                  */
         double *Cdgb,                 /* (R/W) capacitances                  */
         double *Cddb,                 /* (R/W) capacitances                  */
         double *Cdsb,                 /* (R/W) capacitances                  */
         double *Csgb,                 /* (R/W) capacitances                  */
         double *Csdb,                 /* (R/W) capacitances                  */
         double *Cssb,                 /* (R/W) capacitances                  */
         double *Qdrn,                 /* (R/W) device charges                */
         double *Qgate,                /* (R/W) device charges                */
         double *Qsrc,                 /* (R/W) device charges                */
         double *Qbulk,                /* (R/W) device charges                */
         double *Qchan)                /* (R/W) device charges                */
/*****************************************************************************
* Purpose
*   Evaluate MOS capacitances for the Ward-Dutton model
*
* Returned value
*   None
*
*  Discussion
*    The channel charge and the derivatives of the channel charge
*    are divided up by (1-xqc)/xqc to source and drain.  Overlap
*    capacitances are added to all the charge derivatives.
*
* Author
*   pwt  - 28 Aug 86 - creation
*   pwt  - 29 Dec 86 - housekeeping
*   pwt  - 19 Feb 88 - bug (dating to SPICE2G.6):
*                       remove junction caps from calculations (these are
*                       already accounted for in I-vector and G-matrix load)
*   pwt  - 18 Mar 88 - re-write for clarity
*   whjb - 20 Jun 92 - simplified in conjunction with Meyer -> Yang changes
*
*****************************************************************************/
 
{
/* Local variables */
 
    double
            cchnlg = - (*Cggb + *Cbgb),
            cdgb = cchnlg * Xqc,
            csgb = cchnlg - cdgb;
    double
            cchnld = - (*Cgdb + *Cbdb),
            cddb = cchnld * Xqc,
            csdb = cchnld - cddb;
    double
            cchnls = - (*Cgsb + *Cbsb),
            cdsb = cchnls * Xqc,
            cssb = cchnls - cdsb;
 
    *Cdsb = cdsb;
    *Cdgb = cdgb - Covlgd;
    *Cddb = cddb + Covlgd;
 
    *Csdb = csdb;
    *Csgb = csgb - Covlgs;
    *Cssb = cssb + Covlgs;
 
    *Cggb = *Cggb + Covlgd + Covlgs + Covlgb;
    *Cgdb = *Cgdb - Covlgd;
    *Cgsb = *Cgsb - Covlgs;
 
    *Cbgb = *Cbgb - Covlgb;
 
/* compute total terminal charges */
 
    {
        double
            qgd = Covlgd * Vgd,
            qgs = Covlgs * Vgs,
            qgb = Covlgb * Vgb;
 
        *Qgate += qgd + qgs + qgb;
        *Qbulk -= qgb;
 
        *Qdrn = *Qchan * Xqc - qgd;
        *Qsrc = *Qchan * (1 - Xqc) - qgs;
    }
}                                      /* done                                */
 
 
static void Yangcap(
                struct M_ *Model,      /* (R) device model                    */
                double Vgs,            /* (R) terminal voltages               */
                double Vgd,            /* (R) terminal voltages               */
                double Vgb,            /* (R) terminal voltages               */
                double Von,            /* (R) effective threshold, sat. v's   */
                double Vdsat,          /* (R) effective threshold, sat. v's   */
                double Covlgs,         /* (R) overlap capacitances            */
                double Covlgd,         /* (R) overlap capacitances            */
                double Covlgb,         /* (R) overlap capacitances            */
                double *Qs,            /* (W) charges                         */
                double *Qd,            /* (W) charges                         */
                double *Qg,            /* (W) charges                         */
                double *Qb,            /* (W) charges                         */
                double *Cggb,          /* (W) capacitances                    */
                double *Cgdb,          /* (W) capacitances                    */
                double *Cgsb,          /* (W) capacitances                    */
                double *Cbgb,          /* (W) capacitances                    */
                double *Cbdb,          /* (W) capacitances                    */
                double *Cbsb,          /* (W) capacitances                    */
                double *Cdgb,          /* (W) capacitances                    */
                double *Cddb,          /* (W) capacitances                    */
                double *Cdsb,          /* (W) capacitances                    */
                double *Csgb,          /* (W) capacitances                    */
                double *Csdb,          /* (W) capacitances                    */
                double *Cssb)          /* (W) capacitances                    */
/*****************************************************************************
* Purpose
*   Evaluate MOS charges and their derivatives (Yang-Chatterjee model)
*
* Returned value
*   None
*
*  Discussion
*    This routine used to be named CMeyer and used to implement the
*    Meyer capacitance model.  This model did not conserve charge
*    because it was based on capacitances, not charges.  The routine
*    was re-written to implement the Yang-Chatterjee equations, as
*    described in:
*       "An Investigation of the Charge Conservation Problem for MOSFET
*       Circuit Simulation" by
*       Ping Yang, Berton D. Epler, and Pallab K. Chatterjee
*       in the IEEE Journal of Solid-State Circuits, vol. SC-18, no. 1,
*       February 1983.
*    Instead of reciprocal capacitances, this routine now returns
*    the more general, non-reciprocal charge derivatives.  These
*    have values which are close to the Meyer capacitances.  Most
*    circuits will not show any significant differences in their
*    simulations.
*
* Author
*   pwt  - 28 Aug 86 - creation
*   pwt  - 15 Sep 87 - re-written to do one set of calc's at a time
*                       and use pointers instead of copying d.p. floats
*   pwt  - 21 Dec 87 - correction for Microsoft optimization
*   whjb - 20 Jun 92 - re-written: Meyer model replaced by Yang-Chatterjee
*   whjb - 16 Jan 93 - add guard against negative sqrt for vgs > Von
*   gwb  - 20 Jun 95 - add a fix to prevent an FPE
*
*****************************************************************************/
 
{
/* Local variables */
 
    double  vbs = Vgs - Vgb,
            vds = Vgs - Vgd,
/*          ax  = (Vgs-Von)/Vdsat,
            vdsax = vds*ax, */
            vfb = (Model->M_type) * ModVbi - ModPhi,
            gammasq = ModGamma * ModGamma,
            dvondvbs = -.5 * ModGamma / sqrt(ModPhi - MIN(0., vbs));
    double  cbbs, cbgs, cbds, cbss, csbs, csgs, csds, csss,
            cdbs, cdgs, cdds, cdss, cggs, cgds, cgbs, cgss;
 
    /* Prevent Compiler Warnings */
    USEARG(Vdsat);
/*
 * First, Qb and Cbb, Cbg, Cbd
 */
    cbds = 0;
    if (Vgb <= vfb) {                  /* Accumulation region                 */
        *Qb = - Cox * (Vgb - vfb);
        cbgs = - Cox; cbbs = Cox;
    }
    else if (gammasq == 0.0) {         /* Avoid div-by-0 in Sub. and Sat.     */
        *Qb = cbgs = cbbs = 0;
    }
    else if (Vgs <= Von) {             /* Subthreshold region                 */
        double sqrtterm = sqrt(1 + 4 * (Vgb - vfb) / gammasq);
        *Qb = Cox * (gammasq / 2) * (1 - sqrtterm);
        cbgs = - Cox / sqrtterm;
        cbbs = - cbgs;
    }
    else {                             /* Saturation & linear regions         */
        double sqrtterm = 1 + 4 * (Von - vbs - vfb) / gammasq;
        if (sqrtterm < 1e-6) {         /* Guard against negative sqrt         */
            sqrtterm = 1e-3;           /*   (happens for large, pos. vbs)     */
            cbbs = 0.;
        }
        else {
            sqrtterm = sqrt(sqrtterm);
            cbbs = Cox / sqrtterm * (1 - dvondvbs);
        }
        *Qb = Cox * (gammasq / 2) * (1 - sqrtterm);
        cbgs = 0;
    }
/*
 * Next, Qs and csgs, csds & csbs as well as Qd and cdgs, cdds & cdbs
 */
    if (Vgs <= Von) {                  /* Cutoff                              */
        *Qs = csgs = csds = csbs = 0;
        *Qd = cdgs = cdds = cdbs = 0;
    }
    else if (vds > Vgs - Von) {        /* Saturation                          */
        double Cox0 = Cox / 1.5;
/*  double f = (1-ax)/(3*ax);
 
    *Qb += f*(Vgs-Von);
    cbgs+= f;
    cbbs+= -f*dvondvbs;
*/
        *Qs = - Cox0 * (Vgs - Von);
        csgs = - Cox0;
        csds = 0;
        csbs = Cox0 * dvondvbs;
        *Qd = cdgs = cdds = cdbs = 0;
    }
    else {                             /* Linear                              */
        double vtmp, bias, tmp1, dbiasdvgs, dbiasdvds, dbiasdvbs;
        double Cox0 = - Cox / 2;
 
        vtmp = 12 * (Vgs - Von - vds / 2);
        bias = vds / 2 - vds * vds / vtmp;
        tmp1 = vds * vds / (vtmp * vtmp);
        dbiasdvgs = 12 * tmp1;
        dbiasdvds =.5 - 6 * tmp1 - 2 * vds / vtmp;
        dbiasdvbs = -12 * tmp1 * dvondvbs;
 
        *Qs = Cox0 * (Vgs - Von + bias);
        csds = Cox0 * (dbiasdvds);
        csgs = Cox0 * (1 + dbiasdvgs);
        csbs = Cox0 * (- dvondvbs + dbiasdvbs);
        *Qd = Cox0 * (Vgs - Von - 3 * bias);
        cdds = Cox0 * (-3 * dbiasdvds);
        cdgs = Cox0 * (1 - 3 * dbiasdvgs);
        cdbs = Cox0 * (- dvondvbs - 3 * dbiasdvbs);
    }
/*  *Qb = cbgs = cbbs = 0; */
/*  *Qs = csgs = csds = csbs = 0; */
/*  *Qd = cdgs = cdds = cdbs = 0; */
    *Qb -= Covlgb * Vgb;
    *Qs -= Covlgs * Vgs;
    *Qd -= Covlgd * Vgd;
 
    *Qg = - (*Qs + *Qd + *Qb);
    cdss = - (cdds + cdgs + cdbs);
    csss = - (csds + csgs + csbs);
    cbss = - (cbds + cbgs + cbbs);
/*
 * Calculate the gate capacitances and add in overlap capacitances
 */
    *Cdsb = cdss;
    *Cdgb = cdgs - Covlgd;
    *Cddb = cdds + Covlgd;
 
    *Csdb = csds;
    *Csgb = csgs - Covlgs;
    *Cssb = csss + Covlgs;
 
    cggs = - (csgs + cdgs + cbgs);
    cgds = - (csds + cdds + cbds);
    cgbs = - (csbs + cdbs + cbbs);
    cgss = - (cgds + cggs + cgbs);
    *Cggb = cggs + Covlgd + Covlgs + Covlgb;
    *Cgdb = cgds - Covlgd;
    *Cgsb = cgss - Covlgs;
 
    *Cbgb = cbgs - Covlgb;
    *Cbdb = cbds;
    *Cbsb = cbss;
 
}                                      /* done                                */
 
void Mqspof(
         struct M_ *Model,             /* (R) pointer to model parameters     */
         double Vds,                   /* (R) terminal voltages               */
         double Vbs,                   /* (R) terminal voltages               */
         double Vgs,                   /* (R) terminal voltages               */
         double Vpof,                  /* (R) eff. characteristic voltages    */
         double Von,                   /* (R) eff. characteristic voltages    */
         double Vdsat,                 /* (R) eff. characteristic voltages    */
         double Vdsat1,                /* (R) eff. characteristic voltages    */
         double *Cggb,                 /* (W) capacitances                    */
         double *Cgdb,                 /* (W) capacitances                    */
         double *Cgsb,                 /* (W) capacitances                    */
         double *Cbgb,                 /* (W) capacitances                    */
         double *Cbdb,                 /* (W) capacitances                    */
         double *Cbsb,                 /* (W) capacitances                    */
         double *Qgate,                /* (W) charges                         */
         double *Qchan,                /* (W) charges                         */
         double *Qbulk)                /* (W) charges                         */
/*****************************************************************************
* Purpose
*   Calculate "on" capacitances and charges for MOS level 2
*
* Returned value
*   None
*
* Author
*   pwt  - 29 Aug 86 - creation
*   pwt  - 10 Oct 87 - re-work as part of BSIM addition
*
*****************************************************************************/
 
{
/* Local variables */
 
/*  double qcpof,*/
    double  qgate1, qcpof1, qbulk1, cggb1, cgdb1, cgsb1, cbgb1, cbdb1, cbsb1,
            qgate2, qcpof2, qbulk2, cggb2, cgdb2, cgsb2, cbgb2, cbdb2, cbsb2;
 
/*  Vdsat1 = MAX(Vds,Vdsat1)+1E-3;
 */
 
    USEARG(Von);
 
    switch (ModLevel) {
    case 2 :
        MOS2cap(Model, Vds, Vbs, Vgs, Vdsat, Cggb, Cgdb, Cgsb, Cbgb, Cbdb,
            Cbsb, Qgate, Qchan, Qbulk);
        if (Vds > Vdsat) return;
        MOS2cap(Model, Vds, Vbs, Vpof, Vdsat1, &cggb1, &cgdb1, &cgsb1, &cbgb1,
            &cbdb1, &cbsb1, &qgate1, &qcpof1, &qbulk1);
        MOS2cap(Model, Vdsat, Vbs, Vgs, Vdsat, &cggb2, &cgdb2, &cgsb2, &cbgb2,
            &cbdb2, &cbsb2, &qgate2, &qcpof2, &qbulk2);
        break;
    default :
        return;
    }
 
/* tangential limiting of qs */
 
    if (Vgs > Vpof ||
            Vds < Vdsat) {
        double qd,
            csgb1 = - (1 - ModXqc) * (cggb1 + cbgb1),
            qs = csgb1 * (Vgs - Vpof) + (1 - ModXqc) * qcpof1,
            qspof2 = (1 - ModXqc) * qcpof2;
 
        if (fabs(qs) < fabs(qspof2)) qs = qspof2;
 
        if (fabs(qs) <.5 * fabs(*Qchan)) {
            Xqc =.5;
            return;
        }
 
/*  csdb = -.25*(cgdb+cbdb);
 *  qs   = qs + csdb*(Vdsat-Vds);
 *  Xqc  = MIN(.5,(*Qchan-qs)/(*Qchan));
 */
        qd = *Qchan - qs;
        Xqc = qd / (*Qchan);
 
/* insure that Xqc = .5 @ Vds = 0 */
 
        if (Vds < Vdsat) Xqc = Xqc + ((Vdsat - Vds) / Vdsat) * (.5 - Xqc);
 
/* constant limiting of qs */
 
/*  qdpof = qcpof*ModXqc;
 *  qspof = qcpof - qdpof;
 *
 *  if ( fabs(qspof) > .5*fabs(*Qchan) ) {
 *    qd  = *Qchan - qspof;
 *    qs  = qspof;
 *    Xqc = qd/(*Qchan);
 *    }
 *  else Xqc = .5;
 */
    }
    else Xqc = ModXqc;
 
}                                      /* done                                */
 
