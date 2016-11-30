/* mos6.c
 *   $Revision:   1.20  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:51:20  $ */
 
#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"
 
/* p.bendix:  add vtm variable for BSIM3.  this needs to be global
 * since it is defined in MODCHK */
/* gwb:  vtm is used for temperature updating.  data cannot be
 * passed between MODCHK and MOS6eval in this manner.
 * temperature updating has not yet been tested. */
 
/*extern double vtm;	not needed anymore - computed locally now*/
 
#define PARAM(a)        ((double)Model->a)
#define AT              PARAM(BSIM3_AT)
#define A0              PARAM(BSIM3_A0)
#define A1              PARAM(BSIM3_A1)
#define A2              PARAM(BSIM3_A2)
#define BULKMOD         NINT(PARAM(BSIM3_BULKMOD))	     /* version 2.0 */
#define CDSC            PARAM(BSIM3_CDSC)
#define CDSCB           PARAM(BSIM3_CDSCB)		     /* version 2.0 */
#define CIT             PARAM(BSIM3_CIT)		     /* version 2.0 */
#define DROUT           PARAM(BSIM3_DROUT)
#define DSUB            PARAM(BSIM3_DSUB)		     /* version 2.0 */
#define DVT0            PARAM(BSIM3_DVT0)
#define DVT1            PARAM(BSIM3_DVT1)
#define DVT2            PARAM(BSIM3_DVT2)		     /* version 2.0 */
#define EM              PARAM(BSIM3_EM)
#define ETA             PARAM(M_eta)
#define ETA0            PARAM(BSIM3_ETA0)		     /* version 2.0 */
#define ETAB            PARAM(BSIM3_ETAB)		     /* version 2.0 */
#define GAMMA1          PARAM(BSIM3_GAMMA1)
#define GAMMA2          PARAM(BSIM3_GAMMA2)
#define K1              PARAM(BSIM_K10)
#define K2              PARAM(BSIM_K20)
#define K3              PARAM(BSIM3_K3)
#define K3B             PARAM(BSIM3_K3B)		     /* version 2.0 */
#define KETA            PARAM(BSIM3_KETA)		     /* version 2.0 */
#define KT1             PARAM(BSIM3_KT1)
#define KT1L            PARAM(BSIM3_KT1L)		     /* version 2.0 */
#define KT2             PARAM(BSIM3_KT2)
#define LDD             PARAM(BSIM3_LDD)
#define LITL            PARAM(BSIM3_LITL)
#define NFACTOR         PARAM(BSIM3_NFACTOR)
#define NGATE           PARAM(BSIM3_NGATE)		     /* version 2.0 */
#define NLX             PARAM(BSIM3_NLX)
#define NPEAK           PARAM(BSIM3_NPEAK)
#define PCLM            PARAM(BSIM3_PCLM)
#define PDIBL1          PARAM(BSIM3_PDIBL1)
#define PDIBL2          PARAM(BSIM3_PDIBL2)
#define PHI             PARAM(M_phi)
#define PSCBE1          PARAM(BSIM3_PSCBE1)
#define PSCBE2          PARAM(BSIM3_PSCBE2)
#define PVAG            PARAM(BSIM3_PVAG)		     /* version 2.0 */
#define RDS0            PARAM(BSIM3_RDS0)
#define RDSW            PARAM(BSIM3_RDSW)
#define SATMOD          NINT(PARAM(BSIM3_SATMOD))
#define SUBTHMOD        NINT(PARAM(BSIM3_SUBTHMOD))
#define BSIM3tnom       PARAM(BSIM3_TNOM)		     /* version 2.0 */
#define TOX             PARAM(M_tox)
#define TYPE            (Model->M_type)
#define U0              PARAM(BSIM_ugs0)
#define U0TEMP          PARAM(BSIM3_U0TEMP)
#define UA              PARAM(BSIM3_UA)
#define UA1             PARAM(BSIM3_UA1)
#define UB              PARAM(BSIM3_UB)
#define UB1             PARAM(BSIM3_UB1)
#define UC              PARAM(BSIM3_UC)
#define UC1             PARAM(BSIM3_UC1)		     /* version 2.0 */
#define UTE             PARAM(BSIM3_UTE)		     /* version 2.0 */
#define VBI             PARAM(BSIM3_VBI)
#define VBM             PARAM(BSIM3_VBM)
#define VBX             PARAM(BSIM3_VBX)
#define VFB             PARAM(BSIM_vfb0)
#define VGHIGH          PARAM(BSIM3_VGHIGH)
#define VGLOW           PARAM(BSIM3_VGLOW)
#define VOFF            PARAM(BSIM3_VOFF)
#define VSAT            PARAM(BSIM3_VSAT)
#define VSATTEMP        PARAM(BSIM3_VSATTEMP)
#define VTH0            PARAM(BSIM3_VTH0)
#define W0              PARAM(BSIM3_W0)
#define XJ              PARAM(M_xj)
#define XT              PARAM(BSIM3_XT)
#define XPART           PARAM(BSIM_xpart)

/* disable global subexpression elimination */
#pragma optimize( "g", off)
 
void MOS6eval(
         struct M_ *Model,             /* (R) pointer to model parameters     */
         double Len,                   /* (R) device size                     */
         double Wid,                   /* (R) device size                     */
         double Mdev,                  /* (R) device size                     */
         double Vgs,                   /* (R) terminal voltages               */
         double Vds,                   /* (R) terminal voltages               */
         double Vbs,                   /* (R) terminal voltages               */
         double *Von,                  /* (W) characteristic voltages         */
         double *Vdsat,                /* (W) characteristic voltages         */
         double *Id,                   /* (W) drain current                   */
         double *Gds,                  /* (W) device conductances             */
         double *Gm,                   /* (W) device conductances             */
         double *Gmbs,                 /* (W) device conductances             */
         int Charge,                   /* (R) YES: do charge calculations     */
         double *Cggb,                 /* (W) capacitances                    */
         double *Cgdb,                 /* (W) capacitances                    */
         double *Cgsb,                 /* (W) capacitances                    */
         double *Cdgb,                 /* (W) capacitances                    */
         double *Cddb,                 /* (W) capacitances                    */
         double *Cdsb,                 /* (W) capacitances                    */
         double *Cbgb,                 /* (W) capacitances                    */
         double *Cbdb,                 /* (W) capacitances                    */
         double *Cbsb,                 /* (W) capacitances                    */
         double *Qg,                   /* (W) charges                         */
         double *Qd,                   /* (W) charges                         */
         double *Qb,                   /* (W) charges                         */
         double *NoiseBeta,            /* (W) noise beta                      */
         double Tmod)                  /* (R) temperature                     */
/*****************************************************************************
* Purpose
*   Evaluate MOS level 6 (BSIM3: Berkeley Short-Channel IGFET Model) model
*
* Returned value
*   Number of convergence checks which failed
*
*  Discussion
*   LdFrc controls whether this routine does a full or a partial load.
*   For LdFrc==YES MatPrm is zeroed and then all devices put in their
*   contributions.  For LdFrc==NO, the matrix is not zeroed and only
*   those devices which need to (which have changed) overwrite their
*   matrix terms.  In both cases, at the end of this routine MatPrm
*   is copied into MatWrk and all MatPrm's overflow terms are added
*   into the correct positions of MatWrk.  MatWrk is then ready for
*   the matrix solving routines.
*
* Author
*   gwb - 03 Feb 94 - created (based on BSIM3 Version 1.0, Level=5)
*   dec - 02 May 95 - compute Vt locally instead of relying on global vtm
*   gwb - 23 May 95 - use safe SQRT instead of sqrt to prevent FPE.
*   gwb - 18 Sep 95 - disable global subexpression elimination for Windows
*   gwb - 11 Jun 96 - add limiting to fix an FPE
*   gwb - 15 Aug 96 - additions for new mosfet noise model
*   dec - 14 Nov 96 - temperature now passed in as function argument
*   dec - 14 Feb 97 - use PSpice constants instead of SPICE3 #defines for
*                     EPSSI, Charge_q
*   gwb - 01 Apr 97 - add limiting to fix an FPE
*   gwb - 13 Jun 97 - change limiting introduced above.
*   gwb - 13 Jun 97 - change TempRatio definition (necessary because of
*                     addition of BSIM3 version 3.0 (Level=7).
*
*****************************************************************************/
 
{
 
/* Local variables */
 
#define MIN_EXP 1.713908431e-15
#define EXP_THRESHOLD 34.0
 
    double  qgate, qbulk, qdrn;
    double  Vgs_eff, dVgs_eff_dVg, Vfb, dVfb_dVb;
    double  Phis, dPhis_dVb, T1s, dT1s_dVb, Inv_T1s, Vth, dVth_dVb;
    double  Vgst, Vgsaddvth, n, dn_dVb, Vt;
    double  ExpArg, ExpArg1, Ids1, Ids2, Gds1, Gds2, Gm1, Gm2, Gmb1, Gmb2;
    double  Denomi, dDenomi_dVg, dDenomi_dVb;
    double  ueff, dueff_dVg, dueff_dVb, Esat, dEsat_dVg, dEsat_dVb, Vdsat0;
    double  Esatlength, Vdseff, Ilimit, Iexp, dIexp_dVg, dIexp_dVb;
    double  dVdsat_dVg, dVdsat_dVb, Vasat, dAlphaz_dVg, dAlphaz_dVb;
    double  dVasat_dVg, dVasat_dVb, Va, Va2, dVa_dVd, dVa_dVg, dVa_dVb, Vbseff;
    double  dVbseff_dVb, Arg1, One_Third_CoxWL, Two_Third_CoxWL, Alphaz, CoxWL;
    double  I0, T0, dT0_dVb, T1, dT1_dVb, T2, T3, dT3_dVd, dT3_dVg;
    double  dT3_dVb, T4, T5;
    double  T6, T7, T8, T9;
    double  T10, dT10_dVg, dT10_dVb, T11, dT11_dVg, dT11_dVd, dT11_dVb, T12;
    double  tmp, Abulk, dAbulk_dVb;
    double  t, Vp, Ip, Vglow, Vghigh;
    double  T100, T101, T103;
    double  T104, dT104_dVg, dT104_dVb;
    double  T105, dT105_dVg, dT105_dVd, dT105_dVb;
    double  T106, dT106_dVg, dT106_dVd, dT106_dVb;
    double  T201, dT201_dVg, dT201_dVb;
    double  VACLM, VACLM2, dVACLM_dVg, dVACLM_dVd, dVACLM_dVb;
    double  VADIBL, VADIBL2, dVADIBL_dVg, dVADIBL_dVb;
    double  VAHCE, VAHCE2, dVAHCE_dVg, dVAHCE_dVd, dVAHCE_dVb;
    double  Idsat, Gmsat, Gmbsat;
    double  Xdep, dXdep_dVb, lt0, lt00, dlt0_dVb, Delt_vth, dDelt_vth_dVb;
    double  Theta0, dTheta0_dVb;
    double  Thetarout, TempRatio, tmp1, tmp2, tmp3, tmp4;
    double  DIBL_Coe_Sub, DIBL_Sft, Pmos_factor;
    double  Rout_Vgs_factor, dRout_Vgs_factor_dVg, dRout_Vgs_factor_dVb;
    double  uaOvTox, ubOvTox2, uvds, sqrtphi, phis3;
    double  cdep0, Xdep0, beta, wvcox, rds, wvcoxrds;
    double  thetaRout, theta0vb0, Thetavth;
    double  xvtm, xtemp, eg, ni, ratio, t0, t1, t2;
 
    int     ChargeComputationNeeded, SubthNeeded, TranReg, NgateUsed;
 
    /* add variables for temperature sensitive parameters */
    double  T_U0TEMP, T_VSATTEMP, T_PHI, T_VBX, T_K1, T_K2;
    double  T_VTH0, T_VFB, T_VBI;
 
    double  cox = 3.453e-11 / (TOX);   /* tox in meters, cox in F/m^2         */
    double  vt;
 
    xtemp = Tmod;
    vt = Tmod * BOLTZ / CHARGE;
    TempRatio = Tmod / BSIM3tnom;
    ratio = xtemp / 300.15;
 
/***************************** temperature effects **************************/
/* mos6count keeps track of whether we are doing the first pass through this
 * model or not; mos6count = 0 means first pass; mos6count = 1 means not
 * first pass.  This is needed for handling variables like U0TEMP which
 * should not get updated by temperature unless they were not input to the
 * model. */
 
    /* initialize the temperature dependent parameters */
    T_U0TEMP = U0TEMP;
    T_VSATTEMP = VSATTEMP;
    T_PHI = PHI;
    T_VBX = VBX;
    T_K1 = K1;
    T_K2 = K2;
    T_VTH0 = VTH0;
    T_VFB = VFB;
    T_VBI = VBI;
 
    uaOvTox = (UA + UA1 * (TempRatio - 1.0)) / TOX;
    ubOvTox2 = (UB + UB1 * (TempRatio - 1.0)) / (TOX * TOX);
    xvtm = BOLTZ / CHARGE * xtemp;
    eg = EGFET(xtemp);
    ni = 1.45e10 * ratio * sqrt(ratio) * EXP(21.5565981 -
        eg / (2.0 * xvtm));
 
    if (U0TEMP == OMIT)
        T_U0TEMP = U0 * pow(TempRatio, UTE);
 
    if (VSATTEMP == OMIT)
        T_VSATTEMP = VSAT - AT * (TempRatio - 1.0);
 
    if (NPEAK == OMIT && GAMMA1 != OMIT) {
        /* p.bendix:  Be careful here.
         * Do we really want to reset npeak? */
        t0 = GAMMA1 * GAMMA1 * cox * cox;
        Model->BSIM3_NPEAK = (MDLPARM) (3.021e22 * t0);
    }
 
    if (PHI == OMIT)
        T_PHI = 2.0 * xvtm * LOG(NPEAK / ni);
    sqrtphi = sqrt(T_PHI);
    phis3 = sqrtphi * T_PHI;
 
    if (T_K1 != OMIT || T_K2 != OMIT) {
        /* Spice3 has this as part of "MODCHK" */
        if (T_K1 == OMIT)
            T_K1 = 0.53;
        if (T_K2 == OMIT)
            T_K2 = -0.0186;
    }
    else {
        if (VBX == OMIT) {
            t1 = XT * XT;
            T_VBX = T_PHI - 7.7348e-4 * NPEAK * t1;
        }
 
        if (T_VBX > 0.0)
            T_VBX = - T_VBX;
        if (VBM > 0.0)
            Model->BSIM3_VBM = - Model->BSIM3_VBM;
 
        t0 = GAMMA1 - GAMMA2;
        t1 = sqrt(- T_VBX + T_PHI) - sqrtphi;
        t2 = sqrt(T_PHI * (- VBM + T_PHI)) - T_PHI;
        T_K2 = t0 * t1 / (2.0 * t2 + VBM);
        T_K1 = GAMMA2 - 2.0 * T_K2 * sqrt(- VBM + T_PHI);
    }
 
    if (VTH0 == OMIT)
        /* p.bendix:  this looks wrong;
         *  should also add -xk2 * xphi */
        T_VTH0 = TYPE * (T_VFB + T_PHI + T_K1 * sqrtphi);
    else
        T_VFB = TYPE * T_VTH0 - T_PHI - T_K1 * sqrtphi;
 
    if (VBI == OMIT)
        T_VBI = xvtm * LOG(1.0e22 * NPEAK / (ni * ni));
 
/************************** end temperature effects *************************/
 
    cdep0 = sqrt(1.602e-19 * 1.03594e-4 * NPEAK / 2.0 / T_PHI);
    Xdep0 = 35.960 * sqrtphi / sqrt(NPEAK);
    beta = T_U0TEMP * cox * Wid / Len;

    *NoiseBeta = beta;

    wvcox = 2.0 * Wid * T_VSATTEMP * cox;
    rds = RDSW / Wid / 1.0e6 + RDS0;
    if (rds < 0.0)
        rds = 0.0;
    wvcoxrds = wvcox * rds;
    uvds = 1.0 + ETA * LDD / LITL;
 
    t1 = sqrt(3.0 * TOX * Xdep0);
    t0 = EXP(-0.5 * DSUB * Len / t1);
    theta0vb0 = (t0 + 2.0 * t0 * t0);
 
    t0 = EXP(-0.5 * DROUT * Len / t1);
    t2 = (t0 + 2.0 * t0 * t0);
    thetaRout = PDIBL1 * t2 + PDIBL2;
 
 
    /* Calculate drain current and its
     * derivatives and charge and capacitances related to gate
     * drain, and bulk
     */
 
    /* p.bendix:  pspice uses Charge, not ChargeComputationNeeded */
    ChargeComputationNeeded = Charge;
 
    if (Vbs == 0.0) {
        Phis = T_PHI;
        dPhis_dVb = -1.0;
        T1s = sqrtphi;
        Inv_T1s = 1.0 / T1s;
        dT1s_dVb = -0.5 * Inv_T1s;
        Xdep = Xdep0;
        T2 = sqrt(Xdep0);
    }
    else if (Vbs < 0.0) {
        Phis = T_PHI - Vbs;
        dPhis_dVb = -1.0;
        T1s = sqrt(Phis);
        Inv_T1s = 1.0 / T1s;
        dT1s_dVb = -0.5 * Inv_T1s;
        Xdep = Xdep0 * T1s / sqrtphi;
        T2 = sqrt(Xdep);
    }
    else {
        T0 = T_PHI / (T_PHI + Vbs);
        Phis = T_PHI * T0;
        dPhis_dVb = - T0 * T0;
        T1s = phis3 / (T_PHI + 0.5 * Vbs);
        Inv_T1s = 1.0 / T1s;
        dT1s_dVb = -0.5 * T1s * T1s / phis3;
        Xdep = Xdep0 * T1s / sqrtphi;
        T2 = sqrt(Xdep);
    }
 
    dXdep_dVb = (Xdep0 / sqrtphi) * dT1s_dVb;
    T1 = sqrt(3.0 * TOX);
    tmp1 = NLX * sqrtphi / (Len * T1s);
    T100 = sqrt(1.0 + tmp1);
    T101 = 1.0 + DVT2 * Vbs;
    T101 = MAX(T101, 1.0e-12);

    lt0 = T1 * T2 * T101;
    lt00 = T1 * sqrt(Xdep0);           /* added in version 2.0 but not used   */
    dlt0_dVb = T1 * (0.5 / T2 * T101 * dXdep_dVb + T2 * DVT2);
 
    tmp = -0.5 * DVT1 * Len / lt0;
    if (tmp > - EXP_THRESHOLD) {
        T0 = EXP(tmp);
        dT0_dVb = - tmp / lt0 * T0 * dlt0_dVb;
    }
    else {
        T0 = MIN_EXP;
        dT0_dVb = 0.0;
    }
 
    Theta0 = T0 * (1.0 + 2.0 * T0);
    dTheta0_dVb = (1.0 + 4.0 * T0) * dT0_dVb;
 
    /* The following line is Berkeley code needed for NOISE */
    /* here->BSIM3Thetavth = model->BSIM3dvt0 * Theta0; */
    Thetavth = DVT0 * Theta0;
    tmp = T_VBI - T_PHI;
    Delt_vth = Thetavth * tmp;
    dDelt_vth_dVb = DVT0 * dTheta0_dVb * tmp;
 
    /* TempRatio =  ckt->CKTtemp / model->BSIM3tnom - 1.0; */
    /* Changed from Spice3 */
 
    T1 = T_K1 * (T100 - 1.0) * sqrtphi
        + (KT1 + KT2 * Vbs + KT1L / Len) * (TempRatio - 1.0);
    tmp2 = TOX / ((Wid / Mdev) + W0) * T_PHI;
    Vth = TYPE * T_VTH0 + T_K1 * (T1s - sqrtphi) - T_K2 * Vbs
        - Delt_vth + (K3 + K3B * Vbs) * tmp2 + T1;
 
    /* The following line is Berkeley code needed for NOISE */
    /* here->BSIM3vthreshold = Vth; */
 
    dVth_dVb = T_K1 * dT1s_dVb - T_K2
        - dDelt_vth_dVb
        - 0.5 * T_K1 * tmp1 * sqrtphi / (T100 * T1s) * dT1s_dVb
        + K3B * tmp2 + KT2 * (TempRatio - 1.0);
 
    /* Poly Gate Si Depletion Effect */
    T0 = T_VFB + T_PHI;
    if ((NGATE > 0.0) && (Vgs > T0)) {
        T1 = 1.0e6 * CHARGE * EPSSIL * NGATE / (cox * cox);
        T4 = sqrt(1.0 + 2.0 * (Vgs - T0) / T1);
        T2 = T1 * (T4 - 1.0);
        T3 = 0.5 * T2 * T2 / T1;
        if (T3 < 1.12) {
            Vgs_eff = T0 + T2;
            dVgs_eff_dVg = 1.0 / T4;
        }
        else {
            Vgs_eff = Vgs - 1.12;
            dVgs_eff_dVg = 1.0;
        }
        NgateUsed = 1;
    }
    else {
        Vgs_eff = Vgs;
        dVgs_eff_dVg = 1.0;
        NgateUsed = 0;
    }
 
    Vgst = Vgs_eff - Vth;
 
    T1 = 2.0 * sqrt(XJ * Xdep);
    dT1_dVb = 0.5 * T1 * dXdep_dVb / Xdep;
    tmp2 = Len + T1;
 
    T0 = 1.0 + KETA * Vbs;
    if (BULKMOD == 1) {
        Abulk = (1.0 + T_K1 * A0 * Len / (tmp2 * T1s * 2.0)) / T0;
        dAbulk_dVb = (1.0 / T0 - Abulk) * (dT1_dVb / tmp2 + dT1s_dVb / T1s)
            - Abulk / T0 * KETA;
    }
    else {
        Abulk = T_K1 * A0 * Len / (tmp2 * sqrtphi * 2.0 * T0);
        dAbulk_dVb = - Abulk * (dT1_dVb / tmp2 + KETA / T0);
    }
 
    DIBL_Coe_Sub = (ETA0 + ETAB * Vbs) * theta0vb0;
    DIBL_Sft = DIBL_Coe_Sub * Vds;
 
    switch (SUBTHMOD) {
    case 0 :
        SubthNeeded = TranReg = 0;
        break;
    case 2 :
    case 3 :
        Vglow = VGLOW - DIBL_Sft;
        Vghigh = VGHIGH + DIBL_Sft;
        if (Vgst < Vghigh) {
            SubthNeeded = 1;
            if (Vgst > Vglow) {
                TranReg = 1;
                Vgst = Vglow;
            }
            else {
                TranReg = 0;
            }
        }
        else {
            SubthNeeded = TranReg = 0;
        }
        break;
    default :
        SubthNeeded = 1;
        TranReg = 0;
        break;
    }
 
    *Vdsat = 0.0;
    dVdsat_dVg = 0.0;
    dVdsat_dVb = 0.0;
 
    if (SubthNeeded) {
 
        tmp2 = NFACTOR * 1.0359e-10 / Xdep;
        tmp3 = CDSC + CDSCB * Vbs;
        n = 1.0 + (tmp2 + tmp3 * Theta0 + CIT) / cox;
        dn_dVb = (- tmp2 / Xdep * dXdep_dVb + tmp3 * dTheta0_dVb
                + CDSCB * Theta0) / cox;
 
        /* Vt = vtm;	not needed - computed locally now */
        Vt = 8.625e-5 * (ModTempGetTnom_C ((struct Gen_ *)Model, TNOM) + CTOK);
        T10 = 1.0 / (n * Vt);
        ExpArg = (Vgst - VOFF + DIBL_Sft) * T10;
 
        if (ExpArg > - EXP_THRESHOLD) {
            ExpArg1 = Vds / Vt;
            if (ExpArg1 < EXP_THRESHOLD) {
                T2 = T6 = EXP(- ExpArg1);
            }
            else {
                T6 = MIN_EXP;
                T2 = 0.0;
            }
 
            I0 = T_U0TEMP * Wid / Len * cdep0 * Vt * Vt;
 
            if (SUBTHMOD > 1) {
                T1 = I0 * EXP(ExpArg);
                Ids1 = T1 * (1.0 - T6);
                Gm1 = Ids1 * T10;
                Gds1 = T1 * T2 / Vt + Gm1 * DIBL_Coe_Sub;
                Gmb1 = - Gm1 * dVth_dVb - Ids1 * (ExpArg * dn_dVb / n
                        - Vds * ETAB * theta0vb0 * T10);
            }                        /* SUBTHMOD >1                         */
            else {
                tmp2 = EXP(DIBL_Sft * T10);
                Ilimit = 4.5 * I0 * tmp2;
                tmp3 = Vds * ETAB * theta0vb0;
                if (ExpArg < EXP_THRESHOLD) {
                    Iexp = I0 * EXP(ExpArg);
                    T9 = 1.0 / (Ilimit + Iexp);
                    T7 = Ilimit * T9;
                    T9 *= Iexp;
                    T9 *= T9 * T6 * Ilimit;
 
                    T5 = T7 * Iexp;
                    T8 = T7 * T7 * (1.0 - T6);
 
                    dIexp_dVg = Iexp * T10;
                    dIexp_dVb = - dIexp_dVg * dVth_dVb
                        - Iexp * ExpArg / n * dn_dVb
                        + Iexp * Vds * ETAB * theta0vb0;
 
                    Ids1 = T5 * (1.0 - T6);
                    Gm1 = T8 * dIexp_dVg;
                    Gds1 = T5 * T2 / Vt
                        + DIBL_Coe_Sub * (T9 * T10 + Gm1);
                    Gmb1 = T8 * dIexp_dVb
                        + T9 * T10 * (tmp3 - DIBL_Sft * dn_dVb / n);
                }
                else {
                    Ids1 = Ilimit * (1.0 - T6);
                    Gds1 = Ilimit * T2 / Vt + Ids1 * T10 * DIBL_Coe_Sub;
                    Gm1 = 0.0;
                    Gmb1 = Ids1 * T10 * (tmp3 - DIBL_Sft / n * dn_dVb);
                }
            }                        /* SUBTHMOD <=1                        */
        }                            /* ExpArg > - EXP_THRESHOLD            */
        else {
            Ids1 = Gm1 = Gds1 = Gmb1 = 0.0;
        }                            /* ExpArg <= - EXP_THRESHOLD)          */
 
        if (TranReg)
            Vgst = Vghigh;
 
    }                                /* SubthNeeded                         */
    else {
        Ids1 = Gm1 = Gds1 = Gmb1 = 0.0;
    }                                /* No SubthNeeded                      */
 
    if (Vgst > 0.0) {
 
        Vgsaddvth = Vgst + Vth + Vth;
        tmp1 = UC + UC1 * (TempRatio - 1.0);
        Denomi = 1.0 + tmp1 * Vbs
            + Vgsaddvth * (uaOvTox + Vgsaddvth * ubOvTox2);
        dDenomi_dVg = uaOvTox + 2.0 * ubOvTox2 * Vgsaddvth;
        dDenomi_dVb = dDenomi_dVg * dVth_dVb + tmp1;
 
        ueff = T_U0TEMP / Denomi;
        /* here->BSIM3ueff = ueff; */
        T0 = - ueff / Denomi;
        dueff_dVg = T0 * dDenomi_dVg;
        dueff_dVb = T0 * dDenomi_dVb;
 
        Esat = 2.0 * T_VSATTEMP / ueff;
        T0 = - Esat / ueff;
        dEsat_dVg = T0 * dueff_dVg;
        dEsat_dVb = T0 * dueff_dVb;
 
        Esatlength = Esat * Len;
        T1 = 1.0 / (Abulk * Esatlength + Vgst);
        Vdsat0 = Esatlength * Vgst * T1;
 
        Pmos_factor = A1 * Vgst + A2;
        if (Pmos_factor > 1.0)
            Pmos_factor = 1.0;
 
        if (rds == 0 && Pmos_factor == 1.0) {
            *Vdsat = Vdsat0;
            if (! TranReg || (Vds > *Vdsat)) {
                T2 = Esatlength * Esatlength;
                T3 = Len * Vgst * Vgst;
                T4 = T1 * T1;
                dVdsat_dVg = (T2 * Abulk + T3 * dEsat_dVg) * T4;
                dVdsat_dVb = (T3 * dEsat_dVb - T2 * Abulk * dVth_dVb) * T4
                    - (*Vdsat) * T1 * Esatlength * dAbulk_dVb;
            }
        }
        else {
            T104 = Abulk * (0.5 * Abulk * wvcoxrds - 1.0 + 1.0 / Pmos_factor);
            T105 = - (Vgst * (2.0 / Pmos_factor - 1.0)
                    + Abulk * Esatlength + 1.5 * Abulk * Vgst * wvcox * rds);
            T106 = Vgst * (Esatlength + Vgst * wvcoxrds);
            T201 = MAX(SQRT(T105 * T105 - 4.0 * T104 * T106), 1.0e-15);
            *Vdsat = -0.5 * (T105 + T201) / T104;
 
            if (! TranReg || (Vds > *Vdsat)) {
                tmp1 = A1 / (Pmos_factor * Pmos_factor);
                tmp2 = Abulk * wvcoxrds;
                tmp3 = 2.0 / Pmos_factor - 1.0;
                dT104_dVg = - Abulk * tmp1;
                dT104_dVb = dAbulk_dVb * (tmp2 - 1.0 + 1.0 / Pmos_factor)
                    + Abulk * tmp1 * dVth_dVb;
 
                dT105_dVg = (- (tmp3 + Abulk * dEsat_dVg * Len + 1.5 * tmp2)
                        + Vgst * 2.0 * tmp1);
                tmp4 = wvcoxrds * Vgst;
                dT105_dVb = - (- dVth_dVb * tmp3 + Abulk * dEsat_dVb * Len
                        + Esatlength * dAbulk_dVb - 1.5 * (tmp2 * dVth_dVb
                            - tmp4 * dAbulk_dVb))
                    - Vgst * 2.0 * tmp1 * dVth_dVb;
 
                dT106_dVg = (Esatlength + 2.0 * tmp4)
                    + Vgst * dEsat_dVg * Len;
                dT106_dVb = - Esatlength * dVth_dVb
                    + Vgst * dEsat_dVb * Len - 2.0 * tmp4 * dVth_dVb;
 
                dT201_dVg = (T105 * dT105_dVg - 2.0 * (T104 * dT106_dVg
                            + dT104_dVg * T106)) / T201;
                dT201_dVb = (T105 * dT105_dVb - 2.0 * (T104 * dT106_dVb
                            + dT104_dVb * T106)) / T201;
 
                tmp4 = 0.5 * (T105 + T201) / (T104 * T104);
                dVdsat_dVg = -0.5 * (dT105_dVg + dT201_dVg) / T104
                    + tmp4 * dT104_dVg;
                dVdsat_dVb = -0.5 * (dT105_dVb + dT201_dVb) / T104
                    + tmp4 * dT104_dVb;
            }
        }
 
        if (Vds <= *Vdsat) {
            T2 = 1.0 / (Esatlength + Vds);
            T0 = (Vgst - 0.5 * Abulk * Vds) * T2;
            T3 = wvcox * T0;
            dT3_dVd = - wvcox * (0.5 * Abulk + T0) * T2;
            T0 = T3 * Len;
            dT3_dVg = T2 * (wvcox - T0 * dEsat_dVg);
 
            dT3_dVb = - T2 * (wvcox * (dVth_dVb + 0.5 * Vds * dAbulk_dVb)
                    + T0 * dEsat_dVb);
 
            T4 = 1.0 / (1.0 + rds * T3);
            T0 = T3 * T4;
            tmp1 = Vds * T4 * (1.0 - T0 * rds);
            Ids2 = Vds * T0;
            Gds2 = tmp1 * dT3_dVd + T0;
            Gm2 = tmp1 * dT3_dVg;
            Gmb2 = tmp1 * dT3_dVb;
        }                            /* Vds <= *Vdsat                       */
        else {
            /* Vds > *Vdsat */
            tmp1 = PVAG / Esatlength;
            Rout_Vgs_factor = 1.0 + tmp1 * Vgst;
            tmp2 = (1.0 - Rout_Vgs_factor) / Esat;
            dRout_Vgs_factor_dVg = tmp1 + tmp2 * dEsat_dVg;
            dRout_Vgs_factor_dVb = - tmp1 * dVth_dVb + tmp2 * dEsat_dVb;
 
            T10 = Esatlength + (*Vdsat)
                + wvcoxrds * (Vgst - 0.5 * Abulk * (*Vdsat));
            dT10_dVg = Len * dEsat_dVg + dVdsat_dVg
                + wvcoxrds * (1.0 - 0.5 * Abulk * dVdsat_dVg);
            dT10_dVb = Len * dEsat_dVb + dVdsat_dVb
                - wvcoxrds * (dVth_dVb + 0.5 * Abulk * dVdsat_dVb
                    + 0.5 * (*Vdsat) * dAbulk_dVb);
 
            T11 = 2.0 / Pmos_factor - 1.0 + 0.5 * Abulk
                * wvcoxrds;
            dT11_dVg = -2.0 / (Pmos_factor * Pmos_factor) * A1;
            dT11_dVb = - dT11_dVg * dVth_dVb + wvcoxrds * 0.5 * dAbulk_dVb;
 
            Vasat = T10 / T11;
            T12 = T11 * T11;
            dVasat_dVg = (dT10_dVg * T11 - T10 * dT11_dVg) / T12;
            dVasat_dVb = (dT10_dVb * T11 - T10 * dT11_dVb) / T12;
            Vdseff = Vds - (*Vdsat);
 
            if (SATMOD == 1) {
                if (PCLM > 0.0) {
                    T6 = uvds / (PCLM * Abulk * LITL * Esat);
                    T7 = T6 / T1;
                    T8 = Vdseff / (LITL * EM);
                    T9 = Vdseff * (1.0 - 0.5 * T8);
                    Va = Vasat + Rout_Vgs_factor * T7 * T9;
                    dVa_dVd = Rout_Vgs_factor * T7 * (1.0 - T8);
                    dVa_dVg = dVasat_dVg - dVa_dVd * dVdsat_dVg
                        + ((Len * Abulk * dEsat_dVg + 1.0) * T6
                            - T7 / Esat * dEsat_dVg) * Rout_Vgs_factor * T9
                        + dRout_Vgs_factor_dVg * T7 * T9;
                    dVa_dVb = dVasat_dVb - dVa_dVd * dVdsat_dVb
                        + ((Len * (Abulk * dEsat_dVb + Esat * dAbulk_dVb)
                                - dVth_dVb) * T6 - T7 * (dEsat_dVb / Esat
                                + dAbulk_dVb / Abulk)) * Rout_Vgs_factor * T9
                        + dRout_Vgs_factor_dVb * T7 * T9;
                }
                else {
                    Va = 1.0e10;
                    dVa_dVd = dVa_dVg = dVa_dVb = 0.0;
                }
            }                        /* SATMOD == 1                         */
            else {
                /* VACLM Calculation */
                if (PCLM > 0.0) {
                    tmp2 = 1.0 / (LITL * PCLM);
                    tmp1 = tmp2 / Abulk;
                    T6 = tmp1 / Esat;
                    T100 = Len * tmp1;
 
                    dVACLM_dVd = (Len * tmp2 + Vgst * T6);
                    T6 *= Vdseff;
                    tmp3 = Vgst / Esat;
                    dVACLM_dVg = - dVACLM_dVd * dVdsat_dVg
                        + T6 * (1.0 - tmp3 * dEsat_dVg);
                    dVACLM_dVb = - dVACLM_dVd * dVdsat_dVb
                        - T6 * (dVth_dVb + tmp3 * dEsat_dVb
                            + Vgst * dAbulk_dVb / Abulk);
                    VACLM = T6 / T1;
                }
                else {
                    VACLM = 1.0e10;
                    dVACLM_dVd = dVACLM_dVg = dVACLM_dVb = 0.0;
                }
 
                /*  VADIBL Calculation */
                Thetarout = thetaRout;
                if (Thetarout != 0.0) {
                    T201 = Abulk * (*Vdsat) * Vgst / (Abulk * (*Vdsat) + Vgst);
                    tmp1 = T201 / (*Vdsat);
                    tmp1 *= tmp1 / Abulk;
                    tmp2 = T201 / Vgst;
                    tmp2 *= tmp2;
                    tmp3 = T201 / Abulk;
                    tmp3 *= tmp3 / (*Vdsat);
                    dT201_dVg = dVdsat_dVg * tmp1 + tmp2;
                    dT201_dVb = dVdsat_dVb * tmp1 - dVth_dVb * tmp2
                        + tmp3 * dAbulk_dVb;
                    VADIBL = (Vgst - T201) / Thetarout;
                    dVADIBL_dVg = (1.0 - dT201_dVg) / Thetarout;
                    dVADIBL_dVb = - (dVth_dVb + dT201_dVb) / Thetarout;
 
                    T105 = 1.0 / VACLM + 1.0 / VADIBL;
                    VACLM2 = VACLM * VACLM;
                    VADIBL2 = VADIBL * VADIBL;
                    dT105_dVg = - dVACLM_dVg / VACLM2 - dVADIBL_dVg / VADIBL2;
                    dT105_dVd = - dVACLM_dVd / VACLM2;
                    dT105_dVb = - dVACLM_dVb / VACLM2 - dVADIBL_dVb / VADIBL2;
                }
                else {
                    T105 = 1.0 / VACLM;
                    VACLM2 = VACLM * VACLM;
                    dT105_dVg = - dVACLM_dVg / VACLM2;
                    dT105_dVd = - dVACLM_dVd / VACLM2;
                    dT105_dVb = - dVACLM_dVb / VACLM2;
                }
                T106 = uvds / T105;
                T103 = T105 * T105;
                tmp1 = uvds / T103;
                dT106_dVg = - dT105_dVg * tmp1;
                dT106_dVd = - dT105_dVd * tmp1;
                dT106_dVb = - dT105_dVb * tmp1;
 
                Va = Vasat + Rout_Vgs_factor * T106;
                dVa_dVg = dVasat_dVg + Rout_Vgs_factor * dT106_dVg
                    + dRout_Vgs_factor_dVg * T106;
                dVa_dVd = Rout_Vgs_factor * dT106_dVd;
                dVa_dVb = dVasat_dVb + Rout_Vgs_factor * dT106_dVb
                    + dRout_Vgs_factor_dVb * T106;
 
            }                        /* SATMOD != 1                         */
 
            tmp1 = Pmos_factor * 0.5 * wvcox;
            Idsat = tmp1 * (Vgst - Abulk * (*Vdsat));
            tmp2 = A1 * Idsat / Pmos_factor;
            Gmsat = tmp1 * (1.0 - Abulk * dVdsat_dVg) + tmp2;
            Gmbsat = - tmp1 * (dVth_dVb + Abulk * dVdsat_dVb
                    + dAbulk_dVb * (*Vdsat)) - tmp2 * dVth_dVb;
 
            Va2 = Va * Va;
            T10 = Vdseff / Va;
 
            /* VAHCE Calculation */
            if (PSCBE1 > 0.0) {
                T101 = PSCBE1 * LITL
                    / Vdseff;
                if (T101 < EXP_THRESHOLD) {
                    VAHCE = Len / (PSCBE2 * EXP(- T101));
                    dVAHCE_dVd = - T101 / Vdseff * VAHCE;
                    dVAHCE_dVg = - dVAHCE_dVd * dVdsat_dVg;
                    dVAHCE_dVb = - dVAHCE_dVd * dVdsat_dVb;
                }
                else {
                    VAHCE = EXP(EXP_THRESHOLD) * Len / PSCBE2;
                    dVAHCE_dVd = dVAHCE_dVg = dVAHCE_dVb = 0.0;
                }
                VAHCE2 = VAHCE * VAHCE;
                tmp1 = 1.0 + Vdseff / VAHCE;
                tmp2 = 1.0 + T10;
                tmp3 = Vdseff / Va2;
                tmp4 = Vdseff / VAHCE2;
                T11 = tmp1 * tmp2;
                dT11_dVd = tmp1 * (1.0 / Va - tmp3 * dVa_dVd)
                    + tmp2 * (1.0 / VAHCE - tmp4 * dVAHCE_dVd);
                dT11_dVg = tmp1 * (- dVdsat_dVg / Va - tmp3 * dVa_dVg)
                    - tmp2 * (dVdsat_dVg / VAHCE + tmp4 * dVAHCE_dVg);
                dT11_dVb = tmp1 * (- dVdsat_dVb / Va - tmp3 * dVa_dVb)
                    - tmp2 * (dVdsat_dVb / VAHCE + tmp4 * dVAHCE_dVb);
            }                        /* PSCBE1 > 0.0                        */
            else {
                T11 = 1.0 + T10;
                tmp3 = Vdseff / Va2;
                dT11_dVd = 1.0 / Va - tmp3 * dVa_dVd;
                dT11_dVg = - (dVdsat_dVg / Va + tmp3 * dVa_dVg);
                dT11_dVb = - (dVdsat_dVb / Va + tmp3 * dVa_dVb);
            }                        /* PSCBE1 <= 0.0                       */
 
            Ids2 = Idsat * T11;
            Gds2 = Idsat * dT11_dVd;
            Gm2 = Gmsat * T11 + Idsat * dT11_dVg;
            Gmb2 = Gmbsat * T11 + Idsat * dT11_dVb;
        }                            /* Vds > *Vdsat                        */
 
    }                                /* Vgst > 0.0                          */
    else {
        Ids2 = Gm2 = Gds2 = Gmb2 = 0.0;
    }                                /* Vgst <= 0.0                         */
 
    if (TranReg) {
 
        if ((Gm2 - Gm1) == 0.0) {
            *Id = 0;
            *Gm = 0;
            *Gds = 0;
            *Gmbs = 0;
        }
        else {
            /*Determine the drain current in transition region */
            double Ids1x, Ids2x, Gm12x;
            Vgst = Vgs_eff - Vth;
            if (SUBTHMOD == 3) {
                Ids1x = ((Ids1 == 0.0) ? 1.0e-12 : Ids1);
                Ids2x = ((Ids2 == 0.0) ? 1.0e-12 : Ids2);
                Gm1 = Gm1 / Ids1x;
                Gm2 = Gm2 / Ids2x;
                T10 = Ids1;
                T11 = Ids2;
                Ids1 = LOG(Ids1);
                Ids2 = LOG(Ids2);
            }
 
            Gm12x = (((Gm2 - Gm1) == 0.0) ? 1.0e-12 : (Gm2 - Gm1));
            Vp = ((Gm2 * Vghigh - Gm1 * Vglow) - (Ids2 - Ids1))
                / Gm12x;
 
            T1 = Vp - Vglow;
            T2 = Vglow - 2.0 * Vp + Vghigh;
            Ip = Ids1 + Gm1 * T1;
            T5 = T2 * (Vgst - Vglow) / (T1 * T1);
            t = T1 / T2 * (sqrt(1.0 + T5) - 1.0);
            T6 = 1.0 - t;
            *Id = T6 * T6 * Ids1 + 2.0 * t * T6 * Ip + t * t * Ids2;
 
            /* ***** End of drain current calculation ***** */
 
            *Gm = (T6 * (Ip - Ids1) + t * (Ids2 - Ip))
                / (T6 * T1 + t * (Vghigh - Vp));
 
            if (SUBTHMOD == 3) {
                *Id = EXP(*Id);
                *Gm *= *Id;
                Ids1 = T10;
                Ids2 = T11;
            }
 
            T4 = (*Id - Ids1) * (Vghigh - Vglow)
                / ((Ids2 - Ids1) * (Vgst - Vglow));
            *Gds = Gds1 + (Gds2 - Gds1) * T4;
            *Gmbs = Gmb1 + (Gmb2 - Gmb1) * T4;
        }
 
    }                                /* TranReg                             */
    else {
        *Id = Ids1 + Ids2;
        *Gds = Gds1 + Gds2;
        *Gm = Gm1 + Gm2;
        *Gmbs = Gmb1 + Gmb2;
    }                                /* No TranReg                          */
 
    if (NgateUsed)
        *Gm *= dVgs_eff_dVg;
 
/**************************** end of DC calculations ************************/
 
/* charge calculations */
 
    *Von = Vth;
    /* here->BSIM3vdsat = Vdsat; */
 
    if ((XPART < 0) || (! ChargeComputationNeeded)) {
 
        *Qg = *Qd = *Qb = 0.0;
        *Cggb = *Cgsb = *Cgdb = 0.0;
        *Cdgb = *Cdsb = *Cddb = 0.0;
        *Cbgb = *Cbsb = *Cbdb = 0.0;
        goto finished;
 
    }
    else {
        if (Vbs < 0.0) {
            Vbseff = Vbs;
            dVbseff_dVb = 1.0;
        }
        else {
            Vbseff = T_PHI - Phis;
            dVbseff_dVb = - dPhis_dVb;
        }
 
        CoxWL = cox * Wid * Len;
        Vfb = Vth - T_PHI - T_K1 * T1s;
        dVfb_dVb = dVth_dVb - T_K1 * dT1s_dVb;
        Arg1 = Vgs_eff - Vbseff - Vfb;
 
        if (TranReg) {
            Vgst = Vgs_eff - Vth;
            if (Vgst > 0.0) {
                Vgsaddvth = Vgs_eff + Vth;
                tmp1 = UC + UC1 * (TempRatio - 1.0);
                Denomi = 1.0 + tmp1 * Vbs
                    + Vgsaddvth * (uaOvTox + Vgsaddvth * ubOvTox2);
                dDenomi_dVg = uaOvTox + 2.0 * ubOvTox2 * Vgsaddvth;
                dDenomi_dVb = dDenomi_dVg * dVth_dVb + tmp1;
 
                ueff = T_U0TEMP / Denomi;
                /* here->BSIM3ueff = ueff; */
                T0 = - ueff / Denomi;
                dueff_dVg = T0 * dDenomi_dVg;
                dueff_dVb = T0 * dDenomi_dVb;
 
                Esat = 2.0 * T_VSATTEMP / ueff;
                T0 = - Esat / ueff;
                dEsat_dVg = T0 * dueff_dVg;
                dEsat_dVb = T0 * dueff_dVb;
 
                Esatlength = Esat * Len;
                T1 = 1.0 / (Abulk * Esatlength + Vgst);
                Vdsat0 = Esatlength * Vgst * T1;
 
                Pmos_factor = A1 * Vgst + A2;
 
                if (rds == 0 && Pmos_factor == 1.0) {
                    *Vdsat = Vdsat0;
                    T2 = Esatlength * Esatlength;
                    T3 = Len * Vgst * Vgst;
                    T4 = T1 * T1;
                    dVdsat_dVg = (T2 * Abulk + T3 * dEsat_dVg) * T4;
                    dVdsat_dVb = (T3 * dEsat_dVb
                            - T2 * Abulk * dVth_dVb) * T4
                        - (*Vdsat) * T1 * Esatlength * dAbulk_dVb;
                }
                else {
                    T104 = Abulk * (0.5 * Abulk * wvcoxrds
                            - 1.0 + 1.0 / Pmos_factor);
 
                    T105 = - (Vgst * (2.0 / Pmos_factor - 1.0)
                            + Abulk * Esatlength
                            + 1.5 * Abulk * Vgst * wvcox * rds);
 
                    T106 = Vgst * (Esatlength + Vgst * wvcoxrds);
 
                    T201 = sqrt(T105 * T105 - 4.0 * T104 * T106);
                    *Vdsat = -0.5 * (T105 + T201) / T104;
 
                    tmp1 = A1 / (Pmos_factor * Pmos_factor);
                    tmp2 = Abulk * wvcoxrds;
                    tmp3 = 2.0 / Pmos_factor - 1.0;
                    dT104_dVg = - Abulk * tmp1;
                    dT104_dVb = dAbulk_dVb * (tmp2 - 1.0
                            + 1.0 / Pmos_factor) + Abulk * tmp1 * dVth_dVb;
 
                    dT105_dVg = (- (tmp3 + Abulk * dEsat_dVg * Len
                                + 1.5 * tmp2) + Vgst * 2.0 * tmp1);
                    tmp4 = wvcoxrds * Vgst;
                    dT105_dVb = - (- dVth_dVb * tmp3 + Abulk * dEsat_dVb * Len
                            + Esatlength * dAbulk_dVb
                            - 1.5 * (tmp2 * dVth_dVb - tmp4 * dAbulk_dVb))
                        - Vgst * 2.0 * tmp1 * dVth_dVb;
 
                    dT106_dVg = (Esatlength + 2.0 * tmp4)
                        + Vgst * dEsat_dVg * Len;
                    dT106_dVb = - Esatlength * dVth_dVb
                        + Vgst * dEsat_dVb * Len - 2.0 * tmp4 * dVth_dVb;
 
                    dT201_dVg = (T105 * dT105_dVg - 2.0 * (T104 * dT106_dVg
                                + dT104_dVg * T106)) / T201;
                    dT201_dVb = (T105 * dT105_dVb
                            - 2.0 * (T104 * dT106_dVb
                                + dT104_dVb * T106)) / T201;
 
                    tmp4 = 0.5 * (T105 + T201) / (T104 * T104);
                    dVdsat_dVg = -0.5 * (dT105_dVg + dT201_dVg) / T104
                        + tmp4 * dT104_dVg;
 
                    dVdsat_dVb = -0.5 * (dT105_dVb + dT201_dVb) / T104
                        + tmp4 * dT104_dVb;
                }
            }                        /* Vgst > 0.0                          */
 
        }                            /* TranReg                             */
 
        if (Arg1 <= 0.0) {
 
            qgate = CoxWL * Arg1;
            qbulk = - qgate;
            qdrn = 0.0;
 
            *Cggb = CoxWL * dVgs_eff_dVg;
            *Cgdb = 0.0;
            *Cgsb = CoxWL * (dVfb_dVb + dVbseff_dVb - dVgs_eff_dVg);
 
            *Cdgb = 0.0;
            *Cddb = 0.0;
            *Cdsb = 0.0;
 
            *Cbgb = - CoxWL * dVgs_eff_dVg;
            *Cbdb = 0.0;
            *Cbsb = - *Cgsb;
 
        }                            /* Arg1 <= 0.0                         */
        else if (Vgst <= 0.0) {
            T1 = 0.5 * T_K1;
            T2 = sqrt(T1 * T1 + Arg1);
            qgate = CoxWL * T_K1 * (T2 - T1);
            qbulk = - qgate;
            qdrn = 0.0;
 
            T0 = CoxWL * T1 / T2;
            *Cggb = T0 * dVgs_eff_dVg;
            *Cgdb = 0.0;
            *Cgsb = T0 * (dVfb_dVb + dVbseff_dVb - dVgs_eff_dVg);
 
            *Cdgb = 0.0;
            *Cddb = 0.0;
            *Cdsb = 0.0;
 
            *Cbgb = - *Cggb;
            *Cbdb = 0.0;
            *Cbsb = - *Cgsb;
 
        }                            /* Arg1 > 0.0 and Vgst <= 0.0          */
        else {
            /* Arg1 > 0.0 and Vgst > 0.0 */
            One_Third_CoxWL = CoxWL / 3.0;
            Two_Third_CoxWL = 2.0 * One_Third_CoxWL;
 
            if (XPART > 0.5) {
                /* 0/100 Charge partition model */
                if (*Vdsat <= Vds) {
                    /* saturation region */
                    T1 = (*Vdsat) / 3.0;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI - T1);
                    T2 = - Two_Third_CoxWL * Vgst;
                    qbulk = - (qgate + T2);
                    qdrn = 0.0;
 
                    *Cggb = One_Third_CoxWL * (3.0
                            - dVdsat_dVg) * dVgs_eff_dVg;
                    T2 = - One_Third_CoxWL * (dVdsat_dVb + 3.0 * dVfb_dVb);
                    *Cgsb = - (*Cggb + T2);
                    *Cgdb = 0.0;
 
                    *Cdgb = 0.0;
                    *Cddb = 0.0;
                    *Cdsb = 0.0;
 
                    *Cbgb = - (*Cggb - Two_Third_CoxWL * dVgs_eff_dVg);
                    T3 = - (T2 + Two_Third_CoxWL * dVth_dVb);
                    *Cbsb = - (*Cbgb + T3);
                    *Cbdb = 0.0;
                }                    /* saturation region                   */
                else {
                    /* linear region */
                    Alphaz = Vgst / (*Vdsat);
                    T1 = 2.0 * (*Vdsat) - Vds;
                    T2 = Vds / (3.0 * T1);
                    T3 = T2 * Vds;
                    T9 = 0.25 * CoxWL;
                    T4 = T9 * Alphaz;
                    T7 = 2.0 * Vds - T1 - 3.0 * T3;
                    T8 = T3 - T1 - 2.0 * Vds;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI - 0.5 * (Vds - T3));
                    T10 = T4 * T8;
                    qdrn = T4 * T7;
                    qbulk = - (qgate + qdrn + T10);
 
                    T5 = T3 / T1;
                    *Cggb = CoxWL * (1.0 - T5 * dVdsat_dVg) * dVgs_eff_dVg;
                    T11 = - CoxWL * (T5 * dVdsat_dVb + dVfb_dVb);
                    *Cgdb = CoxWL * (T2 - 0.5 + 0.5 * T5);
                    *Cgsb = - (*Cggb + T11 + *Cgdb);
                    T6 = 1.0 / (*Vdsat);
                    dAlphaz_dVg = T6 * (1.0 - Alphaz * dVdsat_dVg);
                    dAlphaz_dVb = - T6 * (dVth_dVb + Alphaz * dVdsat_dVb);
                    T7 = T9 * T7;
                    T8 = T9 * T8;
                    T9 = 2.0 * T4 * (1.0 - 3.0 * T5);
                    *Cdgb = (T7 * dAlphaz_dVg
                            - T9 * dVdsat_dVg) * dVgs_eff_dVg;
                    T12 = T7 * dAlphaz_dVb - T9 * dVdsat_dVb;
                    *Cddb = T4 * (3.0 - 6.0 * T2 - 3.0 * T5);
                    *Cdsb = - (*Cdgb + T12 + *Cddb);
 
                    T9 = 2.0 * T4 * (1.0 + T5);
                    T10 = (T8 * dAlphaz_dVg
                            - T9 * dVdsat_dVg) * dVgs_eff_dVg;
                    T11 = T8 * dAlphaz_dVb - T9 * dVdsat_dVb;
                    T12 = T4 * (2.0 * T2 + T5 - 1.0);
                    T0 = - (T10 + T11 + T12);
 
                    *Cbgb = - (*Cggb + *Cdgb + T10);
                    *Cbdb = - (*Cgdb + *Cddb + T12);
                    *Cbsb = - (*Cgsb + *Cdsb + T0);
                }                    /* linear region                       */
 
            }                        /* 0/100 Charge partition model        */
            else if (XPART < 0.5) {
                /* 40/60 Charge partition model */
                if (Vds >= *Vdsat) {
                    /* saturation region */
                    T1 = (*Vdsat) / 3.0;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI - T1);
                    T2 = - Two_Third_CoxWL * Vgst;
                    qbulk = - (qgate + T2);
                    qdrn = 0.4 * T2;
 
                    *Cggb = One_Third_CoxWL * (3.0
                            - dVdsat_dVg) * dVgs_eff_dVg;
                    T2 = - One_Third_CoxWL * (dVdsat_dVb + 3.0 * dVfb_dVb);
                    *Cgsb = - (*Cggb + T2);
                    *Cgdb = 0.0;
 
                    T3 = 0.4 * Two_Third_CoxWL;
                    *Cdgb = - T3 * dVgs_eff_dVg;
                    *Cddb = 0.0;
                    T4 = T3 * dVth_dVb;
                    *Cdsb = - (T4 + *Cdgb);
 
                    *Cbgb = - (*Cggb - Two_Third_CoxWL * dVgs_eff_dVg);
                    T3 = - (T2 + Two_Third_CoxWL * dVth_dVb);
                    *Cbsb = - (*Cbgb + T3);
                    *Cbdb = 0.0;
                }                    /* saturation region                   */
                else {
                    /* linear region  */
                    Alphaz = Vgst / (*Vdsat);
                    T1 = 2.0 * (*Vdsat) - Vds;
                    T2 = Vds / (3.0 * T1);
                    T3 = T2 * Vds;
                    T9 = 0.25 * CoxWL;
                    T4 = T9 * Alphaz;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI - 0.5 * (Vds - T3));
 
                    T5 = T3 / T1;
                    *Cggb = CoxWL * (1.0 - T5 * dVdsat_dVg) * dVgs_eff_dVg;
                    tmp = - CoxWL * (T5 * dVdsat_dVb + dVfb_dVb);
                    *Cgdb = CoxWL * (T2 - 0.5 + 0.5 * T5);
                    *Cgsb = - (*Cggb + *Cgdb + tmp);
 
                    T6 = 1.0 / (*Vdsat);
                    dAlphaz_dVg = T6 * (1.0 - Alphaz * dVdsat_dVg);
                    dAlphaz_dVb = - T6 * (dVth_dVb + Alphaz * dVdsat_dVb);
 
                    T6 = 8.0 * (*Vdsat) * (*Vdsat) - 6.0 * (*Vdsat) * Vds
                        + 1.2 * Vds * Vds;
                    T8 = T2 / T1;
                    T7 = Vds - T1 - T8 * T6;
                    qdrn = T4 * T7;
                    T7 *= T9;
                    tmp = T8 / T1;
                    tmp1 = T4 * (2.0 - 4.0 * tmp * T6
                            + T8 * (16.0 * (*Vdsat) - 6.0 * Vds));
 
                    *Cdgb = (T7 * dAlphaz_dVg
                            - tmp1 * dVdsat_dVg) * dVgs_eff_dVg;
                    T10 = T7 * dAlphaz_dVb - tmp1 * dVdsat_dVb;
                    *Cddb = T4 * (2.0 - (1.0 / (3.0 * T1 * T1)
                                + 2.0 * tmp) * T6
                            + T8 * (6.0 * (*Vdsat) - 2.4 * Vds));
                    *Cdsb = - (*Cdgb + T10 + *Cddb);
 
                    T7 = 2.0 * (T1 + T3);
                    qbulk = - (qgate - T4 * T7);
                    T7 *= T9;
                    T0 = 4.0 * T4 * (1.0 - T5);
                    T12 = (- T7 * dAlphaz_dVg - *Cdgb
                            - T0 * dVdsat_dVg) * dVgs_eff_dVg;
                    T11 = - T7 * dAlphaz_dVb - T10 - T0 * dVdsat_dVb;
                    T10 = -4.0 * T4 * (T2 - 0.5 + 0.5 * T5) - *Cddb;
                    tmp = - (T10 + T11 + T12);
 
                    *Cbgb = - (*Cggb + *Cdgb + T12);
                    *Cbdb = - (*Cgdb + *Cddb + T11);
                    *Cbsb = - (*Cgsb + *Cdsb + tmp);
                }                    /* linear region                       */
 
            }                        /* 40/60 Charge partition model        */
            else {
                /* 50/50 partitioning */
                if (Vds >= *Vdsat) {
                    /* saturation region */
                    T1 = (*Vdsat) / 3.0;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI - T1);
                    T2 = - Two_Third_CoxWL * Vgst;
                    qbulk = - (qgate + T2);
                    qdrn = 0.5 * T2;
 
                    *Cggb = One_Third_CoxWL * (3.0
                            - dVdsat_dVg) * dVgs_eff_dVg;
                    T2 = - One_Third_CoxWL * (dVdsat_dVb + 3.0 * dVfb_dVb);
                    *Cgsb = - (*Cggb + T2);
                    *Cgdb = 0.0;
 
                    *Cdgb = - One_Third_CoxWL * dVgs_eff_dVg;
                    *Cddb = 0.0;
                    T4 = One_Third_CoxWL * dVth_dVb;
                    *Cdsb = - (T4 + *Cdgb);
 
                    *Cbgb = - (*Cggb - Two_Third_CoxWL * dVgs_eff_dVg);
                    T3 = - (T2 + Two_Third_CoxWL * dVth_dVb);
                    *Cbsb = - (*Cbgb + T3);
                    *Cbdb = 0.0;
                }                    /* saturation region                   */
                else {
                    /* linear region */
                    Alphaz = Vgst / (*Vdsat);
                    T1 = 2.0 * (*Vdsat) - Vds;
                    T2 = Vds / (3.0 * T1);
                    T3 = T2 * Vds;
                    T9 = 0.25 * CoxWL;
                    T4 = T9 * Alphaz;
                    qgate = CoxWL * (Vgs_eff - Vfb - T_PHI
                            - 0.5 * (Vds - T3));
 
                    T5 = T3 / T1;
                    *Cggb = CoxWL * (1.0 - T5 * dVdsat_dVg) * dVgs_eff_dVg;
                    tmp = - CoxWL * (T5 * dVdsat_dVb + dVfb_dVb);
                    *Cgdb = CoxWL * (T2 - 0.5 + 0.5 * T5);
                    *Cgsb = - (*Cggb + *Cgdb + tmp);
 
                    T6 = 1.0 / (*Vdsat);
                    dAlphaz_dVg = T6 * (1.0 - Alphaz * dVdsat_dVg);
                    dAlphaz_dVb = - T6 * (dVth_dVb + Alphaz * dVdsat_dVb);
 
                    T7 = T1 + T3;
                    qdrn = - T4 * T7;
                    qbulk = - (qgate + qdrn + qdrn);
                    T7 *= T9;
                    T0 = T4 * (2.0 * T5 - 2.0);
 
                    *Cdgb = (T0 * dVdsat_dVg
                            - T7 * dAlphaz_dVg) * dVgs_eff_dVg;
                    T12 = T0 * dVdsat_dVb - T7 * dAlphaz_dVb;
                    *Cddb = T4 * (1.0 - 2.0 * T2 - T5);
                    *Cdsb = - (*Cdgb + T12 + *Cddb);
 
                    *Cbgb = - (*Cggb + 2.0 **Cdgb);
                    *Cbdb = - (*Cgdb + 2.0 **Cddb);
                    *Cbsb = - (*Cgsb + 2.0 **Cdsb);
                }                    /* linear region                       */
 
            }                        /* 50/50 charge partitioning           */
 
        }                            /* Arg1 > 0.0 and Vgst > 0.0           */
 
        /* End of Codes added by Mansun      */
 
        *Qg = qgate;
        *Qd = qdrn;
        *Qb = qbulk;
 
    }                                /* End of charge calculations          */
 
    finished :;                      /* returning Values to Calling Routine */
 
}                                    /* done with charge calculations       */
 
/************************** end of charge calculations **********************/
 
 
void MOS6cap(
         double Vgd,                   /* (R) Terminal voltages               */
         double Vgs,                   /* (R) Terminal voltages               */
         double Vgb,                   /* (R) Terminal voltages               */
         double CgdOvl,                /* (R) Overlap capacitances            */
         double CgsOvl,                /* (R) Overlap capacitances            */
         double CgbOvl,                /* (R) Overlap capacitances            */
         double *Qgat,                 /* (R/W) Charges                       */
         double *Qsub,                 /* (R/W) Charges                       */
         double *Qdrn,                 /* (R/W) Charges                       */
         double *Qsrc,                 /* (R/W) Charges                       */
         double *Cggb,                 /* (R/W) Capacitances                  */
         double *Cgdb,                 /* (R/W) Capacitances                  */
         double *Cgsb,                 /* (R/W) Capacitances                  */
         double *Cbgb,                 /* (R/W) Capacitances                  */
         double *Cbdb,                 /* (R/W) Capacitances                  */
         double *Cbsb,                 /* (R/W) Capacitances                  */
         double *Cdgb,                 /* (R/W) Capacitances                  */
         double *Cddb,                 /* (R/W) Capacitances                  */
         double *Cdsb,                 /* (R/W) Capacitances                  */
         double *Csgb,                 /* (R/W) Capacitances                  */
         double *Csdb,                 /* (R/W) Capacitances                  */
         double *Cssb)                 /* (R/W) Capacitances                  */
/*****************************************************************************
* Purpose
*   Calculate MOS6 total terminal charges and capacitances, incl. overlap
*
* Returned value
*   None
*
* Author
*   gwb - 03 Feb 94 - created (based on BSIM3 Version 1.0, Level=5)
*
*****************************************************************************/
 
{
    *Csgb = - (*Cggb + *Cbgb + *Cdgb + CgsOvl);
    *Csdb = - (*Cgdb + *Cbdb + *Cddb);
    *Cssb = - (*Cgsb + *Cbsb + *Cdsb - CgsOvl);
 
    *Cdgb = *Cdgb - CgdOvl;
    *Cddb = *Cddb + CgdOvl;
 
    *Cggb = *Cggb + CgdOvl + CgsOvl + CgbOvl;
    *Cgdb = *Cgdb - CgdOvl;
    *Cgsb = *Cgsb - CgsOvl;
 
    *Cbgb = *Cbgb - CgbOvl;
 
    { double                         /* calc. total terminal charge         */
                qgd = CgdOvl * Vgd,
                qgs = CgsOvl * Vgs,
                qgb = CgbOvl * Vgb;
 
        *Qgat += qgd + qgs + qgb;
        *Qsub -= qgb;
        *Qdrn -= qgd;
        *Qsrc = - (*Qgat + *Qsub + *Qdrn);
    }
}                                    /* done                                */
