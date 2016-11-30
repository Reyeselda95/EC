/* dematptr.c
 *   $Revision:   1.9  $
 *   $Author:   GWB  $
 *   $Date:   12 Jun 1997 18:49:46  $ */
 
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
 
int d_MatPtr(struct d_ *dloc)
/*****************************************************************************
* Purpose
*   Allocate memory and setup matrix index for diodes
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The tables pointed to by the arguments are assumed to be allocated
*   already and initialized to 0's.  MatPtr fills in the values for
*   these tables which are used by ReOrder.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATPTR.C
*
*****************************************************************************/
{
    int     flag = 0xffff, nP, nN, np;
    nP = dloc->d_P;
    nN = dloc->d_N;
    np = dloc->d_p;
 
    flag &= Reserve(nP, nP);
    flag &= Reserve(nP, np);
    flag &= Reserve(nN, nN);
    flag &= Reserve(nN, np);
    flag &= Reserve(np, nP);
    flag &= Reserve(np, nN);
    flag &= Reserve(np, np);
    return flag;
}
 
int q_MatPtr(struct q_ *qloc)
/*****************************************************************************
* Purpose
*   Allocate memory and setup matrix index for bjts
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The tables pointed to by the arguments are assumed to be allocated
*   already and initialized to 0's.  MatPtr fills in the values for
*   these tables which are used by ReOrder.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATPTR.C
*    GWB - 29 Jul 96 - Add corrections to fix XCJC2 implementation.
*
*****************************************************************************/
{
    int     flag = 0xffff,
            C = qloc->q_C,
            c = qloc->q_c,
            n = qloc->q_n,
            B = qloc->q_B,
            b = qloc->q_b,
            E = qloc->q_E,
            e = qloc->q_e,
            S = qloc->q_S;
 
    flag &= Reserve(C, C);
    flag &= Reserve(C, n);
    flag &= Reserve(c, n);
    flag &= Reserve(c, c);
    flag &= Reserve(c, b);
    flag &= Reserve(c, e);
    flag &= Reserve(n, C);
    flag &= Reserve(n, n);
    flag &= Reserve(n, c);
    flag &= Reserve(n, b);
    flag &= Reserve(b, c);
    flag &= Reserve(b, b);
    flag &= Reserve(b, B);
    flag &= Reserve(b, e);
    flag &= Reserve(B, b);
    flag &= Reserve(B, B);
    flag &= Reserve(e, c);
    flag &= Reserve(e, b);
    flag &= Reserve(e, e);
    flag &= Reserve(e, E);
    flag &= Reserve(E, e);
    flag &= Reserve(E, E);
    flag &= Reserve(S, S);
 
    if (qloc->q_model->Q_lpnp == NO) { /* Cjs is c-to-S                       */
        flag &= Reserve(c, S);
        flag &= Reserve(S, c);
    }
    else {                             /* Cjs is b-to-S                       */
        flag &= Reserve(b, S);
        flag &= Reserve(S, b);
    }
 
    if ((double) qloc->q_model->Q_xcjc2 < 1.) {
        flag &= Reserve(B, C);
        flag &= Reserve(C, B);
    }
    else if ((double) qloc->q_model->Q_xcjc < 1.) {
        flag &= Reserve(B, c);
        flag &= Reserve(c, B);
    }
 
    if ((double) qloc->q_model->Q_qco > 0.) {
        flag &= Reserve(b, n);
    }
 
    return flag;
}
 
int j_MatPtr(struct j_ *jloc)
/*****************************************************************************
* Purpose
*   Allocate memory and setup matrix index for jfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The tables pointed to by the arguments are assumed to be allocated
*   already and initialized to 0's.  MatPtr fills in the values for
*   these tables which are used by ReOrder.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATPTR.C
*
*****************************************************************************/
{
    int     flag = 0xffff, nG, nD, nd, nS, ns;
    nG = jloc->j_G;
    nD = jloc->j_D;
    nd = jloc->j_d;
    nS = jloc->j_S;
    ns = jloc->j_s;
 
    flag &= Reserve(nD, nD);
    flag &= Reserve(nG, nG);
    flag &= Reserve(nS, nS);
    flag &= Reserve(nd, nd);
    flag &= Reserve(ns, ns);
    flag &= Reserve(nD, nd);
    flag &= Reserve(nG, nd);
    flag &= Reserve(nG, ns);
    flag &= Reserve(nS, ns);
    flag &= Reserve(nd, ns);
    flag &= Reserve(nd, nD);
    flag &= Reserve(nd, nG);
    flag &= Reserve(ns, nG);
    flag &= Reserve(ns, nS);
    flag &= Reserve(ns, nd);
    return flag;
}
 
int m_MatPtr(struct m_ *mloc)
/*****************************************************************************
* Purpose
*   Allocate memory and setup matrix index for mosfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The tables pointed to by the arguments are assumed to be allocated
*   already and initialized to 0's.  MatPtr fills in the values for
*   these tables which are used by ReOrder.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATPTR.C
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
 
    flag &= Reserve(nD, nD);
    flag &= Reserve(ng, ng);
    flag &= Reserve(nS, nS);
    flag &= Reserve(nb, nb);
    flag &= Reserve(nd, nd);
    flag &= Reserve(ns, ns);
    flag &= Reserve(nD, nd);
    flag &= Reserve(ng, nb);
    flag &= Reserve(ng, nd);
    flag &= Reserve(ng, ns);
    flag &= Reserve(nS, ns);
    flag &= Reserve(nb, nd);
    flag &= Reserve(nb, ns);
    flag &= Reserve(nd, ns);
    flag &= Reserve(nd, nD);
    flag &= Reserve(nb, ng);
    flag &= Reserve(nd, ng);
    flag &= Reserve(ns, ng);
    flag &= Reserve(ns, nS);
    flag &= Reserve(nd, nb);
    flag &= Reserve(ns, nb);
    flag &= Reserve(ns, nd);
    flag &= Reserve(nG, nG);
    flag &= Reserve(nG, ng);
    flag &= Reserve(ng, nG);
    flag &= Reserve(nB, nB);
    flag &= Reserve(nB, nb);
    flag &= Reserve(nb, nB);
    if (nqsMod) {
        flag &= Reserve(nq, nq);
        flag &= Reserve(nd, nq);
        flag &= Reserve(ns, nq);
        flag &= Reserve(ng, nq);
        flag &= Reserve(nq, ng);
        flag &= Reserve(nq, nd);
        flag &= Reserve(nq, ns);
        flag &= Reserve(nq, nb);
    }
    return flag;
}
 
int b_MatPtr(struct b_ *bloc)
/*****************************************************************************
* Purpose
*   Allocate memory and setup matrix index for gaasfets
*
* Returned value
*   YES: successful completion
*
* Discussion
*   The tables pointed to by the arguments are assumed to be allocated
*   already and initialized to 0's.  MatPtr fills in the values for
*   these tables which are used by ReOrder.
*
* Author
*    DEC - 27 Apr 95 - moved here from MATPTR.C
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
 
    flag &= Reserve(nD, nD);
    flag &= Reserve(nG, nG);
    flag &= Reserve(nS, nS);
    flag &= Reserve(nd, nd);
    flag &= Reserve(ns, ns);
    flag &= Reserve(ng, ng);
    flag &= Reserve(nD, nd);
    flag &= Reserve(nG, ng);
    flag &= Reserve(nS, ns);
    flag &= Reserve(nd, ns);
    flag &= Reserve(nd, nD);
    flag &= Reserve(ng, nG);
    flag &= Reserve(ns, nS);
    flag &= Reserve(ns, nd);
    flag &= Reserve(nd, ng);
    flag &= Reserve(ng, nd);
    flag &= Reserve(ns, ng);
    flag &= Reserve(ng, ns);
    return flag;
}
