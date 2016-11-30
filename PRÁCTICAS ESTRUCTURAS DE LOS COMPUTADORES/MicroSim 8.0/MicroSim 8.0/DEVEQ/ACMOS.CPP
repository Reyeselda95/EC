/* acmos.c
 *   $Revision:   1.19  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:55:22  $ */
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** See the comments in the files mos.c and m.h for details  **********/
/******** on changing the model parameters.                        **********/
 
#include "mslib.h"
#include "tran.h"
#include "dev.h"
#include "m.h"
 
void m_ACLoad(
         struct m_ *Instance,          /* (R) device to evaluate              */
         double Omega)                 /* (R) 2*pi*frequency                  */
/*****************************************************************************
* Purpose
*   Process MOSFET for AC analysis
*
* Returned value
*   None
*
* Author
*   whjb - 28 Mar 87 - created (from code taken from ACLoad)
*   pwt  - 17 Feb 88 - re-written (found bug dating to SPICE2G.6)
*   pwt  - 07 Mar 88 - renamed (from MOSAC)
*   pwt  - 15 Mar 88 - re-written, adding BSIM capacitance model
*   pwt  - 07 Oct 88 - add "M" (multiplier) to calculations
*   whjb - 20 Jun 92 - consolidated 3 (Meyer, WD, BSIM) cap structures into 1
*   dec  - 13 Jun 97 - add loading for BSIM3 version 3.0 (Level=7).
*
*****************************************************************************/
{
    double &DevM = (Instance->m_m);    /* device size multiplier              */
 
    double &GDPR = (Instance->m_rd);   /* ohmic conductances                  */
    double &GSPR = (Instance->m_rs);
    double &GGPR = (Instance->m_rg);
    double &GBPR = (Instance->m_rb);
 
    double &GBD = (Instance->mcv_gbd); /* active conductances                 */
    double &GBS = (Instance->mcv_gbs);
    double &GDS = (Instance->mcv_gds);
    double &GM = (Instance->mcv_gm);
    double &GMBS = (Instance->mcv_gmbs);
 
    double &CBD = (Instance->m_sda.m_ac.mac_cbd);    /* junction capacitances */
    double &CBS = (Instance->m_sda.m_ac.mac_cbs);
 
    double &CGDB = (Instance->m_sda.m_ac.mac_cgdb);  /* active capacitances   */
    double &CGGB = (Instance->m_sda.m_ac.mac_cggb);
    double &CGSB = (Instance->m_sda.m_ac.mac_cgsb);
 
    double &CBDB = (Instance->m_sda.m_ac.mac_cbdb);
    double &CBGB = (Instance->m_sda.m_ac.mac_cbgb);
    double &CBSB = (Instance->m_sda.m_ac.mac_cbsb);
 
    double &CDDB = (Instance->m_sda.m_ac.mac_cddb);
    double &CDGB = (Instance->m_sda.m_ac.mac_cdgb);
    double &CDSB = (Instance->m_sda.m_ac.mac_cdsb);
 
    double &CSDB = (Instance->m_sda.m_ac.mac_csdb);
    double &CSGB = (Instance->m_sda.m_ac.mac_csgb);
    double &CSSB = (Instance->m_sda.m_ac.mac_cssb);
 
    /* NQS mode capacitances for BSIM3v3 */
    double &CQDB = (Instance->m_sda.m_ac.mac_cqdb);
    double &CQGB = (Instance->m_sda.m_ac.mac_cqgb);
    double &CQSB = (Instance->m_sda.m_ac.mac_cqsb);
    double &CQBB = (Instance->m_sda.m_ac.mac_cqbb);
    /* NQS mode conductances for BSIM3v3 */
    double &GTD = (Instance->mcv_gtd);
    double &GTG = (Instance->mcv_gtg);
    double &GTS = (Instance->mcv_gts);
    double &GTB = (Instance->mcv_gtb);
    double &GTAU = (Instance->mcv_gtau);
 
    /* Local variables */
 
    struct M_ *model = Instance->m_model;  /* device model                    */
 
    int     fwd = Instance->m_mode > 0 ? YES : NO;
    int     nqsmod = (model->M_level == 7.0 && model->BSIM3_NQSMOD != 0.0) ? YES : NO;
 
    double  dxpart = nqsmod * (fwd ? 0.4 : 0.6);
    double  sxpart = nqsmod * (fwd ? 0.6 : 0.4);
 
    /* Load imaginary admittances */
 
    AC_MAT_I(m_db) = - (
        (AC_MAT_I(m_ds) = Omega * CDSB) +
        (AC_MAT_I(m_dg) = Omega * CDGB) +
        (AC_MAT_I(m_dd) = Omega * (CDDB + CBD)));
 
    AC_MAT_I(m_gb) = - (
        (AC_MAT_I(m_gd) = Omega * CGDB) +
        (AC_MAT_I(m_gs) = Omega * CGSB) +
        (AC_MAT_I(m_gg) = Omega * CGGB));
 
    AC_MAT_I(m_sb) = - (
        (AC_MAT_I(m_sd) = Omega * CSDB) +
        (AC_MAT_I(m_sg) = Omega * CSGB) +
        (AC_MAT_I(m_ss) = Omega * (CSSB + CBS)));
 
    AC_MAT_I(m_bb) = - (
        (AC_MAT_I(m_bd) = Omega * (CBDB - CBD)) +
        (AC_MAT_I(m_bs) = Omega * (CBSB - CBS)) +
        (AC_MAT_I(m_bg) = Omega * CBGB));
 
    /* load q node for BSIM3v3 NQS mode */
    if (nqsmod) {
        AC_MAT_I(m_qq) = Omega;
        AC_MAT_I(m_qg) = - Omega * CQGB;
        AC_MAT_I(m_qd) = - Omega * CQDB;
        AC_MAT_I(m_qs) = - Omega * CQSB;
        AC_MAT_I(m_qb) = - Omega * CQBB;
    }
 
    /* load real part of admittances */
 
    AC_MAT_R(m_Gg) = - GGPR * DevM;
    AC_MAT_R(m_gG) = - GGPR * DevM;
    AC_MAT_R(m_GG) = GGPR * DevM;
    AC_MAT_R(m_gg) = GGPR * DevM - nqsmod * GTG;
 
    AC_MAT_R(m_dg) = (fwd ? GM : - GM) + dxpart * GTG;
    AC_MAT_R(m_ds) = (fwd ? - GM - GMBS : 0.) - GDS + dxpart * GTS;
    AC_MAT_R(m_db) = (fwd ? GMBS : - GMBS) - GBD + dxpart * GTB;
    AC_MAT_R(m_dd) = (fwd ? 0. : GM + GMBS) + GDS + GBD + GDPR * DevM + dxpart * GTD;
    AC_MAT_R(m_Dd) = - GDPR * DevM;
    AC_MAT_R(m_dD) = - GDPR * DevM;
    AC_MAT_R(m_DD) = GDPR * DevM;
 
    AC_MAT_R(m_sg) = (fwd ? - GM : GM) + sxpart * GTG;
    AC_MAT_R(m_sd) = (fwd ? 0. : - GM - GMBS) - GDS + sxpart * GTD;
    AC_MAT_R(m_sb) = (fwd ? - GMBS : GMBS) - GBS + sxpart * GTG;  // why not GTB?
    AC_MAT_R(m_ss) = (fwd ? GM + GMBS : 0.) + GDS + GBS + GSPR * DevM + sxpart * GTS;
    AC_MAT_R(m_Ss) = - GSPR * DevM;
    AC_MAT_R(m_sS) = - GSPR * DevM;
    AC_MAT_R(m_SS) = GSPR * DevM;
 
    AC_MAT_R(m_bd) = - GBD;
    AC_MAT_R(m_bs) = - GBS;
    AC_MAT_R(m_bb) = GBD + GBS + GBPR * DevM;
    AC_MAT_R(m_Bb) = - GBPR * DevM;
    AC_MAT_R(m_bB) = - GBPR * DevM;
    AC_MAT_R(m_BB) = GBPR * DevM;
 
    if (nqsmod) {
        AC_MAT_R(m_gb) = - GTB;
        AC_MAT_R(m_gd) = - GTD;
        AC_MAT_R(m_gs) = - GTS;
 
        AC_MAT_R(m_qq) = GTAU;
 
        AC_MAT_R(m_dq) = dxpart * GTAU;
        AC_MAT_R(m_sq) = sxpart * GTAU;
        AC_MAT_R(m_gq) = - GTAU;
 
        AC_MAT_R(m_qg) = GTG;
        AC_MAT_R(m_qd) = GTD;
        AC_MAT_R(m_qs) = GTS;
        AC_MAT_R(m_qb) = GTB;
    }
}                                      /* End ACLoad_M                        */
