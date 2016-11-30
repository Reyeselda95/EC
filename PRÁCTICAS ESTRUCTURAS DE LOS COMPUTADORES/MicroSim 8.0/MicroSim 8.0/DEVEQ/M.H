/* m.h
 *   $Revision:   1.44  $
 *   $Author:   GWB  $
 *   $Date:   18 Jun 1997 18:14:46  $ */
 
#ifndef DEV_M_H
#define DEV_M_H
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
 
/* WARNING: the procedure for adding user-specified parameters has changed  */
/*          slightly from version 4.00 and up.                              */
 
/******** To add model parameters, see the comments just before    **********/
/******** the definition of the model's structure (M_).  Do not    **********/
/******** change the device structure (m_), except to add items    **********/
/******** at the very end of the structure.                        **********/
 
/*****************************************************************************
*
* Purpose
*   MOSFET transistor definitions.
*
* Author
*    pwt - ?? Aug 86 - creation.
*    pwt - 17 Mar 88 - implement shared data area in device instance.
*    swg - 16 Aug 88 - add revision header.
*    imw - 23 Aug 88 - additions for Params & expressions.
*    pwt - 11 Oct 88 - add sidewall current density, and "M" multiplier.
*    jms - 16 Mar 89 - removed mos.fd (files that need this already
*                      include it).
*    sv  - 29 Mar 89 - changed Alias to permit .DC and .STEP of aliased name.
*    sv  - 14 Feb 90 - added model temperature data structure.
*    sv  - 10 Apr 90 - model Temp #ifdef-ed out.
*    sv  - 10 Apr 90 - model Temp removed entirely.
*    pwt - 04 May 90 - removed instance values no longer required (used
*                      for bypass calculations).
*    pwt - 09 Oct 90 - fixed blunder in model structure on AKO:model.
*    sv  - 14 Feb 91 - addition of model parameters.
*    sv  - 28 Feb 91 - make PBSW also have _User_ version.
*    sv  - 04 Apr 91 - fixed TOX's divide by zero.
*    pwt - 13 Jun 91 - added to MOS instance a storage for parasitic
*                      resistance, separate from the number-of-squares value.
*    whb - 03 Aug 92 - got rid of Meyer capacitances (consolidated all
*                      capacitances into one set).
*    sv  - 12 Oct 92 - model temperature changes.
*    muw - 09 Feb 93 - change ENDPARMS.
*    eks - 01 Jun 93 - use XDSQUARE instead of LAMBDA in level=3 model to
*                      avoid confusion.
*    eks - 04 Apr 94 - additions for BSIM3 (level=5 model).
*    sv  - 08 Jun 94 - Stress Analysis stubs.
*    eks - 07 Sep 94 - fixed the problem with BSIM parameter DELL.
*    dec - 13 Oct 94 - C++ compliance for WATCOM.
*    eks - 16 Jan 95 - deleted BSIM1 paremeter DELL.
*    gwb - 03 Feb 95 - additions for BSIM3 version 2.0 and code cleanup.
*    dec - 05 Jul 95 - removed unneeded #if.
*    gwb - 13 Sep 95 - remove BSIM3 level=5 comments.
*    dec - 25 Jan 96 - workaround for DevEq VC++ 4.0 decorated name problem.
*    dec - 01 Feb 96 - #ifdef'd extern "C" for Watcom compiler.
*    gwb - 15-Aug 96 - additions for new mosfet noise model.
*    dec - 12 Sep 96 - removed extern "C" workaround for VC++ 4.0.
*    dec - 09 Oct 96 - added DLL linkage modifiers and applied function
*                      naming convention.
*    dec - 18 Oct 96 - obsoleted mos.fd, and moved most function
*                      declarations to here.
*    dec - 11 Nov 96 - added function pointers needed for runtime DE DLL
*                      loading.
*    dec - 16 Dec 96 - changed arguments to M_TmpMod() function.
*    dec - 21 Jan 97 - removed m_ACPrb() from DLL interface.
*    dec - 13 Jun 97 - additions for BSIM3 version 3.0 (gwb modifications).
*****************************************************************************/
 
struct mac_def {        /* AC values                                        */
    double              /* capacitances                                     */
            mac_cgdb,   /* capacitance values                               */
            mac_cggb,
            mac_cgsb,
            mac_cbdb,
            mac_cbgb,
            mac_cbsb,
            mac_cddb,
            mac_cdgb,
            mac_cdsb,
            mac_csdb,
            mac_csgb,
            mac_cssb,
            mac_cqdb,
            mac_cqsb,
            mac_cqgb,
            mac_cqbb,
            mac_cbd,    /* substrate-junction capacitance values            */
            mac_cbs;
};
 
struct msv_def {        /* state vector                                     */
    struct qi_def       /* capacitor charges & currents                     */
        msv_cgs,        /* note: aliases below                              */
        msv_cgd,
        msv_cgb,
        msv_cbd,
        msv_cbs,
        msv_cqg,
        msv_cqb,
        msv_cqd,
        msv_qcheq,      /* states for non-quasi-static model */
        msv_qcdump;
 
/* aliases:  capacitor currents & charges */
#define msv_cb          msv_cgs
#define msv_cg          msv_cgd
#define msv_cd          msv_cgb
 
    double              /* voltages                                         */
            msv_vds,
            msv_vgs,
            msv_vbs;
 
    double              /* device capacitances (w/o overlaps)               */
            msv_capgs,
            msv_capgd,
            msv_capgb;
};
 
/* state-vector access */
 
#define M_VDS(vect)     (sv[vect]->msv_vds)
#define M_VGS(vect)     (sv[vect]->msv_vgs)
#define M_VBS(vect)     (sv[vect]->msv_vbs)
 
#define M_CGS(vect)     (sv[vect]->msv_capgs)
#define M_CGD(vect)     (sv[vect]->msv_capgd)
#define M_CGB(vect)     (sv[vect]->msv_capgb)
 
#define M_QIGS(vect)    (sv[vect]->msv_cgs)
#define M_QCGS(vect)    (sv[vect]->msv_cgs.qi_q)
#define M_ICGS(vect)    (sv[vect]->msv_cgs.qi_i)
 
#define M_QIGD(vect)    (sv[vect]->msv_cgd)
#define M_QCGD(vect)    (sv[vect]->msv_cgd.qi_q)
#define M_ICGD(vect)    (sv[vect]->msv_cgd.qi_i)
 
#define M_QIGB(vect)    (sv[vect]->msv_cgb)
#define M_QCGB(vect)    (sv[vect]->msv_cgb.qi_q)
#define M_ICGB(vect)    (sv[vect]->msv_cgb.qi_i)
 
#define M_QIBD(vect)    (sv[vect]->msv_cbd)
#define M_QCBD(vect)    (sv[vect]->msv_cbd.qi_q)
#define M_ICBD(vect)    (sv[vect]->msv_cbd.qi_i)
 
#define M_QIBS(vect)    (sv[vect]->msv_cbs)
#define M_QCBS(vect)    (sv[vect]->msv_cbs.qi_q)
#define M_ICBS(vect)    (sv[vect]->msv_cbs.qi_i)
 
#define M_QICB(vect)    (sv[vect]->msv_cb)
#define M_QCB(vect)     (sv[vect]->msv_cb.qi_q)
#define M_ICB(vect)     (sv[vect]->msv_cb.qi_i)
 
#define M_QICG(vect)    (sv[vect]->msv_cg)
#define M_QCG(vect)     (sv[vect]->msv_cg.qi_q)
#define M_ICG(vect)     (sv[vect]->msv_cg.qi_i)
 
#define M_QICD(vect)    (sv[vect]->msv_cd)
#define M_QCD(vect)     (sv[vect]->msv_cd.qi_q)
#define M_ICD(vect)     (sv[vect]->msv_cd.qi_i)
 
/* states for non-quasi-static model */
#define M_QIQG(vect)    (sv[vect]->msv_cqg)
#define M_QQG(vect)     (sv[vect]->msv_cqg.qi_q)
#define M_IQG(vect)     (sv[vect]->msv_cqg.qi_i)
 
#define M_QIQB(vect)    (sv[vect]->msv_cqb)
#define M_QQB(vect)     (sv[vect]->msv_cqb.qi_q)
#define M_IQB(vect)     (sv[vect]->msv_cqb.qi_i)
 
#define M_QIQD(vect)    (sv[vect]->msv_cqd)
#define M_QQD(vect)     (sv[vect]->msv_cqd.qi_q)
#define M_IQD(vect)     (sv[vect]->msv_cqd.qi_i)
 
#define M_QICHEQ(vect)  (sv[vect]->msv_qcheq)
#define M_QCHEQ(vect)   (sv[vect]->msv_qcheq.qi_q)
#define M_ICHEQ(vect)   (sv[vect]->msv_qcheq.qi_i)
 
#define M_QIDUMP(vect)  (sv[vect]->msv_qcdump)
#define M_QDUMP(vect)   (sv[vect]->msv_qcdump.qi_q)
#define M_IDUMP(vect)   (sv[vect]->msv_qcdump.qi_i)
 
struct bsim3SizeDependParam
{
    double  Width;
    double  Length;
 
    double  BSIM3cdsc;
    double  BSIM3cdscb;
    double  BSIM3cdscd;
    double  BSIM3cit;
    double  BSIM3nfactor;
    double  BSIM3xj;
    double  BSIM3vsat;
    double  BSIM3at;
    double  BSIM3a0;
    double  BSIM3ags;
    double  BSIM3a1;
    double  BSIM3a2;
    double  BSIM3keta;
    double  BSIM3nsub;
    double  BSIM3npeak;
    double  BSIM3ngate;
    double  BSIM3gamma1;
    double  BSIM3gamma2;
    double  BSIM3vbx;
    double  BSIM3vbi;
    double  BSIM3vbm;
    double  BSIM3vbsc;
    double  BSIM3xt;
    double  BSIM3phi;
    double  BSIM3litl;
    double  BSIM3k1;
    double  BSIM3kt1;
    double  BSIM3kt1l;
    double  BSIM3kt2;
    double  BSIM3k2;
    double  BSIM3k3;
    double  BSIM3k3b;
    double  BSIM3w0;
    double  BSIM3nlx;
    double  BSIM3dvt0;
    double  BSIM3dvt1;
    double  BSIM3dvt2;
    double  BSIM3dvt0w;
    double  BSIM3dvt1w;
    double  BSIM3dvt2w;
    double  BSIM3drout;
    double  BSIM3dsub;
    double  BSIM3vth0;
    double  BSIM3ua;
    double  BSIM3ua1;
    double  BSIM3ub;
    double  BSIM3ub1;
    double  BSIM3uc;
    double  BSIM3uc1;
    double  BSIM3u0;
    double  BSIM3ute;
    double  BSIM3voff;
    double  BSIM3vfb;
    double  BSIM3delta;
    double  BSIM3rdsw;
    double  BSIM3rds0;
    double  BSIM3prwg;
    double  BSIM3prwb;
    double  BSIM3prt;
    double  BSIM3eta0;
    double  BSIM3etab;
    double  BSIM3pclm;
    double  BSIM3pdibl1;
    double  BSIM3pdibl2;
    double  BSIM3pdiblb;
    double  BSIM3pscbe1;
    double  BSIM3pscbe2;
    double  BSIM3pvag;
    double  BSIM3wr;
    double  BSIM3dwg;
    double  BSIM3dwb;
    double  BSIM3b0;
    double  BSIM3b1;
    double  BSIM3alpha0;
    double  BSIM3beta0;
 
 
    /* CV model */
    double  BSIM3elm;
    double  BSIM3cgsl;
    double  BSIM3cgdl;
    double  BSIM3ckappa;
    double  BSIM3cf;
    double  BSIM3clc;
    double  BSIM3cle;
 
 
/* Pre-calculated constants */
 
    double  BSIM3dw;
    double  BSIM3dl;
    double  BSIM3leff;
    double  BSIM3weff;
 
    double  BSIM3dwc;
    double  BSIM3dlc;
    double  BSIM3leffCV;
    double  BSIM3weffCV;
    double  BSIM3abulkCVfactor;
    double  BSIM3cgso;
    double  BSIM3cgdo;
    double  BSIM3cgbo;
 
    double  BSIM3u0temp;
    double  BSIM3vsattemp;
    double  BSIM3sqrtPhi;
    double  BSIM3phis3;
    double  BSIM3Xdep0;
    double  BSIM3sqrtXdep0;
    double  BSIM3theta0vb0;
    double  BSIM3thetaRout;
 
    double  BSIM3cof1;
    double  BSIM3cof2;
    double  BSIM3cof3;
    double  BSIM3cof4;
    double  BSIM3cdep0;
    struct bsim3SizeDependParam  *pNext;
};
 
/* device instance */
 
struct M_;
 
struct m_ {
    struct m_ *m_next;
    char      *m_name;
    struct M_ *m_model;
    STRESS_BLOCK
 
    CKT_IDX             /* circuit matrix indices: external nodes           */
    m_D,
    m_G,
    m_S,
    m_B;
 
    int     m_off;
 
    /* device parameters and expressions */
    /* MUST FOLLOW m_off */
 
    /* IC= */
    DXPR(m_vds, mx_vds);
    DXPR(m_vgs, mx_vgs);
    DXPR(m_vbs, mx_vbs);
 
    /* instance geometries */
    DXPR(m_l,   mx_l);
    DXPR(m_w,   mx_w);
    DXPR(m_ad,  mx_ad);
    DXPR(m_as,  mx_as);
    DXPR(m_pd,  mx_pd);
    DXPR(m_ps,  mx_ps);
    DXPR(m_nrd, mx_nrd);
    DXPR(m_nrs, mx_nrs);
    DXPR(m_nrg, mx_nrg);
    DXPR(m_nrb, mx_nrb);
    DXPR(m_m,   mx_m);
 
    double              /* reserved: pre-computed values                    */
            m_idsat,    /* = area-scaled d-b saturation current             */
            m_issat,    /* = area-scaled s-b saturation current             */
            m_rd,       /* = 1/( RSH-scaled resistance or model value )     */
            m_rs,       /* = 1/( RSH-scaled resistance or model value )     */
            m_rg,       /* = 1/( RSH-scaled resistance or model value )     */
            m_rb;       /* = 1/( RSH-scaled resistance or model value )     */

    bsim3SizeDependParam *pParam; /* size dependency parameters for BSIM3v3 */

    int     m_mode;     /* values saved from previous iteration             */
    double
            m_von,
            m_vdsat,
            m_xqc,
            m_noi,      /* noise factor for NLEV=3                          */
            m_BSIM3qinv,
            m_BSIM3ueff,
            m_BSIM3tconst,
            BSIM3cgso,
            BSIM3cgdo;
 
    CKT_IDX             /* circuit matrix indices: internal nodes           */
    m_d,
    m_g,
    m_s,
    m_b,
    m_q;                /* q node for BSIM3v3                               */
 
    MTX_IDX             /* MatPrm indices: conductance terms                */
    m_Dd,
    m_gb,
    m_gd,
    m_gs,
    m_Ss,
    m_bg,
    m_bd,
    m_bs,
    m_dD,
    m_dg,
    m_db,
    m_ds,
    m_sg,
    m_sS,
    m_sb,
    m_sd,
    m_DD,
    m_gg,
    m_SS,
    m_bb,
    m_dd,
    m_ss,
    m_GG,
    m_Gg,
    m_gG,
    m_BB,
    m_Bb,
    m_bB,

    m_qq,               /* the following relate to q node for BSIM3v3 */
    m_dq,
    m_sq,
    m_gq,
    m_qg,
    m_qd,
    m_qs,
    m_qb;
 
    MTX_IDX             /* MatPrm indices: branch currents                  */
    m_id,
    m_ig,
    m_ib,
    m_is,
    m_iq;               /* q node for BSIM3v3                               */
 
    double              /* "current" values                                 */
            mcv_id,     /* currents                                         */
            mcv_ibs,
            mcv_ibd,
            mcv_gm,     /* device conductances                              */
            mcv_gds,
            mcv_gmbs,
            mcv_gbd,
            mcv_gbs,
            mcv_gtau,
            mcv_gtg,
            mcv_gtb,
            mcv_gtd,
            mcv_gts;
 
    struct {            /* shared data area                                 */
        struct mac_def m_ac;         /* AC (capacitance values)             */
        struct msv_def m_sv[MSTVCT]; /* state vectors (transient values)    */
    }       m_sda;
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/*   You may add items to the device structure at the end.  DO NOT change   */
/*   the structure in any way except to add items to the end!               */
/*   (New feature for release 5.4)                                          */
/****************************************************************************/
 
};
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/*                                                                          */
/*    NOTE: from 4.00 onward, this procedure has changed slightly.          */
/*          See additional material below.                                  */
/*                                                                          */
/******** To add model parameters, add them to the definition of   **********/
/******** model's structure (M_) and the value structure           **********/
/******** (M_Assoc[]).  The ASSOCIATE macro causes an element in   **********/
/******** the model structure to be associated with a default      **********/
/******** value and a name.  This association is used during       **********/
/******** read-in to allocate memory for the model and to read in  **********/
/******** and default each parameter in a .MODEL statement.        **********/
/******** DO NOT CHANGE THE MODEL PARAMETERS SUPPLIED BY MICROSIM. **********/
/******** In other words, add new model parameters to the end of   **********/
/******** the list, not the beginning or the middle.               **********/
 
/* 4.00+ : in order to add a parameter to the model struct, the MXPR macro  */
/*         must be used. This requires two names as arguments.              */
/*         The first is the parameter's name (for example, M_user1).        */
/*         The second should be the same as the first with an "x" after the */
/*         "M" (for example, Mx_user1).                                     */
 
/*         The ASSOCIATE macro is used the same way as before               */
 
/* device model */
 
struct M_ {
    struct M_      *M_next;
    char           *M_name;
    struct M_      *M_nom;
    struct M_      *M_ako;
    struct ModTemp *M_ModTemp_ptr;
 
    int     M_type;     /* device type == N_TYPE or P_TYPE                  */
 
    double              /* reserved: pre-computed values
                         * Note: F1, F2, F3 are obsolete                    */
            M_vinit,    /* = -1                                             */
            M_vbi,      /* = 2*phi{f} + phi{ms} - q*NSS/cox                 */
            M_xd;       /* = sqrt(2*epSi/(q*NSUB))                          */

    struct bsim3SizeDependParam* pSizeDependParamKnot;
        
    /* model parameters and expressions */
    MXPR(M_level,           Mx_level);
    MXPR(M_tpg,             Mx_tpg);
    MXPR(M_l,               Mx_l);
    MXPR(M_w,               Mx_w);
    MXPR(M_ld,              Mx_ld);               /* also BSIM_DL, BSIM3_DL */
    MXPR(M_wd,              Mx_wd);               /* also BSIM_DW, BSIM3_DW */
    MXPR(M_vto,             Mx_vto);
    MXPR(M_kp,              Mx_kp);
    MXPR(M_gamma,           Mx_gamma);
    MXPR(M_phi,             Mx_phi);           /* also BSIM_phi0, BSIM3_PHI */
    MXPR(M_lambda,          Mx_lambda);
    MXPR(M_xdsquare,        Mx_xdsquare);
    MXPR(M_User_rd,         Mx_User_rd);
    MXPR(M_User_rs,         Mx_User_rs);
    MXPR(M_User_rg,         Mx_User_rg);
    MXPR(M_User_rb,         Mx_User_rb);
    MXPR(M_User_rds,        Mx_User_rds);
    MXPR(M_User_rsh,        Mx_User_rsh);
    MDLPARM M_rd, M_rs, M_rg, M_rb, M_rsh, M_rds, M_nsub, M_nss, M_nfs;
    MDLPARM M_uo, M_ucrit, M_delta, M_eta;
    MXPR(M_is,              Mx_is);
    MXPR(M_js,              Mx_js);
    MXPR(M_jssw,            Mx_jssw);
    MXPR(M_n,               Mx_n);                  /* emission coefficient */
    MXPR(M_pb,              Mx_pb);
    MXPR(M_pbsw,            Mx_pbsw);
    MXPR(M_cbd,             Mx_cbd);
    MXPR(M_cbs,             Mx_cbs);
    MXPR(M_cj,              Mx_cj);
    MXPR(M_cjsw,            Mx_cjsw);
    MXPR(M_mj,              Mx_mj);
    MXPR(M_mjsw,            Mx_mjsw);
    MXPR(M_fc,              Mx_fc);
    MXPR(M_tt,              Mx_tt);      /* transit time for bulk junctions */
    MXPR(M_cgso,            Mx_cgso);
    MXPR(M_cgdo,            Mx_cgdo);
    MXPR(M_cgbo,            Mx_cgbo);
    MXPR(M_User_nsub,       Mx_User_nsub);               /* also BSIM3_NSUB */
    MXPR(M_User_nss,        Mx_User_nss);
    MXPR(M_User_nfs,        Mx_User_nfs);
    MXPR(M_tox,             Mx_tox); /* also BSIM_oxideThickness, BSIM3_TOX */
    MXPR(M_xj,              Mx_xj);                        /* also BSIM3_XJ */
    MXPR(M_User_uo,         Mx_User_uo);
    MXPR(M_User_ucrit,      Mx_User_ucrit);
    MXPR(M_uexp,            Mx_uexp);
    MXPR(M_utra,            Mx_utra);
    MXPR(M_vmax,            Mx_vmax);
    MXPR(M_neff,            Mx_neff);
    MXPR(M_xqc,             Mx_xqc);
    MXPR(M_User_delta,      Mx_User_delta);
    MXPR(M_theta,           Mx_theta);
    MXPR(M_User_eta,        Mx_User_eta);      /* also BSIM_eta0, BSIM3_ETA */
    MXPR(M_kappa,           Mx_kappa);
    MXPR(M_kf,              Mx_kf);
    MXPR(M_af,              Mx_af);
    MXPR(M_nlev,            Mx_nlev);
    MXPR(M_gdsnoi,          Mx_gdsnoi);
    MXPR(M_diomod,          Mx_diomod);
 
    /* BSIM model parameters and expressions */
    MXPR(BSIM_vfb0,         BSIMx_vfb0);                 /* also BSIM3_vfb0 */
    MXPR(BSIM_vfbL,         BSIMx_vfbL);
    MXPR(BSIM_vfbW,         BSIMx_vfbW);
    MXPR(BSIM_phiL,         BSIMx_phiL);
    MXPR(BSIM_phiW,         BSIMx_phiW);
    MXPR(BSIM_User_K10,     BSIMx_User_K10);               /* also BSIM3_K1 */
    MXPR(BSIM_K1L,          BSIMx_K1L);
    MXPR(BSIM_K1W,          BSIMx_K1W);
    MXPR(BSIM_User_K20,     BSIMx_User_K20);               /* also BSIM3_K2 */
    MXPR(BSIM_K2L,          BSIMx_K2L);
    MXPR(BSIM_K2W,          BSIMx_K2W);
    MXPR(BSIM_etaL,         BSIMx_etaL);
    MXPR(BSIM_etaW,         BSIMx_etaW);
    MXPR(BSIM_etaB0,        BSIMx_etaB0);
    MXPR(BSIM_etaBL,        BSIMx_etaBL);
    MXPR(BSIM_etaBW,        BSIMx_etaBW);
    MXPR(BSIM_etaD0,        BSIMx_etaD0);
    MXPR(BSIM_etaDL,        BSIMx_etaDL);
    MXPR(BSIM_etaDW,        BSIMx_etaDW);
    MXPR(BSIM_mobZero,      BSIMx_mobZero);
    MXPR(BSIM_mobZeroB0,    BSIMx_mobZeroB0);
    MXPR(BSIM_mobZeroBL,    BSIMx_mobZeroBL);
    MXPR(BSIM_mobZeroBW,    BSIMx_mobZeroBW);
    MXPR(BSIM_mobVdd0,      BSIMx_mobVdd0);
    MXPR(BSIM_mobVddL,      BSIMx_mobVddL);
    MXPR(BSIM_mobVddW,      BSIMx_mobVddW);
    MXPR(BSIM_mobVddB0,     BSIMx_mobVddB0);
    MXPR(BSIM_mobVddBL,     BSIMx_mobVddBL);
    MXPR(BSIM_mobVddBW,     BSIMx_mobVddBW);
    MXPR(BSIM_mobVddD0,     BSIMx_mobVddD0);
    MXPR(BSIM_mobVddDL,     BSIMx_mobVddDL);
    MXPR(BSIM_mobVddDW,     BSIMx_mobVddDW);
    MXPR(BSIM_ugs0,         BSIMx_ugs0);                   /* also BSIM3_U0 */
    MXPR(BSIM_ugsL,         BSIMx_ugsL);
    MXPR(BSIM_ugsW,         BSIMx_ugsW);
    MXPR(BSIM_ugsB0,        BSIMx_ugsB0);
    MXPR(BSIM_ugsBL,        BSIMx_ugsBL);
    MXPR(BSIM_ugsBW,        BSIMx_ugsBW);
    MXPR(BSIM_uds0,         BSIMx_uds0);
    MXPR(BSIM_udsL,         BSIMx_udsL);
    MXPR(BSIM_udsW,         BSIMx_udsW);
    MXPR(BSIM_udsB0,        BSIMx_udsB0);
    MXPR(BSIM_udsBL,        BSIMx_udsBL);
    MXPR(BSIM_udsBW,        BSIMx_udsBW);
    MXPR(BSIM_udsD0,        BSIMx_udsD0);
    MXPR(BSIM_udsDL,        BSIMx_udsDL);
    MXPR(BSIM_udsDW,        BSIMx_udsDW);
    MXPR(BSIM_subthSlope0,  BSIMx_subthSlope0);
    MXPR(BSIM_subthSlopeL,  BSIMx_subthSlopeL);
    MXPR(BSIM_subthSlopeW,  BSIMx_subthSlopeW);
    MXPR(BSIM_subthSlopeB0, BSIMx_subthSlopeB0);
    MXPR(BSIM_subthSlopeBL, BSIMx_subthSlopeBL);
    MXPR(BSIM_subthSlopeBW, BSIMx_subthSlopeBW);
    MXPR(BSIM_subthSlopeD0, BSIMx_subthSlopeD0);
    MXPR(BSIM_subthSlopeDL, BSIMx_subthSlopeDL);
    MXPR(BSIM_subthSlopeDW, BSIMx_subthSLopeDW);
    MXPR(BSIM_temp,         BSIMx_temp);
    MXPR(BSIM_vdd,          BSIMx_vdd);
    MXPR(BSIM_xpart,        BSIMx_xpart);               /* also BSIM3_XPART */
 
    /* BSIM3 model parameters and expressions */
    MDLPARM BSIM3_NPEAK, BSIM3_GAMMA1, BSIM3_GAMMA2, BSIM3_XT;
    MDLPARM BSIM_K10, BSIM_K20, BSIM3_VBX, BSIM3_VBM, BSIM3_VTH0;
    MXPR(BSIM3_User_VTH0,   BSIM3x_User_VTH0);
    MXPR(BSIM3_K3,          BSIM3x_K3);
    MXPR(BSIM3_W0,          BSIM3x_W0);
    MXPR(BSIM3_NLX,         BSIM3x_NLX);
    MXPR(BSIM3_DVT0,        BSIM3x_DVT0);
    MXPR(BSIM3_DVT1,        BSIM3x_DVT1);
    MXPR(BSIM3_UA,          BSIM3x_UA);
    MXPR(BSIM3_UB,          BSIM3x_UB);
    MXPR(BSIM3_UC,          BSIM3x_UC);
    MXPR(BSIM3_VSAT,        BSIM3x_VSAT);
    MXPR(BSIM3_RDSW,        BSIM3x_RDSW);
    MXPR(BSIM3_VOFF,        BSIM3x_VOFF);
    MXPR(BSIM3_NFACTOR,     BSIM3x_NFACTOR);
    MXPR(BSIM3_CDSC,        BSIM3x_CDSC);
    MXPR(BSIM3_PCLM,        BSIM3x_PCLM);
    MXPR(BSIM3_PDIBL1,      BSIM3x_PDIBL1);
    MXPR(BSIM3_PDIBL2,      BSIM3x_PDIBL2);
    MXPR(BSIM3_DROUT,       BSIM3x_DROUT);
    MXPR(BSIM3_PSCBE1,      BSIM3x_PSCBE1);
    MXPR(BSIM3_PSCBE2,      BSIM3x_PSCBE2);
    MXPR(BSIM3_A0,          BSIM3x_A0);
    MXPR(BSIM3_A1,          BSIM3x_A1);
    MXPR(BSIM3_A2,          BSIM3x_A2);
    MXPR(BSIM3_User_NPEAK,  BSIM3x_User_NPEAK);
    MXPR(BSIM3_SUBTHMOD,    BSIM3x_SUBTHMOD);
    MXPR(BSIM3_SATMOD,      BSIM3x_SATMOD);
    MXPR(BSIM3_VGLOW,       BSIM3x_VGLOW);
    MXPR(BSIM3_VGHIGH,      BSIM3x_VGHIGH);
    MXPR(BSIM3_User_GAMMA1, BSIM3x_User_GAMMA1);
    MXPR(BSIM3_User_GAMMA2, BSIM3x_User_GAMMA2);
    MXPR(BSIM3_User_XT,     BSIM3x_User_XT);
    MXPR(BSIM3_User_VBM,    BSIM3x_User_VBM);
    MXPR(BSIM3_User_VBX,    BSIM3x_User_VBX);
    MXPR(BSIM3_VBI,         BSIM3x_VBI);
    MXPR(BSIM3_U0TEMP,      BSIM3x_U0TEMP);
    MXPR(BSIM3_VSATTEMP,    BSIM3x_VSATTEMP);
    MXPR(BSIM3_EM,          BSIM3x_EM);
    MXPR(BSIM3_LDD,         BSIM3x_LDD);
    MXPR(BSIM3_LITL,        BSIM3x_LITL);
    MXPR(BSIM3_ALPHA,       BSIM3x_ALPHA);
    MXPR(BSIM3_KT1,         BSIM3x_KT1);
    MXPR(BSIM3_KT2,         BSIM3x_KT2);
    MXPR(BSIM3_UA1,         BSIM3x_UA1);
    MXPR(BSIM3_UB1,         BSIM3x_UB1);
    MXPR(BSIM3_UC1,         BSIM3x_UC1);
    MXPR(BSIM3_AT,          BSIM3x_AT);
 
    /* BSIM3 version 2.0 additional parameters and expressions */
    MXPR(BSIM3_PVAG,        BSIM3x_PVAG);
    MXPR(BSIM3_KETA,        BSIM3x_KETA);
    MXPR(BSIM3_ETA0,        BSIM3x_ETA0);
    MXPR(BSIM3_ETAB,        BSIM3x_ETAB);
    MXPR(BSIM3_KT1L,        BSIM3x_KT1L);
    MXPR(BSIM3_K3B,         BSIM3x_K3B);
    MXPR(BSIM3_DVT2,        BSIM3x_DVT2);
    MXPR(BSIM3_CDSCB,       BSIM3x_CDSCB);
    MXPR(BSIM3_CIT,         BSIM3x_CIT);
    MXPR(BSIM3_BULKMOD,     BSIM3x_BULKMOD);
    MXPR(BSIM3_DSUB,        BSIM3x_DSUB);
    MXPR(BSIM3_RDS0,        BSIM3x_RDS0);
    MXPR(BSIM3_UTE,         BSIM3x_UTE);
    MDLPARM BSIM3_TNOM;
    MXPR(BSIM3_NGATE,       BSIM3x_NGATE);

    /* BSIM3 version 3.0 additional parameters and expressions */
    MXPR(BSIM3_MOBMOD,      BSIM3x_MOBMOD);
    MXPR(BSIM3_BINUNIT,     BSIM3x_BINUNIT);
    MXPR(BSIM3_CAPMOD,      BSIM3x_CAPMOD);
    MXPR(BSIM3_NQSMOD,      BSIM3x_NQSMOD);
    MXPR(BSIM3_NOIMOD,      BSIM3x_NOIMOD);
    MXPR(BSIM3_CDSCD,       BSIM3x_CDSCD);
    MXPR(BSIM3_AGS,         BSIM3x_AGS);
    MXPR(BSIM3_DVT0W,       BSIM3x_DVT0W);
    MXPR(BSIM3_DVT1W,       BSIM3x_DVT1W);
    MXPR(BSIM3_DVT2W,       BSIM3x_DVT2W);
    MXPR(BSIM3_PRWG,        BSIM3x_PRWG);
    MXPR(BSIM3_PRWB,        BSIM3x_PRWB);
    MXPR(BSIM3_PRT,         BSIM3x_PRT);
    MXPR(BSIM3_PDIBLB,      BSIM3x_PDIBLB);
    MXPR(BSIM3_WR,          BSIM3x_WR);
    MXPR(BSIM3_DWG,         BSIM3x_DWG);
    MXPR(BSIM3_DWB,         BSIM3x_DWB);
    MXPR(BSIM3_B0,          BSIM3x_B0);
    MXPR(BSIM3_B1,          BSIM3x_B1);
    MXPR(BSIM3_ALPHA0,      BSIM3x_ALPHA0);
    MXPR(BSIM3_BETA0,       BSIM3x_BETA0);
    MXPR(BSIM3_ELM,         BSIM3x_ELM);
    MXPR(BSIM3_CGSL,        BSIM3x_CGSL);
    MXPR(BSIM3_CGDL,        BSIM3x_CGDL);
    MXPR(BSIM3_CKAPPA,      BSIM3x_CKAPPA);
    MXPR(BSIM3_CLC,         BSIM3x_CLC);
    MXPR(BSIM3_CLE,         BSIM3x_CLE);
    MXPR(BSIM3_LINT,        BSIM3x_LINT);
    MXPR(BSIM3_LL,          BSIM3x_LL);
    MXPR(BSIM3_LLN,         BSIM3x_LLN);
    MXPR(BSIM3_LW,          BSIM3x_LW);
    MXPR(BSIM3_LWN,         BSIM3x_LWN);
    MXPR(BSIM3_LWL,         BSIM3x_LWL);
    MXPR(BSIM3_LMIN,        BSIM3x_LMIN);
    MXPR(BSIM3_LMAX,        BSIM3x_LMAX);
    MXPR(BSIM3_WINT,        BSIM3x_WINT);
    MXPR(BSIM3_WL,          BSIM3x_WL);
    MXPR(BSIM3_WLN,         BSIM3x_WLN);
    MXPR(BSIM3_WW,          BSIM3x_WW);
    MXPR(BSIM3_WWN,         BSIM3x_WWN);
    MXPR(BSIM3_WWL,         BSIM3x_WWL);
    MXPR(BSIM3_WMIN,        BSIM3x_WMIN);
    MXPR(BSIM3_WMAX,        BSIM3x_WMAX);
    MXPR(BSIM3_EF,          BSIM3x_EF);
    MXPR(BSIM3_DLC,         BSIM3x_DLC);
    MXPR(BSIM3_DWC,         BSIM3x_DWC);
    MXPR(BSIM3_CF,          BSIM3x_CF);
    MXPR(BSIM3_NOIA,        BSIM3x_NOIA);
    MXPR(BSIM3_NOIB,        BSIM3x_NOIB);
    MXPR(BSIM3_NOIC,        BSIM3x_NOIC);
    MXPR(BSIM3lcdsc,        BSIM3xlcdsc);
    MXPR(BSIM3lcdscb,       BSIM3xlcdscb);
    MXPR(BSIM3lcdscd,       BSIM3xlcdscd);
    MXPR(BSIM3lcit,         BSIM3xlcit);
    MXPR(BSIM3lnfactor,     BSIM3xlnfactor);
    MXPR(BSIM3lxj,          BSIM3xlxj);
    MXPR(BSIM3lvsat,        BSIM3xlvsat);
    MXPR(BSIM3lat,          BSIM3xlat);
    MXPR(BSIM3la0,          BSIM3xla0);
    MXPR(BSIM3lags,         BSIM3xlags);
    MXPR(BSIM3la1,          BSIM3xla1);
    MXPR(BSIM3la2,          BSIM3xla2);
    MXPR(BSIM3lketa,        BSIM3xlketa);
    MXPR(BSIM3lnsub,        BSIM3xlnsub);
    MXPR(BSIM3lnpeak,       BSIM3xlnpeak);
    MXPR(BSIM3lvbm,         BSIM3xlvbm);
    MXPR(BSIM3lxt,          BSIM3xlxt);
    MXPR(BSIM3lkt1,         BSIM3xlkt1);
    MXPR(BSIM3lkt1l,        BSIM3xlkt1l);
    MXPR(BSIM3lkt2,         BSIM3xlkt2);
    MXPR(BSIM3lk3,          BSIM3xlk3);
    MXPR(BSIM3lk3b,         BSIM3xlk3b);
    MXPR(BSIM3lw0,          BSIM3xlw0);
    MXPR(BSIM3lnlx,         BSIM3xlnlx);
    MXPR(BSIM3ldvt0,        BSIM3xldvt0);
    MXPR(BSIM3ldvt1,        BSIM3xldvt1);
    MXPR(BSIM3ldvt2,        BSIM3xldvt2);
    MXPR(BSIM3ldvt0w,       BSIM3xldvt0w);
    MXPR(BSIM3ldvt1w,       BSIM3xldvt1w);
    MXPR(BSIM3ldvt2w,       BSIM3xldvt2w);
    MXPR(BSIM3ldrout,       BSIM3xldrout);
    MXPR(BSIM3ldsub,        BSIM3xldsub);
    MXPR(BSIM3lvth0,        BSIM3xlvth0);
    MXPR(BSIM3lua,          BSIM3xlua);
    MXPR(BSIM3lua1,         BSIM3xlua1);
    MXPR(BSIM3lub,          BSIM3xlub);
    MXPR(BSIM3lub1,         BSIM3xlub1);
    MXPR(BSIM3luc,          BSIM3xluc);
    MXPR(BSIM3luc1,         BSIM3xluc1);
    MXPR(BSIM3lute,         BSIM3xlute);
    MXPR(BSIM3lvoff,        BSIM3xlvoff);
    MXPR(BSIM3ldelta,       BSIM3xldelta);
    MXPR(BSIM3lrdsw,        BSIM3xlrdsw);
    MXPR(BSIM3lprwb,        BSIM3xlprwb);
    MXPR(BSIM3lprwg,        BSIM3xlprwg);
    MXPR(BSIM3lprt,         BSIM3xlprt);
    MXPR(BSIM3leta0,        BSIM3xleta0);
    MXPR(BSIM3letab,        BSIM3xletab);
    MXPR(BSIM3lpclm,        BSIM3xlpclm);
    MXPR(BSIM3lpdibl1,      BSIM3xlpdibl1);
    MXPR(BSIM3lpdibl2,      BSIM3xlpdibl2);
    MXPR(BSIM3lpdiblb,      BSIM3xlpdiblb);
    MXPR(BSIM3lpscbe1,      BSIM3xlpscbe1);
    MXPR(BSIM3lpscbe2,      BSIM3xlpscbe2);
    MXPR(BSIM3lpvag,        BSIM3xlpvag);
    MXPR(BSIM3lwr,          BSIM3xlwr);
    MXPR(BSIM3ldwg,         BSIM3xldwg);
    MXPR(BSIM3ldwb,         BSIM3xldwb);
    MXPR(BSIM3lb0,          BSIM3xlb0);
    MXPR(BSIM3lb1,          BSIM3xlb1);
    MXPR(BSIM3lalpha0,      BSIM3xlalpha0);
    MXPR(BSIM3lbeta0,       BSIM3xlbeta0);
    MXPR(BSIM3lelm,         BSIM3xlelm);
    MXPR(BSIM3lcgsl,        BSIM3xlcgsl);
    MXPR(BSIM3lcgdl,        BSIM3xlcgdl);
    MXPR(BSIM3lckappa,      BSIM3xlckappa);
    MXPR(BSIM3lcf,          BSIM3xlcf);
    MXPR(BSIM3lclc,         BSIM3xlclc);
    MXPR(BSIM3lcle,         BSIM3xlcle);
    MXPR(BSIM3wcdsc,        BSIM3xwcdsc);
    MXPR(BSIM3wcdscb,       BSIM3xwcdscb);
    MXPR(BSIM3wcdscd,       BSIM3xwcdscd);
    MXPR(BSIM3wcit,         BSIM3xwcit);
    MXPR(BSIM3wnfactor,     BSIM3xwnfactor);
    MXPR(BSIM3wxj,          BSIM3xwxj);
    MXPR(BSIM3wvsat,        BSIM3xwvsat);
    MXPR(BSIM3wat,          BSIM3xwat);
    MXPR(BSIM3wa0,          BSIM3xwa0);
    MXPR(BSIM3wags,         BSIM3xwags);
    MXPR(BSIM3wa1,          BSIM3xwa1);
    MXPR(BSIM3wa2,          BSIM3xwa2);
    MXPR(BSIM3wketa,        BSIM3xwketa);
    MXPR(BSIM3wnsub,        BSIM3xwnsub);
    MXPR(BSIM3wnpeak,       BSIM3xwnpeak);
    MXPR(BSIM3wvbm,         BSIM3xwvbm);
    MXPR(BSIM3wxt,          BSIM3xwxt);
    MXPR(BSIM3wkt1,         BSIM3xwkt1);
    MXPR(BSIM3wkt1l,        BSIM3xwkt1l);
    MXPR(BSIM3wkt2,         BSIM3xwkt2);
    MXPR(BSIM3wk3,          BSIM3xwk3);
    MXPR(BSIM3wk3b,         BSIM3xwk3b);
    MXPR(BSIM3ww0,          BSIM3xww0);
    MXPR(BSIM3wnlx,         BSIM3xwnlx);
    MXPR(BSIM3wdvt0,        BSIM3xwdvt0);
    MXPR(BSIM3wdvt1,        BSIM3xwdvt1);
    MXPR(BSIM3wdvt2,        BSIM3xwdvt2);
    MXPR(BSIM3wdvt0w,       BSIM3xwdvt0w);
    MXPR(BSIM3wdvt1w,       BSIM3xwdvt1w);
    MXPR(BSIM3wdvt2w,       BSIM3xwdvt2w);
    MXPR(BSIM3wdrout,       BSIM3xwdrout);
    MXPR(BSIM3wdsub,        BSIM3xwdsub);
    MXPR(BSIM3wvth0,        BSIM3xwvth0);
    MXPR(BSIM3wua,          BSIM3xwua);
    MXPR(BSIM3wua1,         BSIM3xwua1);
    MXPR(BSIM3wub,          BSIM3xwub);
    MXPR(BSIM3wub1,         BSIM3xwub1);
    MXPR(BSIM3wuc,          BSIM3xwuc);
    MXPR(BSIM3wuc1,         BSIM3xwuc1);
    MXPR(BSIM3wute,         BSIM3xwute);
    MXPR(BSIM3wvoff,        BSIM3xwvoff);
    MXPR(BSIM3wdelta,       BSIM3xwdelta);
    MXPR(BSIM3wrdsw,        BSIM3xwrdsw);
    MXPR(BSIM3wprwb,        BSIM3xwprwb);
    MXPR(BSIM3wprwg,        BSIM3xwprwg);
    MXPR(BSIM3wprt,         BSIM3xwprt);
    MXPR(BSIM3weta0,        BSIM3xweta0);
    MXPR(BSIM3wetab,        BSIM3xwetab);
    MXPR(BSIM3wpclm,        BSIM3xwpclm);
    MXPR(BSIM3wpdibl1,      BSIM3xwpdibl1);
    MXPR(BSIM3wpdibl2,      BSIM3xwpdibl2);
    MXPR(BSIM3wpdiblb,      BSIM3xwpdiblb);
    MXPR(BSIM3wpscbe1,      BSIM3xwpscbe1);
    MXPR(BSIM3wpscbe2,      BSIM3xwpscbe2);
    MXPR(BSIM3wpvag,        BSIM3xwpvag);
    MXPR(BSIM3wwr,          BSIM3xwwr);
    MXPR(BSIM3wdwg,         BSIM3xwdwg);
    MXPR(BSIM3wdwb,         BSIM3xwdwb);
    MXPR(BSIM3wb0,          BSIM3xwb0);
    MXPR(BSIM3wb1,          BSIM3xwb1);
    MXPR(BSIM3walpha0,      BSIM3xwalpha0);
    MXPR(BSIM3wbeta0,       BSIM3xwbeta0);
    MXPR(BSIM3welm,         BSIM3xwelm);
    MXPR(BSIM3wcgsl,        BSIM3xwcgsl);
    MXPR(BSIM3wcgdl,        BSIM3xwcgdl);
    MXPR(BSIM3wckappa,      BSIM3xwckappa);
    MXPR(BSIM3wcf,          BSIM3xwcf);
    MXPR(BSIM3wclc,         BSIM3xwclc);
    MXPR(BSIM3wcle,         BSIM3xwcle);
    MXPR(BSIM3pcdsc,        BSIM3xpcdsc);
    MXPR(BSIM3pcdscb,       BSIM3xpcdscb);
    MXPR(BSIM3pcdscd,       BSIM3xpcdscd);
    MXPR(BSIM3pcit,         BSIM3xpcit);
    MXPR(BSIM3pnfactor,     BSIM3xpnfactor);
    MXPR(BSIM3pxj,          BSIM3xpxj);
    MXPR(BSIM3pvsat,        BSIM3xpvsat);
    MXPR(BSIM3pat,          BSIM3xpat);
    MXPR(BSIM3pa0,          BSIM3xpa0);
    MXPR(BSIM3pags,         BSIM3xpags);
    MXPR(BSIM3pa1,          BSIM3xpa1);
    MXPR(BSIM3pa2,          BSIM3xpa2);
    MXPR(BSIM3pketa,        BSIM3xpketa);
    MXPR(BSIM3pnsub,        BSIM3xpnsub);
    MXPR(BSIM3pnpeak,       BSIM3xpnpeak);
    MXPR(BSIM3pvbm,         BSIM3xpvbm);
    MXPR(BSIM3pxt,          BSIM3xpxt);
    MXPR(BSIM3pkt1,         BSIM3xpkt1);
    MXPR(BSIM3pkt1l,        BSIM3xpkt1l);
    MXPR(BSIM3pkt2,         BSIM3xpkt2);
    MXPR(BSIM3pk3,          BSIM3xpk3);
    MXPR(BSIM3pk3b,         BSIM3xpk3b);
    MXPR(BSIM3pw0,          BSIM3xpw0);
    MXPR(BSIM3pnlx,         BSIM3xpnlx);
    MXPR(BSIM3pdvt0,        BSIM3xpdvt0);
    MXPR(BSIM3pdvt1,        BSIM3xpdvt1);
    MXPR(BSIM3pdvt2,        BSIM3xpdvt2);
    MXPR(BSIM3pdvt0w,       BSIM3xpdvt0w);
    MXPR(BSIM3pdvt1w,       BSIM3xpdvt1w);
    MXPR(BSIM3pdvt2w,       BSIM3xpdvt2w);
    MXPR(BSIM3pdrout,       BSIM3xpdrout);
    MXPR(BSIM3pdsub,        BSIM3xpdsub);
    MXPR(BSIM3pvth0,        BSIM3xpvth0);
    MXPR(BSIM3pua,          BSIM3xpua);
    MXPR(BSIM3pua1,         BSIM3xpua1);
    MXPR(BSIM3pub,          BSIM3xpub);
    MXPR(BSIM3pub1,         BSIM3xpub1);
    MXPR(BSIM3puc,          BSIM3xpuc);
    MXPR(BSIM3puc1,         BSIM3xpuc1);
    MXPR(BSIM3pu0,          BSIM3xpu0);
    MXPR(BSIM3pute,         BSIM3xpute);
    MXPR(BSIM3pvoff,        BSIM3xpvoff);
    MXPR(BSIM3pdelta,       BSIM3xpdelta);
    MXPR(BSIM3prdsw,        BSIM3xprdsw);
    MXPR(BSIM3pprwb,        BSIM3xpprwb);
    MXPR(BSIM3pprwg,        BSIM3xpprwg);
    MXPR(BSIM3pprt,         BSIM3xpprt);
    MXPR(BSIM3peta0,        BSIM3xpeta0);
    MXPR(BSIM3petab,        BSIM3xpetab);
    MXPR(BSIM3ppclm,        BSIM3xppclm);
    MXPR(BSIM3ppdibl1,      BSIM3xppdibl1);
    MXPR(BSIM3ppdibl2,      BSIM3xppdibl2);
    MXPR(BSIM3ppdiblb,      BSIM3xppdiblb);
    MXPR(BSIM3ppscbe1,      BSIM3xppscbe1);
    MXPR(BSIM3ppscbe2,      BSIM3xppscbe2);
    MXPR(BSIM3ppvag,        BSIM3xppvag);
    MXPR(BSIM3pwr,          BSIM3xpwr);
    MXPR(BSIM3pdwg,         BSIM3xpdwg);
    MXPR(BSIM3pdwb,         BSIM3xpdwb);
    MXPR(BSIM3pb0,          BSIM3xpb0);
    MXPR(BSIM3pb1,          BSIM3xpb1);
    MXPR(BSIM3palpha0,      BSIM3xpalpha0);
    MXPR(BSIM3pbeta0,       BSIM3xpbeta0);
    MXPR(BSIM3pelm,         BSIM3xpelm);
    MXPR(BSIM3pcgsl,        BSIM3xpcgsl);
    MXPR(BSIM3pcgdl,        BSIM3xpcgdl);
    MXPR(BSIM3pckappa,      BSIM3xpckappa);
    MXPR(BSIM3pcf,          BSIM3xpcf);
    MXPR(BSIM3pclc,         BSIM3xpclc);
    MXPR(BSIM3pcle,         BSIM3xpcle);
    MXPR(BSIM3lngate,       BSIM3xlngate);
    MXPR(BSIM3wngate,       BSIM3xwngate);
    MXPR(BSIM3pngate,       BSIM3xpngate);
    MXPR(BSIM3lgamma1,      BSIM3xlgamma1);
    MXPR(BSIM3wgamma1,      BSIM3xwgamma1);
    MXPR(BSIM3pgamma1,      BSIM3xpgamma1);
    MXPR(BSIM3lgamma2,      BSIM3xlgamm2);
    MXPR(BSIM3wgamma2,      BSIM3xwgamma2);
    MXPR(BSIM3pgamma2,      BSIM3xpgamma2);
    MXPR(BSIM3lvbx,         BSIM3xlvbx);
    MXPR(BSIM3wvbx,         BSIM3xwvbx);
    MXPR(BSIM3pvbx,         BSIM3xpvbx);
    MXPR(BSIM3pk1,          BSIM3xpk1);
    MXPR(BSIM3pk2,          BSIM3xpk2);
    MXPR(BSIM3vtm,          BSIM3xvtm);  /* Internal only */
    
 
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** Add new model parameters after this line                 **********/
 
/******** and before this line                                     **********/
};
 
#ifdef M_DEVICE
 
struct  M_      M_default;
 
#define BASE    M_default
 
struct  Assoc   M_Assoc[] = {                   /*IGNORE*/ /* for Pre-C */
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
/******** This table is used by the read-in code to decode the     **********/
/******** .MODEL statements.  The format is:                       **********/
 
/********          element     default  parameter                  **********/
/********           name        value     name                     **********/
    ASSOCIATE (M_level,           1,        "*LEVEL"    ),
 
/******** where "element name" is the name in the M_ structure     **********/
/******** above, "default value" is the value the parameter is     **********/
/******** given if it is not specified on the .MODEL statement,    **********/
/******** and "parameter name" is the name in the .MODEL that the  **********/
/******** read-in will associate with this parameter.  If the      **********/
/******** "parameter name" starts with "*" then the the parameter  **********/
/******** will be included in the PSpice's model parameter         **********/
/******** printout whether or not it was defaulted.                **********/
    ASSOCIATE (M_tpg,             1,        "TPG"       ),
    ASSOCIATE (M_l,               OMITTED,  "L"         ),
    ASSOCIATE (M_w,               OMITTED,  "W"         ),
    ASSOCIATE (M_ld,              0.,       "LD"        ),
    ASSOCIATE (M_wd,              0.,       "WD"        ),
    ASSOCIATE (M_vto,             OMITTED,  "*VTO"      ),      /* force print */
    ASSOCIATE (M_kp,              OMITTED,  "*KP"       ),      /* force print */
    ASSOCIATE (M_gamma,           OMITTED,  "GAMMA"     ),
    ASSOCIATE (M_phi,             OMITTED,  "PHI"       ),
    ASSOCIATE (M_lambda,          0.,       "LAMBDA"    ),
    ASSOCIATE (M_User_rd,         0.,       "RD"        ),
    ASSOCIATE (M_User_rs,         0.,       "RS"        ),
    ASSOCIATE (M_User_rg,         0.,       "RG"        ),
    ASSOCIATE (M_User_rb,         0.,       "RB"        ),
    ASSOCIATE (M_User_rds,        0.,       "RDS"       ),
    ASSOCIATE (M_User_rsh,        0.,       "RSH"       ),
    ASSOCIATE (M_is,              OMITTED,  "IS"        ),
    ASSOCIATE (M_js,              OMITTED,  "JS"        ),
    ASSOCIATE (M_jssw,            0.,       "JSSW"      ),
    ASSOCIATE (M_n,               1.,       "N"         ),
    ASSOCIATE (M_pb,              OMITTED,  "PB"        ),
    ASSOCIATE (M_pbsw,            OMITTED,  "PBSW"      ),
    ASSOCIATE (M_cbd,             0.,       "CBD"       ),
    ASSOCIATE (M_cbs,             0.,       "CBS"       ),
    ASSOCIATE (M_cj,              OMITTED,  "CJ"        ),
    ASSOCIATE (M_cjsw,            OMITTED,  "CJSW"      ),
    ASSOCIATE (M_mj,              .5,       "MJ"        ),
    ASSOCIATE (M_mjsw,            .33,      "MJSW"      ),
    ASSOCIATE (M_fc,              .5,       "FC"        ),
    ASSOCIATE (M_tt,              0.,       "TT"        ),
    ASSOCIATE (M_cgso,            OMITTED,  "CGSO"      ),
    ASSOCIATE (M_cgdo,            OMITTED,  "CGDO"      ),
    ASSOCIATE (M_cgbo,            0.,       "CGBO"      ),
    ASSOCIATE (M_User_nsub,       OMITTED,  "NSUB"      ),
    ASSOCIATE (M_User_nss,        OMITTED,  "NSS"       ),
    ASSOCIATE (M_User_nfs,        0.,       "NFS"       ),
    ASSOCIATE (M_tox,             OMITTED,  "TOX"       ),
    ASSOCIATE (M_xj,              OMITTED,  "XJ"        ),
    ASSOCIATE (M_User_uo,         600.,     "UO"        ),
    ASSOCIATE (M_User_ucrit,      1E4,      "UCRIT"     ),
    ASSOCIATE (M_uexp,            0.,       "UEXP"      ),
    ASSOCIATE (M_utra,            0.,       "UTRA"      ),
    ASSOCIATE (M_vmax,            0.,       "VMAX"      ),
    ASSOCIATE (M_neff,            1.,       "NEFF"      ),
    ASSOCIATE (M_xqc,             1.,       "XQC"       ),
    ASSOCIATE (M_User_delta,      OMITTED,  "DELTA"     ),
    ASSOCIATE (M_theta,           0.,       "THETA"     ),
    ASSOCIATE (M_User_eta,        OMITTED,  "ETA"       ),
    ASSOCIATE (M_kappa,           .2,       "KAPPA"     ),
    ASSOCIATE (M_kf,              0.,       "KF"        ),
    ASSOCIATE (M_af,              1.,       "AF"        ),
    ASSOCIATE (M_nlev,            2.,       "NLEV"      ),
    ASSOCIATE (M_gdsnoi,          1.,       "GDSNOI"    ),
    ASSOCIATE (M_diomod,          OMITTED,  "DIOMOD"    ),
 
    ASSOCIATE (BSIM_vfb0,         OMITTED,  "VFB"       ), /* Flat band
                                                            * voltage */
    ASSOCIATE (BSIM_vfbL,         0.,       "LVFB"      ), /* Length dependence
                                                            * of vfb */
    ASSOCIATE (BSIM_vfbW,         0.,       "WVFB"      ), /* Width dependence
                                                            * of vfb */
    ASSOCIATE (BSIM_phiL,         0.,       "LPHI"      ), /* Length dependence
                                                            * of phi */
    ASSOCIATE (BSIM_phiW,         0.,       "WPHI"      ), /* Width dependence
                                                            * of phi */
    ASSOCIATE (BSIM_User_K10,     OMITTED,  "K1"        ), /* Bulk effect
                                                            * coefficient 1 */
    ASSOCIATE (BSIM_K1L,          0.,       "LK1"       ), /* Length dependence
                                                            * of k1 */
    ASSOCIATE (BSIM_K1W,          0.,       "WK1"       ), /* Width dependence
                                                            * of k1 */
    ASSOCIATE (BSIM_User_K20,     OMITTED,  "K2"        ), /* Bulk effect
                                                            * coefficient 2 */
    ASSOCIATE (BSIM_K2L,          0.,       "LK2"       ), /* Length dependence
                                                            * of k2 */
    ASSOCIATE (BSIM_K2W,          0.,       "WK2"       ), /* Width dependence
                                                            * of k2 */
    ASSOCIATE (BSIM_etaL,         0.,       "LETA"      ), /* Length dependence
                                                            * of eta */
    ASSOCIATE (BSIM_etaW,         0.,       "WETA"      ), /* Width dependence
                                                            * of eta */
    ASSOCIATE (BSIM_etaB0,        0.,       "X2E"       ), /* VBS dependence of
                                                            * eta */
    ASSOCIATE (BSIM_etaBL,        0.,       "LX2E"      ), /* Length dependence
                                                            * of x2e */
    ASSOCIATE (BSIM_etaBW,        0.,       "WX2E"      ), /* Width dependence
                                                            * of x2e */
    ASSOCIATE (BSIM_etaD0,        0.,       "X3E"       ), /* VDS dependence of
                                                            * eta */
    ASSOCIATE (BSIM_etaDL,        0.,       "LX3E"      ), /* Length dependence
                                                            * of x3e */
    ASSOCIATE (BSIM_etaDW,        0.,       "WX3E"      ), /* Width dependence
                                                            * of x3e */
    ASSOCIATE (BSIM_mobZero,      0.,       "MUZ"       ), /* Zero field
                                                            * mobility at VDS=0
                                                            * VGS=VTH */
    ASSOCIATE (BSIM_mobZeroB0,    0.,       "X2MZ"      ), /* VBS dependence of
                                                            * muz */
    ASSOCIATE (BSIM_mobZeroBL,    0.,       "LX2MZ"     ), /* Length dependence
                                                            * of x2mz */
    ASSOCIATE (BSIM_mobZeroBW,    0.,       "WX2MZ"     ), /* Width dependence
                                                            * of x2mz */
    ASSOCIATE (BSIM_mobVdd0,      0.,       "MUS"       ), /* Mobility at VDS=
                                                            * VDD VGS=VTH,
                                                            * channel length
                                                            * modulation */
    ASSOCIATE (BSIM_mobVddL,      0.,       "LMUS"      ), /* Length dependence
                                                            * of mus */
    ASSOCIATE (BSIM_mobVddW,      0.,       "WMUS"      ), /* Width dependence
                                                            * of mus */
    ASSOCIATE (BSIM_mobVddB0,     0.,       "X2MS"      ), /* VBS dependence of
                                                            * mus */
    ASSOCIATE (BSIM_mobVddBL,     0.,       "LX2MS"     ), /* Length dependence
                                                            * of x2ms */
    ASSOCIATE (BSIM_mobVddBW,     0.,       "WX2MS"     ), /* Width dependence
                                                            * of x2ms */
    ASSOCIATE (BSIM_mobVddD0,     0.,       "X3MS"      ), /* VDS dependence of
                                                            * mus */
    ASSOCIATE (BSIM_mobVddDL,     0.,       "LX3MS"     ), /* Length dependence
                                                            * of x3ms */
    ASSOCIATE (BSIM_mobVddDW,     0.,       "WX3MS"     ), /* Width dependence
                                                            * of x3ms */
    ASSOCIATE (BSIM_ugs0,         OMITTED,  "U0"        ), /* VGS dependence of
                                                            * mobility */
    ASSOCIATE (BSIM_ugsL,         0.,       "LU0"       ), /* Length dependence
                                                            * of u0 */
    ASSOCIATE (BSIM_ugsW,         0.,       "WU0"       ), /* Width dependence
                                                            * of u0 */
    ASSOCIATE (BSIM_ugsB0,        0.,       "X2U0"      ), /* VBS dependence of
                                                            * u0 */
    ASSOCIATE (BSIM_ugsBL,        0.,       "LX2U0"     ), /* Length dependence
                                                            * of x2u0 */
    ASSOCIATE (BSIM_ugsBW,        0.,       "WX2U0"     ), /* Width dependence
                                                            * of x2u0 */
    ASSOCIATE (BSIM_uds0,         0.,       "U1"        ), /* VDS depence of
                                                            * mobility, velocity saturation */
    ASSOCIATE (BSIM_udsL,         0.,       "LU1"       ), /* Length dependence
                                                            * of u1 */
    ASSOCIATE (BSIM_udsW,         0.,       "WU1"       ), /* Width dependence
                                                            * of u1 */
    ASSOCIATE (BSIM_udsB0,        0.,       "X2U1"      ), /* VBS depence of
                                                            * u1 */
    ASSOCIATE (BSIM_udsBL,        0.,       "LX2U1"     ), /* Length depence of
                                                            * x2u1 */
    ASSOCIATE (BSIM_udsBW,        0.,       "WX2U1"     ), /* Width depence of
                                                            * x2u1 */
    ASSOCIATE (BSIM_udsD0,        0.,       "X3U1"      ), /* VDS depence of
                                                            * u1 */
    ASSOCIATE (BSIM_udsDL,        0.,       "LX3U1"     ), /* Length dependence
                                                            * of x3u1 */
    ASSOCIATE (BSIM_udsDW,        0.,       "WX3U1"     ), /* Width depence of
                                                            * x3u1 */
    ASSOCIATE (BSIM_subthSlope0,  0.,       "N0"        ), /* Subthreshold
                                                            * slope */
    ASSOCIATE (BSIM_subthSlopeL,  0.,       "LN0"       ), /* Length dependence
                                                            * of n0 */
    ASSOCIATE (BSIM_subthSlopeW,  0.,       "WN0"       ), /* Width dependence
                                                            * of n0 */
    ASSOCIATE (BSIM_subthSlopeB0, 0.,       "NB"        ), /* VBS dependence of
                                                            * subthreshold
                                                            * slope */
    ASSOCIATE (BSIM_subthSlopeBL, 0.,       "LNB"       ), /* Length dependence
                                                            * of nb */
    ASSOCIATE (BSIM_subthSlopeBW, 0.,       "WNB"       ), /* Width dependence
                                                            * of nb */
    ASSOCIATE (BSIM_subthSlopeD0, 0.,       "ND"        ), /* VDS dependence of
                                                            * subthreshold slope */
    ASSOCIATE (BSIM_subthSlopeDL, 0.,       "LND"       ), /* Length dependence
                                                            * of nd */
    ASSOCIATE (BSIM_subthSlopeDW, 0.,       "WND"       ), /* Width dependence
                                                            * of nd */
    ASSOCIATE (BSIM_temp,         OMITTED,  "TEMP"      ), /* Temperature in
                                                            * degree Celcius */
    ASSOCIATE (BSIM_vdd,          OMITTED,  "VDD"       ), /* Supply voltage to
                                                            * specify mus */
    ASSOCIATE (BSIM_xpart,        OMITTED,  "XPART"     ), /* Flag for channel
                                                            * charge
                                                            * partitioning */
 
    ASSOCIATE ( BSIM3_User_VTH0,  OMITTED,  "VTH0"      ),
    ASSOCIATE ( BSIM3_K3,         80.0,     "K3"        ),
    ASSOCIATE ( BSIM3_W0,         2.5E-6,   "W0"        ),
    ASSOCIATE ( BSIM3_NLX,        1.74E-7,  "NLX"       ),
    ASSOCIATE ( BSIM3_DVT0,       2.2,      "DVT0"      ),
    ASSOCIATE ( BSIM3_DVT1,       .53,      "DVT1"      ),
    ASSOCIATE ( BSIM3_UA,         2.25E-9,  "UA"        ),
    ASSOCIATE ( BSIM3_UB,         5.87E-19, "UB"        ),
    ASSOCIATE ( BSIM3_UC,         OMITTED,  "UC"        ),
    ASSOCIATE ( BSIM3_VSAT,       OMITTED,  "VSAT"      ),
    ASSOCIATE ( BSIM3_RDSW,       0.,       "RDSW"      ),
    ASSOCIATE ( BSIM3_VOFF,       OMITTED,  "VOFF"      ),
    ASSOCIATE ( BSIM3_NFACTOR,    1.0,      "NFACTOR"   ),
    ASSOCIATE ( BSIM3_CDSC,       2.4E-4,   "CDSC"      ),
    ASSOCIATE ( BSIM3_PCLM,       1.3,      "PCLM"      ),
    ASSOCIATE ( BSIM3_PDIBL1,     .39,      "PDIBL1"    ),
    ASSOCIATE ( BSIM3_PDIBL2,     .0086,    "PDIBL2"    ),
    ASSOCIATE ( BSIM3_DROUT,      .56,      "DROUT"     ),
    ASSOCIATE ( BSIM3_PSCBE1,     4.24E8,   "PSCBE1"    ),
    ASSOCIATE ( BSIM3_PSCBE2,     1.0E-5,   "PSCBE2"    ),
    ASSOCIATE ( BSIM3_A0,         OMITTED,  "A0"        ),
    ASSOCIATE ( BSIM3_A1,         OMITTED,  "A1"        ),
    ASSOCIATE ( BSIM3_A2,         OMITTED,  "A2"        ),
    ASSOCIATE ( BSIM3_User_NPEAK, OMITTED,  "NPEAK"     ),
    ASSOCIATE ( BSIM3_SUBTHMOD,   2,        "SUBTHMOD"  ),
    ASSOCIATE ( BSIM3_SATMOD,     2,        "SATMOD"    ),
    ASSOCIATE ( BSIM3_VGLOW,      -.12,     "VGLOW"     ),
    ASSOCIATE ( BSIM3_VGHIGH,     .12,      "VGHIGH"    ),
    ASSOCIATE ( BSIM3_User_GAMMA1,OMITTED,  "GAMMA1"    ),
    ASSOCIATE ( BSIM3_User_GAMMA2,OMITTED,  "GAMMA2"    ),
    ASSOCIATE ( BSIM3_User_XT,    OMITTED,  "XT"        ),
    ASSOCIATE ( BSIM3_User_VBM,   OMITTED,  "VBM"       ),
    ASSOCIATE ( BSIM3_User_VBX,   OMITTED,  "VBX"       ),
    ASSOCIATE ( BSIM3_VBI,        OMITTED,  "VBI"       ),
    ASSOCIATE ( BSIM3_U0TEMP,     OMITTED,  "U0TEMP"    ),
    ASSOCIATE ( BSIM3_VSATTEMP,   OMITTED,  "VSATTEMP"  ),
    ASSOCIATE ( BSIM3_EM,         4.1E7,    "EM"        ),
    ASSOCIATE ( BSIM3_LDD,        OMITTED,  "LDD"       ),
    ASSOCIATE ( BSIM3_LITL,       OMITTED,  "LITL"      ),
    ASSOCIATE ( BSIM3_ALPHA,      1.9,      "ALPHA"     ),
    ASSOCIATE ( BSIM3_KT1,        -0.11,    "KT1"       ),
    ASSOCIATE ( BSIM3_KT2,        0.022,    "KT2"       ),
    ASSOCIATE ( BSIM3_UA1,        4.31E-9,  "UA1"       ),
    ASSOCIATE ( BSIM3_UB1,        -7.61E-18,"UB1"       ),
    ASSOCIATE ( BSIM3_UC1,        OMITTED,  "UC1"       ),
    ASSOCIATE ( BSIM3_AT,         3.3E4,    "AT"        ),
     
    ASSOCIATE ( BSIM3_PVAG,       0.0,      "PVAG"      ),
    ASSOCIATE ( BSIM3_KETA,       -0.047,   "KETA"      ),
    ASSOCIATE ( BSIM3_ETA0,       0.08,     "ETA0"      ),
    ASSOCIATE ( BSIM3_ETAB,       -0.07,    "ETAB"      ),
    ASSOCIATE ( BSIM3_KT1L,       0.0,      "KT1L"      ),
    ASSOCIATE ( BSIM3_K3B,        0.0,      "K3B"       ),
    ASSOCIATE ( BSIM3_DVT2,       -0.032,   "DVT2"      ),
    ASSOCIATE ( BSIM3_CDSCB,      0.0,      "CDSCB"     ),
    ASSOCIATE ( BSIM3_CIT,        0.0,      "CIT"       ),
    ASSOCIATE ( BSIM3_BULKMOD,    OMITTED,  "BULKMOD"   ),
    ASSOCIATE ( BSIM3_DSUB,       OMITTED,  "DSUB"      ),
    ASSOCIATE ( BSIM3_RDS0,       0.0,      "RDS0"      ),
    ASSOCIATE ( BSIM3_UTE,        -1.5,     "UTE"       ),
    ASSOCIATE ( BSIM3_NGATE,      0.0,      "NGATE"     ),
 
    ASSOCIATE ( BSIM3_MOBMOD,     1.0,      "MOBMOD"    ),
    ASSOCIATE ( BSIM3_BINUNIT,    1.0,      "BINUNIT"   ),
    ASSOCIATE ( BSIM3_CAPMOD,     1.0,      "CAPMOD"    ),
    ASSOCIATE ( BSIM3_NQSMOD,     0.0,      "NQSMOD"    ),
    ASSOCIATE ( BSIM3_NOIMOD,     1.0,      "NOIMOD"    ),
    ASSOCIATE ( BSIM3_CDSCD,      0.0,      "CDSCD"     ),
    ASSOCIATE ( BSIM3_AGS,        0.0,      "AGS"       ),
    ASSOCIATE ( BSIM3_DVT0W,      0.0,      "DVT0W"     ),
    ASSOCIATE ( BSIM3_DVT1W,      5.3E6,    "DVT1W"     ),
    ASSOCIATE ( BSIM3_DVT2W,      -0.032,   "DVT2W"     ),
    ASSOCIATE ( BSIM3_PRWG,       0.0,      "PRWG"      ),
    ASSOCIATE ( BSIM3_PRWB,       0.0,      "PRWB"      ),
    ASSOCIATE ( BSIM3_PRT,        0.0,      "PRT"       ),
    ASSOCIATE ( BSIM3_PDIBLB,     0.0,      "PDIBLCB"   ),
    ASSOCIATE ( BSIM3_WR,         1.0,      "WR"        ),
    ASSOCIATE ( BSIM3_DWG,        0.0,      "DWG"       ),
    ASSOCIATE ( BSIM3_DWB,        0.0,      "DWB"       ),
    ASSOCIATE ( BSIM3_B0,         0.0,      "B0"        ),
    ASSOCIATE ( BSIM3_B1,         0.0,      "B1"        ),
    ASSOCIATE ( BSIM3_ALPHA0,     0.0,      "ALPHA0"    ),
    ASSOCIATE ( BSIM3_BETA0,      30.0,     "BETA0"     ),
    ASSOCIATE ( BSIM3_ELM,        5.0,      "ELM"       ),
    ASSOCIATE ( BSIM3_CGSL,       0.0,      "CGSL"      ),
    ASSOCIATE ( BSIM3_CGDL,       0.0,      "CGDL"      ),
    ASSOCIATE ( BSIM3_CKAPPA,     0.6,      "CKAPPA"    ),
    ASSOCIATE ( BSIM3_CLC,        0.1e-6,   "CLC"       ),
    ASSOCIATE ( BSIM3_CLE,        0.6,      "CLE"       ),
    ASSOCIATE ( BSIM3_LINT,       0.0,      "LINT"      ),
    ASSOCIATE ( BSIM3_LL,         0.0,      "LL"        ),
    ASSOCIATE ( BSIM3_LLN,        1.0,      "LLN"       ),
    ASSOCIATE ( BSIM3_LW,         0.0,      "LW"        ),
    ASSOCIATE ( BSIM3_LWN,        1.0,      "LWN"       ),
    ASSOCIATE ( BSIM3_LWL,        0.0,      "LWL"       ),
    ASSOCIATE ( BSIM3_LMIN,       0.0,      "LMIN"      ),
    ASSOCIATE ( BSIM3_LMAX,       1.0,      "LMAX"      ),
    ASSOCIATE ( BSIM3_WINT,       0.0,      "WINT"      ),
    ASSOCIATE ( BSIM3_WL,         0.0,      "WL"        ),
    ASSOCIATE ( BSIM3_WLN,        1.0,      "WLN"       ),
    ASSOCIATE ( BSIM3_WW,         0.0,      "WW"        ),
    ASSOCIATE ( BSIM3_WWN,        1.0,      "WWN"       ),
    ASSOCIATE ( BSIM3_WWL,        0.0,      "WWL"       ),
    ASSOCIATE ( BSIM3_WMIN,       0.0,      "WMIN"      ),
    ASSOCIATE ( BSIM3_WMAX,       1.0,      "WMAX"      ),
    ASSOCIATE ( BSIM3_EF,         1.0,      "EF"        ),
    ASSOCIATE ( BSIM3_DLC,        OMITTED,  "DLC"       ),
    ASSOCIATE ( BSIM3_DWC,        OMITTED,  "DWC"       ),
    ASSOCIATE ( BSIM3_CF,         OMITTED,  "CF"        ),
    ASSOCIATE ( BSIM3_NOIA,       OMITTED,  "NOIA"      ),
    ASSOCIATE ( BSIM3_NOIB,       OMITTED,  "NOIB"      ),
    ASSOCIATE ( BSIM3_NOIC,       OMITTED,  "NOIC"      ),
    ASSOCIATE ( BSIM3lcdsc,       0.0,      "LCDSC"     ),
    ASSOCIATE ( BSIM3lcdscb,      0.0,      "LCDSCB"    ),
    ASSOCIATE ( BSIM3lcdscd,      0.0,      "LCDSCD"    ),
    ASSOCIATE ( BSIM3lcit,        0.0,      "LCIT"      ),
    ASSOCIATE ( BSIM3lnfactor,    0.0,      "LNFACTOR"  ),
    ASSOCIATE ( BSIM3lxj,         0.0,      "LXJ"       ),
    ASSOCIATE ( BSIM3lvsat,       0.0,      "LVSAT"     ),
    ASSOCIATE ( BSIM3lat,         0.0,      "LAT"       ),
    ASSOCIATE ( BSIM3la0,         0.0,      "LA0"       ),
    ASSOCIATE ( BSIM3lags,        0.0,      "LAGS"      ),
    ASSOCIATE ( BSIM3la1,         0.0,      "LA1"       ),
    ASSOCIATE ( BSIM3la2,         0.0,      "LA2"       ),
    ASSOCIATE ( BSIM3lketa,       0.0,      "LKETA"     ),
    ASSOCIATE ( BSIM3lnsub,       0.0,      "LNSUB"     ),
    ASSOCIATE ( BSIM3lnpeak,      0.0,      "LNCH"      ),
    ASSOCIATE ( BSIM3lvbm,        0.0,      "LVBM"      ),
    ASSOCIATE ( BSIM3lxt,         0.0,      "LXT"       ),
    ASSOCIATE ( BSIM3lkt1,        0.0,      "LKT1"      ),
    ASSOCIATE ( BSIM3lkt1l,       0.0,      "LKT1L"     ),
    ASSOCIATE ( BSIM3lkt2,        0.0,      "LKT2"      ),
    ASSOCIATE ( BSIM3lk3,         0.0,      "LK3"       ),
    ASSOCIATE ( BSIM3lk3b,        0.0,      "LK3B"      ),
    ASSOCIATE ( BSIM3lw0,         0.0,      "LW0"       ),
    ASSOCIATE ( BSIM3lnlx,        0.0,      "LNLX"      ),
    ASSOCIATE ( BSIM3ldvt0,       0.0,      "LDVT0"     ),
    ASSOCIATE ( BSIM3ldvt1,       0.0,      "LDVT1"     ),
    ASSOCIATE ( BSIM3ldvt2,       0.0,      "LDVT2"     ),
    ASSOCIATE ( BSIM3ldvt0w,      0.0,      "LDVT0W"    ),
    ASSOCIATE ( BSIM3ldvt1w,      0.0,      "LDVT1W"    ),
    ASSOCIATE ( BSIM3ldvt2w,      0.0,      "LDVT2W"    ),
    ASSOCIATE ( BSIM3ldrout,      0.0,      "LDROUT"    ),
    ASSOCIATE ( BSIM3ldsub,       0.0,      "LDSUB"     ),
    ASSOCIATE ( BSIM3lvth0,       0.0,      "LVTH0"     ),
    ASSOCIATE ( BSIM3lua,         0.0,      "LUA"       ),
    ASSOCIATE ( BSIM3lua1,        0.0,      "LUA1"      ),
    ASSOCIATE ( BSIM3lub,         0.0,      "LUB"       ),
    ASSOCIATE ( BSIM3lub1,        0.0,      "LUB1"      ),
    ASSOCIATE ( BSIM3luc,         0.0,      "LUC"       ),
    ASSOCIATE ( BSIM3luc1,        0.0,      "LUC1"      ),
    ASSOCIATE ( BSIM3lute,        0.0,      "LUTE"      ),
    ASSOCIATE ( BSIM3lvoff,       0.0,      "LVOFF"     ),
    ASSOCIATE ( BSIM3ldelta,      0.0,      "LDELTA"    ),
    ASSOCIATE ( BSIM3lrdsw,       0.0,      "LRDSW"     ),
    ASSOCIATE ( BSIM3lprwb,       0.0,      "LPRWB"     ),
    ASSOCIATE ( BSIM3lprwg,       0.0,      "LPRWG"     ),
    ASSOCIATE ( BSIM3lprt,        0.0,      "LPRT"      ),
    ASSOCIATE ( BSIM3leta0,       0.0,      "LETA0"     ),
    ASSOCIATE ( BSIM3letab,       0.0,      "LETAB"     ),
    ASSOCIATE ( BSIM3lpclm,       0.0,      "LPCLM"     ),
    ASSOCIATE ( BSIM3lpdibl1,     0.0,      "LPDIBLC1"  ),
    ASSOCIATE ( BSIM3lpdibl2,     0.0,      "LPDIBLC2"  ),
    ASSOCIATE ( BSIM3lpdiblb,     0.0,      "LPDIBLCB"   ),
    ASSOCIATE ( BSIM3lpscbe1,     0.0,      "LPSCBE1"   ),
    ASSOCIATE ( BSIM3lpscbe2,     0.0,      "LPSCBE2"   ),
    ASSOCIATE ( BSIM3lpvag,       0.0,      "LPVAG"     ),
    ASSOCIATE ( BSIM3lwr,         0.0,      "LWR"       ),
    ASSOCIATE ( BSIM3ldwg,        0.0,      "LDWG"      ),
    ASSOCIATE ( BSIM3ldwb,        0.0,      "LDWB"      ),
    ASSOCIATE ( BSIM3lb0,         0.0,      "LB0"       ),
    ASSOCIATE ( BSIM3lb1,         0.0,      "LB1"       ),
    ASSOCIATE ( BSIM3lalpha0,     0.0,      "LALPHA0"   ),
    ASSOCIATE ( BSIM3lbeta0,      0.0,      "LBETA0"    ),
    ASSOCIATE ( BSIM3lelm,        0.0,      "LELM"      ),
    ASSOCIATE ( BSIM3lcgsl,       0.0,      "LCGSL"     ),
    ASSOCIATE ( BSIM3lcgdl,       0.0,      "LCGDL"     ),
    ASSOCIATE ( BSIM3lckappa,     0.0,      "LCKAPPA"   ),
    ASSOCIATE ( BSIM3lcf,         0.0,      "LCF"       ),
    ASSOCIATE ( BSIM3lclc,        0.0,      "LCLC"      ),
    ASSOCIATE ( BSIM3lcle,        0.0,      "LCLE"      ),
    ASSOCIATE ( BSIM3wcdsc,       0.0,      "WCDSC"     ),
    ASSOCIATE ( BSIM3wcdscb,      0.0,      "WCDSCB"    ),
    ASSOCIATE ( BSIM3wcdscd,      0.0,      "WCDSCD"    ),
    ASSOCIATE ( BSIM3wcit,        0.0,      "WCIT"      ),
    ASSOCIATE ( BSIM3wnfactor,    0.0,      "WNFACTOR"  ),
    ASSOCIATE ( BSIM3wxj,         0.0,      "WXJ"       ),
    ASSOCIATE ( BSIM3wvsat,       0.0,      "WVSAT"     ),
    ASSOCIATE ( BSIM3wat,         0.0,      "WAT"       ),
    ASSOCIATE ( BSIM3wa0,         0.0,      "WA0"       ),
    ASSOCIATE ( BSIM3wags,        0.0,      "WAGS"      ),
    ASSOCIATE ( BSIM3wa1,         0.0,      "WA1"       ),
    ASSOCIATE ( BSIM3wa2,         0.0,      "WA2"       ),
    ASSOCIATE ( BSIM3wketa,       0.0,      "WKETA"     ),
    ASSOCIATE ( BSIM3wnsub,       0.0,      "WNSUB"     ),
    ASSOCIATE ( BSIM3wnpeak,      0.0,      "WNCH"    ),
    ASSOCIATE ( BSIM3wvbm,        0.0,      "WVBM"      ),
    ASSOCIATE ( BSIM3wxt,         0.0,      "WXT"       ),
    ASSOCIATE ( BSIM3wkt1,        0.0,      "WKT1"      ),
    ASSOCIATE ( BSIM3wkt1l,       0.0,      "WKT1L"     ),
    ASSOCIATE ( BSIM3wkt2,        0.0,      "WKT2"      ),
    ASSOCIATE ( BSIM3wk3,         0.0,      "WK3"       ),
    ASSOCIATE ( BSIM3wk3b,        0.0,      "WK3B"      ),
    ASSOCIATE ( BSIM3ww0,         0.0,      "WW0"       ),
    ASSOCIATE ( BSIM3wnlx,        0.0,      "WNLX"      ),
    ASSOCIATE ( BSIM3wdvt0,       0.0,      "WDVT0"     ),
    ASSOCIATE ( BSIM3wdvt1,       0.0,      "WDVT1"     ),
    ASSOCIATE ( BSIM3wdvt2,       0.0,      "WDVT2"     ),
    ASSOCIATE ( BSIM3wdvt0w,      0.0,      "WDVT0W"    ),
    ASSOCIATE ( BSIM3wdvt1w,      0.0,      "WDVT1W"    ),
    ASSOCIATE ( BSIM3wdvt2w,      0.0,      "WDVT2W"    ),
    ASSOCIATE ( BSIM3wdrout,      0.0,      "WDROUT"    ),
    ASSOCIATE ( BSIM3wdsub,       0.0,      "WDSUB"     ),
    ASSOCIATE ( BSIM3wvth0,       0.0,      "WVTH0"     ),
    ASSOCIATE ( BSIM3wua,         0.0,      "WUA"       ),
    ASSOCIATE ( BSIM3wua1,        0.0,      "WUA1"      ),
    ASSOCIATE ( BSIM3wub,         0.0,      "WUB"       ),
    ASSOCIATE ( BSIM3wub1,        0.0,      "WUB1"      ),
    ASSOCIATE ( BSIM3wuc,         0.0,      "WUC"       ),
    ASSOCIATE ( BSIM3wuc1,        0.0,      "WUC1"      ),
    ASSOCIATE ( BSIM3wute,        0.0,      "WUTE"      ),
    ASSOCIATE ( BSIM3wvoff,       0.0,      "WVOFF"     ),
    ASSOCIATE ( BSIM3wdelta,      0.0,      "WDELTA"    ),
    ASSOCIATE ( BSIM3wrdsw,       0.0,      "WRDSW"     ),
    ASSOCIATE ( BSIM3wprwb,       0.0,      "WPRWB"     ),
    ASSOCIATE ( BSIM3wprwg,       0.0,      "WPRWG"     ),
    ASSOCIATE ( BSIM3wprt,        0.0,      "WPRT"      ),
    ASSOCIATE ( BSIM3weta0,       0.0,      "WETA0"     ),
    ASSOCIATE ( BSIM3wetab,       0.0,      "WETAB"     ),
    ASSOCIATE ( BSIM3wpclm,       0.0,      "WPCLM"     ),
    ASSOCIATE ( BSIM3wpdibl1,     0.0,      "WPDIBLC1"   ),
    ASSOCIATE ( BSIM3wpdibl2,     0.0,      "WPDIBLC2"   ),
    ASSOCIATE ( BSIM3wpdiblb,     0.0,      "WPDIBLCB"   ),
    ASSOCIATE ( BSIM3wpscbe1,     0.0,      "WPSCBE1"   ),
    ASSOCIATE ( BSIM3wpscbe2,     0.0,      "WPSCBE2"   ),
    ASSOCIATE ( BSIM3wpvag,       0.0,      "WPVAG"     ),
    ASSOCIATE ( BSIM3wwr,         0.0,      "WWR"       ),
    ASSOCIATE ( BSIM3wdwg,        0.0,      "WDWG"      ),
    ASSOCIATE ( BSIM3wdwb,        0.0,      "WDWB"      ),
    ASSOCIATE ( BSIM3wb0,         0.0,      "WB0"       ),
    ASSOCIATE ( BSIM3wb1,         0.0,      "WB1"       ),
    ASSOCIATE ( BSIM3walpha0,     0.0,      "WALPHA0"   ),
    ASSOCIATE ( BSIM3wbeta0,      0.0,      "WBETA0"    ),
    ASSOCIATE ( BSIM3welm,        0.0,      "WELM"      ),
    ASSOCIATE ( BSIM3wcgsl,       0.0,      "WCGSL"     ),
    ASSOCIATE ( BSIM3wcgdl,       0.0,      "WCGDL"     ),
    ASSOCIATE ( BSIM3wckappa,     0.0,      "WCKAPPA"   ),
    ASSOCIATE ( BSIM3wcf,         0.0,      "WCF"       ),
    ASSOCIATE ( BSIM3wclc,        0.0,      "WCLC"      ),
    ASSOCIATE ( BSIM3wcle,        0.0,      "WCLE"      ),
    ASSOCIATE ( BSIM3pcdsc,       0.0,      "PCDSC"     ),
    ASSOCIATE ( BSIM3pcdscb,      0.0,      "PCDSCB"    ),
    ASSOCIATE ( BSIM3pcdscd,      0.0,      "PCDSCD"    ),
    ASSOCIATE ( BSIM3pcit,        0.0,      "PCIT"      ),
    ASSOCIATE ( BSIM3pnfactor,    0.0,      "PNFACTOR"  ),
    ASSOCIATE ( BSIM3pxj,         0.0,      "PXJ"       ),
    ASSOCIATE ( BSIM3pvsat,       0.0,      "PVSAT"     ),
    ASSOCIATE ( BSIM3pat,         0.0,      "PAT"       ),
    ASSOCIATE ( BSIM3pa0,         0.0,      "PA0"       ),
    ASSOCIATE ( BSIM3pags,        0.0,      "PAGS"      ),
    ASSOCIATE ( BSIM3pa1,         0.0,      "PA1"       ),
    ASSOCIATE ( BSIM3pa2,         0.0,      "PA2"       ),
    ASSOCIATE ( BSIM3pketa,       0.0,      "PKETA"     ),
    ASSOCIATE ( BSIM3pnsub,       0.0,      "PNSUB"     ),
    ASSOCIATE ( BSIM3pnpeak,      0.0,      "PNCH"      ),
    ASSOCIATE ( BSIM3pvbm,        0.0,      "PVBM"      ),
    ASSOCIATE ( BSIM3pxt,         0.0,      "PXT"       ),
    ASSOCIATE ( BSIM3pkt1,        0.0,      "PKT1"      ),
    ASSOCIATE ( BSIM3pkt1l,       0.0,      "PKT1L"     ),
    ASSOCIATE ( BSIM3pkt2,        0.0,      "PKT2"      ),
    ASSOCIATE ( BSIM3pk3,         0.0,      "PK3"       ),
    ASSOCIATE ( BSIM3pk3b,        0.0,      "PK3B"      ),
    ASSOCIATE ( BSIM3pw0,         0.0,      "PW0"       ),
    ASSOCIATE ( BSIM3pnlx,        0.0,      "PNLX"      ),
    ASSOCIATE ( BSIM3pdvt0,       0.0,      "PDVT0"     ),
    ASSOCIATE ( BSIM3pdvt1,       0.0,      "PDVT1"     ),
    ASSOCIATE ( BSIM3pdvt2,       0.0,      "PDVT2"     ),
    ASSOCIATE ( BSIM3pdvt0w,      0.0,      "PDVT0W"    ),
    ASSOCIATE ( BSIM3pdvt1w,      0.0,      "PDVT1W"    ),
    ASSOCIATE ( BSIM3pdvt2w,      0.0,      "PDVT2W"    ),
    ASSOCIATE ( BSIM3pdrout,      0.0,      "PDROUT"    ),
    ASSOCIATE ( BSIM3pdsub,       0.0,      "PDSUB"     ),
    ASSOCIATE ( BSIM3pvth0,       0.0,      "PVTH0"     ),
    ASSOCIATE ( BSIM3pua,         0.0,      "PUA"       ),
    ASSOCIATE ( BSIM3pua1,        0.0,      "PUA1"      ),
    ASSOCIATE ( BSIM3pub,         0.0,      "PUB"       ),
    ASSOCIATE ( BSIM3pub1,        0.0,      "PUB1"      ),
    ASSOCIATE ( BSIM3puc,         0.0,      "PUC"       ),
    ASSOCIATE ( BSIM3puc1,        0.0,      "PUC1"      ),
    ASSOCIATE ( BSIM3pu0,         0.0,      "PU0"       ),
    ASSOCIATE ( BSIM3pute,        0.0,      "PUTE"      ),
    ASSOCIATE ( BSIM3pvoff,       0.0,      "PVOFF"     ),
    ASSOCIATE ( BSIM3pdelta,      0.0,      "PDELTA"    ),
    ASSOCIATE ( BSIM3prdsw,       0.0,      "PRDSW"     ),
    ASSOCIATE ( BSIM3pprwb,       0.0,      "PPRWB"     ),
    ASSOCIATE ( BSIM3pprwg,       0.0,      "PPRWG"     ),
    ASSOCIATE ( BSIM3pprt,        0.0,      "PPRT"      ),
    ASSOCIATE ( BSIM3peta0,       0.0,      "PETA0"     ),
    ASSOCIATE ( BSIM3petab,       0.0,      "PETAB"     ),
    ASSOCIATE ( BSIM3ppclm,       0.0,      "PPCLM"     ),
    ASSOCIATE ( BSIM3ppdibl1,     0.0,      "PPDIBLC1"   ),
    ASSOCIATE ( BSIM3ppdibl2,     0.0,      "PPDIBLC2"   ),
    ASSOCIATE ( BSIM3ppdiblb,     0.0,      "PPDIBLCB"   ),
    ASSOCIATE ( BSIM3ppscbe1,     0.0,      "PPSCBE1"   ),
    ASSOCIATE ( BSIM3ppscbe2,     0.0,      "PPSCBE2"   ),
    ASSOCIATE ( BSIM3ppvag,       0.0,      "PPVAG"     ),
    ASSOCIATE ( BSIM3pwr,         0.0,      "PWR"       ),
    ASSOCIATE ( BSIM3pdwg,        0.0,      "PDWG"      ),
    ASSOCIATE ( BSIM3pdwb,        0.0,      "PDWB"      ),
    ASSOCIATE ( BSIM3pb0,         0.0,      "PB0"       ),
    ASSOCIATE ( BSIM3pb1,         0.0,      "PB1"       ),
    ASSOCIATE ( BSIM3palpha0,     0.0,      "PALPHA0"   ),
    ASSOCIATE ( BSIM3pbeta0,      0.0,      "PBETA0"    ),
    ASSOCIATE ( BSIM3pelm,        0.0,      "PELM"      ),
    ASSOCIATE ( BSIM3pcgsl,       0.0,      "PCGSL"     ),
    ASSOCIATE ( BSIM3pcgdl,       0.0,      "PCGDL"     ),
    ASSOCIATE ( BSIM3pckappa,     0.0,      "PCKAPPA"   ),
    ASSOCIATE ( BSIM3pcf,         0.0,      "PCF"       ),
    ASSOCIATE ( BSIM3pclc,        0.0,      "PCLC"      ),
    ASSOCIATE ( BSIM3pcle,        0.0,      "PCLE"      ),
    ASSOCIATE ( BSIM3lngate,      0.0,      "LNGATE"    ),
    ASSOCIATE ( BSIM3wngate,      0.0,      "WNGATE"    ),
    ASSOCIATE ( BSIM3pngate,      0.0,      "PNGATE"    ),
    ASSOCIATE ( BSIM3lgamma1,     0.0,      "LGAMMA1"   ),
    ASSOCIATE ( BSIM3wgamma1,     0.0,      "WGAMMA1"   ),
    ASSOCIATE ( BSIM3pgamma1,     0.0,      "PGAMMA1"   ),
    ASSOCIATE ( BSIM3lgamma2,     0.0,      "LGAMMA2"   ),
    ASSOCIATE ( BSIM3wgamma2,     0.0,      "WGAMMA2"   ),
    ASSOCIATE ( BSIM3pgamma2,     0.0,      "PGAMMA2"   ),
    ASSOCIATE ( BSIM3lvbx,        0.0,      "LVBX"      ),
    ASSOCIATE ( BSIM3wvbx,        0.0,      "WVBX"      ),
    ASSOCIATE ( BSIM3pvbx,        0.0,      "PVBX"      ),
    ASSOCIATE ( BSIM3pk1,         0.0,      "PK1"       ),
    ASSOCIATE ( BSIM3pk2,         0.0,      "PK2"       ),
    ASSOCIATE ( BSIM3vtm,         0.0,      "VTM"       ),
     
/******************* USERS OF DEVICE EQUATIONS OPTION ***********************/
 
/******** and before this line                                     **********/
        END_PARMS(m_)                           /*ENDIGNORE*/
} ;
 
#undef  BASE
#undef  M_DEVICE
#endif
 
#ifdef UnAlias_Def
static char *M_alias[] = {
      "DL",      "LD",
      "DW",      "WD",
      "WDF",     "W",
      "PDIBLC1", "PDIBL1",
      "PDIBLC2", "PDIBL2",
      "NCH",     "NPEAK"
      "" };
#endif
 
cmplex m_ACPrb(struct m_ *, double, int, int);
 
// Functions exported to PSpice by Device Equations - do not modify
DLL_FUNC void M_TmpMod(struct M_ *, double, double, double);
DLL_FUNC void M_ModChk(struct M_ *);
DLL_FUNC void m_AddInternalNodes(struct m_ *);
DLL_FUNC int m_MatPtr(struct m_ *);
DLL_FUNC int m_MatLoc(struct m_ *);
DLL_FUNC int m_Load(struct m_ *, int, int, int, double);
DLL_FUNC void m_ACLoad(struct m_ *, double);
DLL_FUNC void m_Noise(const struct m_ *, double, double, double *, double *, double *,
                  double *, double *, double *, double *);
 
// Function types for GetProcAddress()
typedef void (*PROCM_TmpMod) (struct M_ *, double, double, double);
typedef void (*PROCM_ModChk) (struct M_ *);
typedef void (*PROCm_AddInternalNodes) (struct m_ *);
typedef int (*PROCm_MatPtr) (struct m_ *);
typedef int (*PROCm_MatLoc) (struct m_ *);
typedef int (*PROCm_Load) (struct m_ *, int, int, int, double );
typedef void (*PROCm_ACLoad) (struct m_ *, double );
typedef void (*PROCm_Noise) (const struct m_ *, double, double, double *, double *, double *,
    double *, double *, double *, double *);
 
DLL_FUNC PROCM_TmpMod fp_M_TmpMod;
DLL_FUNC PROCM_ModChk fp_M_ModChk;
DLL_FUNC PROCm_AddInternalNodes fp_m_AddInternalNodes;
DLL_FUNC PROCm_MatPtr fp_m_MatPtr;
DLL_FUNC PROCm_MatLoc fp_m_MatLoc;
DLL_FUNC PROCm_Load fp_m_Load;
DLL_FUNC PROCm_ACLoad fp_m_ACLoad;
DLL_FUNC PROCm_Noise fp_m_Noise;
 
// Functions private to MOS code
void Mqspof(struct M_ *,
         double, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *);
void MOS1eval(struct M_ *, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *, double *);
void MOScap(
         double, double, double, double, double, double,
         double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *);
void MOS2eval(struct M_ *, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         int, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double);
void MOS2cap(struct M_ *, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *);
void MOS3eval(struct M_ *, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double);
void MOS3cap(struct M_ *, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *);
void MOS4eval(struct M_ *, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         int, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *, double *, double);
void MOS4cap(double, double, double, double, double, double,
         double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *);
void MOS6eval(struct M_ *, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *,
         int, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *, double *, double);
void MOS6cap(double, double, double, double, double, double,
         double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *);
void MOS7eval(struct M_ *, double, double, double, double, double, double,
         double *, double *, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, 
         int, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, bsim3SizeDependParam *, double);
void MOS7cap(int, double, double, double, double, double,
         double, double, double, double, double,
         double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double *, double *, double *, double *, double *, double *,
         double, double, double, double, double, double,
         double *, double *, double *, double *);
 
#endif                                 // DEV_M_H
