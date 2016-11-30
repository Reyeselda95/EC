/* noise.c
 *   $Revision:   1.22  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:55:42  $ */
 
/* noise.c */
 
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
 
void d_Noise(
         const struct d_ *dev,         // diode to be analysed
         double tnow,                  // present device temperature
         double Freq,                  // frequency (omega)
         double *VTot,                 // total noise
         double *V1,                   // noise components...
         double *V2,
         double *V3,
         double *V4,
         double *V5,
         double *V6)
/*****************************************************************************
* Purpose
*   Calculate noise components for a diode
*
* Returned value
*   Nothing
*
* Discussion
*   This routine used to exist as inline code in a switch/case construct
*
* Author
*   DEC - 17 Sep 96 - creation
*
*****************************************************************************/
{
    D_ * mod = dev->d_model;
    double  vt = tnow * BOLTZ / CHARGE;
    double  fourkt = 4 * CHARGE * vt;
    double  ij = fabs(dev->dcv_ij);
    double  vrs = VMAG(d_P, d_p) * fourkt * fabs(mod->D_rs) * dev->d_area;
 
    ij = MAX(ij, MIN_INOISE);
    double  vn = VMAG(d_p, d_N);
    double  vshot = vn * 2 * CHARGE * ij;
    double  vflck = vn * mod->D_kf * pow(ij, (double) (mod->D_af)) / Freq;
 
    *VTot = vrs + vshot + vflck;
    *V1 = vrs;
    *V2 = vshot;
    *V3 = vflck;
}
 
void q_Noise(
         const struct q_ *dev,         // BJT to be analysed
         double tnow,                  // present device temperature
         double Freq,                  // frequency (omega)
         double *VTot,                 // total noise
         double *V1,                   // noise components...
         double *V2,
         double *V3,
         double *V4,
         double *V5,
         double *V6)
/*****************************************************************************
* Purpose
*   Calculate noise components for a BJT
*
* Returned value
*   Nothing
*
* Discussion
*   This routine used to exist as inline code in a switch/case construct
*
* Author
*   DEC - 17 Sep 96 - creation
*
*****************************************************************************/
{
    Q_ * mod = dev->q_model;
    double  vcsht;
    double  vt = tnow * BOLTZ / CHARGE;
    double  fourkt = 4 * CHARGE * vt;
    double  ib = fabs(dev->qcv_ib);
    double  ic = fabs(dev->qcv_ic);
    double  vb = VMAG(q_B, q_b) * fourkt * fabs(dev->qcv_gx);
    double  ve = VMAG(q_E, q_e) * fourkt * fabs(mod->Q_re) * dev->q_area;
    double  vc = VMAG(q_C, q_c) * fourkt * fabs(mod->Q_rc) * dev->q_area;
 
    ib = MAX(ib, MIN_INOISE);
    double  vn = VMAG(q_b, q_e);
    double  vshot = vn * 2 * CHARGE * ib;
    double  vflck = vn * mod->Q_kf * pow(ib, (double) (mod->Q_af)) / Freq;
 
    ic = MAX(ic, MIN_INOISE);
    vn = VMAG(q_c, q_e);
    vcsht = vn * 2 * CHARGE * ic;
 
    *VTot = vb + ve + vc + vshot + vflck + vcsht;
    *V1 = vb;
    *V2 = vc;
    *V3 = ve;
    *V4 = vshot;
    *V5 = vcsht;
    *V6 = vflck;
}
 
void j_Noise(
         const struct j_ *dev,         // JFet to be analysed
         double tnow,                  // present device temperature
         double Freq,                  // frequency (omega)
         double *VTot,                 // total noise
         double *V1,                   // noise components...
         double *V2,
         double *V3,
         double *V4,
         double *V5,
         double *V6)
/*****************************************************************************
* Purpose
*   Calculate noise components for a JFET
*
* Returned value
*   Nothing
*
* Discussion
*   This routine used to exist as inline code in a switch/case construct
*
* Author
*   DEC - 17 Sep 96 - creation
*
*****************************************************************************/
{
    J_ * mod = dev->j_model;
    double  vt = tnow * BOLTZ / CHARGE;
    double  fourkt = 4 * CHARGE * vt;
    double  ichnl = fabs(dev->jcv_id);
    double  gm = fabs(dev->jcv_gm);
    double  vd = VMAG(j_D, j_d) * fourkt * fabs(mod->J_rd) * dev->j_area;
    double  vs = VMAG(j_S, j_s) * fourkt * fabs(mod->J_rs) * dev->j_area;
 
    ichnl = MAX(ichnl, MIN_INOISE);
    double  vn = VMAG(j_d, j_s);
    double  vshot = vn * fourkt * 2.0 / 3.0 * gm;
    double  vflck = vn * mod->J_kf * pow(ichnl, (double) (mod->J_af)) / Freq;
 
    *VTot = vd + vs + vshot + vflck;
    *V1 = vd;
    *V2 = vs;
    *V3 = vshot;
    *V4 = vflck;
}
 
static double StrongInversionNoiseEval(
                  const struct m_ *dev,
                  double vgs,
                  double vds,
                  double Freq,
                  double tnow,
                  double cox)
/*****************************************************************************
* Purpose
*   Calculate strong inversion noise components for BSIM3V3 model
*
* Returned value
*   Noise component
*
* Discussion
*   This code is converted from Spice3
*
* Author
*   gwb - 13 May 97 - creation
*
*****************************************************************************/
{
    struct bsim3SizeDependParam *pParam = dev->pParam;
    M_ * model = dev->m_model;
    double  cd, esat, DelClm, EffFreq, N0, Nl, Vgst;
    double  T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, Ssi;
    double  type = model->M_type > 0 ? 1. : -1.;
 
    cd = fabs(dev->mcv_id);
    if (vds > dev->m_vdsat * type) {
        esat = 2.0 * pParam->BSIM3vsattemp / dev->m_BSIM3ueff;
        T0 = ((((vds - dev->m_vdsat * type) / pParam->BSIM3litl)
                    + model->BSIM3_EM) / esat);
        DelClm = pParam->BSIM3litl * LOG(T0);
    }
    else
        DelClm = 0.0;
    EffFreq = pow(Freq, (double) (model->BSIM3_EF));
    T1 = CHARGE * CHARGE * 8.62e-5 * cd * tnow * dev->m_BSIM3ueff;
    T2 = 1.0e8 * EffFreq * cox
        * pParam->BSIM3leff * pParam->BSIM3leff;
    Vgst = vgs - dev->m_von * type;
    N0 = cox * Vgst / CHARGE;
    if (N0 < 0.0)
        N0 = 0.0;
    Nl = cox * (Vgst - MIN(vds, dev->m_vdsat * type)) / CHARGE;
    if (Nl < 0.0)
        Nl = 0.0;
 
    T3 = model->BSIM3_NOIA
        * LOG(((N0 + 2.0e14) / (Nl + 2.0e14)));
    T4 = model->BSIM3_NOIB * (N0 - Nl);
    T5 = model->BSIM3_NOIC * 0.5 * (N0 * N0 - Nl * Nl);
 
    T6 = 8.62e-5 * tnow * cd * cd;
    T7 = 1.0e8 * EffFreq * pParam->BSIM3leff
        * pParam->BSIM3leff * pParam->BSIM3weff;
    T8 = model->BSIM3_NOIA + model->BSIM3_NOIB * Nl
        + model->BSIM3_NOIC * Nl * Nl;
    T9 = (Nl + 2.0e14) * (Nl + 2.0e14);
 
    Ssi = T1 / T2 * (T3 + T4 + T5) + T6 / T7 * DelClm * T8 / T9;
    return Ssi;
}
 
void m_Noise(
         const struct m_ *dev,         // MOSFet to be analysed
         double tnow,                  // present device temperature
         double Freq,                  // frequency (omega)
         double *VTot,                 // total noise
         double *V1,                   // noise components...
         double *V2,
         double *V3,
         double *V4,
         double *V5,
         double *V6)
/*****************************************************************************
* Purpose
*   Calculate noise components for a MOSFet
*
* Returned value
*   Nothing
*
* Discussion
*   This routine used to exist as inline code in a switch/case construct
*
* Author
*   DEC - 17 Sep 96 - creation
*   GWB - 13 Jun 97 - addition of BSIM3 version 3.1 (Level=7) noise models.
*
*****************************************************************************/
{
    struct bsim3SizeDependParam *pParam = dev->pParam;
    M_ * mod = dev->m_model;
    struct msv_def *sv[MSTVCT];
    UPDATE_SV(sv, dev->m_sda.m_sv);
    double  vd, vs, vg, vb;
    double  ichnl = MAX(fabs(dev->mcv_id), MIN_INOISE);
    double  gm = fabs(dev->mcv_gm);
    double  gds = fabs(dev->mcv_gds);
    double  gmbs = fabs(dev->mcv_gmbs);
    double  qinv = fabs(dev->m_BSIM3qinv);
    double  noi = fabs(dev->m_noi);
    double  cox;
    double  l = dev->m_l - mod->M_ld * ((double) mod->M_level == 4. ? 1e-6 : 2.);
    double  w = (dev->m_w - mod->M_wd * ((double) mod->M_level == 4 ? 1e-6 : 2.)) * dev->m_m;
    double  vt = tnow * BOLTZ / CHARGE;
    double  fourkt = 4 * CHARGE * vt;
    double  vn = VMAG(m_d, m_s);
    double  vshot, vflck;
    double  Ssi, Swi, Slimit, T1, T10, T11, vds, vgs;
    double  type = mod->M_type > 0 ? 1. : -1.;
    int     whichmodel;
 
    if ((double) mod->M_level != 4.)
        cox = EPSOX / ((double) mod->M_tox == 0. ? 1e-7 : mod->M_tox);
    else
        cox = EPSOX / ((double) mod->M_tox == 0. ? 1e-7 : mod->M_tox * 1.0e-6);
 
//  vd = VMAG(m_D,m_d) * fourkt * fabs(mod->M_rd)
//  vs = VMAG(m_S,m_s) * fourkt * fabs(mod->M_rs)
//  vg = VMAG(m_G,m_g) * fourkt * fabs(mod->M_rg)
//  vb = VMAG(m_B,m_b) * fourkt * fabs(mod->M_rb)
    if (dev->m_rd != 0) vd = VMAG(m_D, m_d) * fourkt * fabs(dev->m_rd);
    else vd = VMAG(m_D, m_d) * fourkt * fabs(mod->M_rd);
    if (dev->m_rs != 0) vs = VMAG(m_S, m_s) * fourkt * fabs(dev->m_rs);
    else vs = VMAG(m_S, m_s) * fourkt * fabs(mod->M_rs);
    if (dev->m_rg != 0) vg = VMAG(m_G, m_g) * fourkt * fabs(dev->m_rg);
    else vg = VMAG(m_G, m_g) * fourkt * fabs(mod->M_rg);
    if (dev->m_rb != 0) vb = VMAG(m_B, m_b) * fourkt * fabs(dev->m_rb);
    else vb = VMAG(m_B, m_b) * fourkt * fabs(mod->M_rb);
 
    if (mod->M_level != 7) {
 
        if (mod->M_nlev == FLOAT(3.0))
            vshot = vn * fourkt * 2.0 / 3.0 * noi;
        else
            vshot = vn * fourkt * 2.0 / 3.0 * gm;
 
        if (mod->M_nlev == FLOAT(0.0)) {
            vflck = vn * mod->M_kf * pow(ichnl, (double) (mod->M_af)) / (Freq * cox * l * l);
        }
        else if (mod->M_nlev == FLOAT(1.0)) {
            vflck = vn * mod->M_kf * pow(ichnl, (double) (mod->M_af)) / (Freq * cox * w * l);
        }
        else {
            vflck = vn * mod->M_kf * gm * gm
                / (cox * w * l * pow(Freq, (double) (mod->M_af)));
        }
 
    }
    else {
 
        whichmodel = NINT(mod->BSIM3_NOIMOD);
        switch (whichmodel) {
        case 1 :                       // SPICE2 thermal (shot) noise
        case 3 :
            vshot = vn * fourkt * (2.0 / 3.0 * (gm + gds + gmbs));
            break;
        case 2 :                       // BSIM3 thermal (shot) noise
        case 4 :
            vshot = vn * fourkt * (dev->m_BSIM3ueff * fabs(qinv
                        / (pParam->BSIM3leff * pParam->BSIM3leff)));
            break;
        }
 
        switch (whichmodel) {
        case 1 :                       // SPICE2 flicker noise
        case 4 :
            vflck = mod->M_kf * exp(mod->M_af * LOG(ichnl))
                / (pow(Freq, (double) (mod->BSIM3_EF))
                    * pParam->BSIM3leff * pParam->BSIM3leff * cox);
            break;
        case 2 :                       // BSIM3 flicker noise
        case 3 :
            vgs = M_VGS(0);
            vds = M_VDS(0);
            if (vds < 0.0) {
                vds = - vds;
                vgs = vgs + vds;
            }
            if (vgs >= dev->m_von * type + 0.1) {
                Ssi = StrongInversionNoiseEval(dev, vgs, vds, Freq, tnow, cox);
                vflck = Ssi;
            }
            else {
                T10 = mod->BSIM3_NOIA * 8.62e-5 * tnow;
                T11 = pParam->BSIM3weff * pParam->BSIM3leff
                    * pow(Freq, (double) (mod->BSIM3_EF)) * 4.0e36;
                Swi = T10 / T11 * ichnl
                    * ichnl;
                Slimit = StrongInversionNoiseEval(dev, dev->m_von * type + 0.1,
                    vds, Freq, tnow, cox);
                T1 = Swi + Slimit;
                if (T1 > 0.0) {
                    vflck = (Slimit * Swi) / T1;
                }
                else {
                    vflck = 0.0;
                }
            }
            break;
        }
 
    }
 
    *VTot = vd + vs + vg + vb + vshot + vflck;
    *V1 = vd;
    *V2 = vs;
    *V3 = vg;
    *V4 = vb;
    *V5 = vshot;
    *V6 = vflck;
}
 
void b_Noise(
         const struct b_ *dev,         // GAASFet to be analysed
         double tnow,                  // present device temperature
         double Freq,                  // frequency (omega)
         double *VTot,                 // total noise
         double *V1,                   // noise components...
         double *V2,
         double *V3,
         double *V4,
         double *V5,
         double *V6)
/*****************************************************************************
* Purpose
*   Calculate noise components for a GAASFet
*
* Returned value
*   Nothing
*
* Discussion
*   This routine used to exist as inline code in a switch/case construct
*
* Author
*   DEC - 17 Sep 96 - creation
*
*****************************************************************************/
{
    B_ * mod = dev->b_model;
    double  ichnl = fabs(dev->bcv_id);
    double  gm = fabs(dev->bcv_gm);
    double  vt = tnow * BOLTZ / CHARGE;
    double  fourkt = 4 * CHARGE * vt;
    double  vd = VMAG(b_D, b_d) * fourkt * fabs(mod->B_rd) * dev->b_area;
    double  vs = VMAG(b_S, b_s) * fourkt * fabs(mod->B_rs) * dev->b_area;
    double  vg = VMAG(b_G, b_g) * fourkt * fabs(mod->B_rg);
 
    ichnl = MAX(ichnl, MIN_INOISE);
    double  vn = VMAG(b_d, b_s);
    double  vshot = vn * fourkt * 2.0 / 3.0 * gm;
    double  vflck = vn * mod->B_kf * pow(ichnl, (double) (mod->B_af)) / Freq;
 
    *VTot = vd + vs + vg + vshot + vflck;
    *V1 = vd;
    *V2 = vs;
    *V3 = vg;
    *V4 = vshot;
    *V5 = vflck;
}
