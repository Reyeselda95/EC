# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=DEVEQ - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to DEVEQ - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "DEVEQ - Win32 Release" && "$(CFG)" != "DEVEQ - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "deveq.mak" CFG="DEVEQ - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DEVEQ - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DEVEQ - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "DEVEQ - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "DEVEQ - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\deveq.dll"

CLEAN : 
	-@erase "$(INTDIR)\acbjt.obj"
	-@erase "$(INTDIR)\acdiode.obj"
	-@erase "$(INTDIR)\acgasfet.obj"
	-@erase "$(INTDIR)\acjfet.obj"
	-@erase "$(INTDIR)\acmos.obj"
	-@erase "$(INTDIR)\bjt.obj"
	-@erase "$(INTDIR)\dematloc.obj"
	-@erase "$(INTDIR)\dematptr.obj"
	-@erase "$(INTDIR)\demodchk.obj"
	-@erase "$(INTDIR)\deveqdll.obj"
	-@erase "$(INTDIR)\diode.obj"
	-@erase "$(INTDIR)\gasfet.obj"
	-@erase "$(INTDIR)\jfet.obj"
	-@erase "$(INTDIR)\mos.obj"
	-@erase "$(INTDIR)\mos2.obj"
	-@erase "$(INTDIR)\mos3.obj"
	-@erase "$(INTDIR)\mos4.obj"
	-@erase "$(INTDIR)\mos6.obj"
	-@erase "$(INTDIR)\mos7.obj"
	-@erase "$(INTDIR)\noise.obj"
	-@erase "$(INTDIR)\psmesfet.obj"
	-@erase "$(INTDIR)\tmpupd.obj"
	-@erase "$(OUTDIR)\deveq.dll"
	-@erase "$(OUTDIR)\deveq.exp"
	-@erase "$(OUTDIR)\deveq.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "USE_DLL" /D "IN_DLL" /D i386=1 /D "PSPICE_WINDOWS" /D CTYPE=2048 /YX /c
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "USE_DLL" /D "IN_DLL" /D i386=1 /D "PSPICE_WINDOWS" /D CTYPE=2048\
 /Fp"$(INTDIR)/deveq.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=.\.
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/deveq.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/deveq.pdb" /machine:I386 /out:"$(OUTDIR)/deveq.dll"\
 /implib:"$(OUTDIR)/deveq.lib" 
LINK32_OBJS= \
	"$(INTDIR)\acbjt.obj" \
	"$(INTDIR)\acdiode.obj" \
	"$(INTDIR)\acgasfet.obj" \
	"$(INTDIR)\acjfet.obj" \
	"$(INTDIR)\acmos.obj" \
	"$(INTDIR)\bjt.obj" \
	"$(INTDIR)\dematloc.obj" \
	"$(INTDIR)\dematptr.obj" \
	"$(INTDIR)\demodchk.obj" \
	"$(INTDIR)\deveqdll.obj" \
	"$(INTDIR)\diode.obj" \
	"$(INTDIR)\gasfet.obj" \
	"$(INTDIR)\jfet.obj" \
	"$(INTDIR)\mos.obj" \
	"$(INTDIR)\mos2.obj" \
	"$(INTDIR)\mos3.obj" \
	"$(INTDIR)\mos4.obj" \
	"$(INTDIR)\mos6.obj" \
	"$(INTDIR)\mos7.obj" \
	"$(INTDIR)\noise.obj" \
	"$(INTDIR)\psmesfet.obj" \
	"$(INTDIR)\tmpupd.obj"

"$(OUTDIR)\deveq.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DEVEQ - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\deveq.dll"

CLEAN : 
	-@erase "$(INTDIR)\acbjt.obj"
	-@erase "$(INTDIR)\acdiode.obj"
	-@erase "$(INTDIR)\acgasfet.obj"
	-@erase "$(INTDIR)\acjfet.obj"
	-@erase "$(INTDIR)\acmos.obj"
	-@erase "$(INTDIR)\bjt.obj"
	-@erase "$(INTDIR)\dematloc.obj"
	-@erase "$(INTDIR)\dematptr.obj"
	-@erase "$(INTDIR)\demodchk.obj"
	-@erase "$(INTDIR)\deveqdll.obj"
	-@erase "$(INTDIR)\diode.obj"
	-@erase "$(INTDIR)\gasfet.obj"
	-@erase "$(INTDIR)\jfet.obj"
	-@erase "$(INTDIR)\mos.obj"
	-@erase "$(INTDIR)\mos2.obj"
	-@erase "$(INTDIR)\mos3.obj"
	-@erase "$(INTDIR)\mos4.obj"
	-@erase "$(INTDIR)\mos6.obj"
	-@erase "$(INTDIR)\mos7.obj"
	-@erase "$(INTDIR)\noise.obj"
	-@erase "$(INTDIR)\psmesfet.obj"
	-@erase "$(INTDIR)\tmpupd.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\deveq.dll"
	-@erase "$(OUTDIR)\deveq.exp"
	-@erase "$(OUTDIR)\deveq.ilk"
	-@erase "$(OUTDIR)\deveq.lib"
	-@erase "$(OUTDIR)\deveq.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "USE_DLL" /D "IN_DLL" /D i386=1 /D "PSPICE_WINDOWS" /D CTYPE=2048 /YX /c
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "USE_DLL" /D "IN_DLL" /D i386=1 /D "PSPICE_WINDOWS" /D CTYPE=2048\
 /Fp"$(INTDIR)/deveq.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\.
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/deveq.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/deveq.pdb" /debug /machine:I386 /out:"$(OUTDIR)/deveq.dll"\
 /implib:"$(OUTDIR)/deveq.lib" 
LINK32_OBJS= \
	"$(INTDIR)\acbjt.obj" \
	"$(INTDIR)\acdiode.obj" \
	"$(INTDIR)\acgasfet.obj" \
	"$(INTDIR)\acjfet.obj" \
	"$(INTDIR)\acmos.obj" \
	"$(INTDIR)\bjt.obj" \
	"$(INTDIR)\dematloc.obj" \
	"$(INTDIR)\dematptr.obj" \
	"$(INTDIR)\demodchk.obj" \
	"$(INTDIR)\deveqdll.obj" \
	"$(INTDIR)\diode.obj" \
	"$(INTDIR)\gasfet.obj" \
	"$(INTDIR)\jfet.obj" \
	"$(INTDIR)\mos.obj" \
	"$(INTDIR)\mos2.obj" \
	"$(INTDIR)\mos3.obj" \
	"$(INTDIR)\mos4.obj" \
	"$(INTDIR)\mos6.obj" \
	"$(INTDIR)\mos7.obj" \
	"$(INTDIR)\noise.obj" \
	"$(INTDIR)\psmesfet.obj" \
	"$(INTDIR)\tmpupd.obj"

"$(OUTDIR)\deveq.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "DEVEQ - Win32 Release"
# Name "DEVEQ - Win32 Debug"

!IF  "$(CFG)" == "DEVEQ - Win32 Release"

!ELSEIF  "$(CFG)" == "DEVEQ - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\tmpupd.cpp
DEP_CPP_TMPUP=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\tmpupd.obj" : $(SOURCE) $(DEP_CPP_TMPUP) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\acdiode.cpp
DEP_CPP_ACDIO=\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\acdiode.obj" : $(SOURCE) $(DEP_CPP_ACDIO) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\acgasfet.cpp
DEP_CPP_ACGAS=\
	".\b.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\psmesfet.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\acgasfet.obj" : $(SOURCE) $(DEP_CPP_ACGAS) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\acjfet.cpp
DEP_CPP_ACJFE=\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\acjfet.obj" : $(SOURCE) $(DEP_CPP_ACJFE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\acmos.cpp
DEP_CPP_ACMOS=\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\acmos.obj" : $(SOURCE) $(DEP_CPP_ACMOS) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\bjt.cpp
DEP_CPP_BJT_C=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\bjt.obj" : $(SOURCE) $(DEP_CPP_BJT_C) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\dematloc.cpp
DEP_CPP_DEMAT=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\dematloc.obj" : $(SOURCE) $(DEP_CPP_DEMAT) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\dematptr.cpp
DEP_CPP_DEMATP=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\dematptr.obj" : $(SOURCE) $(DEP_CPP_DEMATP) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\demodchk.cpp
DEP_CPP_DEMOD=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\demodchk.obj" : $(SOURCE) $(DEP_CPP_DEMOD) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\deveqdll.cpp
DEP_CPP_DEVEQ=\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\deveqdll.obj" : $(SOURCE) $(DEP_CPP_DEVEQ) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\diode.cpp
DEP_CPP_DIODE=\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\diode.obj" : $(SOURCE) $(DEP_CPP_DIODE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\gasfet.cpp
DEP_CPP_GASFE=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\psmesfet.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\gasfet.obj" : $(SOURCE) $(DEP_CPP_GASFE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\jfet.cpp
DEP_CPP_JFET_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\errors.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\modtemp.h"\
	".\mserrors.h"\
	".\msgwin.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\symtab.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\jfet.obj" : $(SOURCE) $(DEP_CPP_JFET_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos.cpp
DEP_CPP_MOS_C=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos.obj" : $(SOURCE) $(DEP_CPP_MOS_C) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos2.cpp
DEP_CPP_MOS2_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos2.obj" : $(SOURCE) $(DEP_CPP_MOS2_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos3.cpp
DEP_CPP_MOS3_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos3.obj" : $(SOURCE) $(DEP_CPP_MOS3_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos4.cpp
DEP_CPP_MOS4_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos4.obj" : $(SOURCE) $(DEP_CPP_MOS4_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos6.cpp
DEP_CPP_MOS6_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos6.obj" : $(SOURCE) $(DEP_CPP_MOS6_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\noise.cpp
DEP_CPP_NOISE=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\d.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\j.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\q.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\noise.obj" : $(SOURCE) $(DEP_CPP_NOISE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\acbjt.cpp
DEP_CPP_ACBJT=\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\q.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\acbjt.obj" : $(SOURCE) $(DEP_CPP_ACBJT) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\psmesfet.cpp
DEP_CPP_PSMES=\
	".\b.h"\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\psmesfet.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\psmesfet.obj" : $(SOURCE) $(DEP_CPP_PSMES) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mos7.cpp
DEP_CPP_MOS7_=\
	".\constant.h"\
	".\cpudefs.h"\
	".\demo.h"\
	".\dev.h"\
	".\fmtflt.h"\
	".\m.h"\
	".\modtemp.h"\
	".\mslib.h"\
	".\mslibmin.h"\
	".\options.h"\
	".\tran.h"\
	".\version.h"\
	".\wdefines.h"\
	

"$(INTDIR)\mos7.obj" : $(SOURCE) $(DEP_CPP_MOS7_) "$(INTDIR)"


# End Source File
# End Target
# End Project
################################################################################
