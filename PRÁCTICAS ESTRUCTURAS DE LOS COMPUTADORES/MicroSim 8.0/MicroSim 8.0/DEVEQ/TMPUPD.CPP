/* tmpupd.c
 *   $Revision:   1.62  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:45:08  $ */
 
#include "mslib.h"
#include "constant.h"
#include "tran.h"
#include "options.h"
#include "dev.h"
#include "b.h"
#include "d.h"
#include "j.h"
#include "m.h"
#include "q.h"
#include "mserrors.h"
 
//#define BSIM3_DEBUG
//#define BSIM3_TEMP
 
void B_TmpMod(                        /* Update ONE model to a new temperature*/
     struct B_ *mod,                  /* model to be processed                */
     double Told,                     /* Temperature models have now          */
     double Tnew,                     /* Temperature models will have on exit */
     double tnom)                     /* nominal temperature                  */
/*****************************************************************************
* Purpose
*   Do temperature updating for ONE B model
*   This includes printing and checking updated values
*
* Return Value: NONE
*
* Discussion
*   Taken from a switch/case construct in Tmp1Mod().
*
* Author
*   dec - 19 Sep 96 - created from inline code in Tmp1Mod
*   dec - 16 Dec 96 - Logic for printing report to .OUT now implemented
*                     generically for all Device Equations models using
*                     TmpModReport()
*
*****************************************************************************/
{
    double  oldpb, pbo, gmaold, gmanew, pbrat, oldcjf, newcjf,
            vt = Tnew * BOLTZ / CHARGE,
            reftmp = 27 + CTOK,        /* explicitly 27'C                     */
            vtref = reftmp * BOLTZ / CHARGE,
            vt1 = Told * BOLTZ / CHARGE,
            eg = EGFET(Tnew),
            eg1 = EGFET(Told),
            egref = EGFET(reftmp),
            arg = egref / vtref - eg / vt,
            arg1 = egref / vtref - eg1 / vt1,
            fact2 = Tnew / reftmp,
            fact1 = Told / reftmp,
            pbfact = - vt * (3 * log(fact2) + arg),
            pbfat1 = - vt1 * (3 * log(fact1) + arg1),
            t_dif = Tnew - Told,
            t_rat = Tnew / Told;
 
    MDLPARM & LEVEL = (mod->B_level);
    MDLPARM & VTO = (mod->B_vto);
    MDLPARM & VTO_TC = (mod->B_vtotc);
    MDLPARM & BETA = (mod->B_beta);
    MDLPARM & BETA_TCE = (mod->B_betatce);
    MDLPARM & EG = (mod->B_eg);
    MDLPARM & XTI = (mod->B_xti);
    MDLPARM & RG = (mod->B_rg);
    MDLPARM & RD = (mod->B_rd);
    MDLPARM & RS = (mod->B_rs);
    MDLPARM & TRG1 = (mod->B_trg1);
    MDLPARM & TRD1 = (mod->B_trd1);
    MDLPARM & TRS1 = (mod->B_trs1);
    MDLPARM & CGD = (mod->B_cgd);
    MDLPARM & CGS = (mod->B_cgs);
    MDLPARM & VMAX = (mod->B_vmax);
    MDLPARM & IS = (mod->B_is);
    MDLPARM & M = (mod->B_m);
    MDLPARM & N = (mod->B_n);
    MDLPARM & VBI = (mod->B_vbi);
    MDLPARM & GAMMA = (mod->B_gamma);
    MDLPARM & GAMMATC = (mod->B_gammatc);
    MDLPARM & ALPHA = (mod->B_alpha);
    MDLPARM & ALPHATCE = (mod->B_alphatce);
    MDLPARM & CGSTCE = (mod->B_cgstce);
    MDLPARM & CGDTCE = (mod->B_cgdtce);
    MDLPARM & VBITC = (mod->B_vbitc);
 
    VTO += FLOAT(VTO_TC * t_dif);                /* VTO_TC is V/degree        */
    BETA *= FLOAT(pow(1.01, BETA_TCE * t_dif));  /* BETA_TCE is %/degree      */
 
 
    IS *= FLOAT(exp(EG / (N * vt) * (t_rat - 1))
              * pow(t_rat, (double) (XTI) / N));
 
/* update RS, RD, RS (which are stored as conductances) */
 
    RG *= FLOAT(1 + (Told - tnom) * TRG1);
    RG /= FLOAT(1 + (Tnew - tnom) * TRG1);
 
    RD *= FLOAT(1 + (Told - tnom) * TRD1);
    RD /= FLOAT(1 + (Tnew - tnom) * TRD1);
 
    RS *= FLOAT(1 + (Told - tnom) * TRS1);
    RS /= FLOAT(1 + (Tnew - tnom) * TRS1);
 
    if (LEVEL != 5) {
 
/* calculate Cgs, Cgd & Vbi for Tref */
 
        oldpb = VBI;
        pbo = (VBI - pbfat1) / fact1;
        gmaold = (VBI - pbo) / pbo;
        oldcjf = 1 + M * (.0004 * (Told - reftmp) - gmaold);
        CGS /= FLOAT(oldcjf);
        CGD /= FLOAT(oldcjf);
 
/* calculate new Cgs, Cgd & Pb */
 
        VBI = FLOAT(fact2 * pbo + pbfact);
        gmanew = (VBI - pbo) / pbo;
        newcjf = 1 + M * (.0004 * (Tnew - reftmp) - gmanew);
        CGS *= FLOAT(newcjf);
        CGD *= FLOAT(newcjf);
 
        pbrat = VBI / oldpb;
 
        mod->B_fc *= FLOAT(pbrat);     /* really fc*pb                        */
        mod->B_f1 *= pbrat;
 
        mod->B_vcrit = N * vt * log(N * vt / (IS * ROOT2));
    }
    else {                             /* TOM-2 Model                         */
 
        ALPHA *= FLOAT(pow(1.01, ALPHATCE * t_dif));
        GAMMA += FLOAT(GAMMATC * t_dif);
        VBI += FLOAT(VBITC * t_dif);
        VMAX += FLOAT(VBITC * t_dif);
        CGS /= FLOAT(1 + (Told - tnom) * CGSTCE);
        CGS *= FLOAT(1 + (Tnew - tnom) * CGSTCE);
        CGD /= FLOAT(1 + (Told - tnom) * CGDTCE);
        CGD *= FLOAT(1 + (Tnew - tnom) * CGDTCE);
    }
 
    TmpModReport("VTO", VTO);
    TmpModReport("BETA", BETA);
    TmpModReport("IS", IS);
    TmpModReport("VBI", VBI);
    TmpModReport("CGS", CGS);
    TmpModReport("CGD", CGD);
    TmpModReport("RG", FLOAT(RG == 0. ? 0. : 1 / RG));
    TmpModReport("RD", FLOAT(RD == 0. ? 0. : 1 / RD));
    TmpModReport("RS", FLOAT(RS == 0. ? 0. : 1 / RS));
    if (LEVEL == 5) {
        TmpModReport("ALPHA", ALPHA);
        TmpModReport("GAMMA", GAMMA);
        TmpModReport("VMAX", VMAX);
    }
    TmpModEndReport();
 
    if (CGS < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_001);
        SimError(FATAL_ERROR, "Model %s has negative CGS\n", mod->B_name);
    }
    if (CGD < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_002);
        SimError(FATAL_ERROR, "Model %s has negative CGD\n", mod->B_name);
    }
}
 
void D_TmpMod(                        /* Update ONE model to a new temperature*/
     struct D_ *mod,                  /* model to be processed                */
     double Told,                     /* Temperature models have now          */
     double Tnew,                     /* Temperature models will have on exit */
     double tnom)                     /* nominal temperature                  */
/*****************************************************************************
* Purpose
*   Do temperature updating for ONE D model
*   This includes printing and checking updated values
*
* Return Value: NONE
*
* Discussion
*   Taken from a switch/case construct in Tmp1Mod().
*
* Author
*   dec - 19 Sep 96 - created from inline code in Tmp1Mod
*   dec - 16 Dec 96 - Logic for printing report to .OUT now implemented
*                     generically for all Device Equations models using
*                     TmpModReport()
*
*****************************************************************************/
{
    double  oldpb, pbo, gmaold, gmanew, pbrat,
            vt = Tnew * BOLTZ / CHARGE,
            reftmp = 27 + CTOK,        /* explicitly 27'C                     */
            vtref = reftmp * BOLTZ / CHARGE,
            vt1 = Told * BOLTZ / CHARGE,
            eg = EGFET(Tnew),
            eg1 = EGFET(Told),
            egref = EGFET(reftmp),
            arg = egref / vtref - eg / vt,
            arg1 = egref / vtref - eg1 / vt1,
            fact2 = Tnew / reftmp,
            fact1 = Told / reftmp,
            pbfact = - vt * (3 * log(fact2) + arg),
            pbfat1 = - vt1 * (3 * log(fact1) + arg1),
            t_dif = Tnew - Told,
            t_rat = Tnew / Told;
 
    MDLPARM & BV = (mod->D_bv);
    MDLPARM & CJO = (mod->D_cjo);
    MDLPARM & EG = (mod->D_eg);
    MDLPARM & IKF = (mod->D_ikf);
    MDLPARM & IS = (mod->D_is);
    MDLPARM & ISR = (mod->D_isr);
    MDLPARM & M = (mod->D_m);
    MDLPARM & N = (mod->D_n);
    MDLPARM & NR = (mod->D_nr);
    MDLPARM & RS = (mod->D_rs);
    MDLPARM & VJ = (mod->D_vj);
    MDLPARM & XTI = (mod->D_xti);
 
    IS *= FLOAT(exp(EG / (N * vt) * (t_rat - 1))
              * pow(t_rat, (double) (XTI) / N));
    ISR *= FLOAT(exp(EG / (NR * vt) * (t_rat - 1))
               * pow(t_rat, (double) (XTI) / NR));
 
/* update RS, IKF, and BV */
 
    RS *= FLOAT(1 + (Told - tnom) * (mod->D_trs1
              + (Told - tnom) * mod->D_trs2));
    RS /= FLOAT(1 + (Tnew - tnom) * (mod->D_trs1
              + (Tnew - tnom) * mod->D_trs2));
 
    IKF /= FLOAT(1 + (Told - tnom) * mod->D_tikf);
    IKF *= FLOAT(1 + (Tnew - tnom) * mod->D_tikf);
 
    BV /= FLOAT(1 + (Told - tnom) * (mod->D_tbv1
              + (Told - tnom) * mod->D_tbv2));
    BV *= FLOAT(1 + (Tnew - tnom) * (mod->D_tbv1
              + (Tnew - tnom) * mod->D_tbv2));
 
/* calculate Cjo & Vj for Tref */
 
    oldpb = VJ;
    pbo = (VJ - pbfat1) / fact1;
    gmaold = (VJ - pbo) / pbo;
    CJO /= FLOAT(1 + M * (.0004 * (Told - reftmp) - gmaold));
 
/* calculate new Cjo & Vj */
 
    VJ = FLOAT(fact2 * pbo + pbfact);
    gmanew = (VJ - pbo) / pbo;
    CJO *= FLOAT(1 + M * (.0004 * (Tnew - reftmp) - gmanew));
    pbrat = VJ / oldpb;
 
    mod->D_fc *= FLOAT(pbrat);         /* really fc*vj                        */
    mod->D_f1 *= pbrat;
 
    mod->D_vcrit = N * vt * log(N * vt / (IS * ROOT2));
 
    TmpModReport("IS", IS);
    TmpModReport("VJ", VJ);
    TmpModReport("CJO", CJO);
    TmpModReport("RS", FLOAT(RS == 0. ? 0. : 1 / RS));
    TmpModReport("IKF", IKF);
    TmpModReport("BV", (BV == 0. ? OMIT : BV));
    TmpModEndReport();
 
    if (VJ < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_003);
        SimError(FATAL_ERROR, "Model %s has negative VJ\n", mod->D_name);
    }
    if (CJO < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_004);
        SimError(FATAL_ERROR, "Model %s has negative CJO\n", mod->D_name);
    }
}
 
void J_TmpMod(                        /* Update ONE model to a new temperature*/
     struct J_ *mod,                  /* model to be processed                */
     double Told,                     /* Temperature models have now          */
     double Tnew,                     /* Temperature models will have on exit */
     double tnom)                     /* nominal temperature                  */
/*****************************************************************************
* Purpose
*   Do temperature updating for ONE J model
*   This includes printing and checking updated values
*
* Return Value: NONE
*
* Discussion
*   Taken from a switch/case construct in Tmp1Mod().
*
* Author
*   dec - 19 Sep 96 - created from inline code in Tmp1Mod
*   dec - 16 Dec 96 - Logic for printing report to .OUT now implemented
*                     generically for all Device Equations models using
*                     TmpModReport()
*
*****************************************************************************/
{
    double  oldpb, pbo, gmaold, gmanew, pbrat, oldcjf, newcjf,
            vt = Tnew * BOLTZ / CHARGE,
            reftmp = 27 + CTOK,        /* explicitly 27'C                     */
            vtref = reftmp * BOLTZ / CHARGE,
            vt1 = Told * BOLTZ / CHARGE,
            eg = EGFET(Tnew),
            eg1 = EGFET(Told),
            egref = EGFET(reftmp),
            arg = egref / vtref - eg / vt,
            arg1 = egref / vtref - eg1 / vt1,
            fact2 = Tnew / reftmp,
            fact1 = Told / reftmp,
            pbfact = - vt * (3 * log(fact2) + arg),
            pbfat1 = - vt1 * (3 * log(fact1) + arg1),
            t_dif = Tnew - Told,
            t_rat = Tnew / Told;
 
    MDLPARM & VTO = (mod->J_vto);
    MDLPARM & VTO_TC = (mod->J_vtotc);
    MDLPARM & BETA = (mod->J_beta);
    MDLPARM & BETA_TCE = (mod->J_betatce);
    MDLPARM & CGD = (mod->J_cgd);
    MDLPARM & CGS = (mod->J_cgs);
    MDLPARM & M = (mod->J_m);
    MDLPARM & N = (mod->J_n);
    MDLPARM & PB = (mod->J_pb);
    MDLPARM & IS = (mod->J_is);
    MDLPARM & XTI = (mod->J_xti);
 
    VTO += FLOAT(VTO_TC * t_dif);                /* VTO_TC is V/degree        */
    BETA *= FLOAT(pow(1.01, BETA_TCE * t_dif));  /* BETA_TCE is %/degree      */
    IS *= FLOAT(exp(1.11 /(N * vt) * (t_rat - 1))
              * pow(t_rat, (double) (XTI) / N));
 
/* calculate Cgs, Cgd & Pb for Tref */
 
    oldpb = PB;
    pbo = (PB - pbfat1) / fact1;
    gmaold = (PB - pbo) / pbo;
    oldcjf = 1 + M * (.0004 * (Told - reftmp) - gmaold);
    CGS /= FLOAT(oldcjf);
    CGD /= FLOAT(oldcjf);
 
/* calculate new Cgs, Cgd & Pb */
 
    PB = FLOAT(fact2 * pbo + pbfact);
    gmanew = (PB - pbo) / pbo;
    newcjf = 1 + M * (.0004 * (Tnew - reftmp) - gmanew);
    CGS *= FLOAT(newcjf);
    CGD *= FLOAT(newcjf);
 
    pbrat = PB / oldpb;
 
    mod->J_fc *= FLOAT(pbrat);         /* really fc*pb                        */
    mod->J_f1 *= pbrat;
 
    mod->J_vcrit = vt * log(vt / (IS * ROOT2));
 
    TmpModReport("VTO", VTO);
    TmpModReport("BETA", BETA);
    TmpModReport("IS", IS);
    TmpModReport("PB", PB);
    TmpModReport("CGS", CGS);
    TmpModReport("CGD", CGD);
    TmpModEndReport();
 
    if (PB < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_005);
        SimError(FATAL_ERROR, "Model %s has negative PB\n", mod->J_name);
    }
    if (CGS < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_006);
        SimError(FATAL_ERROR, "Model %s has negative CGS\n", mod->J_name);
    }
    if (CGD < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_007);
        SimError(FATAL_ERROR, "Model %s has negative CGD\n", mod->J_name);
    }
}
 
void M_TmpMod(                        /* Update ONE model to a new temperature*/
     struct M_ *mod,                  /* model to be processed                */
     double Told,                     /* Temperature models have now          */
     double Tnew,                     /* Temperature models will have on exit */
     double tnom)                     /* nominal temperature                  */
/*****************************************************************************
* Purpose
*   Do temperature updating for ONE M model
*   This includes printing and checking updated values
*
* Return Value: NONE
*
* Discussion
*   Taken from a switch/case construct in Tmp1Mod().
*
* Author
*   dec - 19 Sep 96 - created from inline code in Tmp1Mod
*   dec - 16 Dec 96 - Logic for printing report to .OUT now implemented
*                     generically for all Device Equations models using
*                     TmpModReport()
*   gwb - 13 Jun 97 - additions for BSIM3 version 3.0 (Level=7) parameters.
*
*****************************************************************************/
{
    double  pbo, oldphi, phio, gmaold, gmanew,
            coeold, coenew, vfb, isat,
            vt = Tnew * BOLTZ / CHARGE,
            reftmp = 27 + CTOK,        /* explicitly 27'C                     */
            vtref = reftmp * BOLTZ / CHARGE,
            vt1 = Told * BOLTZ / CHARGE,
            eg = EGFET(Tnew),
            eg1 = EGFET(Told),
            egref = EGFET(reftmp),
            arg = egref / vtref - eg / vt,
            arg1 = egref / vtref - eg1 / vt1,
            fact2 = Tnew / reftmp,
            fact1 = Told / reftmp,
            pbfact = - vt * (3 * log(fact2) + arg),
            pbfat1 = - vt1 * (3 * log(fact1) + arg1),
            t_dif = Tnew - Told,
            t_rat = Tnew / Told,
            rat3on2 = t_rat * sqrt(t_rat);
 
#ifdef BSIM3_DEBUG
    ToOutFile("ENTER TMPUPD\n");
#endif
 
    MDLPARM & IS = (mod->M_is);
    MDLPARM & JS = (mod->M_js);
    MDLPARM & JSSW = (mod->M_jssw);
    MDLPARM & KP = (mod->M_kp);
    MDLPARM & MJ = (mod->M_mj);
    MDLPARM & MJSW = (mod->M_mjsw);
    MDLPARM & PB = (mod->M_pb);
    MDLPARM & PBSW = (mod->M_pbsw);
    MDLPARM & PHI = (mod->M_phi);
    int &   TYPE = (mod->M_type);
    MDLPARM & UO = (mod->M_uo);
    double &VBI = (mod->M_vbi);
    MDLPARM & VTO = (mod->M_vto);
    MDLPARM & BsimU0 = (mod->BSIM_mobZero);
    MDLPARM & BsimU0Vdd = (mod->BSIM_mobVdd0);
    MDLPARM & BsimU0VddD0 = (mod->BSIM_mobVddD0);
 
/* temperature equations for BSIM3V20 model are implemented in mos6.c */
    if (mod->M_level != 6.0 && mod->M_level != 7.0) {
        BsimU0 /= FLOAT(rat3on2);
        BsimU0Vdd /= FLOAT(rat3on2);
        BsimU0VddD0 /= FLOAT(rat3on2);
        KP /= FLOAT(rat3on2);
        UO /= FLOAT(rat3on2);
 
        oldphi = PHI;
        phio = (PHI - pbfat1) / fact1;
        PHI = FLOAT(fact2 * phio + pbfact);
 
        vfb = VBI -.5 * TYPE * oldphi;
        vfb +=.5 * (eg1 - eg);
        VBI = vfb +.5 * TYPE * PHI;
 
        VTO = FLOAT(VBI + TYPE * (mod->M_gamma) * sqrt(PHI));
 
        { double tmp = exp(eg1 / vt1 - eg / vt);
 
            IS *= FLOAT(tmp);
            JS *= FLOAT(tmp);
            JSSW *= FLOAT(tmp);
        }
 
        pbo = (PBSW - pbfat1) / fact1;
        PBSW = FLOAT(fact2 * pbo + pbfact);
 
        pbo = (PB - pbfat1) / fact1;
        gmaold = (PB - pbo) / pbo;
        coeold = 1 + MJ * (.0004 * (Told - reftmp) - gmaold);
        mod->M_cbd /= FLOAT(coeold);
        mod->M_cbs /= FLOAT(coeold);
        mod->M_cj /= FLOAT(coeold);
        mod->M_cjsw /= FLOAT(1 + MJSW * (.0004 * (Told - reftmp) - gmaold));
 
        PB = FLOAT(fact2 * pbo + pbfact);
        gmanew = (PB - pbo) / pbo;
        coenew = 1 + MJ * (.0004 * (Tnew - reftmp) - gmanew);
        mod->M_cbd *= FLOAT(coenew);
        mod->M_cbs *= FLOAT(coenew);
        mod->M_cj *= FLOAT(coenew);
        mod->M_cjsw *= FLOAT(1 + MJSW * (.0004 * (Tnew - reftmp) - gmanew));
 
        isat = MAX(IS, JS);
 
        TmpModReport("VTO", VTO);
        TmpModReport("PHI", PHI);
        TmpModReport("PB", PB);
        TmpModReport("IS(JS)", FLOAT(isat));
        TmpModReport("KP", KP);
        TmpModReport("UO", FLOAT(1e4 * UO));
        TmpModEndReport();
 
        if (PHI < 0.0) {
            SENDMESSAGE_HELPID(HELP_SP_TMPUPD_008);
            SimError(FATAL_ERROR, "Model %s has negative PHI\n", mod->M_name);
        }
        if (PB < 0.0) {
            SENDMESSAGE_HELPID(HELP_SP_TMPUPD_009);
            SimError(FATAL_ERROR, "Model %s has negative PB\n", mod->M_name);
        }
    }                                  /* if level != 6 && level != 7         */
 
    if (mod->M_level == 7.0) {         /* BSIM3V30                            */
        struct bsim3SizeDependParam *pParam;
        double T0, T1, T2, Tnom;
 
        Tnom = mod->BSIM3_TNOM = FLOAT(tnom);
        double TRatio = Tnew / Tnom;
 
#ifdef BSIM3_TEMP
        ToOutFile("TMPUPD DEBUG: Told, Tnew, tnom %10.2e %10.2e %10.2e\n\n",
            Told, Tnew, tnom);
        ToOutFile("TMPUPD-B3TEMP: TRatio       %10.4e\n", TRatio);
        ToOutFile("TMPUPD-B3TEMP: Tnew         %10.4e\n", Tnew);
        ToOutFile("TMPUPD-B3TEMP: Tnom         %10.4e\n", Tnom);
#endif
 
        for (pParam = mod->pSizeDependParamKnot; pParam;
                 pParam = pParam->pNext) {
 
            T0 = (TRatio - 1.0);
            pParam->BSIM3ua = pParam->BSIM3ua + pParam->BSIM3ua1 * T0;
            pParam->BSIM3ub = pParam->BSIM3ub + pParam->BSIM3ub1 * T0;
            pParam->BSIM3uc = pParam->BSIM3uc + pParam->BSIM3uc1 * T0;
 
            pParam->BSIM3u0temp = pParam->BSIM3u0
                * pow(TRatio, pParam->BSIM3ute);
            pParam->BSIM3vsattemp = pParam->BSIM3vsat - pParam->BSIM3at
                * T0;
            pParam->BSIM3rds0 = (pParam->BSIM3rdsw + pParam->BSIM3prt * T0)
                / pow(pParam->BSIM3weff * 1E6, pParam->BSIM3wr);
 
            double KboQ = BOLTZ / CHARGE, Vtm0 = KboQ * Tnom;
            double Eg = 1.16 - 7.02e-4 * Tnom * Tnom / (Tnom + 1108.0);
            double ni = 1.45e10 * (Tnom / 300.15) * sqrt(Tnom / 300.15)
                * exp(21.5565981 - Eg / (2.0 * Vtm0));
 
            pParam->BSIM3phi = 2.0 * Vtm0
                * log(pParam->BSIM3npeak / ni);
 
            pParam->BSIM3sqrtPhi = sqrt(pParam->BSIM3phi);
            pParam->BSIM3phis3 = pParam->BSIM3sqrtPhi * pParam->BSIM3phi;
 
            pParam->BSIM3Xdep0 = sqrt(2.0 * EPSSIL / (CHARGE
                        * pParam->BSIM3npeak * 1.0e6))
                * pParam->BSIM3sqrtPhi;
            pParam->BSIM3sqrtXdep0 = sqrt(pParam->BSIM3Xdep0);
            pParam->BSIM3litl = sqrt(3.0 * pParam->BSIM3xj
                    * mod->M_tox);
            pParam->BSIM3vbi = Vtm0 * log(1.0e20
                    * pParam->BSIM3npeak / (ni * ni));
            pParam->BSIM3cdep0 = sqrt(CHARGE * EPSSIL
                    * pParam->BSIM3npeak * 1.0e6 / 2.0
                    / pParam->BSIM3phi);
 
            if (mod->BSIM_User_K10 != OMIT
                    || mod->BSIM_User_K20 != OMIT) {
            }
            else {
                if (mod->BSIM3_User_VBX == OMIT)
                    pParam->BSIM3vbx = pParam->BSIM3phi - 7.7348e-4
                        * pParam->BSIM3npeak
                        * pParam->BSIM3xt * pParam->BSIM3xt;
                if (pParam->BSIM3vbx > 0.0)
                    pParam->BSIM3vbx = - pParam->BSIM3vbx;
 
                T0 = pParam->BSIM3gamma1 - pParam->BSIM3gamma2;
                T1 = sqrt(pParam->BSIM3phi - pParam->BSIM3vbx)
                    - pParam->BSIM3sqrtPhi;
                T2 = sqrt(pParam->BSIM3phi * (pParam->BSIM3phi
                            - pParam->BSIM3vbm)) - pParam->BSIM3phi;
                pParam->BSIM3k2 = T0 * T1 / (2.0 * T2 + pParam->BSIM3vbm);
                pParam->BSIM3k1 = pParam->BSIM3gamma2 - 2.0
                    * pParam->BSIM3k2 * sqrt(pParam->BSIM3phi
                        - pParam->BSIM3vbm);
            }
 
            if (pParam->BSIM3k2 > 0.0) {
                T0 = 0.5 * pParam->BSIM3k1 / pParam->BSIM3k2;
                pParam->BSIM3vbsc = 0.9 * (pParam->BSIM3phi - T0 * T0);
                if (pParam->BSIM3vbsc > -3.0)
                    pParam->BSIM3vbsc = -3.0;
                else if (pParam->BSIM3vbsc < -30.0)
                    pParam->BSIM3vbsc = -30.0;
            }
            else {
                pParam->BSIM3vbsc = -10.0;
            }
 
            mod->BSIM3vtm = FLOAT(KboQ * Tnew);
 
            if (mod->BSIM3_User_VTH0 != OMIT)
                pParam->BSIM3vfb = mod->M_type * pParam->BSIM3vth0
                    - pParam->BSIM3phi - pParam->BSIM3k1
                    * pParam->BSIM3sqrtPhi;
            else
                pParam->BSIM3vth0 = mod->M_type * (-1.0
                        + pParam->BSIM3phi + pParam->BSIM3k1
                        * pParam->BSIM3sqrtPhi);
 
            T1 = sqrt(EPSSIL / EPSOX * mod->M_tox
                    * pParam->BSIM3Xdep0);
            T0 = exp(-0.5 * pParam->BSIM3dsub * pParam->BSIM3leff / T1);
            pParam->BSIM3theta0vb0 = (T0 + 2.0 * T0 * T0);
 
            T0 = exp(-0.5 * pParam->BSIM3drout * pParam->BSIM3leff / T1);
            T2 = (T0 + 2.0 * T0 * T0);
            pParam->BSIM3thetaRout = pParam->BSIM3pdibl1 * T2
                + pParam->BSIM3pdibl2;
 
            TmpModReport("UA", FLOAT(pParam->BSIM3ua));
            TmpModReport("UB", FLOAT(pParam->BSIM3ub));
            TmpModReport("UC", FLOAT(pParam->BSIM3uc));
            TmpModReport("VBX", FLOAT(pParam->BSIM3vbx));
            TmpModReport("GAMMA1", FLOAT(pParam->BSIM3gamma1));
            TmpModReport("K1", FLOAT(pParam->BSIM3k1));
            TmpModReport("K2", FLOAT(pParam->BSIM3k2));
            TmpModReport("VTH0", FLOAT(pParam->BSIM3vth0));
            TmpModEndReport();
 
        }
    }
 
#ifdef BSIM3_DEBUG
    ToOutFile("EXIT TMPUPD\n");
#endif
 
}
 
void Q_TmpMod(                        /* Update ONE model to a new temperature*/
     struct Q_ *mod,                  /* model to be processed                */
     double Told,                     /* Temperature models have now          */
     double Tnew,                     /* Temperature models will have on exit */
     double tnom)                     /* nominal temperature                  */
/*****************************************************************************
* Purpose
*   Do temperature updating for ONE Q model
*   This includes printing and checking updated values
*
* Return Value: NONE
*
* Discussion
*   Taken from a switch/case construct in Tmp1Mod().
*
* Author
*   dec - 19 Sep 96 - created from inline code in Tmp1Mod
*   dec - 16 Dec 96 - Logic for printing report to .OUT now implemented
*                     generically for all Device Equations models using
*                     TmpModReport()
*
*****************************************************************************/
{
    double  oldpb, pbo, gmaold, gmanew, pbrat, bfactr,
            vt = Tnew * BOLTZ / CHARGE,
            reftmp = 27 + CTOK,        /* explicitly 27'C                     */
            vtref = reftmp * BOLTZ / CHARGE,
            vt1 = Told * BOLTZ / CHARGE,
            eg = EGFET(Tnew),
            eg1 = EGFET(Told),
            egref = EGFET(reftmp),
            arg = egref / vtref - eg / vt,
            arg1 = egref / vtref - eg1 / vt1,
            fact2 = Tnew / reftmp,
            fact1 = Told / reftmp,
            pbfact = - vt * (3 * log(fact2) + arg),
            pbfat1 = - vt1 * (3 * log(fact1) + arg1),
            t_dif = Tnew - Told,
            t_rat = Tnew / Told;
 
    MDLPARM & BF = (mod->Q_bf);
    MDLPARM & BR = (mod->Q_br);
    MDLPARM & CJC = (mod->Q_cjc);
    MDLPARM & CJE = (mod->Q_cje);
    MDLPARM & CJS = (mod->Q_cjs);
    MDLPARM & EG = (mod->Q_eg);
    MDLPARM & IS = (mod->Q_is);
    MDLPARM & ISC = (mod->Q_isc);
    MDLPARM & ISE = (mod->Q_ise);
    MDLPARM & ISS = (mod->Q_iss);
    MDLPARM & MJC = (mod->Q_mjc);
    MDLPARM & MJE = (mod->Q_mje);
    MDLPARM & MJS = (mod->Q_mjs);
    MDLPARM & NC = (mod->Q_nc);
    MDLPARM & NE = (mod->Q_ne);
    MDLPARM & NS = (mod->Q_ns);
    MDLPARM & RB = (mod->Q_rb);
    MDLPARM & RBM = (mod->Q_rbm);
    MDLPARM & RC = (mod->Q_rc);
    MDLPARM & RE = (mod->Q_re);
    MDLPARM & VJC = (mod->Q_vjc);
    MDLPARM & VJE = (mod->Q_vje);
    MDLPARM & VJS = (mod->Q_vjs);
    MDLPARM & XTB = (mod->Q_xtb);
    MDLPARM & XTI = (mod->Q_xti);
 
    IS *= FLOAT(exp(EG / vt * (t_rat - 1)) * pow(t_rat, (double) (XTI)));
    ISC *= FLOAT(exp(EG / (NC * vt) * (t_rat - 1))
               * pow(t_rat, (double) (XTI) / NC));
    ISE *= FLOAT(exp(EG / (NE * vt) * (t_rat - 1))
               * pow(t_rat, (double) (XTI) / NE));
    ISS *= FLOAT(exp(EG / (NS * vt) * (t_rat - 1))
               * pow(t_rat, (double) (XTI) / NS));
 
    bfactr = pow(t_rat, (double) (XTB));
    BF *= FLOAT(bfactr);
    BR *= FLOAT(bfactr);
    ISC /= FLOAT(bfactr);
    ISE /= FLOAT(bfactr);
    ISS /= FLOAT(bfactr);
 
    mod->Q_vcrit = vt * log(vt / (IS * ROOT2));
 
/* calculate Cjc & Vjc for Tref */
 
    oldpb = VJC;
    pbo = (VJC - pbfat1) / fact1;
    gmaold = (VJC - pbo) / pbo;
    CJC /= FLOAT(1 + MJC * (.0004 * (Told - reftmp) - gmaold));
 
/* calculate new Cjc & Vjc */
 
    VJC = FLOAT(fact2 * pbo + pbfact);
    gmanew = (VJC - pbo) / pbo;
    CJC *= FLOAT(1 + MJC * (.0004 * (Tnew - reftmp) - gmanew));
 
    pbrat = VJC / oldpb;
    mod->Q_fcpc *= pbrat;
    mod->Q_f1bc *= pbrat;
 
/* calculate Cje & Vje for Tref */
 
    oldpb = VJE;
    pbo = (VJE - pbfat1) / fact1;
    gmaold = (VJE - pbo) / pbo;
    CJE /= FLOAT(1 + MJE * (.0004 * (Told - reftmp) - gmaold));
 
/* calculate new Cje & Vje */
 
    VJE = FLOAT(fact2 * pbo + pbfact);
    gmanew = (VJE - pbo) / pbo;
    CJE *= FLOAT(1 + MJE * (.0004 * (Tnew - reftmp) - gmanew));
 
    pbrat = VJE / oldpb;
    mod->Q_fcpe *= pbrat;
    mod->Q_f1be *= pbrat;
 
/* calculate Cjs & Vjs for Tref */
 
    pbo = (VJS - pbfat1) / fact1;
    gmaold = (VJS - pbo) / pbo;
    CJS /= FLOAT(1 + MJS * (.0004 * (Told - reftmp) - gmaold));
 
/* calculate new Cjs & Vjs */
 
    VJS = FLOAT(fact2 * pbo + pbfact);
    gmanew = (VJS - pbo) / pbo;
    CJS *= FLOAT(1 + MJS * (.0004 * (Tnew - reftmp) - gmanew));
 
/* update parasitic resistance values */
 
    RB /= FLOAT(1 + (Told - tnom) * (mod->Q_trb1
              + (Told - tnom) * mod->Q_trb2));
    RB *= FLOAT(1 + (Tnew - tnom) * (mod->Q_trb1
              + (Tnew - tnom) * mod->Q_trb2));
 
    RBM /= FLOAT(1 + (Told - tnom) * (mod->Q_trm1
               + (Told - tnom) * mod->Q_trm2));
    RBM *= FLOAT(1 + (Tnew - tnom) * (mod->Q_trm1
               + (Tnew - tnom) * mod->Q_trm2));
 
/* these parasitic resistors' values are stored as conductances */
 
    RC *= FLOAT(1 + (Told - tnom) * (mod->Q_trc1
              + (Told - tnom) * mod->Q_trc2));
    RC /= FLOAT(1 + (Tnew - tnom) * (mod->Q_trc1
              + (Tnew - tnom) * mod->Q_trc2));
 
    RE *= FLOAT(1 + (Told - tnom) * (mod->Q_tre1
              + (Told - tnom) * mod->Q_tre2));
    RE /= FLOAT(1 + (Tnew - tnom) * (mod->Q_tre1
              + (Tnew - tnom) * mod->Q_tre2));
 
    TmpModReport("BF", BF);
    TmpModReport("ISE", ISE);
    TmpModReport("VJE", VJE);
    TmpModReport("CJE", CJE);
    TmpModReport("RE", FLOAT(RE == 0. ? 0. : 1 / RE));
    TmpModReport("RB", RB);
    TmpModReport("BR", BR);
    TmpModReport("ISC", ISC);
    TmpModReport("VJC", VJC);
    TmpModReport("CJC", CJC);
    TmpModReport("RC", FLOAT(RC == 0. ? 0. : 1 / RC));
    TmpModReport("RBM", RBM);
    TmpModReport("IS", IS);
    TmpModReport("ISS", ISS);
    TmpModReport("VJS", VJS);
    TmpModReport("CJS", CJS);
    TmpModEndReport();
 
    if (VJE < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_010);
        SimError(FATAL_ERROR, "Model %s has negative VJE\n", mod->Q_name);
    }
    if (CJE < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_011);
        SimError(FATAL_ERROR, "Model %s has negative CJE\n", mod->Q_name);
    }
    if (VJC < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_012);
        SimError(FATAL_ERROR, "Model %s has negative VJC\n", mod->Q_name);
    }
    if (CJC < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_013);
        SimError(FATAL_ERROR, "Model %s has negative CJC\n", mod->Q_name);
    }
    if (VJS < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_014);
        SimError(FATAL_ERROR, "Model %s has negative VJS\n", mod->Q_name);
    }
    if (CJS < 0.0) {
        SENDMESSAGE_HELPID(HELP_SP_TMPUPD_015);
        SimError(FATAL_ERROR, "Model %s has negative CJS\n", mod->Q_name);
    }
}
