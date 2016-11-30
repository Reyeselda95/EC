/* demodchk.c
 *   $Revision:   1.32  $
 *   $Author:   GWB  $
 *   $Date:   25 Jun 1997 11:54:20  $ */

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

/*
 * assuming that...
 * genp is a variable of type (struct gen_ *) i.e. a generic device
 * Genp is a variable of type (struct Gen_ *) i.e. a generic model
 * p must be #defined to recast genp to the appropriate type of pointer
 * P must be #defined to recase Genp to the appropriate type of pointer
 * UPPERLIM(data,value) will force data to be <= value.
 * LOWERLIM(data,value) will force data to be >= value.
 * INTERNAL_NODE generates code to assign internal nodes.  if the value
 *  of 'var' is zero, sets the internal node to the external,
 *  otherwise, allocates a new node number.  'p' is again set up
 *  prior to expansion.
 * SDV sets the value of 'e' to v if it is 'OMITTED'.
 */

#define UPPERLIM(e,l)	if (p -> e  >  FLOAT(l))  p -> e = FLOAT(l)
#define LOWERLIM(e,l)	if (p -> e  <  FLOAT(l))  p -> e = FLOAT(l)
#define SDV(e,v)	if (p -> e == OMIT) p -> e = FLOAT(v)
#define RG(v)		if (v != FLOAT(0.0))  v = FLOAT(1.0 / v)
#define RG2(v,x)	if (v != FLOAT(0.0))  v = FLOAT(x / v)
#define AF_LIMIT	0.1
#define EG_LIMIT	0.1
#define FC_LIMIT	0.9999

extern B_ B_default;
extern D_ D_default;
extern J_ J_default;
extern M_ M_default;
extern Q_ Q_default;

DLL_FUNC Gen_* GetDefault(int type)
/*****************************************************************************
* Purpose
*   Return a Gen_ structure pointer for the model type
*
* Return Value: 
*   Pointer to appropriate one of B_default, D_default,...
*
* Discussion
*   The returned pointer is needed to help setup model defaults. This used
*   to be done statically, but now has to be done at runtime to support
*   runtime dynamic linking.
*
* Author
*   dec - 11 Nov 96 - created
*****************************************************************************/
{
    switch (type) {
    case 'B':
        return (Gen_*)&B_default;
    case 'D':
        return (Gen_*)&D_default;
    case 'J':
        return (Gen_*)&J_default;
    case 'M':
        return (Gen_*)&M_default;
    case 'Q':
        return (Gen_*)&Q_default;
    }
    return (Gen_*)NULL;
}

Assoc B_Assoc[],D_Assoc[],J_Assoc[],M_Assoc[],Q_Assoc[];

DLL_FUNC Assoc* GetAssoc(int type)
/*****************************************************************************
* Purpose
*   Return an Assoc structure pointer for the model type
*
* Return Value: 
*   Pointer to appropriate one of B_Assoc, D_Assoc,...
*
* Discussion
*   The returned pointer is needed to help setup model defaults. This used
*   to be done statically, but now has to be done at runtime to support
*   runtime dynamic linking.
*
* Author
*   dec - 11 Nov 96 - created
*****************************************************************************/
{
    switch (type) {
    case 'B':
        return B_Assoc;
    case 'D':
        return D_Assoc;
    case 'J':
        return J_Assoc;
    case 'M':
        return M_Assoc;
    case 'Q':
        return Q_Assoc;
    }
    return (Assoc*)NULL;
}

/*#define PRINT_DEBUG*/

/* void B_ModChk(p) *TITLE*/

/*****************************************************************************
* Purpose
*   Do the processing of ONE B model
*   This includes setting default values and precomputing some constants
*
* Return Value: NONE
*
* Discussion
*   Derived from Release 4.05 MODCHK.C, where the code
*   was spread out across a number of routines
*
* Author
*   sv - 91/02/05 - created
*  eks - 94/10/19 - added support for level=4 Parker-Skellern MESFET model
*  dec - 02 May 95 - vte no longer depends on global vt - computed locally
*  gwb - 16 May 96 - fix KAPPA limiting to allow zero value
*****************************************************************************/

void B_ModChk(
struct B_ *p)			/* R/W Pointer to model */
{
/* local variables */
  double fc, m, t, vbi, vte;

/* code */
  p -> B_fc = p -> B_User_fc;
  p -> B_rd = p -> B_User_rd;
  p -> B_rs = p -> B_User_rs;
  p -> B_rg = p -> B_User_rg;

	/**** limit GaAsFET MODELS ****/
  LOWERLIM (B_af, AF_LIMIT);
  UPPERLIM (B_kf, .95);

  /**** assign level dependent parameter default values ****/
  if ( NINT( (double)p->B_level ) == 4 ) {
    if (p -> B_vto == OMIT)  p -> B_vto = FLOAT(-2.0);
    if (p -> B_beta == OMIT) p -> B_beta = FLOAT(1.0e-4);
    } else {
    if (p -> B_vto == OMIT)  p -> B_vto = FLOAT(-2.5);
 	 if (p -> B_beta == OMIT) p -> B_beta = FLOAT(0.1);
    }

  if ( NINT( (double)p->B_level ) == 2 && (double)p->B_vbi <= .5 ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_001);
    SimError(WARNING_ONLY,"VBI for GaAsFET model %s\n\
is less than (or equal to) 0.5, which may cause numerical errors\n\
for the Statz/Raytheon model capacitance formulation", p->B_name );
    }

  if ( NINT((double)p->B_level) > 5 || NINT((double)p->B_level) < 1 ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_002);
    SimError(0, "Invalid Model Level for GaAsFET model %s",p->B_name );
    }

  /**** process GaAsFET MODELS ****/
  RG (p -> B_rd);
  RG (p -> B_rs);
  RG (p -> B_rg);

  vbi = p -> B_vbi;
  m   = p -> B_m;
  fc  = p -> B_fc;

  p -> B_fc *= FLOAT(vbi);
  p -> B_f1  = vbi*( m == 1.? -log(1-fc) : (1 - pow(1-fc,1-m))/(1-m) );
  p -> B_f2  = pow(1-fc,1+m);
  p -> B_f3  = 1 - fc*(1+m);

  vte = p -> B_n *
    BOLTZ * (ModTempGetTnom_C ((struct Gen_ *)p, TNOM) + CTOK) / CHARGE;
  t =  vte * log( vte / (ROOT2 * p -> B_is ) );
  p -> B_vcrit = t > 0.? t : 0.;
}	/* B_ModChk */



/* void D_ModChk(p) *TITLE*/

/*****************************************************************************
* Purpose
*   Do the processing of ONE D model
*   This includes setting default values and precomputing some constants
*
* Return Value: NONE
*
* Discussion
*   Derived from Release 4.05 MODCHK.C, where the code
*   was spread out across a number of routines
*
* Author
*   sv - 91/02/05 - created
*   dec - 15 dec 92 - check for VJ == 0.0
*   dec - 02 May 95 - vte no longer depends on global vt - computed locally
*****************************************************************************/

void D_ModChk(
struct D_ *p)			/* R/W Pointer to model */
{
/* local variables */
  double fc, m, t, pb, vte;

/* code */
  p -> D_fc = p -> D_User_fc;
  p -> D_rs = p -> D_User_rs;

	/**** limit DIODE MODELS ****/
  LOWERLIM (D_af, AF_LIMIT);
  LOWERLIM (D_eg, EG_LIMIT);
  UPPERLIM (D_fc, FC_LIMIT);

	/**** process DIODE MODELS ****/
  RG (p -> D_rs);
  pb = p -> D_vj;
  if ( pb <= FLOAT(0.0) ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_003);
    SimError(0, "VJ must be greater than zero for model %s", p -> D_name);
    }
  m  = p -> D_m;
  fc = p -> D_fc;

  /*  f1 = pb*(1 - (1-v/pb)^(1-m) )/(1-m)	where v = fc*pb */
  /*  f2 = (1-v/pb)^(1+m)			where v = fc*pb */
  /*  f3 = 1 - v/pb*(1+m)			where v = fc*pb */

  p -> D_fc *= FLOAT(pb);
  p -> D_f1  = pb*( m == 1.? -log(1-fc) : (1 - pow(1-fc,1-m))/(1-m) );
  p -> D_f2  = pow(1-fc,1+m);
  p -> D_f3  = 1 - fc*(1+m);

  vte = p -> D_n *
    BOLTZ * (ModTempGetTnom_C ((struct Gen_ *)p, TNOM) + CTOK) / CHARGE;
  t = vte * log( vte / (ROOT2 * p -> D_is) );
  p -> D_vcrit = t > 0.? t : 0.;
}	/* D_ModChk */


/* void J_ModChk(p) *TITLE*/

/*****************************************************************************
* Purpose
*   Do the processing of ONE J model
*   This includes setting default values and precomputing some constants
*
* Return Value: NONE
*
* Discussion
*   Derived from Release 4.05 MODCHK.C, where the code
*   was spread out across a number of routines
*
* Author
*   sv - 91/02/05 - created
*   dec - 15 dec 92 - check for PB == 0.0
*   dec - 02 May 95 - vte no longer depends on global vt - computed locally
*****************************************************************************/

void J_ModChk(
struct J_ *p)			/* R/W Pointer to model */
{
/* local variables */
  double fc, pb, m, t, vte;

/* code */
	/**** limit JFET MODELS ****/
  p -> J_fc = p -> J_User_fc;
  p -> J_rd = p -> J_User_rd;
  p -> J_rs = p -> J_User_rs;

  LOWERLIM (J_af, AF_LIMIT);
  UPPERLIM (J_fc, FC_LIMIT);

	/**** Process JFET MODELS ****/
  RG (p -> J_rd);
  RG (p -> J_rs);
  pb = p -> J_pb;
  if ( pb <= FLOAT(0.0) ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_004);
    SimError(0, "PB must be greater than zero for model %s", p -> J_name);
    }
  m  = p -> J_m;
  fc = p -> J_fc;
  p -> J_fc *= FLOAT(pb);
  p -> J_f1  = pb*( m == 1.? -log(1-fc) : (1 - pow(1-fc,1-m))/(1-m) );
  p -> J_f2  = pow(1-fc,1+m);
  p -> J_f3  = 1 - fc*(1+m);

  vte = p -> J_n *
    BOLTZ * (ModTempGetTnom_C ((struct Gen_ *)p, TNOM) + CTOK) / CHARGE;
  t = vte * log( vte / (ROOT2*p -> J_is) );
  p -> J_vcrit = t > 0.? t : 0.;
}	/* J_ModChk */
 
 
/* void AdjustBinParams(model, pParam) *TITLE*/
 
/*****************************************************************************
* Purpose
*   This routine does the actual calculation of the binned model parameters
*   for BSIM3V3 per the equation:
*
*       P = Po + Pl/Leff + Pw/Weff + Pp/(Leff * Weff)
*
* Return Value: NONE
*
* Discussion
*   Extracted from the file B3TEMP.C in Spice3.
*
* Author
*   dec - 13 Jun 97 - initial release.
*****************************************************************************/
 
void AdjustBinParams(M_ * model, bsim3SizeDependParam * pParam)
{
    double  Inv_L, Inv_W, Inv_LW;
 
    if (model->BSIM3_BINUNIT == 1) {
        Inv_L = 1.0e-6 / pParam->BSIM3leff;
        Inv_W = 1.0e-6 / pParam->BSIM3weff;
        Inv_LW = 1.0e-12 / (pParam->BSIM3leff
                * pParam->BSIM3weff);
    }
    else {
        Inv_L = 1.0 / pParam->BSIM3leff;
        Inv_W = 1.0 / pParam->BSIM3weff;
        Inv_LW = 1.0 / (pParam->BSIM3leff
                * pParam->BSIM3weff);
    }
    pParam->BSIM3cdsc = model->BSIM3_CDSC
        + model->BSIM3lcdsc * Inv_L
        + model->BSIM3wcdsc * Inv_W
        + model->BSIM3pcdsc * Inv_LW;
    pParam->BSIM3cdscb = model->BSIM3_CDSCB
        + model->BSIM3lcdscb * Inv_L
        + model->BSIM3wcdscb * Inv_W
        + model->BSIM3pcdscb * Inv_LW;
    pParam->BSIM3cdscd = model->BSIM3_CDSCD
        + model->BSIM3lcdscd * Inv_L
        + model->BSIM3wcdscd * Inv_W
        + model->BSIM3pcdscd * Inv_LW;
    pParam->BSIM3cit = model->BSIM3_CIT
        + model->BSIM3lcit * Inv_L
        + model->BSIM3wcit * Inv_W
        + model->BSIM3pcit * Inv_LW;
    pParam->BSIM3nfactor = model->BSIM3_NFACTOR
        + model->BSIM3lnfactor * Inv_L
        + model->BSIM3wnfactor * Inv_W
        + model->BSIM3pnfactor * Inv_LW;
    pParam->BSIM3xj = model->M_xj
        + model->BSIM3lxj * Inv_L
        + model->BSIM3wxj * Inv_W
        + model->BSIM3pxj * Inv_LW;
    pParam->BSIM3vsat = model->BSIM3_VSAT
        + model->BSIM3lvsat * Inv_L
        + model->BSIM3wvsat * Inv_W
        + model->BSIM3pvsat * Inv_LW;
    pParam->BSIM3at = model->BSIM3_AT
        + model->BSIM3lat * Inv_L
        + model->BSIM3wat * Inv_W
        + model->BSIM3pat * Inv_LW;
    pParam->BSIM3a0 = model->BSIM3_A0
        + model->BSIM3la0 * Inv_L
        + model->BSIM3wa0 * Inv_W
        + model->BSIM3pa0 * Inv_LW;
    pParam->BSIM3ags = model->BSIM3_AGS
        + model->BSIM3lags * Inv_L
        + model->BSIM3wags * Inv_W
        + model->BSIM3pags * Inv_LW;
    pParam->BSIM3a1 = model->BSIM3_A1
        + model->BSIM3la1 * Inv_L
        + model->BSIM3wa1 * Inv_W
        + model->BSIM3pa1 * Inv_LW;
    pParam->BSIM3a2 = model->BSIM3_A2
        + model->BSIM3la2 * Inv_L
        + model->BSIM3wa2 * Inv_W
        + model->BSIM3pa2 * Inv_LW;
    pParam->BSIM3keta = model->BSIM3_KETA
        + model->BSIM3lketa * Inv_L
        + model->BSIM3wketa * Inv_W
        + model->BSIM3pketa * Inv_LW;
    pParam->BSIM3nsub = model->M_nsub
        + model->BSIM3lnsub * Inv_L
        + model->BSIM3wnsub * Inv_W
        + model->BSIM3pnsub * Inv_LW;
    pParam->BSIM3npeak = model->BSIM3_NPEAK
        + model->BSIM3lnpeak * Inv_L
        + model->BSIM3wnpeak * Inv_W
        + model->BSIM3pnpeak * Inv_LW;
    pParam->BSIM3ngate = model->BSIM3_NGATE
        + model->BSIM3lngate * Inv_L
        + model->BSIM3wngate * Inv_W
        + model->BSIM3pngate * Inv_LW;
    pParam->BSIM3gamma1 = model->BSIM3_GAMMA1
        + model->BSIM3lgamma1 * Inv_L
        + model->BSIM3wgamma1 * Inv_W
        + model->BSIM3pgamma1 * Inv_LW;
    pParam->BSIM3gamma2 = model->BSIM3_GAMMA2
        + model->BSIM3lgamma2 * Inv_L
        + model->BSIM3wgamma2 * Inv_W
        + model->BSIM3pgamma2 * Inv_LW;
    pParam->BSIM3vbx = model->BSIM3_VBX
        + model->BSIM3lvbx * Inv_L
        + model->BSIM3wvbx * Inv_W
        + model->BSIM3pvbx * Inv_LW;
    pParam->BSIM3vbm = model->BSIM3_VBM
        + model->BSIM3lvbm * Inv_L
        + model->BSIM3wvbm * Inv_W
        + model->BSIM3pvbm * Inv_LW;
    pParam->BSIM3xt = model->BSIM3_XT
        + model->BSIM3lxt * Inv_L
        + model->BSIM3wxt * Inv_W
        + model->BSIM3pxt * Inv_LW;
    pParam->BSIM3k1 = model->BSIM_K10
        + model->BSIM_K1L * Inv_L
        + model->BSIM_K1W * Inv_W
        + model->BSIM3pk1 * Inv_LW;
    pParam->BSIM3kt1 = model->BSIM3_KT1
        + model->BSIM3lkt1 * Inv_L
        + model->BSIM3wkt1 * Inv_W
        + model->BSIM3pkt1 * Inv_LW;
    pParam->BSIM3kt1l = model->BSIM3_KT1L
        + model->BSIM3lkt1l * Inv_L
        + model->BSIM3wkt1l * Inv_W
        + model->BSIM3pkt1l * Inv_LW;
    pParam->BSIM3k2 = model->BSIM_K20
        + model->BSIM_K2L * Inv_L
        + model->BSIM_K2W * Inv_W
        + model->BSIM3pk2 * Inv_LW;
    pParam->BSIM3kt2 = model->BSIM3_KT2
        + model->BSIM3lkt2 * Inv_L
        + model->BSIM3wkt2 * Inv_W
        + model->BSIM3pkt2 * Inv_LW;
    pParam->BSIM3k3 = model->BSIM3_K3
        + model->BSIM3lk3 * Inv_L
        + model->BSIM3wk3 * Inv_W
        + model->BSIM3pk3 * Inv_LW;
    pParam->BSIM3k3b = model->BSIM3_K3B
        + model->BSIM3lk3b * Inv_L
        + model->BSIM3wk3b * Inv_W
        + model->BSIM3pk3b * Inv_LW;
    pParam->BSIM3w0 = model->BSIM3_W0
        + model->BSIM3lw0 * Inv_L
        + model->BSIM3ww0 * Inv_W
        + model->BSIM3pw0 * Inv_LW;
    pParam->BSIM3nlx = model->BSIM3_NLX
        + model->BSIM3lnlx * Inv_L
        + model->BSIM3wnlx * Inv_W
        + model->BSIM3pnlx * Inv_LW;
    pParam->BSIM3dvt0 = model->BSIM3_DVT0
        + model->BSIM3ldvt0 * Inv_L
        + model->BSIM3wdvt0 * Inv_W
        + model->BSIM3pdvt0 * Inv_LW;
    pParam->BSIM3dvt1 = model->BSIM3_DVT1
        + model->BSIM3ldvt1 * Inv_L
        + model->BSIM3wdvt1 * Inv_W
        + model->BSIM3pdvt1 * Inv_LW;
    pParam->BSIM3dvt2 = model->BSIM3_DVT2
        + model->BSIM3ldvt2 * Inv_L
        + model->BSIM3wdvt2 * Inv_W
        + model->BSIM3pdvt2 * Inv_LW;
    pParam->BSIM3dvt0w = model->BSIM3_DVT0W
        + model->BSIM3ldvt0w * Inv_L
        + model->BSIM3wdvt0w * Inv_W
        + model->BSIM3pdvt0w * Inv_LW;
    pParam->BSIM3dvt1w = model->BSIM3_DVT1W
        + model->BSIM3ldvt1w * Inv_L
        + model->BSIM3wdvt1w * Inv_W
        + model->BSIM3pdvt1w * Inv_LW;
    pParam->BSIM3dvt2w = model->BSIM3_DVT2W
        + model->BSIM3ldvt2w * Inv_L
        + model->BSIM3wdvt2w * Inv_W
        + model->BSIM3pdvt2w * Inv_LW;
    pParam->BSIM3drout = model->BSIM3_DROUT
        + model->BSIM3ldrout * Inv_L
        + model->BSIM3wdrout * Inv_W
        + model->BSIM3pdrout * Inv_LW;
    pParam->BSIM3dsub = model->BSIM3_DSUB
        + model->BSIM3ldsub * Inv_L
        + model->BSIM3wdsub * Inv_W
        + model->BSIM3pdsub * Inv_LW;
    pParam->BSIM3vth0 = model->BSIM3_VTH0
        + model->BSIM3lvth0 * Inv_L
        + model->BSIM3wvth0 * Inv_W
        + model->BSIM3pvth0 * Inv_LW;
    pParam->BSIM3ua = model->BSIM3_UA
        + model->BSIM3lua * Inv_L
        + model->BSIM3wua * Inv_W
        + model->BSIM3pua * Inv_LW;
    pParam->BSIM3ua1 = model->BSIM3_UA1
        + model->BSIM3lua1 * Inv_L
        + model->BSIM3wua1 * Inv_W
        + model->BSIM3pua1 * Inv_LW;
    pParam->BSIM3ub = model->BSIM3_UB
        + model->BSIM3lub * Inv_L
        + model->BSIM3wub * Inv_W
        + model->BSIM3pub * Inv_LW;
    pParam->BSIM3ub1 = model->BSIM3_UB1
        + model->BSIM3lub1 * Inv_L
        + model->BSIM3wub1 * Inv_W
        + model->BSIM3pub1 * Inv_LW;
    pParam->BSIM3uc = model->BSIM3_UC
        + model->BSIM3luc * Inv_L
        + model->BSIM3wuc * Inv_W
        + model->BSIM3puc * Inv_LW;
    pParam->BSIM3uc1 = model->BSIM3_UC1
        + model->BSIM3luc1 * Inv_L
        + model->BSIM3wuc1 * Inv_W
        + model->BSIM3puc1 * Inv_LW;
    pParam->BSIM3u0 = model->BSIM_ugs0
        + model->BSIM_ugsL * Inv_L
        + model->BSIM_ugsW * Inv_W
        + model->BSIM3pu0 * Inv_LW;
    pParam->BSIM3ute = model->BSIM3_UTE
        + model->BSIM3lute * Inv_L
        + model->BSIM3wute * Inv_W
        + model->BSIM3pute * Inv_LW;
    pParam->BSIM3voff = model->BSIM3_VOFF
        + model->BSIM3lvoff * Inv_L
        + model->BSIM3wvoff * Inv_W
        + model->BSIM3pvoff * Inv_LW;
    pParam->BSIM3delta = model->M_delta
        + model->BSIM3ldelta * Inv_L
        + model->BSIM3wdelta * Inv_W
        + model->BSIM3pdelta * Inv_LW;
    pParam->BSIM3rdsw = model->BSIM3_RDSW
        + model->BSIM3lrdsw * Inv_L
        + model->BSIM3wrdsw * Inv_W
        + model->BSIM3prdsw * Inv_LW;
    pParam->BSIM3prwg = model->BSIM3_PRWG
        + model->BSIM3lprwg * Inv_L
        + model->BSIM3wprwg * Inv_W
        + model->BSIM3pprwg * Inv_LW;
    pParam->BSIM3prwb = model->BSIM3_PRWB
        + model->BSIM3lprwb * Inv_L
        + model->BSIM3wprwb * Inv_W
        + model->BSIM3pprwb * Inv_LW;
    pParam->BSIM3prt = model->BSIM3_PRT
        + model->BSIM3lprt * Inv_L
        + model->BSIM3wprt * Inv_W
        + model->BSIM3pprt * Inv_LW;
    pParam->BSIM3eta0 = model->BSIM3_ETA0
        + model->BSIM3leta0 * Inv_L
        + model->BSIM3weta0 * Inv_W
        + model->BSIM3peta0 * Inv_LW;
    pParam->BSIM3etab = model->BSIM3_ETAB
        + model->BSIM3letab * Inv_L
        + model->BSIM3wetab * Inv_W
        + model->BSIM3petab * Inv_LW;
    pParam->BSIM3pclm = model->BSIM3_PCLM
        + model->BSIM3lpclm * Inv_L
        + model->BSIM3wpclm * Inv_W
        + model->BSIM3ppclm * Inv_LW;
    pParam->BSIM3pdibl1 = model->BSIM3_PDIBL1
        + model->BSIM3lpdibl1 * Inv_L
        + model->BSIM3wpdibl1 * Inv_W
        + model->BSIM3ppdibl1 * Inv_LW;
    pParam->BSIM3pdibl2 = model->BSIM3_PDIBL2
        + model->BSIM3lpdibl2 * Inv_L
        + model->BSIM3wpdibl2 * Inv_W
        + model->BSIM3ppdibl2 * Inv_LW;
    pParam->BSIM3pdiblb = model->BSIM3_PDIBLB
        + model->BSIM3lpdiblb * Inv_L
        + model->BSIM3wpdiblb * Inv_W
        + model->BSIM3ppdiblb * Inv_LW;
    pParam->BSIM3pscbe1 = model->BSIM3_PSCBE1
        + model->BSIM3lpscbe1 * Inv_L
        + model->BSIM3wpscbe1 * Inv_W
        + model->BSIM3ppscbe1 * Inv_LW;
    pParam->BSIM3pscbe2 = model->BSIM3_PSCBE2
        + model->BSIM3lpscbe2 * Inv_L
        + model->BSIM3wpscbe2 * Inv_W
        + model->BSIM3ppscbe2 * Inv_LW;
    pParam->BSIM3pvag = model->BSIM3_PVAG
        + model->BSIM3lpvag * Inv_L
        + model->BSIM3wpvag * Inv_W
        + model->BSIM3ppvag * Inv_LW;
    pParam->BSIM3wr = model->BSIM3_WR
        + model->BSIM3lwr * Inv_L
        + model->BSIM3wwr * Inv_W
        + model->BSIM3pwr * Inv_LW;
    pParam->BSIM3dwg = model->BSIM3_DWG
        + model->BSIM3ldwg * Inv_L
        + model->BSIM3wdwg * Inv_W
        + model->BSIM3pdwg * Inv_LW;
    pParam->BSIM3dwb = model->BSIM3_DWB
        + model->BSIM3ldwb * Inv_L
        + model->BSIM3wdwb * Inv_W
        + model->BSIM3pdwb * Inv_LW;
    pParam->BSIM3b0 = model->BSIM3_B0
        + model->BSIM3lb0 * Inv_L
        + model->BSIM3wb0 * Inv_W
        + model->BSIM3pb0 * Inv_LW;
    pParam->BSIM3b1 = model->BSIM3_B1
        + model->BSIM3lb1 * Inv_L
        + model->BSIM3wb1 * Inv_W
        + model->BSIM3pb1 * Inv_LW;
    pParam->BSIM3alpha0 = model->BSIM3_ALPHA0
        + model->BSIM3lalpha0 * Inv_L
        + model->BSIM3walpha0 * Inv_W
        + model->BSIM3palpha0 * Inv_LW;
    pParam->BSIM3beta0 = model->BSIM3_BETA0
        + model->BSIM3lbeta0 * Inv_L
        + model->BSIM3wbeta0 * Inv_W
        + model->BSIM3pbeta0 * Inv_LW;
    /* CV model */
    pParam->BSIM3elm = model->BSIM3_ELM
        + model->BSIM3lelm * Inv_L
        + model->BSIM3welm * Inv_W
        + model->BSIM3pelm * Inv_LW;
    pParam->BSIM3cgsl = model->BSIM3_CGSL
        + model->BSIM3lcgsl * Inv_L
        + model->BSIM3wcgsl * Inv_W
        + model->BSIM3pcgsl * Inv_LW;
    pParam->BSIM3cgdl = model->BSIM3_CGDL
        + model->BSIM3lcgdl * Inv_L
        + model->BSIM3wcgdl * Inv_W
        + model->BSIM3pcgdl * Inv_LW;
    pParam->BSIM3ckappa = model->BSIM3_CKAPPA
        + model->BSIM3lckappa * Inv_L
        + model->BSIM3wckappa * Inv_W
        + model->BSIM3pckappa * Inv_LW;
    pParam->BSIM3cf = model->BSIM3_CF
        + model->BSIM3lcf * Inv_L
        + model->BSIM3wcf * Inv_W
        + model->BSIM3pcf * Inv_LW;
    pParam->BSIM3clc = model->BSIM3_CLC
        + model->BSIM3lclc * Inv_L
        + model->BSIM3wclc * Inv_W
        + model->BSIM3pclc * Inv_LW;
    pParam->BSIM3cle = model->BSIM3_CLE
        + model->BSIM3lcle * Inv_L
        + model->BSIM3wcle * Inv_W
        + model->BSIM3pcle * Inv_LW;
}
 
 
/* void ComputeBinParams(here, model, pParam) *TITLE*/
 
/*****************************************************************************
* Purpose
*   This is the driving routine to calculate the binned model parameters
*   for BSIM3V3.
*
* Return Value: NONE
*
* Discussion
*   Extracted from the file B3TEMP.C in Spice3.
*
* Author
*   dec - 13 Jun 97 - initial release.
*****************************************************************************/
 
void ComputeBinParams(m_ * here, M_ * model, bsim3SizeDependParam * pParam)
{
    double  Ldrn, Wdrn, T0, T1, tmp1, T2, T3, tmp2;
    double  Temp;
    {
 
        Ldrn = here->m_l;
        Wdrn = here->m_w;
 
        T0 = pow(Ldrn, (double) (model->BSIM3_LLN));
        T1 = pow(Wdrn, (double) (model->BSIM3_LWN));
        tmp1 = model->BSIM3_LL / T0 + model->BSIM3_LW / T1
            + model->BSIM3_LWL / (T0 * T1);
        pParam->BSIM3dl = model->BSIM3_LINT + tmp1;
        pParam->BSIM3dlc = model->BSIM3_DLC + tmp1;
 
        T2 = pow(Ldrn, (double) (model->BSIM3_WLN));
        T3 = pow(Wdrn, (double) (model->BSIM3_WWN));
        tmp2 = model->BSIM3_WL / T2 + model->BSIM3_WW / T3
            + model->BSIM3_WWL / (T2 * T3);
        pParam->BSIM3dw = model->BSIM3_WINT + tmp2;
        pParam->BSIM3dwc = model->BSIM3_DWC + tmp2;
 
        pParam->BSIM3leff = here->m_l - 2.0 * pParam->BSIM3dl;
        if (pParam->BSIM3leff <= 0.0) {
            SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_017);
            SimError(FATAL_ERROR,
                "Mosfet %s, model %s: Effective channel length <= 0",
                here->m_name, model->M_name);
        }
 
        if (here->m_m == OMIT) here->m_m = 1.0; 
        pParam->BSIM3weff = (here->m_w - 2.0 * pParam->BSIM3dw) * here->m_m;
        if (pParam->BSIM3weff <= 0.0) {
            SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_018);
            SimError(FATAL_ERROR,
                "Mosfet %s, model %s: Effective channel width <= 0",
                here->m_name, model->M_name);
        }
 
        pParam->BSIM3leffCV = here->m_l - 2.0 * pParam->BSIM3dlc;
        if (pParam->BSIM3leffCV <= 0.0) {
            SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_019);
            SimError(FATAL_ERROR,
                "Mosfet %s, model %s: Effective channel length for C-V <= 0",
                here->m_name, model->M_name);
        }
 
        pParam->BSIM3weffCV = (here->m_w - 2.0 * pParam->BSIM3dwc) * here->m_m;
        if (pParam->BSIM3weffCV <= 0.0) {
            SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_020);
            SimError(FATAL_ERROR,
                "Mosfet %s, model %s: Effective channel width for C-V <= 0",
                here->m_name, model->M_name);
        }
 
        AdjustBinParams(model, pParam);
 
        pParam->BSIM3abulkCVfactor = 1.0 + pow((pParam->BSIM3clc
                    / pParam->BSIM3leff),
            pParam->BSIM3cle);
 
        pParam->BSIM3cgdo = (model->M_cgdo
                + pParam->BSIM3cf)
            * pParam->BSIM3weffCV;
        pParam->BSIM3cgso = (model->M_cgso
                + pParam->BSIM3cf)
            * pParam->BSIM3weffCV;
        pParam->BSIM3cgbo = model->M_cgbo
            * pParam->BSIM3leffCV;
 
        double Tnom = Temp = model->BSIM3_TNOM;
        double TRatio = Temp / Tnom;
 
#ifdef BSIM3_TEMP
        ToOutFile("MODCHK-B3TEMP: TRatio       %10.4e\n", TRatio);
        ToOutFile("MODCHK-B3TEMP: Tnew         %10.4e\n", Temp);
        ToOutFile("MODCHK-B3TEMP: Tnom         %10.4e\n", Tnom);
#endif
 
        T0 = (TRatio - 1.0);
        pParam->BSIM3ua = pParam->BSIM3ua + pParam->BSIM3ua1 * T0;
        pParam->BSIM3ub = pParam->BSIM3ub + pParam->BSIM3ub1 * T0;
        pParam->BSIM3uc = pParam->BSIM3uc + pParam->BSIM3uc1 * T0;
 
        pParam->BSIM3u0temp = pParam->BSIM3u0
            * pow(TRatio, pParam->BSIM3ute);
        pParam->BSIM3vsattemp = pParam->BSIM3vsat - pParam->BSIM3at
            * T0;
        pParam->BSIM3rds0 = (pParam->BSIM3rdsw + pParam->BSIM3prt * T0)
            / pow(pParam->BSIM3weff * 1e6, pParam->BSIM3wr);
 
        double cox = EPSOX / model->M_tox;
 
        if (model->BSIM3_User_NPEAK == OMIT
                && model->BSIM3_User_GAMMA1 != OMIT) {
            T0 = pParam->BSIM3gamma1 * cox;
            pParam->BSIM3npeak = 3.021E22 * T0 * T0;
        }
 
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
                * model->M_tox);
        pParam->BSIM3vbi = Vtm0 * log(1.0e20
                * pParam->BSIM3npeak / (ni * ni));
        pParam->BSIM3cdep0 = sqrt(CHARGE * EPSSIL
                * pParam->BSIM3npeak * 1.0e6 / 2.0
                / pParam->BSIM3phi);
 
        if (model->BSIM_User_K10 != OMIT
                || model->BSIM_User_K20 != OMIT) {
            if (model->BSIM_User_K10 == OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_021);
                SimError(WARNING_ONLY, "k1 should be specified with k2.");
                pParam->BSIM3k1 = 0.53;
            }
            if (model->BSIM_User_K20 == OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_022);
                SimError(WARNING_ONLY, "k2 should be specified with k1.");
                pParam->BSIM3k2 = FLOAT(-0.0186);
                model->BSIM_K20 = FLOAT(0.0);
            }
            if (model->M_User_nsub != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_023);
                SimError(WARNING_ONLY, "nsub is ignored because k1 or k2 is given.");
            }
            if (model->BSIM3_User_XT != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_024);
                SimError(WARNING_ONLY, "xt is ignored because k1 or k2 is given.");
            }
            if (model->BSIM3_User_VBX != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_025);
                SimError(WARNING_ONLY, "vbx is ignored because k1 or k2 is given.");
            }
            if (model->BSIM3_User_VBM != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_026);
                SimError(WARNING_ONLY, "vbm is ignored because k1 or k2 is given.");
            }
            if (model->BSIM3_User_GAMMA1 != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_027);
                SimError(WARNING_ONLY, "gamma1 is ignored because k1 or k2 is given.");
            }
            if (model->BSIM3_User_GAMMA2 != OMIT) {
                SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_028);
                SimError(WARNING_ONLY, "gamma2 is ignored because k1 or k2 is given.");
            }
        }
        else {
            if (model->BSIM3_User_VBX == OMIT)
                pParam->BSIM3vbx = pParam->BSIM3phi - 7.7348e-4
                    * pParam->BSIM3npeak
                    * pParam->BSIM3xt * pParam->BSIM3xt;
            if (pParam->BSIM3vbx > 0.0)
                pParam->BSIM3vbx = - pParam->BSIM3vbx;
            if (pParam->BSIM3vbm > 0.0)
                pParam->BSIM3vbm = - pParam->BSIM3vbm;
 
            if (model->BSIM3_User_GAMMA1 == OMIT)
                pParam->BSIM3gamma1 = 5.753e-12
                    * sqrt(pParam->BSIM3npeak)
                    / cox;
 
            if (model->BSIM3_User_GAMMA2 == OMIT)
                pParam->BSIM3gamma2 = 5.753e-12
                    * sqrt(pParam->BSIM3nsub)
                    / cox;
 
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
 
        model->BSIM3vtm = FLOAT(KboQ * Temp);
 
        if (model->BSIM3_User_VTH0 != OMIT)
            pParam->BSIM3vfb = model->M_type * pParam->BSIM3vth0
                - pParam->BSIM3phi - pParam->BSIM3k1
                * pParam->BSIM3sqrtPhi;
        else
            pParam->BSIM3vth0 = model->M_type * (-1.0
                    + pParam->BSIM3phi + pParam->BSIM3k1
                    * pParam->BSIM3sqrtPhi);
 
        T1 = sqrt(EPSSIL / EPSOX * model->M_tox
                * pParam->BSIM3Xdep0);
        T0 = exp(-0.5 * pParam->BSIM3dsub * pParam->BSIM3leff / T1);
        pParam->BSIM3theta0vb0 = (T0 + 2.0 * T0 * T0);
 
        T0 = exp(-0.5 * pParam->BSIM3drout * pParam->BSIM3leff / T1);
        T2 = (T0 + 2.0 * T0 * T0);
        pParam->BSIM3thetaRout = pParam->BSIM3pdibl1 * T2
            + pParam->BSIM3pdibl2;
 
    }
//    Spice3 does the following assignment - it is not needed
//        here->BSIM3cgso = pParam->BSIM3cgso;
//        here->BSIM3cgdo = pParam->BSIM3cgdo;
}
 
 
/* void CaptureBinParams(model) *TITLE*/
 
/*****************************************************************************
* Purpose
*   This routine sets up the data structures to support model parameter
*   binning for BSIM3V3.  It accumulates precomputed instance parameters
*   and associates them with models.
*
* Return Value: NONE
*
* Discussion
*   Extracted from the file B3TEMP.C in Spice3. Each model has a linked
*   list of size dependency parameters. Each instance is associated
*   with one of these.
*
* Author
*   dec - 13 Jun 97 - initial release.
*****************************************************************************/
 
void CaptureBinParams(M_ * model)
{
    int     Size_Not_Found;
    bsim3SizeDependParam * pLastKnot = NULL;
    bsim3SizeDependParam * pParam = NULL;
 
    for (m_ * here = (m_ *) GetHeads('m'); here; here = here->m_next) {
        if (model != here->m_model) continue;
        bsim3SizeDependParam * pSizeDependParamKnot = model->pSizeDependParamKnot;
        Size_Not_Found = 1;
 
        while ((pSizeDependParamKnot != NULL) && Size_Not_Found) {
            if ((here->m_l == pSizeDependParamKnot->Length)
                    && ((here->m_w * here->m_m) == pSizeDependParamKnot->Width)) {
                // This size configuration is redundant
                Size_Not_Found = 0;
                here->pParam = pSizeDependParamKnot;
            }
            else {
                pLastKnot = pSizeDependParamKnot;
                pSizeDependParamKnot = pSizeDependParamKnot->pNext;
            }
        }
 
        if (Size_Not_Found) {          // didn't find it, so make a new one
            pParam = (struct bsim3SizeDependParam *) malloc(
                sizeof (struct bsim3SizeDependParam));
            if (pLastKnot == NULL) model->pSizeDependParamKnot = pParam;
            else pLastKnot->pNext = pParam;
            pParam->pNext = NULL;
            here->pParam = pParam;
//          VERSION 3.1 DOES THE NEXT TWO LINES
            pParam->Length = here->m_l;
            pParam->Width = here->m_w * here->m_m;
//          VERSION 3.0 ERROR FIXED IN VERSION 3.1
//            pParam->Length = 0.0;
//            pParam->Width = 0.0;
 
            ComputeBinParams(here, model, pParam);
        }
    }
}
 
 
 
/* void M_ModChk(p) *TITLE*/
 
/*****************************************************************************
* Purpose
*   Do the processing of ONE M model
*   This includes setting default values and precomputing some constants
*
* Return Value: NONE
*
* Discussion
*   Derived from Release 4.05 MODCHK.C, where the code
*   was spread out across a number of routines
*
* Author
*   sv  05 Feb 91 - created
*  kcp  29 Oct 93 - unbundled from modchk.c, also included static variables
*                   from modchk.c : tnom, xkt, vt, xni egfet
*  eks  27 Jun 94 - merged M_Modchk(p) back into modchk.c
*  gwb  03 Feb 95 - add BSIM3 version 2.0 parameters,
*                   code indentation and clean up
*  dec  02 May 95 - compute vt and egfet locally instead of depending on
*                     globals
*  gwb  14 Jul 95 - check for PB == 0.0
*  gwb  14 Sep 95 - remove Level=5 BSIM3 code
*  gwb  15 Aug 96 - additions for new mosfet noise models
*  gwb  13 Jun 97 - add support for BSIM3V3 model parameters
*
*****************************************************************************/
 
void M_ModChk(
         struct M_ *p)                 /* R/W Pointer to model                */
 
{
 
#define LEVEL1  FLOAT(1.0)
#define LEVEL2  FLOAT(2.0)
#define LEVEL3  FLOAT(3.0)
#define LEVEL4  FLOAT(4.0)
#define LEVEL5  FLOAT(5.0)
#define LEVEL6  FLOAT(6.0)
#define LEVEL7  FLOAT(7.0)
 
/* local variables */
    double  xnsub, cox;
    double  fermis, fermig, wkfng, wkfngs;
    double  tnom, vt, egfet;
    int     DLCGiven;
 
/* code */
 
#ifdef BSIM3_DEBUG
    ToOutFile("ENTER M_MODCHK\n");
#endif
 
    tnom = ModTempGetTnom_C((struct Gen_ *) p, TNOM) + CTOK;
    vt = BOLTZ * tnom / CHARGE;
    egfet = EGFET(tnom);
 
    p->M_rd = p->M_User_rd;
    p->M_rs = p->M_User_rs;
    p->M_rg = p->M_User_rg;
    p->M_rb = p->M_User_rb;
    p->M_rsh = p->M_User_rsh;
    p->M_rds = p->M_User_rds;
    p->M_nsub = p->M_User_nsub;
    p->M_nss = p->M_User_nss;
    p->M_nfs = p->M_User_nfs;
    p->M_uo = p->M_User_uo;
    p->M_ucrit = p->M_User_ucrit;
    p->M_delta = p->M_User_delta;
    p->M_eta = p->M_User_eta;
 
    p->BSIM3_NPEAK = p->BSIM3_User_NPEAK;
    p->BSIM3_GAMMA1 = p->BSIM3_User_GAMMA1;
    p->BSIM3_GAMMA2 = p->BSIM3_User_GAMMA2;
    p->BSIM3_XT = p->BSIM3_User_XT;
    p->BSIM_K10 = p->BSIM_User_K10;
    p->BSIM_K20 = p->BSIM_User_K20;
    p->BSIM3_VBX = p->BSIM3_User_VBX;
    p->BSIM3_VBM = p->BSIM3_User_VBM;
    p->BSIM3_VTH0 = p->BSIM3_User_VTH0;
 
    p->M_vinit = -1.0;                 /* for now                             */
 
    if (p->M_nlev < FLOAT(0.0) || p->M_nlev > FLOAT(3.0)) {
        SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_016);
        SimError(0, "NLEV must be between 0 and 3 for model %s", p->M_name);
    }
 
    if (p->M_pb <= FLOAT(0.0)) {
        SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_005);
        SimError(0, "PB must be greater than zero for model %s", p->M_name);
    }
 
    if (p->M_level < LEVEL1 || p->M_level > LEVEL7 || p->M_level == LEVEL5) {
        SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_006);
        SimError(0, "Invalid model Level for Mosfet %s",
            p->M_name);
    }
 
    if (p->M_tpg != FLOAT(-1.0)
            && p->M_tpg != FLOAT(0.0)
            && p->M_tpg != FLOAT(1.0)) p->M_tpg = FLOAT(1.0);
 
    if ((p->M_level == LEVEL1
                || p->M_level == LEVEL2
                || p->M_level == LEVEL3)
            && p->M_xj == OMIT) p->M_xj = FLOAT(0.0);
 
    /* special processing for default values of BSIM3 parameters
     * that are taken from BSIM */
 
    if (p->M_level != LEVEL6 && p->M_level != LEVEL7) {
 
        if (p->M_is == OMIT)
            p->M_is = FLOAT(1.0e-14);
        if (p->M_js == OMIT)
            p->M_js = FLOAT(0.0);
        if (p->M_eta == OMIT)
            p->M_eta = FLOAT(0.0);
        if (p->M_pb == OMIT)
            p->M_pb = FLOAT(0.8);
        if (p->BSIM_ugs0 == OMIT)
            p->BSIM_ugs0 = FLOAT(0.0);
        if (p->BSIM_K10 == OMIT)
            p->BSIM_K10 = FLOAT(0.0);
        if (p->BSIM_K20 == OMIT)
            p->BSIM_K20 = FLOAT(0.0);
        if (p->BSIM_vfb0 == OMIT)
            p->BSIM_vfb0 = FLOAT(0.0);
        if (p->BSIM_temp == OMIT)
            p->BSIM_temp = FLOAT(0.0);
        if (p->BSIM_vdd == OMIT)
            p->BSIM_vdd = FLOAT(0.0);
        if (p->BSIM_xpart == OMIT)
            p->BSIM_xpart = FLOAT(0.0);
 
        if (p->M_cgso == OMIT)
            p->M_cgso = FLOAT(0.0);
        if (p->M_cgdo == OMIT)
            p->M_cgdo = FLOAT(0.0);
        if (p->M_cj == OMIT)
            p->M_cj = FLOAT(0.0);
        if (p->M_cjsw == OMIT)
            p->M_cjsw = FLOAT(0.0);
        if (p->M_delta == OMIT)
            p->M_delta = FLOAT(0.0);
 
        if (p->M_diomod = OMIT)
            p->M_diomod = FLOAT(1.0);
 
    }
    else if (p->M_level == LEVEL6) {
 
        /* BSIM3: level = 6 */
        if ((p->BSIM_ugs0 == OMIT) && (p->M_type == 1))
            p->BSIM_ugs0 = FLOAT(670.0e-4);
        if ((p->BSIM_ugs0 == OMIT) && (p->M_type != 1))
            p->BSIM_ugs0 = FLOAT(250.0e-4);
        if (p->BSIM_ugs0 > 1.0)
            p->BSIM_ugs0 *= FLOAT(1.0e-4);
        if (p->M_is == OMIT)
            p->M_is = FLOAT(1.0e-15);
        if (p->M_js == OMIT)
            p->M_js = FLOAT(0.0);
        if (p->M_eta == OMIT)
            p->M_eta = FLOAT(0.3);
        if (p->M_pb == OMIT)
            p->M_pb = FLOAT(0.8);
        if (p->BSIM_vfb0 == OMIT)
            p->BSIM_vfb0 = FLOAT(-1.0);
        if (p->BSIM_xpart == OMIT)
            p->BSIM_xpart = FLOAT(0.0);
 
        if (p->M_diomod = OMIT)
            p->M_diomod = FLOAT(1.0);
 
    }                                  /* level 6                             */
    else {
 
        /* BSIM3: level = 7 */
        if ((p->BSIM_ugs0 == OMIT) && (p->M_type == 1))
            p->BSIM_ugs0 = FLOAT(670.0e-4);
        if ((p->BSIM_ugs0 == OMIT) && (p->M_type != 1))
            p->BSIM_ugs0 = FLOAT(250.0e-4);
        if (p->BSIM_ugs0 > 1.0)
            p->BSIM_ugs0 *= FLOAT(1.0e-4);
        if (p->M_is == OMIT)
            p->M_is = FLOAT(1.0e-15);
        if (p->M_js == OMIT)
            p->M_js = FLOAT(1.0e-4);
        if (p->M_eta == OMIT)
            p->M_eta = FLOAT(0.3);
        if (p->M_pb == OMIT)
            p->M_pb = FLOAT(1.0);
        if (p->BSIM_vfb0 == OMIT)
            p->BSIM_vfb0 = FLOAT(-1.0);
        if (p->BSIM_xpart == OMIT)
            p->BSIM_xpart = FLOAT(0.0);
        if (p->M_cj == OMIT)
            p->M_cj = FLOAT(5.0e-4);
        if (p->M_cjsw == OMIT)
            p->M_cjsw = FLOAT(5.0e-10);
        if (p->M_delta == OMIT)
            p->M_delta = FLOAT(0.01);
 
        if (p->M_diomod = OMIT)
            p->M_diomod = FLOAT(2.0);
 
    }                                  /* level 7                             */
 
    /* default value Processing for BSIM3 MOSFET Model Version 2.0 */
 
    if (p->M_level == LEVEL6) {
 
        p->BSIM3_TNOM = FLOAT(TNOM + CTOK);
 
        if (p->M_xj == OMIT)
            p->M_xj = FLOAT(1.5e-7);
 
        if (p->BSIM3_UC == OMIT)
            p->BSIM3_UC = FLOAT(0.0465);
 
        if (p->BSIM3_UC1 == OMIT)
            p->BSIM3_UC1 = FLOAT(-0.056);
 
        if (p->BSIM3_VSAT == OMIT)
            p->BSIM3_VSAT = FLOAT(8.0e4);
        else
            p->BSIM3_VSAT = p->BSIM3_VSAT * FLOAT(1.0e-2);
 
        /* The following sets M_vto, which will set the first iteration Vgs.
         * to a reasonable value */
        if (p->BSIM3_VTH0 == OMIT) {
            if (p->M_type == 1.0)      /* NMOS                                */
                p->M_vto = FLOAT(1.5);
            else
                p->M_vto = FLOAT(-1.5);
        }
        else {
            p->M_vto = p->BSIM3_VTH0;
        }
 
        if (p->BSIM3_PSCBE2 == 0.0) {
            SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_007);
            SimError(WARNING_ONLY,
                "PSCBE2 cannot be 0.0 for MOS Level 6\n");
        }
        if (p->M_tox == 0.0) {
            SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_008);
            SimError(WARNING_ONLY,
                "TOX cannot be 0.0 for MOS Level 6\n");
        }
        if (p->BSIM3_LITL == 0.0) {
            SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_009);
            SimError(WARNING_ONLY,
                "LITL cannot be 0.0 for MOS Level 6\n");
        }
 
        if (p->M_tox == OMIT) p->M_tox = FLOAT(150.0e-10);
        cox = EPSOX / p->M_tox;
 
        if (p->M_nsub == OMIT)
            p->M_nsub = FLOAT(6.0e16);
 
        if (p->BSIM3_NPEAK == OMIT)
            p->BSIM3_NPEAK = FLOAT(1.7e17);
 
        if (p->BSIM_K10 != OMIT || p->BSIM_K20 != OMIT) {
            /* Spice3 has warning messages here.  It also
             * sets the K1 and K2 defaults here.  The p.bendix
             * PSpice structure doesn't allow this (see MOS6). */
        }
        else {
            if (p->BSIM3_GAMMA1 == OMIT)
                p->BSIM3_GAMMA1 = FLOAT(5.753e-12 * sqrt(p->BSIM3_NPEAK) / cox);
            if (p->BSIM3_GAMMA2 == OMIT)
                p->BSIM3_GAMMA2 = FLOAT(5.753e-12 * sqrt(p->M_nsub) / cox);
        }
 
        if (p->BSIM3_BULKMOD == OMIT) {
            if (p->M_type == 1)
                p->BSIM3_BULKMOD = FLOAT(1.0);
            else
                p->BSIM3_BULKMOD = FLOAT(2.0);
        }
 
        if (p->BSIM3_A0 == OMIT) {
            if (p->BSIM3_BULKMOD == 1.0)/* NMOS                               */
                p->BSIM3_A0 = FLOAT(1.0);
            else
                p->BSIM3_A0 = FLOAT(4.4);
        }
 
        if (p->BSIM3_A1 == OMIT) {
            if (p->M_type == -1.0)     /* PMOS                                */
                p->BSIM3_A1 = FLOAT(0.23);
            else
                p->BSIM3_A1 = FLOAT(0.0);
        }
 
        if (p->BSIM3_A2 == OMIT) {
            if (p->M_type == -1.0)     /* PMOS                                */
                p->BSIM3_A2 = FLOAT(0.08);
            else
                p->BSIM3_A2 = FLOAT(1.0);
        }
 
        if (p->BSIM3_LITL == OMIT)
            p->BSIM3_LITL = FLOAT(sqrt(3.0 * p->M_xj * p->M_tox));
        if (p->BSIM3_DSUB == OMIT)
            p->BSIM3_DSUB = p->BSIM3_DROUT;
        if (p->BSIM3_XT == OMIT)
            p->BSIM3_XT = FLOAT(1.55e-7);
        if (p->BSIM3_LDD == OMIT)
            p->BSIM3_LDD = FLOAT(0.0);
        if (p->BSIM3_VOFF == OMIT) p->BSIM3_VOFF = FLOAT(-0.11);
        if (p->BSIM3_VBM == OMIT) p->BSIM3_VBM = FLOAT(-5.0);
 
    }                                  /* level 6                             */
 
    /* default value Processing for BSIM3 MOSFET Model Version 3.0 */
 
    if (p->M_level == LEVEL7) {
 
        p->BSIM3_TNOM = FLOAT(tnom);
 
        if (p->M_tox == OMIT) p->M_tox = FLOAT(150.0e-10);
        cox = EPSOX / p->M_tox;
 
        if (p->BSIM3_A0 == OMIT) p->BSIM3_A0 = FLOAT(1.0);
        if (p->BSIM3_A1 == OMIT) p->BSIM3_A1 = FLOAT(0.0);
        if (p->BSIM3_A2 == OMIT) p->BSIM3_A2 = FLOAT(1.0);
        DLCGiven = YES;
        if (p->BSIM3_DLC == OMIT) {
            p->BSIM3_DLC = p->BSIM3_LINT;
            DLCGiven = NO;
        }
        if (p->BSIM3_DSUB == OMIT) p->BSIM3_DSUB = p->BSIM3_DROUT;
        if (p->BSIM3_DWC == OMIT) p->BSIM3_DWC = p->BSIM3_WINT;
        if (p->BSIM3_GAMMA1 == OMIT) p->BSIM3_GAMMA1 = FLOAT(0.0);
        if (p->BSIM3_GAMMA2 == OMIT) p->BSIM3_GAMMA2 = FLOAT(0.0);
        if (p->BSIM_K10 == OMIT) p->BSIM_K10 = FLOAT(0.0);
        if (p->BSIM_K20 == OMIT) p->BSIM_K20 = FLOAT(0.0);
        if (p->BSIM3lngate > 1.0e23) p->BSIM3lngate *= FLOAT(1.0e-6);
        if (p->BSIM3lnpeak > 1.0e20) p->BSIM3lnpeak *= FLOAT(1.0e-6);
        if (p->BSIM_ugsL > 1.0) p->BSIM_ugsL *= FLOAT(1.0e-4);
        if (p->BSIM3_NPEAK == OMIT) p->BSIM3_NPEAK = FLOAT(1.7e17);
        if (p->BSIM3_NGATE > 1.0e23) p->BSIM3_NGATE *= FLOAT(1.0e-6);
        if (p->BSIM3_NPEAK > 1.0e20) p->BSIM3_NPEAK *= FLOAT(1.0e-6);
        if (p->BSIM3_NOIA == OMIT)
            p->BSIM3_NOIA = FLOAT((p->M_type == 1.0) ? 1.0e20 : 9.9e18);
        if (p->BSIM3_NOIB == OMIT)
            p->BSIM3_NOIB = FLOAT((p->M_type == 1.0) ? 5.0e4 : 2.4e3);
        if (p->BSIM3_NOIC == OMIT)
            p->BSIM3_NOIC = FLOAT((p->M_type == 1.0) ? -1.4e-12 : 1.4e-12);
        if (p->M_User_nsub == OMIT) p->M_nsub = FLOAT(6.0e10);
        if (p->BSIM3pngate > 1.0e23) p->BSIM3pngate *= FLOAT(1.0e-6);
        if (p->BSIM3pnpeak > 1.0e20) p->BSIM3pnpeak *= FLOAT(1.0e-6);
        if (p->BSIM3pu0 > 1.0) p->BSIM3pu0 *= FLOAT(1.0e-4);
        if (p->BSIM3_UC == OMIT)
            p->BSIM3_UC = FLOAT((p->BSIM3_MOBMOD == 3.0) ? -0.0465 : -0.0465e-9);
        if (p->BSIM3_UC1 == OMIT)
            p->BSIM3_UC1 = FLOAT((p->BSIM3_MOBMOD == 3.0) ? -0.056 : -0.056e-9);
        if (p->BSIM3_VBM == OMIT) p->BSIM3_VBM = FLOAT(-5.0);
        if (p->BSIM3_VBX == OMIT) p->BSIM3_VBX = FLOAT(0.0);
        if (p->BSIM3_VOFF == OMIT) p->BSIM3_VOFF = FLOAT(-0.08);
        if (p->BSIM3_VSAT == OMIT) p->BSIM3_VSAT = FLOAT(8.0e4);
        if (p->BSIM3_VTH0 == OMIT) p->BSIM3_VTH0 = FLOAT((p->M_type == 1.0) ? 0.7 : -0.7);
        /* This sets M_vto, which will set the first iteration Vgs.
         * to a reasonable value */
        p->M_vto = p->BSIM3_VTH0;
        if (p->BSIM3wngate > 1.0e23) p->BSIM3wngate *= FLOAT(1.0e-6);
        if (p->BSIM3wnpeak > 1.0e20) p->BSIM3wnpeak *= FLOAT(1.0e-6);
        if (p->BSIM_ugsW > 1.0) p->BSIM_ugsW *= FLOAT(1.0e-4);
        if (p->M_xj == OMIT) p->M_xj = FLOAT(1.5e-7);
        if (p->BSIM3_XT == OMIT) p->BSIM3_XT = FLOAT(1.55e-7);
 
        if (p->BSIM3_CF == OMIT)
            p->BSIM3_CF = FLOAT(4.0 * EPSOX / TWOPI
                * log(1.0 + 0.4e-6 / p->M_tox));
        if (p->M_cgdo == OMIT) {
            if (DLCGiven && (p->BSIM3_DLC > 0.0)) {
                p->M_cgdo = FLOAT(p->BSIM3_DLC * cox - p->BSIM3_CGDL);
                if (p->M_cgdo < 0.0) p->M_cgdo = FLOAT(0.0);
            }
            else
                p->M_cgdo = FLOAT(0.6 * p->M_xj * cox);
        }
        if (p->M_cgso == OMIT) {
            if (DLCGiven && (p->BSIM3_DLC > 0.0)) {
                p->M_cgso = FLOAT(p->BSIM3_DLC * cox - p->BSIM3_CGSL);
                if (p->M_cgso < 0.0) p->M_cgso = FLOAT(0.0);
            }
            else
                p->M_cgso = FLOAT(0.6 * p->M_xj * cox);
        }
 
        if (p->BSIM3_LITL == OMIT)
            p->BSIM3_LITL = FLOAT(sqrt(3.0 * p->M_xj * p->M_tox));
        if (p->BSIM3_LDD == OMIT)
            p->BSIM3_LDD = FLOAT(0.0);
 
    }                                  /* level 7                             */
 
    /* default parameters for higher level mos models */
    do {
 
        if ((p->M_nsub != OMIT))
            xnsub = p->M_nsub * 1.0e6;
 
        if ((p->M_tox == OMIT) && (p->M_level > LEVEL1)
                && (p->M_level != LEVEL6)
                && (p->M_level != LEVEL7))
            p->M_tox = FLOAT(1.0e-7);
 
        if (p->M_tox == OMIT) break;
 
        /* compute kp if not input using mobility 600 cm**2/v*sec */
 
        cox = EPSOX / p->M_tox;
 
        if (p->M_kp == OMIT)
            p->M_kp = FLOAT(p->M_uo * cox * 1.0e-4);
 
        if (p->M_nsub == OMIT) break;
 
        if (xnsub <= NI) {
            SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_010);
            SimError(0, "NSUB < XNI in model %s", p->M_name);
            break;
        }
 
        /* nsub non zero --> process oriented model */
 
        if (p->M_phi == OMIT) {
            double t = 2.0 * vt * log(xnsub / NI);
            /* check for BSIM3 model */
            if (p->M_level != LEVEL6 && p->M_level != LEVEL7)
                p->M_phi = FLOAT(MAX(.1, t));
        }
 
        fermis = p->M_type * 0.5 * p->M_phi;
        wkfng = 3.2;
 
        if (p->M_tpg != FLOAT(0.0)) {  /* polysilicon gate                    */
            fermig = (p->M_type * p->M_tpg) * 0.5 * egfet;
            wkfng = 3.25 + 0.5 * egfet - fermig;
        }
 
        wkfngs = wkfng - (3.25 + 0.5 * egfet + fermis);
        if (p->M_gamma == OMIT && p->M_level != LEVEL6 && p->M_level != LEVEL7)
            p->M_gamma = FLOAT(sqrt((EPSSIL + EPSSIL)
                        * CHARGE * xnsub) / cox);
 
        if (p->M_vto == OMIT) {        /* computed vto                        */
            if (p->M_nss == OMIT) p->M_nss = FLOAT(0.0);
            p->M_vbi = wkfngs - p->M_nss * 1.0e4 * CHARGE / cox;
            p->M_vto = FLOAT(p->M_vbi +
                p->M_type * (p->M_gamma * sqrt(p->M_phi) + p->M_phi));
        }
        else {                         /* measured vto has been input         */
            p->M_vbi = p->M_vto - p->M_type * (p->M_gamma
                    * sqrt(p->M_phi) + p->M_phi);
        }
 
        p->M_xd = sqrt((EPSSIL + EPSSIL) / (CHARGE * xnsub));
 
    }
 
    while (0);
 
    /* special processing for mos3: limit kappa > 0 */
    if (p->M_level == LEVEL3) {
        if (p->M_kappa <= FLOAT(0.0)) p->M_kappa = FLOAT(1.0e-12);
        p->M_lambda = p->M_ucrit = p->M_uexp = p->M_utra = FLOAT(0.0);
    }
 
    SDV(M_vto, 0.0);
    SDV(M_kp, 2.0e-5);
 
    /* limit MOSFET MODELS */
    LOWERLIM(M_af, AF_LIMIT);
    UPPERLIM(M_fc, FC_LIMIT);
 
    if ((p->M_nsub != OMIT) && (p->M_cbs <= FLOAT(0.0))
            && (p->M_cj <= FLOAT(0.0)) && p->M_level != LEVEL7) {
        p->M_cj = FLOAT(sqrt(EPSSIL * CHARGE * p->M_nsub * (1.0e6 / 2.0)
                    / (p->M_pb == FLOAT(0.0) ? 0.8 : p->M_pb)));
    }
    if (p->M_lambda >= FLOAT(0.2)) {
        SENDMESSAGE_HELPID(HELP_SP1_DEMODCHK_011);
        SimError(WARNING_ONLY, "LAMBDA for MOSFET model %s is unusually\n\
           large and might cause nonconvergence\n", p->M_name);
    }
 
    if (p->M_level != LEVEL2)
        p->M_xqc = FLOAT(1.0);
 
    /* process MOSFET MODELS */
    SDV(M_l, DEFL);
    SDV(M_w, DEFW);
    SDV(M_gamma, 0.0);
    /* check for BSIM3 model */
    if (p->M_level != LEVEL6 && p->M_level != LEVEL7) SDV(M_phi, 0.6);
    SDV(M_nsub, 0.0);
    /*  SDV (M_nsub, 0.0); */
    SDV(M_nss, 0.0);
    SDV(M_tox, 0.0);
    SDV(M_pbsw, p->M_pb);
 
    RG(p->M_rd);
    RG(p->M_rs);
    RG(p->M_rg);
    RG(p->M_rb);
    RG(p->M_rsh);
    RG(p->M_rds);
 
    if (p->M_tox != FLOAT(0.))
        cox = EPSOX / p->M_tox;
    p->M_nsub *= FLOAT(1e6);
    p->M_nss *= FLOAT(1e4);
    p->M_nfs *= FLOAT(1e4);
    /* check for BSIM3 model */
    if (p->M_level != LEVEL6 && p->M_level != LEVEL7) p->M_uo *= FLOAT(1e-4);
    if (p->M_level == LEVEL3) {
        p->M_delta *= FLOAT((0.25 * TWOPI * EPSSIL) / cox);
        p->M_eta *= FLOAT(8.15e-22 / cox);
        if (p->M_nsub != FLOAT(0.0))
            p->M_xdsquare = FLOAT((EPSSIL + EPSSIL)
                    / (CHARGE * p->M_nsub));
    }
    else {
        p->M_ucrit *= FLOAT(100.0);
    }
 
    p->M_vinit = FLOAT(-1.0);
    p->M_vbi = p->M_vto -
    (p->M_type * p->M_gamma * sqrt(p->M_phi));
    if (p->M_tox != FLOAT(0.0) && p->M_level != LEVEL3)
        p->M_ucrit *= FLOAT(EPSSIL / cox);
 
    if (p->M_level == LEVEL7) CaptureBinParams(p);
 
#ifdef BSIM3_DEBUG
    ToOutFile("EXIT M_MODCHK\n");
#endif
 
}                                      /* M_ModChk                            */
 
 
/* void Q_ModChk(p) *TITLE*/

/*****************************************************************************
* Purpose
*   Do the processing of ONE Q model
*   This includes setting default values and precomputing some constants
*
* Return Value: NONE
*
* Discussion
*   Derived from Release 4.05 MODCHK.C, where the code
*   was spread out across a number of routines
*
* Author
*   sv - 91/02/05 - created
*   dec - 15 dec 92 - check for VJS, VJC, VJE == 0.0
*   dec - 02 May 95 - vte no longer depends on global vt - computed locally
*****************************************************************************/

void Q_ModChk(
struct Q_ *p)			/* R/W Pointer to model */
{
/* local variables */
  double fc, pb, m, t, vte;

/* code */
	/**** limit BIPOLAR TRANSISTORS ****/

  p -> Q_ptf = p -> Q_User_ptf;
  p -> Q_fc  = p -> Q_User_fc;
  p -> Q_ise = p -> Q_User_ise;
  p -> Q_isc = p -> Q_User_isc;
  p -> Q_iss = p -> Q_User_iss;
  p -> Q_vaf = p -> Q_User_vaf;
  p -> Q_ikf = p -> Q_User_ikf;
  p -> Q_var = p -> Q_User_var;
  p -> Q_ikr = p -> Q_User_ikr;
  p -> Q_re  = p -> Q_User_re;
  p -> Q_rc  = p -> Q_User_rc;
  p -> Q_vtf = p -> Q_User_vtf;
  p -> Q_type = p -> Q_User_type;
  p -> Q_rbm = p -> Q_User_rbm;

  LOWERLIM (Q_af, AF_LIMIT);
  LOWERLIM (Q_eg, EG_LIMIT);
  UPPERLIM (Q_fc, FC_LIMIT);
  UPPERLIM (Q_xcjc, 1.);
  UPPERLIM (Q_xcjc2, 1.);
  if (p -> Q_tf  == FLOAT(0.)) p -> Q_ptf = FLOAT(0.);
  if (p -> Q_rbm == FLOAT(0.)) p -> Q_rbm = p -> Q_rb;
  else if (p -> Q_rbm > p -> Q_rb) {
    p -> Q_rbm = p -> Q_rb;
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_012);
    SimError(WARNING_ONLY,"Minimum base resistance (RBM) is greater than total (RB)\n\
for model %s.  RBM set to RB",p -> Q_name);
    }

  if (p -> Q_ise >= FLOAT(1.)) p -> Q_ise *= p -> Q_is;
  if (p -> Q_isc >= FLOAT(1.)) p -> Q_isc *= p -> Q_is;
  if (p -> Q_iss >= FLOAT(1.)) p -> Q_iss *= p -> Q_is;

  /**** process BIPOLAR MODELS ****/
  if (p -> Q_type < P_TYPE) {
    p -> Q_type = P_TYPE;
    p -> Q_lpnp = YES;
    }
  else
    p -> Q_lpnp = NO;

  RG (p -> Q_vaf);
  RG (p -> Q_ikf);
  RG (p -> Q_var);
  RG (p -> Q_ikr);
  RG (p -> Q_re);
  RG (p -> Q_rc);
  RG2 (p -> Q_vtf, (1./1.44));
  p -> Q_ptf = FLOAT(p -> Q_ptf / RAD * p -> Q_tf);

  pb = p -> Q_vjs;
  if ( pb <= FLOAT(0.0) ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_013);
    SimError(0, "VJS must be greater than zero for model %s", p -> Q_name);
    }
  pb = p -> Q_vje;
  if ( pb <= FLOAT(0.0) ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_014);
    SimError(0, "VJE must be greater than zero for model %s", p -> Q_name);
    }
  m  = p -> Q_mje;
  fc = p -> Q_fc;
  p -> Q_fc *= FLOAT(pb);

  p -> Q_fcpe = pb*fc;
  p -> Q_f1be = pb*( m == 1.? -log(1-fc) : (1 - pow(1-fc,1-m))/(1-m) );
  p -> Q_f2be = pow(1-fc,1+m);
  p -> Q_f3be = 1 - fc*(1+m);

  pb = p -> Q_vjc;
  if ( pb <= FLOAT(0.0) ) {
    SENDMESSAGE_HELPID (HELP_SP1_DEMODCHK_015);
    SimError(0, "VJC must be greater than zero for model %s", p -> Q_name);
    }
  m  = p -> Q_mjc;

  p -> Q_fcpc = pb*fc;
  p -> Q_f1bc = pb*( m == 1.? -log(1-fc) : (1 - pow(1-fc,1-m))/(1-m) );
  p -> Q_f2bc = pow(1-fc,1+m);
  p -> Q_f3bc = 1 - fc*(1+m);

  vte = p -> Q_nf *
    BOLTZ * (ModTempGetTnom_C ((struct Gen_ *)p, TNOM) + CTOK) / CHARGE;
  t = vte * log( vte / (ROOT2 * p -> Q_is) );
  p -> Q_vcrit = t > 0.? t : 0.;
}	/* Q_ModChk */

#define INTERNAL_NODE(var,inode,xnode) \
	(p -> inode) = (var != FLOAT(0.0)) ? IncrementNodeCount() : p -> xnode

/* void x_AddInternalNodes(p) *TITLE*/
 
void m_AddInternalNodes(struct m_ *p)
/*****************************************************************************
* Purpose
*   Add internal nodes for ONE mosfet
*
* Return Value: NONE
*
* Discussion
*   Moved here from MODCHK.C to make it available for Device Equations
*
* Author
*  dec - 04 Oct 95 - created
*****************************************************************************/
{
    struct M_ *P = p->m_model;
 
    if (P->M_level == FLOAT(7.0)) {
        SDV(m_l, 5.0e-6);
        SDV(m_w, 5.0e-6);
        SDV(m_ad, 0.0);
        SDV(m_as, 0.0);
    }
    else {
        SDV(m_l, P->M_l);
        SDV(m_w, P->M_w);
        SDV(m_ad, DEFAD);
        SDV(m_as, DEFAS);
    }
    SDV(m_pd, 0.);
    SDV(m_ps, 0.);
    SDV(m_nrd, 1.);
    SDV(m_nrs, 1.);
    SDV(m_nrg, 0.);
    SDV(m_nrb, 0.);
    SDV(m_m, 1.);
 
    {
        double gdpr, gspr, gbpr, ggpr;
        if ((P->M_rd <= FLOAT(0.0)) &&
                (P->M_rs <= FLOAT(0.0)) &&
                (P->M_rg <= FLOAT(0.0)) &&
                (P->M_rb <= FLOAT(0.0))) {
            gdpr = gspr = gbpr = ggpr = 0.0;
 
            if (p->m_nrd > 0.0) gdpr = P->M_rsh / p->m_nrd;
            if (p->m_nrs > 0.0) gspr = P->M_rsh / p->m_nrs;
            if (p->m_nrg > 0.0) ggpr = P->M_rsh / p->m_nrg;
            if (p->m_nrb > 0.0) gbpr = P->M_rsh / p->m_nrb;
        }
        else {
            gdpr = P->M_rd;
            gspr = P->M_rs;
            ggpr = P->M_rg;
            gbpr = P->M_rb;
        }
 
        p->m_rd = gdpr;
        p->m_rs = gspr;
        p->m_rg = ggpr;
        p->m_rb = gbpr;
 
        INTERNAL_NODE(gdpr, m_d, m_D);
        INTERNAL_NODE(gspr, m_s, m_S);
        INTERNAL_NODE(ggpr, m_g, m_G);
        INTERNAL_NODE(gbpr, m_b, m_B);
 
        // if not NQSMOD, leave m_q alone - else increment internal node count
        double nqsmod = (P->M_level == FLOAT(7.0) ? P->BSIM3_NQSMOD : 0.0);
        INTERNAL_NODE(nqsmod, m_q, m_q);
    }
 
    if (P->M_js == FLOAT(0.) ||
            p->m_ad == 0. ||
            p->m_as == 0.)
        p->m_idsat = p->m_issat = P->M_is;
    else {
        p->m_idsat = P->M_js * p->m_ad + P->M_jssw * p->m_pd;
        p->m_issat = P->M_js * p->m_as + P->M_jssw * p->m_ps;
    }
}
 

void d_AddInternalNodes(struct d_ *p)
/*****************************************************************************
* Purpose
*   Add internal nodes for ONE diode
*
* Return Value: NONE
*
* Discussion
*   Moved here from MODCHK.C to make it available for Device Equations
*
* Author
*  dec - 04 Oct 95 - created
*****************************************************************************/
{
struct D_ *P = p->d_model;
  INTERNAL_NODE(P -> D_rs, d_p, d_P);
}

void q_AddInternalNodes(struct q_ *p)
/*****************************************************************************
* Purpose
*   Add internal nodes for ONE bjt
*
* Return Value: NONE
*
* Discussion
*   Moved here from MODCHK.C to make it available for Device Equations
*
* Author
*  dec - 04 Oct 95 - created
*****************************************************************************/
{
struct Q_ *P=p->q_model;
  INTERNAL_NODE(P -> Q_rc, q_n, q_C);		/* must be ahead of next line */
  INTERNAL_NODE(P -> Q_rco,q_c, q_n);		/* must be after previous line */
  INTERNAL_NODE(P -> Q_rb, q_b, q_B);
  INTERNAL_NODE(P -> Q_re, q_e, q_E);
}

void j_AddInternalNodes(struct j_ *p)
/*****************************************************************************
* Purpose
*   Add internal nodes for ONE jfet
*
* Return Value: NONE
*
* Discussion
*   Moved here from MODCHK.C to make it available for Device Equations
*
* Author
*  dec - 04 Oct 95 - created
*****************************************************************************/
{
struct J_ *P=p->j_model;
  INTERNAL_NODE(P -> J_rd, j_d, j_D);
  INTERNAL_NODE(P -> J_rs, j_s, j_S);
}

void b_AddInternalNodes(struct b_ *p)
/*****************************************************************************
* Purpose
*   Add internal nodes for ONE gasfet
*
* Return Value: NONE
*
* Discussion
*   Moved here from MODCHK.C to make it available for Device Equations
*
* Author
*  dec - 04 Oct 95 - created
*****************************************************************************/
{
  /**** nodes for GaAsFETS ****/
struct B_ *P=p->b_model;
  INTERNAL_NODE(P -> B_rd, b_d, b_D);
  INTERNAL_NODE(P -> B_rg, b_g, b_G);
  INTERNAL_NODE(P -> B_rs, b_s, b_S);
}
