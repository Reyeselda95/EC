/* dematloc.c
 *   $Revision:   1.9  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:49:12  $ */
 
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
 
int d_MatLoc(struct d_ *dloc)
/*****************************************************************************
* Purpose
*   Find matrix indexes for diodes
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The permanent matrix has separate locations for each device.  This
*   routine notes collisions between devices and reserves unique locations
*   for them.  The "overflow" terms are stored in struct MODef blocks.
*   Each entry in a block contains a pointer to the matrix entry which
*   corresponds to that overflow entry.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATLOC.C
*
*****************************************************************************/
{
    int     flag = 0xffff, nP, nN, np;
 
    nP = dloc->d_P;
    nN = dloc->d_N;
    np = dloc->d_p;
 
    flag &= IndxCl(&(dloc->d_PP), nP, nP);
    flag &= IndxCl(&(dloc->d_Pp), nP, np);
    flag &= IndxCl(&(dloc->d_NN), nN, nN);
    flag &= IndxCl(&(dloc->d_Np), nN, np);
    flag &= IndxCl(&(dloc->d_pP), np, nP);
    flag &= IndxCl(&(dloc->d_pN), np, nN);
    flag &= IndxCl(&(dloc->d_pp), np, np);
    flag &= IndxCl(&(dloc->d_ip), np, 0);
    flag &= IndxCl(&(dloc->d_iN), nN, 0);
    return flag;
}
 
int q_MatLoc(struct q_ *qloc)
/*****************************************************************************
* Purpose
*   Find matrix indexes for bjts
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The permanent matrix has separate locations for each device.  This
*   routine notes collisions between devices and reserves unique locations
*   for them.  The "overflow" terms are stored in struct MODef blocks.
*   Each entry in a block contains a pointer to the matrix entry which
*   corresponds to that overflow entry.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATLOC.C
*    GWB - 29 Jul 96 - Add corrections to fix XCJC2 implementation.
*
*****************************************************************************/
{
    int
            flag = 0xffff,
            C = qloc->q_C,
            c = qloc->q_c,
            n = qloc->q_n,
            B = qloc->q_B,
            b = qloc->q_b,
            E = qloc->q_E,
            e = qloc->q_e,
            S = qloc->q_S;
 
    flag &= IndxCl(&(qloc->q_CC), C, C);
    flag &= IndxCl(&(qloc->q_Cn), C, n);
    flag &= IndxCl(&(qloc->q_cn), c, n);
    flag &= IndxCl(&(qloc->q_cc), c, c);
    flag &= IndxCl(&(qloc->q_cb), c, b);
    flag &= IndxCl(&(qloc->q_ce), c, e);
    flag &= IndxCl(&(qloc->q_nC), n, C);
    flag &= IndxCl(&(qloc->q_nn), n, n);
    flag &= IndxCl(&(qloc->q_nc), n, c);
    flag &= IndxCl(&(qloc->q_nb), n, b);
    flag &= IndxCl(&(qloc->q_bc), b, c);
    flag &= IndxCl(&(qloc->q_bb), b, b);
    flag &= IndxCl(&(qloc->q_bB), b, B);
    flag &= IndxCl(&(qloc->q_be), b, e);
    flag &= IndxCl(&(qloc->q_Bb), B, b);
    flag &= IndxCl(&(qloc->q_BB), B, B);
    flag &= IndxCl(&(qloc->q_ec), e, c);
    flag &= IndxCl(&(qloc->q_eb), e, b);
    flag &= IndxCl(&(qloc->q_ee), e, e);
    flag &= IndxCl(&(qloc->q_eE), e, E);
    flag &= IndxCl(&(qloc->q_Ee), E, e);
    flag &= IndxCl(&(qloc->q_EE), E, E);
    flag &= IndxCl(&(qloc->q_SS), S, S);
 
    if (qloc->q_model->Q_lpnp == NO) { /* Cjs is c-to-S                       */
        flag &= IndxCl(&(qloc->q_jS), c, S);
        flag &= IndxCl(&(qloc->q_Sj), S, c);
    }
    else {                             /* Cjs is b-to-S                       */
        flag &= IndxCl(&(qloc->q_jS), b, S);
        flag &= IndxCl(&(qloc->q_Sj), S, b);
    }
 
    if ((double) qloc->q_model->Q_xcjc2 < 1.) {
        flag &= IndxCl(&(qloc->q_BC), B, C);
        flag &= IndxCl(&(qloc->q_CB), C, B);
    }
    else if ((double) qloc->q_model->Q_xcjc < 1.) {
        flag &= IndxCl(&(qloc->q_Bc), B, c);
        flag &= IndxCl(&(qloc->q_cB), c, B);
    }
 
    if ((double) qloc->q_model->Q_qco > 0.) {
        flag &= IndxCl(&(qloc->q_bn), b, n);
    }
 
    flag &= IndxCl(&(qloc->q_in), n, 0);
    flag &= IndxCl(&(qloc->q_ic), c, 0);
    flag &= IndxCl(&(qloc->q_ib), b, 0);
    flag &= IndxCl(&(qloc->q_ie), e, 0);
    flag &= IndxCl(&(qloc->q_iS), S, 0);
    flag &= IndxCl(&(qloc->q_iC), C, 0);
    flag &= IndxCl(&(qloc->q_iB), B, 0);
    return flag;
}
 
int j_MatLoc(struct j_ *jloc)
/*****************************************************************************
* Purpose
*   Find matrix indexes for jfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The permanent matrix has separate locations for each device.  This
*   routine notes collisions between devices and reserves unique locations
*   for them.  The "overflow" terms are stored in struct MODef blocks.
*   Each entry in a block contains a pointer to the matrix entry which
*   corresponds to that overflow entry.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATLOC.C
*
*****************************************************************************/
{
    int     flag = 0xffff, nG, nD, nd, nS, ns;
    nG = jloc->j_G;
    nD = jloc->j_D;
    nd = jloc->j_d;
    nS = jloc->j_S;
    ns = jloc->j_s;
 
    flag &= IndxCl(&(jloc->j_DD), nD, nD);
    flag &= IndxCl(&(jloc->j_GG), nG, nG);
    flag &= IndxCl(&(jloc->j_SS), nS, nS);
    flag &= IndxCl(&(jloc->j_dd), nd, nd);
    flag &= IndxCl(&(jloc->j_ss), ns, ns);
    flag &= IndxCl(&(jloc->j_Dd), nD, nd);
    flag &= IndxCl(&(jloc->j_Gd), nG, nd);
    flag &= IndxCl(&(jloc->j_Gs), nG, ns);
    flag &= IndxCl(&(jloc->j_Ss), nS, ns);
    flag &= IndxCl(&(jloc->j_ds), nd, ns);
    flag &= IndxCl(&(jloc->j_dD), nd, nD);
    flag &= IndxCl(&(jloc->j_dG), nd, nG);
    flag &= IndxCl(&(jloc->j_sG), ns, nG);
    flag &= IndxCl(&(jloc->j_sS), ns, nS);
    flag &= IndxCl(&(jloc->j_sd), ns, nd);
    flag &= IndxCl(&(jloc->j_iG), nG, 0);
    flag &= IndxCl(&(jloc->j_is), ns, 0);
    flag &= IndxCl(&(jloc->j_id), nd, 0);
    return flag;
}
 
int m_MatLoc(struct m_ *mloc)
/*****************************************************************************
* Purpose
*   Find matrix indexes for mosfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The permanent matrix has separate locations for each device.  This
*   routine notes collisions between devices and reserves unique locations
*   for them.  The "overflow" terms are stored in struct MODef blocks.
*   Each entry in a block contains a pointer to the matrix entry which
*   corresponds to that overflow entry.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATLOC.C
*    GWB - 13 Jun 97 - add "q" node for BSIM3V3
*
*****************************************************************************/
{
    int     flag = 0xffff, nG, ng, nD, nd, nS, ns, nB, nb, nq;
    int     nqsMod = (mloc->m_model->M_level==7
                         && mloc->m_model->BSIM3_NQSMOD!=0.0);
    nG = mloc->m_G;
    ng = mloc->m_g;
    nD = mloc->m_D;
    nd = mloc->m_d;
    nS = mloc->m_S;
    ns = mloc->m_s;
    nB = mloc->m_B;
    nb = mloc->m_b;
    nq = mloc->m_q;
 
    flag &= IndxCl(&(mloc->m_DD), nD, nD);
    flag &= IndxCl(&(mloc->m_gg), ng, ng);
    flag &= IndxCl(&(mloc->m_SS), nS, nS);
    flag &= IndxCl(&(mloc->m_bb), nb, nb);
    flag &= IndxCl(&(mloc->m_dd), nd, nd);
    flag &= IndxCl(&(mloc->m_ss), ns, ns);
    flag &= IndxCl(&(mloc->m_Dd), nD, nd);
    flag &= IndxCl(&(mloc->m_gb), ng, nb);
    flag &= IndxCl(&(mloc->m_gd), ng, nd);
    flag &= IndxCl(&(mloc->m_gs), ng, ns);
    flag &= IndxCl(&(mloc->m_Ss), nS, ns);
    flag &= IndxCl(&(mloc->m_bd), nb, nd);
    flag &= IndxCl(&(mloc->m_bs), nb, ns);
    flag &= IndxCl(&(mloc->m_ds), nd, ns);
    flag &= IndxCl(&(mloc->m_dD), nd, nD);
    flag &= IndxCl(&(mloc->m_bg), nb, ng);
    flag &= IndxCl(&(mloc->m_dg), nd, ng);
    flag &= IndxCl(&(mloc->m_sg), ns, ng);
    flag &= IndxCl(&(mloc->m_sS), ns, nS);
    flag &= IndxCl(&(mloc->m_db), nd, nb);
    flag &= IndxCl(&(mloc->m_sb), ns, nb);
    flag &= IndxCl(&(mloc->m_sd), ns, nd);
    flag &= IndxCl(&(mloc->m_GG), nG, nG);
    flag &= IndxCl(&(mloc->m_Gg), nG, ng);
    flag &= IndxCl(&(mloc->m_gG), ng, nG);
    flag &= IndxCl(&(mloc->m_BB), nB, nB);
    flag &= IndxCl(&(mloc->m_Bb), nB, nb);
    flag &= IndxCl(&(mloc->m_bB), nb, nB);
    flag &= IndxCl(&(mloc->m_ig), ng, 0);
    flag &= IndxCl(&(mloc->m_id), nd, 0);
    flag &= IndxCl(&(mloc->m_is), ns, 0);
    flag &= IndxCl(&(mloc->m_ib), nb, 0);
    if (nqsMod) {
        flag &= IndxCl(&(mloc->m_qq), nq, nq);
        flag &= IndxCl(&(mloc->m_dq), nd, nq);
        flag &= IndxCl(&(mloc->m_sq), ns, nq);
        flag &= IndxCl(&(mloc->m_gq), ng, nq);
        flag &= IndxCl(&(mloc->m_qg), nq, ng);
        flag &= IndxCl(&(mloc->m_qd), nq, nd);
        flag &= IndxCl(&(mloc->m_qs), nq, ns);
        flag &= IndxCl(&(mloc->m_qb), nq, nb);
        flag &= IndxCl(&(mloc->m_iq), nq, 0);
    }
    return flag;
}
 
int b_MatLoc(struct b_ *bloc)
/*****************************************************************************
* Purpose
*   Find matrix indexes for gaasfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The permanent matrix has separate locations for each device.  This
*   routine notes collisions between devices and reserves unique locations
*   for them.  The "overflow" terms are stored in struct MODef blocks.
*   Each entry in a block contains a pointer to the matrix entry which
*   corresponds to that overflow entry.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATLOC.C
*
*****************************************************************************/
{
    int     flag = 0xffff, nG, ng, nD, nd, nS, ns;
    nG = bloc->b_G;
    ng = bloc->b_g;
    nD = bloc->b_D;
    nd = bloc->b_d;
    nS = bloc->b_S;
    ns = bloc->b_s;
 
    flag &= IndxCl(&(bloc->b_DD), nD, nD);
    flag &= IndxCl(&(bloc->b_GG), nG, nG);
    flag &= IndxCl(&(bloc->b_SS), nS, nS);
    flag &= IndxCl(&(bloc->b_dd), nd, nd);
    flag &= IndxCl(&(bloc->b_ss), ns, ns);
    flag &= IndxCl(&(bloc->b_gg), ng, ng);
    flag &= IndxCl(&(bloc->b_Dd), nD, nd);
    flag &= IndxCl(&(bloc->b_Gg), nG, ng);
    flag &= IndxCl(&(bloc->b_Ss), nS, ns);
    flag &= IndxCl(&(bloc->b_ds), nd, ns);
    flag &= IndxCl(&(bloc->b_dD), nd, nD);
    flag &= IndxCl(&(bloc->b_gG), ng, nG);
    flag &= IndxCl(&(bloc->b_sS), ns, nS);
    flag &= IndxCl(&(bloc->b_sd), ns, nd);
    flag &= IndxCl(&(bloc->b_dg), nd, ng);
    flag &= IndxCl(&(bloc->b_gd), ng, nd);
    flag &= IndxCl(&(bloc->b_sg), ns, ng);
    flag &= IndxCl(&(bloc->b_gs), ng, ns);
    flag &= IndxCl(&(bloc->b_ig), ng, 0);
    flag &= IndxCl(&(bloc->b_is), ns, 0);
    flag &= IndxCl(&(bloc->b_id), nd, 0);
    return flag;
}
