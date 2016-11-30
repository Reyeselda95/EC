/* acbjt.c
 *   $Revision:   1.18  $
 *   $Author:   DEC  $
 *   $Date:   21 Jan 1997 14:33:26  $ */
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** The procedure for changing the bipolar model parameters  **********/
/******** and device equations is the same as for the MOSFET.  See **********/
/******** the comments in the files mos.c and m.h for details.     **********/
 
#include "mslib.h"
#include "tran.h"
#include "dev.h"
#include "q.h"
 
void q_ACLoad(                         /* Process BJT for AC analysis         */
     struct q_ *Instance,              /* device to evaluate                  */
     double Omega                      /* 2*pi*frequency                      */
     )
/*****************************************************************************
* Purpose
*   Process bipolar transistor for AC analysis
*
* Returned value
*   None
*
* Discussion
*
* Author
*   whjb  25 Mar 87       created (from code taken from ACLoad)
*   pwt   27 Oct 87       re-written for lateral devices
*   pwt   02 Mar 88       add full diode treatment for substrate diode
*   pwt   02 Mar 88       BJT resistances Q_re and Q_rc now stored as resistance
*   pwt   04 Mar 88       rename from BjtAC
*   pwt   15 Oct 89       add quasi-saturation enhancements
*   eks   16 Feb 95       Changes associated with the added parameter XCJC2.
*                         XCJC2 specifies a portion of the CJC capacitance to be
*                         between external B abd C nodes instead of between
*                         external B and internal c nodes.
*   gwb   29 Jul 96       Add corrections to fix XCJC2 implementation.
*
*****************************************************************************/
{
double& GBE = (Instance->qcv_gpi);    /* active conductances                 */
double& GMU =  (Instance->qcv_gmu);
double& GM = (Instance->qcv_gm);
double& GCE = (Instance->qcv_go);
double& GX = (Instance->qcv_gx);
double& GJS = (Instance->qcv_gjs);
double& GNBN = (Instance->qcv_gnbn);
double& GNBC = (Instance->qcv_gnbc);
 
double& AREA = (Instance->q_area);
 
double& CBN = (Instance->q_sda.q_ac.qac_cbn);  /* device capacitances        */
double& CBC = (Instance->q_sda.q_ac.qac_cbc);
double& CBE = (Instance->q_sda.q_ac.qac_cbe);
double& CJS = (Instance->q_sda.q_ac.qac_cjs);
double& CBX = (Instance->q_sda.q_ac.qac_cBc);
double& CBX2 = (Instance->q_sda.q_ac.qac_cBC);
 
MDLPARM& RC = (Instance->q_model->Q_rc);
MDLPARM& RE = (Instance->q_model->Q_re);
MDLPARM& TD = (Instance->q_model->Q_ptf);
MDLPARM& QCO = (Instance->q_model->Q_qco);
MDLPARM& XCJC = (Instance->q_model->Q_xcjc);
MDLPARM& XCJC2 = (Instance->q_model->Q_xcjc2);
 
int LPNP = (Instance->q_model->Q_lpnp);
 
    double  gcpr, gepr, xjs, xBc, xBC, xbn,
            gm = GM,                   /* active conductance                  */
            xbc = Omega * CBC,         /* reactances                          */
            xbe = Omega * CBE,
            xteq = Omega * Instance->qcv_gcbeq,
            xgm = 0.;
 
    if (TD != 0.) {
        gm += GCE;
        xgm = - gm * sin(Omega * TD);
        gm = gm * cos(Omega * TD) - GCE;
    }
 
/* Stuff terms into matrix */
 
    xBc = Omega * CBX;
    xBC = Omega * CBX2;

    if (XCJC2 < 1.) {
        AC_MAT_I(q_BC) = AC_MAT_I(q_CB) = - xBC;
    }
    else if (XCJC < 1.) {
        AC_MAT_I(q_Bc) = AC_MAT_I(q_cB) = - xBc;
    }
 
    AC_MAT_I(q_BB) = xBc + xBC;
    AC_MAT_I(q_CC) = xBC;
    AC_MAT_I(q_Sj) = AC_MAT_I(q_jS) = - (AC_MAT_I(q_SS) = xjs = Omega * CJS);
    AC_MAT_I(q_nb) = - (AC_MAT_I(q_nn) = xbn = Omega * CBN);
    if (QCO > 0.0) AC_MAT_I(q_bn) = AC_MAT_I(q_nb);
 
    AC_MAT_I(q_bb) = (LPNP ? xjs : 0.) + xbc + xbe + xteq + xbn;
    AC_MAT_I(q_cc) = (LPNP ? 0. : xjs) + xbc + xBc;
    AC_MAT_I(q_ee) = xbe + xgm;
    AC_MAT_I(q_ec) = xteq;
    AC_MAT_I(q_ce) = - xgm;
    AC_MAT_I(q_cb) = xgm - xbc;
    AC_MAT_I(q_bc) = - xbc - xteq;
    AC_MAT_I(q_eb) = - xbe - xgm - xteq;
    AC_MAT_I(q_be) = - xbe;
 
    AC_MAT_R(q_Bb) = AC_MAT_R(q_bB) = - (AC_MAT_R(q_BB) = GX);
    AC_MAT_R(q_Sj) = AC_MAT_R(q_jS) = - (AC_MAT_R(q_SS) = GJS);
    AC_MAT_R(q_Cn) = AC_MAT_R(q_nC) = - (AC_MAT_R(q_CC) = gcpr = AREA * RC);
    AC_MAT_R(q_Ee) = AC_MAT_R(q_eE) = - (AC_MAT_R(q_EE) = gepr = AREA * RE);
 
    AC_MAT_R(q_bb) = (LPNP ? GJS : 0.) + GX + GMU + GBE;
    AC_MAT_R(q_cc) = (LPNP ? 0. : GJS) + GMU + GCE + GNBC;
    AC_MAT_R(q_ee) = gepr + GBE + GCE + gm;
 
    AC_MAT_R(q_eb) = (AC_MAT_R(q_be) = - GBE) - gm;
    AC_MAT_R(q_ce) = (AC_MAT_R(q_ec) = - GCE) - gm;
    AC_MAT_R(q_cb) = (AC_MAT_R(q_bc) = - GMU) + gm - GNBN - GNBC;
 
    AC_MAT_R(q_cn) = GNBN;
    AC_MAT_R(q_nb) = GNBN + GNBC;
    AC_MAT_R(q_nc) = - GNBC;
    AC_MAT_R(q_nn) = gcpr - GNBN;
 
}                                      /* End ACLoad_Q                        */
