/* mos7.c
 *   $Revision:   1.8  $
 *   $Author:   GWB  $
 *   $Date:   18 Jun 1997 11:47:18  $ */
 
#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "m.h"
#include "mserrors.h"
 
//#define BSIM3_DEBUG
//#define BSIM3_TEMP
 
#ifdef BSIM3_DEBUG
void DumpBSIM3ModelParams(M_ *);
void DumpBSIM3pParams(bsim3SizeDependParam *);
#endif
 
#define PARAM(a)        ((double)Model->a)
#define CAPMOD          NINT(PARAM(BSIM3_CAPMOD))
#define MOBMOD          NINT(PARAM(BSIM3_MOBMOD))
#define NGATE           PARAM(BSIM3_NGATE)
#define NQSMOD          NINT(PARAM(BSIM3_NQSMOD))
#define BSIM3tnom       PARAM(BSIM3_TNOM)
#define TOX             PARAM(M_tox)
#define TYPE            NINT(PARAM(M_type))
#define VTM             PARAM(BSIM3vtm)
#define XPART           PARAM(BSIM_xpart)
 
//  disable global subexpression elimination
//  #pragma optimize( "g", off)
 
void MOS7eval(
         struct M_ *Model,             // (R) pointer to model parameters
         double Len,                   // (R) device size
         double Wid,                   // (R) device size
         double Mdev,                  // (R) device size
         double Vgs,                   // (R) terminal voltages
         double Vds,                   // (R) terminal voltages
         double Vbs,                   // (R) terminal voltages
         double *Von,                  // (W) characteristic voltages
         double *Vdsat,                // (W) characteristic voltages
         double *Id,                   // (W) drain current
         double *Isub,                 // (W) ionization current
         double *Isubm,                // (W) ionization current
         double *Gds,                  // (W) device conductances
         double *Gm,                   // (W) device conductances
         double *Gmbs,                 // (W) device conductances
         double *Gbbs,                 // (W) device conductances
         double *Gbgs,                 // (W) device conductances
         double *Gbds,                 // (W) device conductances
         double *Gtau,                 // (W) device conductances
         int Charge,                   // (R) YES: do charge calculations
         double *Cggb,                 // (W) capacitances
         double *Cgdb,                 // (W) capacitances
         double *Cgsb,                 // (W) capacitances
         double *Cdgb,                 // (W) capacitances
         double *Cddb,                 // (W) capacitances
         double *Cdsb,                 // (W) capacitances
         double *Cbgb,                 // (W) capacitances
         double *Cbdb,                 // (W) capacitances
         double *Cbsb,                 // (W) capacitances
         double *Cqdb,                 // (W) capacitances
         double *Cqsb,                 // (W) capacitances
         double *Cqgb,                 // (W) capacitances
         double *Cqbb,                 // (W) capacitances
         double *Qg,                   // (W) charges
         double *Qd,                   // (W) charges
         double *Qb,                   // (W) charges
         double *Qcheq,                // (W) charges
         double *NoiseBeta,            // (W) noise beta
         double *Ueff,                 // (W) effective mobility
         double *Qinv,                 // (W) channel minority inversion charge
         double *Tconst,               // (W) temperature factor
         bsim3SizeDependParam * pParam,// (R) binned parameter struct
         double Tmod)                  // (R) temperature
/*****************************************************************************
*
* Purpose
*   Evaluate MOS level 7 (BSIM3 Version 3.0 model)
*
* Returned value
*
* Discussion
*
* Author
*   dec - 13 Jun 97 - initial release (gwb modifications).
*****************************************************************************/
 
{
 
// Local variables
 
#define MAX_EXP 5.834617425e14
#define MIN_EXP 1.713908431e-15
#define EXP_THRESHOLD 34.0
 
    double  qgate, qbulk, qdrn;
    double  Vgs_eff, dVgs_eff_dVg, Vfb, dVfb_dVb;
    double  Phis, dPhis_dVb, Vth, dVth_dVb;
    double  Vgst, n, dn_dVb;
    double  ExpArg;
    double  Denomi, dDenomi_dVg, dDenomi_dVb;
    double  ueff, dueff_dVg, dueff_dVb, Esat;
    double  Vdseff;
    double  dVdsat_dVg, dVdsat_dVb, Vasat;
    double  dVasat_dVg, dVasat_dVb, Va, dVa_dVd, dVa_dVg, dVa_dVb, Vbseff;
    double  dVbseff_dVb, Arg1, One_Third_CoxWL, Two_Third_CoxWL, CoxWL;
    double  T0, dT0_dVb, T1, dT1_dVb, T2, T3, dT3_dVd, dT3_dVg;
    double  dT3_dVb, T4, T5;
    double  T6, T7, T8;
    double  T10;
    double  Abulk, dAbulk_dVb;
    double  VACLM, dVACLM_dVg, dVACLM_dVd, dVACLM_dVb;
    double  VADIBL, dVADIBL_dVg, dVADIBL_dVb;
    double  Xdep, dXdep_dVb, Delt_vth, dDelt_vth_dVb;
    double  Theta0, dTheta0_dVb;
    double  TempRatio, tmp1, tmp2, tmp3, tmp4;
    double  DIBL_Sft, Pmos_factor;
    double  beta;
 
// The following are local variables new to BSIM3v3

    double  sqrtPhis, dsqrtPhis_dVb;
    double  Leff, Weff, dWeff_dVg, dWeff_dVb;
    double  lt1, dlt1_dVb;
    double  ltw, dltw_dVb;
    double  dDIBL_Sft_dVd;
    double  dVth_dVd;
    double  dn_dVd;
    double  Vtm, VgstNVt;
    double  dT1_dVg, dT1_dVd;
    double  dT2_dVg, dT2_dVd, dT2_dVb;
    double  Vgsteff, dVgsteff_dVg, dVgsteff_dVd, dVgsteff_dVb;
    double  Rds, dRds_dVg, dRds_dVb;
    double  WVCox, WVCoxRds;
    double  Abulk0, dAbulk_dVg, dAbulk0_dVb;
    double  dDenomi_dVd;
    double  dueff_dVd;
    double  EsatL, dEsatL_dVg, dEsatL_dVd, dEsatL_dVb;
    double  a1, Vgst2Vtm;
    double  dT0_dVg, dT0_dVd;
    double  dVdsat_dVd;
    double  dVdseff_dVg, dVdseff_dVd, dVdseff_dVb;
    double  dVasat_dVd;
    double  diffVds;
    double  dVADIBL_dVd;
    double  VASCBE, dVASCBE_dVg, dVASCBE_dVd, dVASCBE_dVb;
    double  CoxWovL;
    double  dbeta_dVg, dbeta_dVd, dbeta_dVb;
    double  fgche1, dfgche1_dVg, dfgche1_dVd, dfgche1_dVb;
    double  fgche2, dfgche2_dVg, dfgche2_dVd, dfgche2_dVb;
    double  gche, dgche_dVg, dgche_dVd, dgche_dVb;
    double  Idl, dIdl_dVg, dIdl_dVd, dIdl_dVb;
    double  Idsa, dIdsa_dVg, dIdsa_dVd, dIdsa_dVb;
    double  Ids, Gmb, Gbd, Gbb, Gbg, isub;
    double  ExpVgst;
 
//  PSpice uses Charge, not ChargeComputationNeeded

    int     ChargeComputationNeeded;
    double  cox = EPSOX / (TOX);       // tox in meters, cox in F/m^2
    double  M_FACTOR1 = sqrt(EPSSIL / EPSOX * TOX);
 
#ifdef BSIM3_DEBUG
    ToOutFile("ENTER MOS7\n");
    DumpBSIM3ModelParams(Model);
    DumpBSIM3pParams(pParam);
#endif
 
    // Calculate drain current and its
    // derivatives and charge and capacitances related to gate
    // drain, and bulk
 
    ChargeComputationNeeded = Charge;
 
    TempRatio = Tmod / BSIM3tnom - 1.0;
 
#ifdef BSIM3_TEMP
    double  debugtemp = (abs(TempRatio) < 1.0e-7 ? 0.0 : TempRatio);
    ToOutFile("EVAL-TempRatio    %10.4e\n", debugtemp);
    ToOutFile("EVAL-CktTemp      %10.4e\n", Tmod);
    ToOutFile("EVAL-NomTemp      %10.4e\n", Model->BSIM3_TNOM);
#endif
 
    pParam->BSIM3rds0 = (pParam->BSIM3rdsw + pParam->BSIM3prt * TempRatio)
        / pow((pParam->BSIM3weff / Mdev) * 1E6, pParam->BSIM3wr);
    pParam->BSIM3rds0 /= Mdev;
 
    T0 = Vbs - pParam->BSIM3vbsc - 0.001;
    T1 = sqrt(T0 * T0 - 0.004 * pParam->BSIM3vbsc);
    Vbseff = pParam->BSIM3vbsc + 0.5 * (T0 + T1);
    dVbseff_dVb = 0.5 * (1.0 + T0 / T1);
 
    if (Vbseff > 0.0) {
        T0 = pParam->BSIM3phi / (pParam->BSIM3phi + Vbseff);
        Phis = pParam->BSIM3phi * T0;
        dPhis_dVb = - T0 * T0;
        sqrtPhis = pParam->BSIM3phis3 / (pParam->BSIM3phi + 0.5 * Vbseff);
        dsqrtPhis_dVb = -0.5 * sqrtPhis * sqrtPhis / pParam->BSIM3phis3;
    }
    else {
        Phis = pParam->BSIM3phi - Vbseff;
        dPhis_dVb = -1.0;
        sqrtPhis = sqrt(Phis);
        dsqrtPhis_dVb = -0.5 / sqrtPhis;
    }
    Xdep = pParam->BSIM3Xdep0 * sqrtPhis / pParam->BSIM3sqrtPhi;
    dXdep_dVb = (pParam->BSIM3Xdep0 / pParam->BSIM3sqrtPhi)
        * dsqrtPhis_dVb;
 
    Leff = pParam->BSIM3leff;
 
    // Vth Calculation

    if ((T1 = 1.0 + pParam->BSIM3dvt2 * Vbseff) < 1.0e-10)
        T1 = 1.0e-10;
    if ((T2 = 1.0 + pParam->BSIM3dvt2w * Vbseff) < 1.0e-10)
        T2 = 1.0e-10;
 
    T3 = sqrt(Xdep);
    lt1 = M_FACTOR1 * T3 * T1;
    dlt1_dVb = M_FACTOR1 * (0.5 / T3 * T1 * dXdep_dVb
            + T3 * pParam->BSIM3dvt2);
 
    ltw = M_FACTOR1 * T3 * T2;
    dltw_dVb = M_FACTOR1 * (0.5 / T3 * T2 * dXdep_dVb
            + T3 * pParam->BSIM3dvt2w);
 
    T0 = -0.5 * pParam->BSIM3dvt1 * Leff / lt1;
    if (T0 > - EXP_THRESHOLD) {
        T1 = exp(T0);
        dT1_dVb = - T0 / lt1 * T1 * dlt1_dVb;
    }
    else {
        T1 = MIN_EXP;
        dT1_dVb = 0.0;
    }
 
    Theta0 = T1 * (1.0 + 2.0 * T1);
    dTheta0_dVb = (1.0 + 4.0 * T1) * dT1_dVb;
 
    T0 = pParam->BSIM3vbi - pParam->BSIM3phi;
    Delt_vth = pParam->BSIM3dvt0 * Theta0 * T0;
    dDelt_vth_dVb = pParam->BSIM3dvt0 * dTheta0_dVb * T0;
 
    T0 = -0.5 * pParam->BSIM3dvt1w * (pParam->BSIM3weff / Mdev) * Leff / ltw;
    if (T0 > - EXP_THRESHOLD) {
        T1 = exp(T0);
        dT1_dVb = - T0 / ltw * T1 * dltw_dVb;
    }
    else {
        T1 = MIN_EXP;
        dT1_dVb = 0.0;
    }
 
    T2 = T1 * (1.0 + 2.0 * T1);
    dT2_dVb = (1.0 + 4.0 * T1) * dT1_dVb;
 
    T0 = pParam->BSIM3dvt0w * T2;
    T1 = pParam->BSIM3vbi - pParam->BSIM3phi;
    T2 = T0 * T1;
    dT2_dVb = pParam->BSIM3dvt0w * dT2_dVb * T1;
 
    T0 = sqrt(1.0 + pParam->BSIM3nlx / Leff);
    T1 = pParam->BSIM3k1 * (T0 - 1.0) * pParam->BSIM3sqrtPhi
        + (pParam->BSIM3kt1 + pParam->BSIM3kt1l / Leff
            + pParam->BSIM3kt2 * Vbseff) * TempRatio;
    tmp2 = TOX / ((pParam->BSIM3weff / Mdev)
            + pParam->BSIM3w0) * pParam->BSIM3phi;
 
    dDIBL_Sft_dVd = (pParam->BSIM3eta0 + pParam->BSIM3etab
            * Vbseff) * pParam->BSIM3theta0vb0;
    DIBL_Sft = dDIBL_Sft_dVd * Vds;
 
    Vth = TYPE * pParam->BSIM3vth0 + pParam->BSIM3k1
        * (sqrtPhis - pParam->BSIM3sqrtPhi) - pParam->BSIM3k2
        * Vbseff - Delt_vth - T2 + (pParam->BSIM3k3 + pParam->BSIM3k3b
            * Vbseff) * tmp2 + T1 - DIBL_Sft;
    *Von = Vth;
 
    dVth_dVb = pParam->BSIM3k1 * dsqrtPhis_dVb - pParam->BSIM3k2
        - dDelt_vth_dVb - dT2_dVb + pParam->BSIM3k3b * tmp2
        - pParam->BSIM3etab * Vds * pParam->BSIM3theta0vb0
        + pParam->BSIM3kt2 * TempRatio;
    dVth_dVd = - dDIBL_Sft_dVd;
 
    // Calculate n

    tmp2 = pParam->BSIM3nfactor * EPSSIL / Xdep;
    tmp3 = pParam->BSIM3cdsc + pParam->BSIM3cdscb * Vbseff
        + pParam->BSIM3cdscd * Vds;
    n = 1.0 + (tmp2 + tmp3 * Theta0 + pParam->BSIM3cit) / cox;
    if (n > 1.0) {
        dn_dVb = (- tmp2 / Xdep * dXdep_dVb + tmp3 * dTheta0_dVb
                + pParam->BSIM3cdscb * Theta0) / cox;
        dn_dVd = pParam->BSIM3cdscd * Theta0 / cox;
    }
    else {
        n = 1.0;
        dn_dVb = dn_dVd = 0.0;
    }
 
    // Poly Gate Si Depletion Effect

    T0 = pParam->BSIM3vfb + pParam->BSIM3phi;
    if ((NGATE > 0.0) && (Vgs > T0)) {
        T1 = 1.0e6 * CHARGE * EPSSIL * pParam->BSIM3ngate
            / (cox * cox);
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
    }
    else {
        Vgs_eff = Vgs;
        dVgs_eff_dVg = 1.0;
    }
    Vgst = Vgs_eff - Vth;
 
    // Effective Vgst (Vgsteff) Calculation

    Vtm = VTM;
    T10 = 2.0 * n * Vtm;
    VgstNVt = Vgst / T10;
    if (VgstNVt < - EXP_THRESHOLD) {
        T1 = T10 * MIN_EXP;
        dT1_dVg = dT1_dVd = dT1_dVb = 0.0;
    }
    else if (VgstNVt > EXP_THRESHOLD) {
        T1 = Vgst;
        dT1_dVg = dVgs_eff_dVg;
        dT1_dVd = - dVth_dVd;
        dT1_dVb = - dVth_dVb;
    }
    else {
        ExpVgst = EXP(VgstNVt);
        T1 = T10 * log(1.0 + ExpVgst);
        dT1_dVg = ExpVgst / (1.0 + ExpVgst);
        dT1_dVb = - dT1_dVg * (dVth_dVb + Vgst / n * dn_dVb)
            + T1 / n * dn_dVb;
        dT1_dVd = - dT1_dVg * (dVth_dVd + Vgst / n * dn_dVd)
            + T1 / n * dn_dVd;
        dT1_dVg *= dVgs_eff_dVg;
    }
 
    T2 = TOX / ((pParam->BSIM3weff / Mdev) + pParam->BSIM3w0);
    ExpArg = (2.0 * pParam->BSIM3voff - Vgst) / T10;
    if (ExpArg < - EXP_THRESHOLD) {
        T2 = 1.0;
        dT2_dVg = dT2_dVd = dT2_dVb = 0.0;
 
    }
    else if (ExpArg > EXP_THRESHOLD) {
        T2 = 1.0 + 2.0 * n * cox / pParam->BSIM3cdep0
            * MAX_EXP;
        dT2_dVg = dT2_dVd = dT2_dVb = 0.0;
    }
    else {
        dT2_dVg = - cox / Vtm / pParam->BSIM3cdep0
            * exp(ExpArg);
        T2 = 1.0 - T10 * dT2_dVg;
        dT2_dVd = - dT2_dVg * (dVth_dVd - 2.0 * Vtm
                * ExpArg * dn_dVd) + (T2 - 1.0) / n * dn_dVd;
        dT2_dVb = - dT2_dVg * (dVth_dVb - 2.0 * Vtm
                * ExpArg * dn_dVb) + (T2 - 1.0) / n * dn_dVb;
        dT2_dVg *= dVgs_eff_dVg;
    }
 
    Vgsteff = T1 / T2;
    dVgsteff_dVg = (T2 * dT1_dVg - T1 * dT2_dVg) / (T2 * T2);
    dVgsteff_dVd = (T2 * dT1_dVd - T1 * dT2_dVd) / (T2 * T2);
    dVgsteff_dVb = (T2 * dT1_dVb - T1 * dT2_dVb) / (T2 * T2);
 
    // Calculate Effective Channel Geometry

    Weff = ((pParam->BSIM3weff / Mdev) - 2.0 * (pParam->BSIM3dwg * Vgsteff
            + pParam->BSIM3dwb * (sqrtPhis - pParam->BSIM3sqrtPhi))) * Mdev;
    dWeff_dVg = -2.0 * pParam->BSIM3dwg;
    dWeff_dVb = -2.0 * pParam->BSIM3dwb * dsqrtPhis_dVb;
 
    if (Weff < 1.0e-8) {
        Weff = 1.0e-8;
        dWeff_dVg = dWeff_dVb = 0;
    }
 
    Rds = pParam->BSIM3rds0 * (1.0 + pParam->BSIM3prwg * Vgsteff
            + pParam->BSIM3prwb * (sqrtPhis - pParam->BSIM3sqrtPhi));
    if (Rds > 0.0) {
        dRds_dVg = pParam->BSIM3rds0 * pParam->BSIM3prwg;
        dRds_dVb = pParam->BSIM3rds0 * pParam->BSIM3prwb * dsqrtPhis_dVb;
    }
    else {
        Rds = dRds_dVg = dRds_dVb = 0.0;
    }
 
    WVCox = Weff * pParam->BSIM3vsattemp * cox;
    WVCoxRds = WVCox * Rds;
 
    // Calculate Abulk

    T0 = 1.0 / (1.0 + pParam->BSIM3keta * Vbseff);
    dT0_dVb = - pParam->BSIM3keta * T0 * T0;
 
    T1 = 0.5 * pParam->BSIM3k1 / sqrtPhis;
    dT1_dVb = - T1 / sqrtPhis * dsqrtPhis_dVb;
 
    tmp1 = Leff + 2.0 * sqrt(pParam->BSIM3xj * Xdep);
    T5 = Leff / tmp1;
    tmp2 = pParam->BSIM3a0 * T5;
    tmp3 = pParam->BSIM3weff + pParam->BSIM3b1;
    tmp4 = pParam->BSIM3b0 / tmp3;
    T2 = tmp2 + tmp4;
    dT2_dVb = - tmp2 / tmp1 * sqrt(pParam->BSIM3xj / Xdep) * dXdep_dVb;
    T6 = T5 * T5;
    T7 = T5 * T6;
    Abulk0 = T0 * (1.0 + T1 * T2);
    if (Abulk0 < 0.01)
        Abulk0 = 0.01;
    T8 = pParam->BSIM3ags * pParam->BSIM3a0 * T7;
    dAbulk_dVg = - T1 * T0 * T8;
    Abulk = Abulk0 + dAbulk_dVg * Vgsteff;
    if (Abulk < 0.01)
        Abulk = 0.01;
    dAbulk0_dVb = T0 * T1 * dT2_dVb + T0 * T2 * dT1_dVb
        + (1.0 + T1 * T2) * dT0_dVb;
    dAbulk_dVb = dAbulk0_dVb - T8 * Vgsteff * (T1 * (3.0 * T0 * dT2_dVb
                / tmp2 + dT0_dVb) + T0 * dT1_dVb);
 
    // Mobility calculation
 
    if (MOBMOD == 1) {
        T0 = Vgsteff + Vth + Vth;
        T2 = pParam->BSIM3ua + pParam->BSIM3uc * Vbseff;
        T3 = T0 / TOX;
        Denomi = 1.0 + T3 * (T2
                + pParam->BSIM3ub * T3);
        T1 = T2 / TOX + 2.0 * pParam->BSIM3ub * T3
            / TOX;
        dDenomi_dVg = T1;
        dDenomi_dVd = T1 * 2.0 * dVth_dVd;
        dDenomi_dVb = T1 * 2.0 * dVth_dVb + pParam->BSIM3uc * T3;
    }
    else if (MOBMOD == 2) {
        Denomi = 1.0 + Vgsteff / TOX * (pParam->BSIM3ua
                + pParam->BSIM3uc * Vbseff + pParam->BSIM3ub * Vgsteff
                / TOX);
        T1 = (pParam->BSIM3ua + pParam->BSIM3uc * Vbseff) / TOX
            + 2.0 * pParam->BSIM3ub / (TOX * TOX)
            * Vgsteff;
        dDenomi_dVg = T1;
        dDenomi_dVd = 0.0;
        dDenomi_dVb = Vgsteff * pParam->BSIM3uc / TOX;
    }
    else {
        T0 = Vgsteff + Vth + Vth;
        T2 = 1.0 + pParam->BSIM3uc * Vbseff;
        T3 = T0 / TOX;
        T4 = T3 * (pParam->BSIM3ua + pParam->BSIM3ub * T3);
        Denomi = 1.0 + T4 * T2;
 
        T1 = (pParam->BSIM3ua / TOX + 2.0 * pParam->BSIM3ub
                * T3 / TOX) * T2;
        dDenomi_dVg = T1;
        dDenomi_dVd = T1 * 2.0 * dVth_dVd;
        dDenomi_dVb = T1 * 2.0 * dVth_dVb + pParam->BSIM3uc * T4;
    }
 
    *Ueff = ueff = pParam->BSIM3u0temp / Denomi;
    dueff_dVg = - ueff / Denomi * dDenomi_dVg;
    dueff_dVd = - ueff / Denomi * dDenomi_dVd;
    dueff_dVb = - ueff / Denomi * dDenomi_dVb;
 
 
    // Saturation Drain Voltage  Vdsat

    Esat = 2.0 * pParam->BSIM3vsattemp / ueff;
    EsatL = Esat * Leff;
    T0 = - EsatL / ueff;
    dEsatL_dVg = T0 * dueff_dVg;
    dEsatL_dVd = T0 * dueff_dVd;
    dEsatL_dVb = T0 * dueff_dVb;
 
    a1 = pParam->BSIM3a1;
    if ((Pmos_factor = a1 * Vgsteff + pParam->BSIM3a2) > 1.0) {
        Pmos_factor = 1.0;
        a1 = 0.0;
    }
 
    Vgst2Vtm = Vgsteff + 2.0 * Vtm;
    if ((Rds == 0.0) && (Pmos_factor == 1.0)) {
        T0 = 1.0 / (Abulk * EsatL + Vgst2Vtm);
        (*Vdsat) = EsatL * Vgst2Vtm * T0;
 
        dT0_dVg = - (Abulk * dEsatL_dVg + EsatL * dAbulk_dVg + 1.0) * T0 * T0;
        dT0_dVd = - (Abulk * dEsatL_dVd) * T0 * T0;
        dT0_dVb = - (Abulk * dEsatL_dVb + dAbulk_dVb * EsatL) * T0 * T0;
 
        dVdsat_dVg = EsatL * Vgst2Vtm * dT0_dVg + EsatL * T0
            + Vgst2Vtm * T0 * dEsatL_dVg;
        dVdsat_dVd = EsatL * Vgst2Vtm * dT0_dVd
            + Vgst2Vtm * T0 * dEsatL_dVd;
        dVdsat_dVb = EsatL * Vgst2Vtm * dT0_dVb
            + Vgst2Vtm * T0 * dEsatL_dVb;
    }
    else {
        tmp1 = a1 / (Pmos_factor * Pmos_factor);
        if (Rds > 0) {
            tmp2 = dRds_dVg / Rds + dWeff_dVg / Weff;
            tmp3 = dRds_dVb / Rds + dWeff_dVb / Weff;
        }
        else {
            tmp2 = dWeff_dVg / Weff;
            tmp3 = dWeff_dVb / Weff;
        }
 
        T0 = 2.0 * Abulk * (Abulk * WVCoxRds - (1.0 - 1.0 / Pmos_factor));
        dT0_dVg = 2.0 * (Abulk * Abulk * WVCoxRds * tmp2 - Abulk * tmp1
                + (2.0 * WVCoxRds * Abulk + (1.0 / Pmos_factor - 1.0))
                * dAbulk_dVg);
 
        dT0_dVb = 2.0 * (Abulk * Abulk * WVCoxRds * (2.0 / Abulk
                    * dAbulk_dVb + tmp3) + (1.0 / Pmos_factor - 1.0)
                * dAbulk_dVb);
        dT0_dVd = 0.0;
        T1 = Vgst2Vtm * (2.0 / Pmos_factor - 1.0) + Abulk
            * EsatL + 3.0 * Abulk * Vgst2Vtm * WVCoxRds;
 
        dT1_dVg = (2.0 / Pmos_factor - 1.0) - 2.0 * Vgst2Vtm * tmp1
            + Abulk * dEsatL_dVg + EsatL * dAbulk_dVg + 3.0 * (Abulk
                * WVCoxRds + Abulk * Vgst2Vtm * WVCoxRds * tmp2 + Vgst2Vtm
                * WVCoxRds * dAbulk_dVg);
        dT1_dVb = Abulk * dEsatL_dVb + EsatL * dAbulk_dVb
            + 3.0 * (Vgst2Vtm * WVCoxRds * dAbulk_dVb
                + Abulk * Vgst2Vtm * WVCoxRds * tmp3);
        dT1_dVd = Abulk * dEsatL_dVd;
 
        T2 = Vgst2Vtm * (EsatL + 2.0 * Vgst2Vtm * WVCoxRds);
        dT2_dVg = EsatL + Vgst2Vtm * dEsatL_dVg + Vgst2Vtm * WVCoxRds
            * (4.0 + 2.0 * Vgst2Vtm * tmp2);
        dT2_dVb = Vgst2Vtm * dEsatL_dVb + 2.0 * Vgst2Vtm * WVCoxRds
            * Vgst2Vtm * tmp3;
        dT2_dVd = Vgst2Vtm * dEsatL_dVd;
 
        T3 = sqrt(T1 * T1 - 2.0 * T0 * T2);
        (*Vdsat) = (T1 - T3) / T0;
 
        dT3_dVg = (T1 * dT1_dVg - 2.0 * (T0 * dT2_dVg + T2 * dT0_dVg))
            / T3;
        dT3_dVd = (T1 * dT1_dVd - 2.0 * (T0 * dT2_dVd + T2 * dT0_dVd))
            / T3;
        dT3_dVb = (T1 * dT1_dVb - 2.0 * (T0 * dT2_dVb + T2 * dT0_dVb))
            / T3;
 
        T4 = T1 - T3;
 
        dVdsat_dVg = (dT1_dVg - (T1 * dT1_dVg - dT0_dVg * T2
                    - T0 * dT2_dVg) / T3 - (*Vdsat) * dT0_dVg) / T0;
        dVdsat_dVb = (dT1_dVb - (T1 * dT1_dVb - dT0_dVb * T2
                    - T0 * dT2_dVb) / T3 - (*Vdsat) * dT0_dVb) / T0;
        dVdsat_dVd = (dT1_dVd - (T1 * dT1_dVd - T0 * dT2_dVd) / T3) / T0;
    }
 
    // Effective Vds (Vdseff) Calculation

    T1 = (*Vdsat) - Vds - pParam->BSIM3delta;
    dT1_dVg = dVdsat_dVg;
    dT1_dVd = dVdsat_dVd - 1.0;
    dT1_dVb = dVdsat_dVb;
 
    T2 = sqrt(T1 * T1 + 4.0 * pParam->BSIM3delta * (*Vdsat));
    T0 = T1 / T2;
    T3 = 2.0 * pParam->BSIM3delta / T2;
    dT2_dVg = T0 * dT1_dVg + T3 * dVdsat_dVg;
    dT2_dVd = T0 * dT1_dVd + T3 * dVdsat_dVd;
    dT2_dVb = T0 * dT1_dVb + T3 * dVdsat_dVb;
 
    Vdseff = (*Vdsat) - 0.5 * (T1 + T2);
    dVdseff_dVg = dVdsat_dVg - 0.5 * (dT1_dVg + dT2_dVg);
    dVdseff_dVd = dVdsat_dVd - 0.5 * (dT1_dVd + dT2_dVd);
    dVdseff_dVb = dVdsat_dVb - 0.5 * (dT1_dVb + dT2_dVb);
 
    // Calculate VAsat

    tmp1 = a1 / (Pmos_factor * Pmos_factor);
    if (Rds > 0) {
        tmp2 = dRds_dVg / Rds + dWeff_dVg / Weff;
        tmp3 = dRds_dVb / Rds + dWeff_dVb / Weff;
    }
    else {
        tmp2 = dWeff_dVg / Weff;
        tmp3 = dWeff_dVb / Weff;
    }
    tmp4 = 1.0 - 0.5 * Abulk * (*Vdsat) / Vgst2Vtm;
    T0 = EsatL + (*Vdsat) + 2.0 * WVCoxRds * Vgsteff * tmp4;
 
    dT0_dVg = dEsatL_dVg + dVdsat_dVg + 2.0 * WVCoxRds * tmp4
        * (1.0 + tmp2 * Vgsteff) - WVCoxRds * Vgsteff / Vgst2Vtm
        * (Abulk * dVdsat_dVg - Abulk * (*Vdsat) / Vgst2Vtm
            + (*Vdsat) * dAbulk_dVg);
 
    dT0_dVb = dEsatL_dVb + dVdsat_dVb + 2.0 * WVCoxRds * tmp4 * tmp3
        * Vgsteff - WVCoxRds * Vgsteff / Vgst2Vtm * (dAbulk_dVb
            * (*Vdsat) + Abulk * dVdsat_dVb);
    dT0_dVd = dEsatL_dVd + dVdsat_dVd - WVCoxRds * Vgsteff / Vgst2Vtm
        * Abulk * dVdsat_dVd;
 
    T1 = 2.0 / Pmos_factor - 1.0 + WVCoxRds * Abulk;
    dT1_dVg = -2.0 * tmp1 + WVCoxRds * (Abulk * tmp2 + dAbulk_dVg);
    dT1_dVb = dAbulk_dVb * WVCoxRds + Abulk * WVCoxRds * tmp3;
 
    Vasat = T0 / T1;
    dVasat_dVg = (dT0_dVg - T0 / T1 * dT1_dVg) / T1;
    dVasat_dVb = (dT0_dVb - T0 / T1 * dT1_dVb) / T1;
    dVasat_dVd = dT0_dVd / T1;
 
    diffVds = Vds - Vdseff;
 
    // Calculate VACLM

    if (pParam->BSIM3pclm > 0.0) {
        T0 = 1.0 / (pParam->BSIM3pclm * Abulk * pParam->BSIM3litl);
        dT0_dVb = - T0 / Abulk * dAbulk_dVb;
        dT0_dVg = - T0 / Abulk * dAbulk_dVg;
 
        T2 = Vgsteff / EsatL;
        T1 = Leff * (Abulk + T2);
        dT1_dVg = Leff * ((1.0 - T2 * dEsatL_dVg) / EsatL + dAbulk_dVg);
        dT1_dVb = Leff * (dAbulk_dVb - T2 * dEsatL_dVb / EsatL);
        dT1_dVd = - T2 * dEsatL_dVd / Esat;
 
        VACLM = T0 * T1 * diffVds;
        dVACLM_dVg = T0 * dT1_dVg * diffVds - T0 * T1 * dVdseff_dVg
            + T1 * diffVds * dT0_dVg;
        dVACLM_dVb = (dT0_dVb * T1 + T0 * dT1_dVb) * diffVds
            - T0 * T1 * dVdseff_dVb;
        dVACLM_dVd = T0 * dT1_dVd * diffVds
            + T0 * T1 * (1.0 - dVdseff_dVd);
    }
    else {
        VACLM = MAX_EXP;
        dVACLM_dVd = dVACLM_dVg = dVACLM_dVb = 0.0;
    }
 
    // Calculate VADIBL

    if (pParam->BSIM3thetaRout > 0.0) {
        T0 = Vgst2Vtm * Abulk * (*Vdsat);
        dT0_dVg = Vgst2Vtm * Abulk * dVdsat_dVg + Abulk * (*Vdsat)
            + Vgst2Vtm * (*Vdsat) * dAbulk_dVg;
        dT0_dVb = Vgst2Vtm * (dAbulk_dVb * (*Vdsat) + Abulk * dVdsat_dVb);
        dT0_dVd = Vgst2Vtm * Abulk * dVdsat_dVd;
 
        T1 = Vgst2Vtm + Abulk * (*Vdsat);
        dT1_dVg = 1.0 + Abulk * dVdsat_dVg + (*Vdsat) * dAbulk_dVg;
        dT1_dVb = Abulk * dVdsat_dVb + dAbulk_dVb * (*Vdsat);
        dT1_dVd = Abulk * dVdsat_dVd;
 
        T2 = pParam->BSIM3thetaRout * (1.0 + pParam->BSIM3pdiblb * Vbseff);
        VADIBL = (Vgst2Vtm - T0 / T1) / T2;
        dVADIBL_dVg = (1.0 - dT0_dVg / T1 + T0 * dT1_dVg / (T1 * T1)) / T2;
        dVADIBL_dVb = ((- dT0_dVb / T1 + T0 * dT1_dVb / (T1 * T1)) - VADIBL
                * pParam->BSIM3thetaRout * pParam->BSIM3pdiblb) / T2;
        dVADIBL_dVd = (- dT0_dVd / T1 + T0 * dT1_dVd / (T1 * T1)) / T2;
    }
    else {
        VADIBL = MAX_EXP;
        dVADIBL_dVd = dVADIBL_dVg = dVADIBL_dVb = 0.0;
    }
 
    // Calculate VA

    T0 = 1.0 + pParam->BSIM3pvag * Vgsteff / EsatL;
    dT0_dVg = pParam->BSIM3pvag * (1.0 - Vgsteff * dEsatL_dVg
            / EsatL) / EsatL;
    dT0_dVb = - pParam->BSIM3pvag * Vgsteff * dEsatL_dVb
        / EsatL / EsatL;
    dT0_dVd = - pParam->BSIM3pvag * Vgsteff * dEsatL_dVd
        / EsatL / EsatL;
 
    tmp1 = VACLM * VACLM;
    tmp2 = VADIBL * VADIBL;
    tmp3 = VACLM + VADIBL;
 
    T1 = VACLM * VADIBL / tmp3;
    tmp3 *= tmp3;
    dT1_dVg = (tmp1 * dVADIBL_dVg + tmp2 * dVACLM_dVg) / tmp3;
    dT1_dVd = (tmp1 * dVADIBL_dVd + tmp2 * dVACLM_dVd) / tmp3;
    dT1_dVb = (tmp1 * dVADIBL_dVb + tmp2 * dVACLM_dVb) / tmp3;
 
    Va = Vasat + T0 * T1;
    dVa_dVg = dVasat_dVg + T1 * dT0_dVg + T0 * dT1_dVg;
    dVa_dVd = dVasat_dVd + T1 * dT0_dVd + T0 * dT1_dVd;
    dVa_dVb = dVasat_dVb + T1 * dT0_dVb + T0 * dT1_dVb;
 
    // Calculate VASCBE
 
    if (pParam->BSIM3pscbe2 > 0.0) {
        if (diffVds > pParam->BSIM3pscbe1 * pParam->BSIM3litl
                    / EXP_THRESHOLD) {
            T0 = pParam->BSIM3pscbe1 * pParam->BSIM3litl / diffVds;
            VASCBE = Leff * exp(T0) / pParam->BSIM3pscbe2;
            T1 = T0 * VASCBE / diffVds;
            dVASCBE_dVg = T1 * dVdseff_dVg;
            dVASCBE_dVd = - T1 * (1.0 - dVdseff_dVd);
            dVASCBE_dVb = T1 * dVdseff_dVb;
        }
        else {
            VASCBE = MAX_EXP * Leff / pParam->BSIM3pscbe2;
            dVASCBE_dVg = dVASCBE_dVd = dVASCBE_dVb = 0.0;
        }
    }
    else {
        VASCBE = MAX_EXP;
        dVASCBE_dVg = dVASCBE_dVd = dVASCBE_dVb = 0.0;
    }
 
    // Calculate Ids

    CoxWovL = cox * Weff / Leff;
    beta = ueff * CoxWovL;
 
    // The following would be needed to use the existing noise models
    // *NoiseBeta = beta;
 
    dbeta_dVg = CoxWovL * dueff_dVg + beta * dWeff_dVg / Weff;
    dbeta_dVd = CoxWovL * dueff_dVd;
    dbeta_dVb = CoxWovL * dueff_dVb + beta * dWeff_dVb / Weff;
 
    T0 = 1.0 - 0.5 * Abulk * Vdseff / Vgst2Vtm;
    dT0_dVg = -0.5 * (Abulk * dVdseff_dVg
            - Abulk * Vdseff / Vgst2Vtm + Vdseff * dAbulk_dVg) / Vgst2Vtm;
    dT0_dVd = -0.5 * Abulk * dVdseff_dVd / Vgst2Vtm;
    dT0_dVb = -0.5 * (Abulk * dVdseff_dVb + dAbulk_dVb * Vdseff)
        / Vgst2Vtm;
 
    fgche1 = Vgsteff * T0;
    dfgche1_dVg = Vgsteff * dT0_dVg + T0;
    dfgche1_dVd = Vgsteff * dT0_dVd;
    dfgche1_dVb = Vgsteff * dT0_dVb;
 
    fgche2 = 1.0 + Vdseff / EsatL;
    dfgche2_dVg = (dVdseff_dVg - Vdseff / EsatL * dEsatL_dVg) / EsatL;
    dfgche2_dVd = (dVdseff_dVd - Vdseff / EsatL * dEsatL_dVd) / EsatL;
    dfgche2_dVb = (dVdseff_dVb - Vdseff / EsatL * dEsatL_dVb) / EsatL;
 
    gche = beta * fgche1 / fgche2;
    dgche_dVg = (beta * dfgche1_dVg + fgche1 * dbeta_dVg
            - gche * dfgche2_dVg) / fgche2;
    dgche_dVd = (beta * dfgche1_dVd + fgche1 * dbeta_dVd
            - gche * dfgche2_dVd) / fgche2;
    dgche_dVb = (beta * dfgche1_dVb + fgche1 * dbeta_dVb
            - gche * dfgche2_dVb) / fgche2;
 
    T0 = 1.0 + gche * Rds;
    Idl = gche * Vdseff / T0;
 
    dIdl_dVg = (gche * dVdseff_dVg + Vdseff * dgche_dVg / T0) / T0
        - Idl * gche / T0 * dRds_dVg;
 
    dIdl_dVd = (gche * dVdseff_dVd + Vdseff * dgche_dVd / T0) / T0;
    dIdl_dVb = (gche * dVdseff_dVb + Vdseff * dgche_dVb / T0
            - Idl * dRds_dVb * gche) / T0;
 
    T0 = 1.0 + diffVds / Va;
    Idsa = Idl * T0;
    dIdsa_dVg = T0 * dIdl_dVg - Idl * (dVdseff_dVg + diffVds / Va
            * dVa_dVg) / Va;
    dIdsa_dVd = T0 * dIdl_dVd + Idl * (1.0 - dVdseff_dVd - diffVds / Va
            * dVa_dVd) / Va;
    dIdsa_dVb = T0 * dIdl_dVb - Idl * (dVdseff_dVb + diffVds / Va
            * dVa_dVb) / Va;
 
    T0 = 1.0 + diffVds / VASCBE;
    Ids = Idsa * T0;
 
    (*Gm) = T0 * dIdsa_dVg - Idsa * (dVdseff_dVg + diffVds / VASCBE
            * dVASCBE_dVg) / VASCBE;
    (*Gds) = T0 * dIdsa_dVd + Idsa * (1.0 - dVdseff_dVd - diffVds / VASCBE
            * dVASCBE_dVd) / VASCBE;
    Gmb = T0 * dIdsa_dVb - Idsa * (dVdseff_dVb + diffVds / VASCBE
            * dVASCBE_dVb) / VASCBE;
 
    (*Gds) += (*Gm) * dVgsteff_dVd;
    Gmb += (*Gm) * dVgsteff_dVb;
    (*Gm) *= dVgsteff_dVg;
    Gmb *= dVbseff_dVb;
 
    // calculate substrate current Isub

    if ((pParam->BSIM3alpha0 <= 0.0) || (pParam->BSIM3beta0 <= 0.0)) {
        isub = Gbd = Gbb = Gbg = 0.0;
    }
    else {
        T2 = pParam->BSIM3alpha0 / Leff;
        if (diffVds < 0.0) {           // added to avoid an FPE when Vds=0
            diffVds = 0.0;
            Vdseff = Vds;
        }
 
        if ((diffVds != 0.0) && ((T0 = - pParam->BSIM3beta0 / diffVds)
                        > - EXP_THRESHOLD)) {
            T1 = T2 * diffVds * exp(T0);
            dT1_dVg = T1 / diffVds * (T0 - 1.0) * dVdseff_dVg;
            dT1_dVd = T1 / diffVds * (1.0 - T0) * (1.0 - dVdseff_dVd);
            dT1_dVb = T1 / diffVds * (T0 - 1.0) * dVdseff_dVb;
        }
        else {
            T1 = T2 * diffVds * MIN_EXP;
            dT1_dVg = - T2 * MIN_EXP * dVdseff_dVg;
            dT1_dVd = T2 * MIN_EXP * (1.0 - dVdseff_dVd);
            dT1_dVb = - T2 * MIN_EXP * dVdseff_dVb;
        }
        isub = T1 * Idsa;
        Gbg = T1 * dIdsa_dVg + Idsa * dT1_dVg;
        Gbd = T1 * dIdsa_dVd + Idsa * dT1_dVd;
        Gbb = T1 * dIdsa_dVb + Idsa * dT1_dVb;
 
        Gbd += Gbg * dVgsteff_dVd;
        Gbb += Gbg * dVgsteff_dVb;
        Gbg *= dVgsteff_dVg;
        Gbg *= dVbseff_dVb;
    }
 
    *Id = Ids;
    *Gmbs = Gmb;
 
    *Gbbs = Gbb;
    *Gbgs = Gbg;
    *Gbds = Gbd;
 
    *Isub -= isub;
    *Isubm = Gbb * Vbseff + Gbd * Vds + Gbg * Vgs;
 
//*************************** end of DC calculations ************************
 
// following are local variables used in charge calcs

#define DELTA_3 0.02
#define DELTA_4 0.02
    double  VbseffCV, dVbseffCV_dVb;
    double  dVfb_dVd;
    double  Cgg, Cgd, Cgb, Cbg, Cbd, Cbb;
    double  AbulkCV, dAbulkCV_dVb;
    double  VdsatCV, dVdsatCV_dVg, dVdsatCV_dVb;
    double  Cgg1, Cgb1, Cgd1, Cbg1, Cbb1, Cbd1;
    double  qsrc;
    double  Csg, Csb, Csd;
    double  V3, V4;
    double  Vfbeff, dVfbeff_dVd, dVfbeff_dVg, dVfbeff_dVb;
    double  Qac0, dQac0_dVg, dQac0_dVd, dQac0_dVb;
    double  Qsub0, dQsub0_dVg, dQsub0_dVd, dQsub0_dVb;
    double  VdseffCV, dVdseffCV_dVg, dVdseffCV_dVd, dVdseffCV_dVb;
    double  gtau_drift, gtau_diff;
 
    // Calculate Qinv for Noise analysis
 
    T1 = Vgsteff * (1.0 - 0.5 * Abulk * Vdseff / Vgst2Vtm);
    *Qinv = - cox * Weff * Leff * T1;
 
    // charge calculations
 
    *Von = Vth;
 
    if ((XPART < 0) || (! ChargeComputationNeeded)) {
 
        *Qg = *Qd = *Qb = 0.0;
        *Cggb = *Cgsb = *Cgdb = 0.0;
        *Cdgb = *Cdsb = *Cddb = 0.0;
        *Cbgb = *Cbsb = *Cbdb = 0.0;
        *Cqdb = *Cqsb = *Cqgb = *Cqbb = 0.0;
        *Gtau = 0.0;

        // SPICE3 does goto finished; -- don't need this because next else goes
        // there.
    }
    else {
        if (Vbseff < 0.0) {
            VbseffCV = Vbseff;
            dVbseffCV_dVb = 1.0;
        }
        else {
            VbseffCV = pParam->BSIM3phi - Phis;
            dVbseffCV_dVb = - dPhis_dVb;
        }
 
        CoxWL = cox * pParam->BSIM3weffCV
            * pParam->BSIM3leffCV;
        Vfb = Vth - pParam->BSIM3phi - pParam->BSIM3k1 * sqrtPhis;
 
        dVfb_dVb = dVth_dVb - pParam->BSIM3k1 * dsqrtPhis_dVb;
        dVfb_dVd = dVth_dVd;
 
        if ((VgstNVt > - EXP_THRESHOLD) && (VgstNVt < EXP_THRESHOLD)) {
            ExpVgst *= ExpVgst;
            Vgsteff = n * Vtm * log(1.0 + ExpVgst);
            dVgsteff_dVg = ExpVgst / (1.0 + ExpVgst);
            dVgsteff_dVd = - dVgsteff_dVg * (dVth_dVd + (Vgs_eff - Vth)
                    / n * dn_dVd) + Vgsteff / n * dn_dVd;
            dVgsteff_dVb = - dVgsteff_dVg * (dVth_dVb + (Vgs_eff - Vth)
                    / n * dn_dVb) + Vgsteff / n * dn_dVb;
            dVgsteff_dVg *= dVgs_eff_dVg;
        }
 
        if (CAPMOD == 1) {
            Arg1 = Vgs_eff - VbseffCV - Vfb;
 
            if (Arg1 <= 0.0) {
                qgate = CoxWL * (Arg1 - Vgsteff);
                Cgg = CoxWL * (dVgs_eff_dVg - dVgsteff_dVg);
                Cgd = - CoxWL * (dVfb_dVd + dVgsteff_dVd);
                Cgb = - CoxWL * (dVfb_dVb + dVbseffCV_dVb + dVgsteff_dVb);
            }
            else {
                T0 = 0.5 * pParam->BSIM3k1;
                T1 = sqrt(T0 * T0 + Arg1 - Vgsteff);
                qgate = CoxWL * pParam->BSIM3k1 * (T1 - T0);
 
                T2 = CoxWL * T0 / T1;
                Cgg = T2 * (dVgs_eff_dVg - dVgsteff_dVg);
                Cgd = - T2 * (dVfb_dVd + dVgsteff_dVd);
                Cgb = - T2 * (dVfb_dVb + dVbseffCV_dVb + dVgsteff_dVb);
            }
            qbulk = - qgate;
            Cbg = - Cgg;
            Cbd = - Cgd;
            Cbb = - Cgb;
 
            One_Third_CoxWL = CoxWL / 3.0;
            Two_Third_CoxWL = 2.0 * One_Third_CoxWL;
            AbulkCV = Abulk0 * pParam->BSIM3abulkCVfactor;
            dAbulkCV_dVb = pParam->BSIM3abulkCVfactor * dAbulk0_dVb;
            VdsatCV = Vgsteff / AbulkCV;
            if (VdsatCV <= Vds) {
                dVdsatCV_dVg = 1.0 / AbulkCV;
                dVdsatCV_dVb = - VdsatCV * dAbulkCV_dVb / AbulkCV;
                T0 = Vgsteff - VdsatCV / 3.0;
                dT0_dVg = 1.0 - dVdsatCV_dVg / 3.0;
                dT0_dVb = - dVdsatCV_dVb / 3.0;
                qgate += CoxWL * T0;
                Cgg1 = CoxWL * dT0_dVg;
                Cgb1 = CoxWL * dT0_dVb + Cgg1 * dVgsteff_dVb;
                Cgd1 = Cgg1 * dVgsteff_dVd;
                Cgg1 *= dVgsteff_dVg;
                Cgg += Cgg1;
                Cgb += Cgb1;
                Cgd += Cgd1;
 
                T0 = VdsatCV - Vgsteff;
                dT0_dVg = dVdsatCV_dVg - 1.0;
                dT0_dVb = dVdsatCV_dVb;
                qbulk += One_Third_CoxWL * T0;
                Cbg1 = One_Third_CoxWL * dT0_dVg;
                Cbb1 = One_Third_CoxWL * dT0_dVb + Cbg1 * dVgsteff_dVb;
                Cbd1 = Cbg1 * dVgsteff_dVd;
                Cbg1 *= dVgsteff_dVg;
                Cbg += Cbg1;
                Cbb += Cbb1;
                Cbd += Cbd1;
 
                if (XPART > 0.5)
                    T0 = - Two_Third_CoxWL;
                else if (XPART < 0.5)
                    T0 = -0.4 * CoxWL;
                else
                    T0 = - One_Third_CoxWL;
 
                qsrc = T0 * Vgsteff;
                Csg = T0 * dVgsteff_dVg;
                Csb = T0 * dVgsteff_dVb;
                Csd = T0 * dVgsteff_dVd;
                Cgb *= dVbseff_dVb;
                Cbb *= dVbseff_dVb;
                Csb *= dVbseff_dVb;
            }
            else {
                T0 = AbulkCV * Vds;
                T1 = 12.0 * (Vgsteff - 0.5 * T0);
                T2 = Vds / T1;
                T3 = T0 * T2;
                dT3_dVg = -12.0 * T2 * T2 * AbulkCV;
                dT3_dVd = 6.0 * T0 * (4.0 * Vgsteff - T0) / T1 / T1 - 0.5;
                dT3_dVb = 12.0 * T2 * T2 * dAbulkCV_dVb * Vgsteff;
 
                qgate += CoxWL * (Vgsteff - 0.5 * Vds + T3);
                Cgg1 = CoxWL * (1.0 + dT3_dVg);
                Cgb1 = CoxWL * dT3_dVb + Cgg1 * dVgsteff_dVb;
                Cgd1 = CoxWL * dT3_dVd + Cgg1 * dVgsteff_dVd;
                Cgg1 *= dVgsteff_dVg;
                Cgg += Cgg1;
                Cgb += Cgb1;
                Cgd += Cgd1;
 
                qbulk += CoxWL * (1.0 - AbulkCV) * (0.5 * Vds - T3);
                Cbg1 = - CoxWL * ((1.0 - AbulkCV) * dT3_dVg);
                Cbb1 = - CoxWL * ((1.0 - AbulkCV) * dT3_dVb
                        + (0.5 * Vds - T3) * dAbulkCV_dVb)
                    + Cbg1 * dVgsteff_dVb;
                Cbd1 = - CoxWL * (1.0 - AbulkCV) * dT3_dVd
                    + Cbg1 * dVgsteff_dVd;
                Cbg1 *= dVgsteff_dVg;
                Cbg += Cbg1;
                Cbb += Cbb1;
                Cbd += Cbd1;
 
                if (XPART > 0.5) {
                    // 0/100 Charge petition model
                    T1 = T1 + T1;
                    qsrc = - CoxWL * (0.5 * Vgsteff + 0.25 * T0
                            - T0 * T0 / T1);
                    Csg = - CoxWL * (0.5 + 24.0 * T0 * Vds / T1 / T1
                            * AbulkCV);
                    Csb = - CoxWL * (0.25 * Vds * dAbulkCV_dVb
                            - 12.0 * T0 * Vds / T1 / T1 * (4.0 * Vgsteff - T0)
                            * dAbulkCV_dVb) + Csg * dVgsteff_dVb;
                    Csd = - CoxWL * (0.25 * AbulkCV - 12.0 * AbulkCV * T0
                            / T1 / T1 * (4.0 * Vgsteff - T0))
                        + Csg * dVgsteff_dVd;
                    Csg *= dVgsteff_dVg;
                }
                else if (XPART < 0.5) {
                    // 40/60 Charge petition model
                    T1 = T1 / 12.0;
                    T2 = 0.5 * CoxWL / (T1 * T1);
                    T3 = Vgsteff * (2.0 * T0 * T0 / 3.0 + Vgsteff
                            * (Vgsteff - 4.0 * T0 / 3.0))
                        - 2.0 * T0 * T0 * T0 / 15.0;
                    qsrc = - T2 * T3;
                    T4 = 4.0 / 3.0 * Vgsteff * (Vgsteff - T0)
                        + 0.4 * T0 * T0;
                    Csg = -2.0 * qsrc / T1 - T2 * (Vgsteff * (3.0
                                * Vgsteff - 8.0 * T0 / 3.0)
                            + 2.0 * T0 * T0 / 3.0);
                    Csb = (qsrc / T1 * Vds + T2 * T4 * Vds) * dAbulkCV_dVb
                        + Csg * dVgsteff_dVb;
                    Csd = (qsrc / T1 + T2 * T4) * AbulkCV
                        + Csg * dVgsteff_dVd;
                    Csg *= dVgsteff_dVg;
                }
                else {
                    // 50/50 Charge petition model
                    qsrc = -0.5 * (qgate + qbulk);
                    Csg = -0.5 * (Cgg1 + Cbg1);
                    Csb = -0.5 * (Cgb1 + Cbb1);
                    Csd = -0.5 * (Cgd1 + Cbd1);
                }
                Cgb *= dVbseff_dVb;
                Cbb *= dVbseff_dVb;
                Csb *= dVbseff_dVb;
            }
            qdrn = - (qgate + qbulk + qsrc);
            *Cggb = Cgg;
            *Cgsb = - (Cgg + Cgd + Cgb);
            *Cgdb = Cgd;
            *Cdgb = - (Cgg + Cbg + Csg);
            *Cdsb = (Cgg + Cgd + Cgb + Cbg + Cbd + Cbb
                    + Csg + Csd + Csb);
            *Cddb = - (Cgd + Cbd + Csd);
            *Cbgb = Cbg;
            *Cbsb = - (Cbg + Cbd + Cbb);
            *Cbdb = Cbd;
        }
        else {
            V3 = Vfb - Vgs_eff + VbseffCV - DELTA_3;
            if (Vfb <= 0.0) {
                T0 = sqrt(V3 * V3 - 4.0 * DELTA_3 * Vfb);
                T2 = - DELTA_3 / T0;
            }
            else {
                T0 = sqrt(V3 * V3 + 4.0 * DELTA_3 * Vfb);
                T2 = DELTA_3 / T0;
            }
 
            T1 = 0.5 * (1.0 + V3 / T0);
            Vfbeff = Vfb - 0.5 * (V3 + T0);
            dVfbeff_dVd = (1.0 - T1 - T2) * dVfb_dVd;
            dVfbeff_dVg = T1 * dVgs_eff_dVg;
            dVfbeff_dVb = (1.0 - T1 - T2) * dVfb_dVb
                - T1 * dVbseffCV_dVb;
            Qac0 = CoxWL * (Vfbeff - Vfb);
            dQac0_dVg = CoxWL * dVfbeff_dVg;
            dQac0_dVd = CoxWL * (dVfbeff_dVd - dVfb_dVd);
            dQac0_dVb = CoxWL * (dVfbeff_dVb - dVfb_dVb);
 
            T0 = 0.5 * pParam->BSIM3k1;
            T1 = sqrt(T0 * T0 + Vgs_eff - Vfbeff - VbseffCV - Vgsteff);
 
            Qsub0 = CoxWL * pParam->BSIM3k1 * (T1 - T0);
 
            T2 = CoxWL * T0 / T1;
            dQsub0_dVg = T2 * (dVgs_eff_dVg - dVfbeff_dVg - dVgsteff_dVg);
            dQsub0_dVd = - T2 * (dVfbeff_dVd + dVgsteff_dVd);
            dQsub0_dVb = - T2 * (dVfbeff_dVb + dVbseffCV_dVb
                    + dVgsteff_dVb);
 
            One_Third_CoxWL = CoxWL / 3.0;
            Two_Third_CoxWL = 2.0 * One_Third_CoxWL;
            AbulkCV = Abulk0 * pParam->BSIM3abulkCVfactor;
            dAbulkCV_dVb = pParam->BSIM3abulkCVfactor * dAbulk0_dVb;
            VdsatCV = Vgsteff / AbulkCV;
 
            V4 = VdsatCV - Vds - DELTA_4;
            T0 = sqrt(V4 * V4 + 4.0 * DELTA_4 * VdsatCV);
            VdseffCV = VdsatCV - 0.5 * (V4 + T0);
            T1 = 0.5 * (1.0 + V4 / T0);
            T2 = DELTA_4 / T0;
            T3 = (1.0 - T1 - T2) / AbulkCV;
            dVdseffCV_dVg = T3;
            dVdseffCV_dVd = T1;
            dVdseffCV_dVb = - T3 * VdsatCV * dAbulkCV_dVb;
 
            T0 = AbulkCV * VdseffCV;
            T1 = 12.0 * (Vgsteff - 0.5 * T0 + 1e-20);
            T2 = VdseffCV / T1;
            T3 = T0 * T2;
 
            T4 = (1.0 - 12.0 * T2 * T2 * AbulkCV);
            T5 = (6.0 * T0 * (4.0 * Vgsteff - T0) / (T1 * T1) - 0.5);
            T6 = 12.0 * T2 * T2 * Vgsteff;
 
            qgate = CoxWL * (Vgsteff - 0.5 * VdseffCV + T3);
            Cgg1 = CoxWL * (T4 + T5 * dVdseffCV_dVg);
            Cgd1 = CoxWL * T5 * dVdseffCV_dVd + Cgg1 * dVgsteff_dVd;
            Cgb1 = CoxWL * (T5 * dVdseffCV_dVb + T6 * dAbulkCV_dVb)
                + Cgg1 * dVgsteff_dVb;
            Cgg1 *= dVgsteff_dVg;
 
            T7 = 1.0 - AbulkCV;
            qbulk = CoxWL * T7 * (0.5 * VdseffCV - T3);
            T4 = - T7 * (T4 - 1.0);
            T5 = - T7 * T5;
            T6 = - (T7 * T6 + (0.5 * VdseffCV - T3));
            Cbg1 = CoxWL * (T4 + T5 * dVdseffCV_dVg);
            Cbd1 = CoxWL * T5 * dVdseffCV_dVd + Cbg1 * dVgsteff_dVd;
            Cbb1 = CoxWL * (T5 * dVdseffCV_dVb + T6 * dAbulkCV_dVb)
                + Cbg1 * dVgsteff_dVb;
            Cbg1 *= dVgsteff_dVg;
 
            if (XPART > 0.5) {
                // 0/100 Charge petition model
                T1 = T1 + T1;
                qsrc = - CoxWL * (0.5 * Vgsteff + 0.25 * T0
                        - T0 * T0 / T1);
                T7 = (4.0 * Vgsteff - T0) / (T1 * T1);
                T4 = - (0.5 + 24.0 * T0 * T0 / (T1 * T1));
                T5 = - (0.25 * AbulkCV - 12.0 * AbulkCV * T0 * T7);
                T6 = - (0.25 * VdseffCV - 12.0 * T0 * VdseffCV * T7);
                Csg = CoxWL * (T4 + T5 * dVdseffCV_dVg);
                Csd = CoxWL * T5 * dVdseffCV_dVd + Csg * dVgsteff_dVd;
                Csb = CoxWL * (T5 * dVdseffCV_dVb + T6 * dAbulkCV_dVb)
                    + Csg * dVgsteff_dVb;
                Csg *= dVgsteff_dVg;
            }
            else if (XPART < 0.5) {
                // 40/60 Charge petition model
                T1 = T1 / 12.0;
                T2 = 0.5 * CoxWL / (T1 * T1);
                T3 = Vgsteff * (2.0 * T0 * T0 / 3.0 + Vgsteff
                        * (Vgsteff - 4.0 * T0 / 3.0))
                    - 2.0 * T0 * T0 * T0 / 15.0;
                qsrc = - T2 * T3;
                T7 = 4.0 / 3.0 * Vgsteff * (Vgsteff - T0)
                    + 0.4 * T0 * T0;
                T4 = -2.0 * qsrc / T1 - T2 * (Vgsteff * (3.0
                            * Vgsteff - 8.0 * T0 / 3.0)
                        + 2.0 * T0 * T0 / 3.0);
                T5 = (qsrc / T1 + T2 * T7) * AbulkCV;
                T6 = (qsrc / T1 * VdseffCV + T2 * T7 * VdseffCV);
                Csg = (T4 + T5 * dVdseffCV_dVg);
                Csd = T5 * dVdseffCV_dVd + Csg * dVgsteff_dVd;
                Csb = (T5 * dVdseffCV_dVb + T6 * dAbulkCV_dVb)
                    + Csg * dVgsteff_dVb;
                Csg *= dVgsteff_dVg;
            }
            else {
                // 50/50 Charge petition model
                qsrc = -0.5 * (qgate + qbulk);
                Csg = -0.5 * (Cgg1 + Cbg1);
                Csb = -0.5 * (Cgb1 + Cbb1);
                Csd = -0.5 * (Cgd1 + Cbd1);
            }
 
            qgate += Qac0 + Qsub0;
            qbulk -= (Qac0 + Qsub0);
            qdrn = - (qgate + qbulk + qsrc);
 
            Cgg = dQac0_dVg + dQsub0_dVg + Cgg1;
            Cgd = dQac0_dVd + dQsub0_dVd + Cgd1;
            Cgb = dQac0_dVb + dQsub0_dVb + Cgb1;
 
            Cbg = Cbg1 - dQac0_dVg - dQsub0_dVg;
            Cbd = Cbd1 - dQac0_dVd - dQsub0_dVd;
            Cbb = Cbb1 - dQac0_dVb - dQsub0_dVb;
 
            Cgb *= dVbseff_dVb;
            Cbb *= dVbseff_dVb;
            Csb *= dVbseff_dVb;
 
            *Cggb = Cgg;
            *Cgsb = - (Cgg + Cgd + Cgb);
            *Cgdb = Cgd;
            *Cdgb = - (Cgg + Cbg + Csg);
            *Cdsb = (Cgg + Cgd + Cgb + Cbg + Cbd + Cbb
                    + Csg + Csd + Csb);
            *Cddb = - (Cgd + Cbd + Csd);
            *Cbgb = Cbg;
            *Cbsb = - (Cbg + Cbd + Cbb);
            *Cbdb = Cbd;
 
        }
 
        // Non-quasi-static Model
 
        if (NQSMOD) {
            *Qcheq = - qbulk - qgate;
            qbulk = qgate = qdrn = qsrc = 0.0;
 
            *Cqgb = - (*Cggb + *Cbgb);
            *Cqdb = - (*Cgdb + *Cbdb);
            *Cqsb = - (*Cgsb + *Cbsb);
            *Cqbb = *Cggb + *Cgdb
                + *Cgsb + *Cbgb
                + *Cbdb + *Cbsb;
 
            *Cggb = *Cgsb = *Cgdb = 0.0;
            *Cdgb = *Cdsb = *Cddb = 0.0;
            *Cbgb = *Cbsb = *Cbdb = 0.0;
 
            T0 = pParam->BSIM3leffCV * pParam->BSIM3leffCV;
            *Tconst = pParam->BSIM3u0temp * pParam->BSIM3elm
                / CoxWL / T0;
 
            if (*Qcheq == 0.0)
                *Tconst = 0.0;
            else if (*Qcheq < 0.0)
                *Tconst = - (*Tconst);
 
            gtau_drift = fabs(*Tconst **Qcheq);
            gtau_diff = 16.0 * pParam->BSIM3u0temp * VTM / T0;
 
            *Gtau = gtau_drift + gtau_diff;
        }
        else {
            *Cqgb = *Cqdb = *Cqsb = *Cqbb = 0.0;
            *Gtau = 0.0;
        }
 
        *Qg = qgate;
        *Qd = qdrn;
        *Qb = qbulk;
 
    }                                  // End of charge calculations
 
    // finished: ; (SPICE3 does a goto to get here, but it's not needed)
 
    // done with charge calculations
 
#ifdef BSIM3_DEBUG
    ToOutFile("EXIT MOS7\n");
#endif
 
}
//************************* end of charge calculations **********************
 
 
void MOS7cap(
         int capMod,                   // (R) Model flag
         double ckappa,                // (R) Capacitance coefficient
         double weffCV,                // (R) Effective width
         double Vgd,                   // (R) Terminal voltages
         double Vgs,                   // (R) Terminal voltages
         double Vgb,                   // (R) Terminal voltages
         double Cgdl,                  // (R) Capacitances
         double Cgsl,                  // (R) Capacitances
         double CgdOvl,                // (R) Overlap capacitances
         double CgsOvl,                // (R) Overlap capacitances
         double CgbOvl,                // (R) Overlap capacitances
         double *Qgat,                 // (R/W) Charges
         double *Qsub,                 // (R/W) Charges
         double *Qdrn,                 // (R/W) Charges
         double *Qsrc,                 // (R/W) Charges
         double *Cggb,                 // (R/W) Capacitances
         double *Cgdb,                 // (R/W) Capacitances
         double *Cgsb,                 // (R/W) Capacitances
         double *Cbgb,                 // (R/W) Capacitances
         double *Cbdb,                 // (R/W) Capacitances
         double *Cbsb,                 // (R/W) Capacitances
         double *Cdgb,                 // (R/W) Capacitances
         double *Cddb,                 // (R/W) Capacitances
         double *Cdsb,                 // (R/W) Capacitances
         double *Csgb,                 // (R/W) Capacitances
         double *Csdb,                 // (R/W) Capacitances
         double *Cssb,                 // (R/W) Capacitances
         double Cqgb,                  // (R) Capacitances
         double Cqbb,                  // (R) Capacitances
         double Cqdb,                  // (R) Capacitances
         double Cqsb,                  // (R) Capacitances
         double Tconst,                // (R) Temperature factor
         double Qdef,                  // (R) Charges
         double *Gtg,                  // (R/W) Conductances
         double *Gtb,                  // (R/W) Conductances
         double *Gtd,                  // (R/W) Conductances
         double *Gts)                  // (R/W) Conductances
/*****************************************************************************
*
* Purpose
*   Calculate MOS7 total terminal charges and capacitances, incl. overlap
*
* Returned value
*
* Discussion
*
* Author
*   dec - 13 Jun 97 - initial release.
*****************************************************************************/
 
{
#define DELTA_1 0.02
    double  T0, T1, T2, T3, T4;
    double  cgdo = CgdOvl, cgso = CgsOvl;
    double  qgdo, qgso;
 
    if (capMod == 1) {
        if (Vgd < 0.0) {
            T1 = sqrt(1.0 - 4.0 * Vgd / ckappa);
            CgdOvl = cgdo + weffCV * Cgdl / T1;
            qgdo = cgdo * Vgd - weffCV * 0.5
                * Cgdl * ckappa * (T1 - 1.0);
        }
        else {
            CgdOvl = cgdo + weffCV * Cgdl;
            qgdo = (weffCV * Cgdl + cgdo) * Vgd;
        }
 
        if (Vgs < 0.0) {
            T1 = sqrt(1.0 - 4.0 * Vgs / ckappa);
            CgsOvl = cgso + weffCV * Cgsl / T1;
            qgso = cgso * Vgs - weffCV * 0.5
                * Cgsl * ckappa * (T1 - 1.0);
        }
        else {
            CgsOvl = cgso + weffCV * Cgsl;
            qgso = (weffCV * Cgsl + cgso) * Vgs;
        }
    }
    else {
        T0 = Vgd + DELTA_1;
        T1 = sqrt(T0 * T0 + 4.0 * DELTA_1);
        T2 = 0.5 * (T0 - T1);
 
        T3 = weffCV * Cgdl;
        T4 = sqrt(1.0 - 4.0 * T2 / ckappa);
        CgdOvl = cgdo + T3 - T3 * (1.0 - 1.0 / T4)
            * (0.5 - 0.5 * T0 / T1);
        qgdo = (cgdo + T3) * Vgd - T3 * (T2
                + 0.5 * ckappa * (T4 - 1.0));
 
        T0 = Vgs + DELTA_1;
        T1 = sqrt(T0 * T0 + 4.0 * DELTA_1);
        T2 = 0.5 * (T0 - T1);
        T3 = weffCV * Cgsl;
        T4 = sqrt(1.0 - 4.0 * T2 / ckappa);
        CgsOvl = cgso + T3 - T3 * (1.0 - 1.0 / T4)
            * (0.5 - 0.5 * T0 / T1);
        qgso = (cgso + T3) * Vgs - T3 * (T2
                + 0.5 * ckappa * (T4 - 1.0));
    }
 
    *Csgb = - (*Cggb + *Cbgb + *Cdgb + CgsOvl);
    *Csdb = - (*Cgdb + *Cbdb + *Cddb);
    *Cssb = - (*Cgsb + *Cbsb + *Cdsb - CgsOvl);
 
    *Cdgb = *Cdgb - CgdOvl;
    *Cddb = *Cddb + CgdOvl;
 
    *Cggb = *Cggb + CgdOvl + CgsOvl + CgbOvl;
    *Cgdb = *Cgdb - CgdOvl;
    *Cgsb = *Cgsb - CgsOvl;
 
    *Cbgb = *Cbgb - CgbOvl;
 
    T0 = Tconst * Qdef;
    *Gtg = T0 * Cqgb;
    *Gtb = T0 * Cqbb;
    *Gtd = T0 * Cqdb;
    *Gts = T0 * Cqsb;
 
    double                             // calc. total terminal charge
            qgd = qgdo,
            qgs = qgso,
            qgb = CgbOvl * Vgb;
 
    *Qgat += qgd + qgs + qgb;
    *Qsub -= qgb;
    *Qdrn -= qgd;
    *Qsrc = - (*Qgat + *Qsub + *Qdrn);
}                                      // done
