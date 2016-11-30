/* deveqdll.c
 *   $Revision:   1.6  $
 *   $Author:   DEC  $
 *   $Date:   28 Feb 1997 10:53:38  $ */

#include <windows.h>

#define IN_DLL_MAIN

#include "mslib.h"
#include "dev.h"
#include "tran.h"
#include "mserrors.h"
#include "options.h"

static HINSTANCE hMain;
typedef void (*PROCDevEqVersionInfo)(char* userString, char* dllVerNo, 
  char* releaseNo,char* dllDate, char* dllTime);
MAIN_FUNC PROCDevEqVersionInfo fp_DevEqVersionInfo;
#define DEVEQVERSIONINFO(userString,dllVerNo) \
  (*fp_DevEqVersionInfo)(userString, dllVerNo, VERSIONNUM, __DATE__, __TIME__)

void* ReturnProcAddress(HINSTANCE hInst, char* FnName)
/*****************************************************************************
* Purpose
*   Perform a call to GetProcAddress(), and raise a MessageBox if the function
*   can't be located.
*
* Returned value
*   the value returned by GetProcAddress()
*
* Discussion
*   tells the user which PSpice functions, if any, couldn't be found by the
*   Device Equations DLL.
*
* Author
*    DEC - 11 Nov 96 - created
*
*****************************************************************************/
{
    FARPROC FnPtr;
    FnPtr = (FARPROC)GetProcAddress(hInst, FnName);
    if (!FnPtr) {
        MessageBox(NULL,"Function not found",FnName,MB_OK | MB_ICONSTOP);
    }
    return FnPtr;
}

extern "C" int APIENTRY DllMain(HINSTANCE hinstDLL, DWORD dwReason, LPVOID lpReserved)
/*****************************************************************************
* Purpose
*   the main entry point for the Device Equations DLL.
*
* Returned value
*   TRUE if all of the required PSpice functions were found, else FALSE
*
* Discussion
*   uses ReturnProcAddress() to tell the user which PSpice functions, if any,
*   couldn't be found by the Device Equations DLL.
*
* Author
*    DEC - 11 Nov 96 - created
*    DEC - 16 Dec 96 - discarded some unneeded functions
*    DEC - 17 Dec 96 - added DEVEQVERSIONINFO() to return DLL version info
*                      to PSpice
*
*****************************************************************************/
{
  switch (dwReason) {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
      {
      hMain = GetModuleHandle(NULL);

      if (!(*fp_DevEqVersionInfo = (PROCDevEqVersionInfo)ReturnProcAddress(hMain, 
        "DevEqVersionInfo"))) return FALSE;

      // Give Device Equations DLL version info to PSpice
      // First argument is a string identifying the DLL, i.e.,
      //   "(C) Copyright 1997\nMy Corporation\nUnauthorized copying prohibited"
      // Second argument is a string containing a version number for the DLL
      //   (i.e., "7.2"). Replace VERSIONNUM with your own numbering system, if
      //   desired.
      DEVEQVERSIONINFO("",VERSIONNUM);

      // misc math functions
      if (!(Expn = (PROCEXPN)ReturnProcAddress(hMain, "Expn"))) return FALSE;
      if (!(Ln = (PROCEXPN)ReturnProcAddress(hMain, "Ln"))) return FALSE;
      if (!(FETlim = (PROCFETLIM)ReturnProcAddress(hMain, "FETlim"))) return FALSE;
      if (!(qsf = (PROCQSF)ReturnProcAddress(hMain, "qsf"))) return FALSE;

      // misc complex number math
      if (!(cadd = (PROCCMPLEX)ReturnProcAddress(hMain, "cadd"))) return FALSE;
      if (!(cadi = (PROCCMPLEX)ReturnProcAddress(hMain, "cadi"))) return FALSE;
      if (!(csub = (PROCCMPLEX)ReturnProcAddress(hMain, "csub"))) return FALSE;
      if (!(cmul = (PROCCMPLEX)ReturnProcAddress(hMain, "cmul"))) return FALSE;

      // tolerance checking for voltages and currents
      if (!(CurrentTOL = (PROCCURRENTTOL)ReturnProcAddress(hMain, "CurrentTOL"))) return FALSE;
      if (!(VoltageTOL = (PROCVOLTAGETOL)ReturnProcAddress(hMain, "VoltageTOL"))) return FALSE;

      // functions needed by INTEGR8() macro
      if (!(GEq = (PROCGEQ)ReturnProcAddress(hMain, "GEq"))) return FALSE;
      if (!(IEq = (PROCIEQ)ReturnProcAddress(hMain, "IEq"))) return FALSE;
      if (!(DcurDt = (PROCDCURDT)ReturnProcAddress(hMain, "DcurDt"))) return FALSE;

      // various "Get()" functions for simulation parameters
      if (!((*fp_GetNOSOLV) = (PROCGETNOSOLV)ReturnProcAddress(hMain, "GetNOSOLV"))) return FALSE;
      if (!((*fp_GetDEFL) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetDEFL"))) return FALSE;
      if (!((*fp_GetDEFW) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetDEFW"))) return FALSE;
      if (!((*fp_GetDEFAD) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetDEFAD"))) return FALSE;
      if (!((*fp_GetDEFAS) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetDEFAS"))) return FALSE;
      if (!((*fp_GetTNOM) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetTNOM"))) return FALSE;
      if (!((*fp_GetGMIN) = (PROCGETOPTION)ReturnProcAddress(hMain, "GetGMIN"))) return FALSE;
      if (!(GetDELTA = (PROCGETDELTA)ReturnProcAddress(hMain, "GetDELTA"))) return FALSE;
      if (!(GetDELTAOLD = (PROCGETDELTA)ReturnProcAddress(hMain, "GetDELTAOLD"))) return FALSE;

      // "Get()" function to access list of devices present in circuit
      if (!((*fp_GetHeads) = (PROCGetHeads)ReturnProcAddress(hMain, "GetHeads"))) return FALSE;

      // functions needed for reporting warnings and errors
      if (!(SimError = (PROCSIMERROR)ReturnProcAddress(hMain, "SimError"))) return FALSE;
      if (!(SendMessageHelpID = (PROCSENDMESSAGEHELPID)ReturnProcAddress(hMain, "SendMessageHelpID"))) return FALSE;

      // Voltage vector access
      if (!(Voltage = (PROCVOLTAGE)ReturnProcAddress(hMain, "Voltage"))) return FALSE;
      if (!(VoltageI = (PROCVOLTAGE)ReturnProcAddress(hMain, "VoltageI"))) return FALSE;

      // state vector rotation
      if (!(Update_SV = (PROCUPDATE_SV)ReturnProcAddress(hMain, "Update_SV"))) return FALSE;
      if (!(Update_SV0 = (PROCUPDATE_SV)ReturnProcAddress(hMain, "Update_SV0"))) return FALSE;

      // matrix element setup
      if (!(IndxCl = (PROCINDXCL)ReturnProcAddress(hMain, "IndxCl"))) return FALSE;
      if (!(Reserve = (PROCRESERVE)ReturnProcAddress(hMain, "Reserve"))) return FALSE;
      if (!(IncrementNodeCount = (PROCINCREMENTNODECOUNT)ReturnProcAddress(hMain, "IncrementNodeCount"))) return FALSE;

      // misc functions needed for model temperature updating
      if (!(ModTempGetTnom_C = (PROCMODTEMPGETTNOM_C)ReturnProcAddress(hMain, "ModTempGetTnom_C"))) return FALSE;
      if (!(TmpModReport = (PROCTmpModReport)ReturnProcAddress(hMain, "TmpModReport"))) return FALSE;
      if (!(TmpModEndReport = (PROCTmpModEndReport)ReturnProcAddress(hMain, "TmpModEndReport"))) return FALSE;

      break;
      }
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
      break;
    }
    return(TRUE);
}
