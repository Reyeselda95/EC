/* errors.h
 *   $Revision:   1.10  $
 *   $Author:   SV  $
 *   $Date:   01 Jul 1997 14:29:00  $ */
 
/*****************************************************************************
*
* Purpose
*   Header file for PSpice error messages.
*
* Returned value
*
* Discussion
*   Provides the help system topic numbers. Numbers are passed to
*   the Message Viewer.
*
* Author
*    sv  - 29 May 96 - created.
*    dec - 29 May 96 - added HELP_SP_MAIN_006
*    gwb - 15 Aug 96 - additions for new mosfet noise model
*    rbh - 04 Dec 96 - added HELP_SPLIB_SPDIGRD_049
*    sv  - 20 Mar 97 - added error for ideal transmission line having TD <= 0
*    gwb - 13 Jun 97 - added errors for BSIM3 version 3.0 (level=7).
*****************************************************************************/
 
#define	HELP_ID_MISSING	       0
//	Topics which have information in PSpice.Hlp have negative values
//	Those which do not have positive, and are replaced with
//		HELP_ID_MISSING before being passed on to Message Viewer

#define HELP_MSLIB_MATHERR_001 101 /* tmp */
#define HELP_SP_CHINTR_001 -102 /* "Invalid Number" */
#define HELP_SP_CHINTR_002 103 /* "Denormal" */
#define HELP_SP_CHINTR_003 104 /* "Overflow" */
#define HELP_SP_CHINTR_004 105 /* "Underflow" */
#define HELP_SP_CHINTR_005 106 /* "Divide by Zero" */
#define HELP_SP_CHINTR_006 107 /* "Inexact" */
#define HELP_SP_CHINTR_007 108 /* "Unemulated" */
#define HELP_SP_CHINTR_008 109 /* "Negative Sqrt" */
#define HELP_SP_CHINTR_009 110 /* "Stack Overflow" */
#define HELP_SP_CHINTR_010 111 /* "Stack Underflow" */
#define HELP_SP_CHINTR_011 112 /* "Generated" */
#define HELP_SP_CHINTR_012 113 /* "Floating Point Error" */
#define HELP_SP_CHINTR_013 114 /* "Invalid Number in device %s" */
#define HELP_SP_CHINTR_014 115 /* "Denormal in device %s" */
#define HELP_SP_CHINTR_015 116 /* "Overflow in device %s" */
#define HELP_SP_CHINTR_016 117 /* "Underflow in device %s" */
#define HELP_SP_CHINTR_017 118 /* "Divide by Zero in device %s" */
#define HELP_SP_CHINTR_018 119 /* "Inexact in device %s" */
#define HELP_SP_CHINTR_019 120 /* "Unemulated in device %s" */
#define HELP_SP_CHINTR_020 121 /* "Negative Sqrt in device %s" */
#define HELP_SP_CHINTR_021 122 /* "Stack Overflow in device %s" */
#define HELP_SP_CHINTR_022 123 /* "Stack Underflow in device %s" */
#define HELP_SP_CHINTR_023 124 /* "Generated in device %s" */
#define HELP_SP_CHINTR_024 125 /* "Floating Point Error in device %s" */
#define HELP_SP_CIRCUIT1_001 -126 /* "No analog devices -- DC Sweep ignored" */
#define HELP_SP_CIRCUIT1_002 -127 /* "No analog devices -- Small-Signal analysis ignored" */
#define HELP_SP_MAIN_001 128 /* "Invalid command line.  Error(s) in option(s)" */
#define HELP_SP_MAIN_002 129 /* "Not enough memory for initialization" */
#define HELP_SP_MAIN_003 130 /* "PSpice ID# %ld does not include the %s option." */
#define HELP_SP_MAIN_004 131 /* "Please contact MicroSim Corporation for ordering information." */
#define HELP_SP_MAIN_005 132 /* errmsg */
#define HELP_SP_MAIN_006 10132 /* "Lost network license or couldn't find network" */
#define HELP_SP_MISCROOT_001 133 /* tmp1 */
#define HELP_SP_MODTEMP_001 -134 /* "Missing value" */
#define HELP_SP_MODTEMP_002 -135 /* "Missing or Invalid Expression" */
#define HELP_SP_MODTEMP_003 136 /* tmp */
#define HELP_SP_MODTEMP_004 137 /* tmp */
#define HELP_SP_MODTEMP_005 138 /* tmp */
#define HELP_SP_MODTEMP_006 139 /* tmp */
#define HELP_SP_MODTEMP_007 140 /* tmp */
#define HELP_SP_MODTEMP_008 141 /* tmp */
#define HELP_SP_MODTEMP_009 142 /* tmp */
#define HELP_SP_RUNPROBE_001 143 /* ReopenErr */
#define HELP_SP_TMPUPD_001 144 /* "Device %s has negative CGS\n" */
#define HELP_SP_TMPUPD_002 145 /* "Device %s has negative CGD\n" */
#define HELP_SP_TMPUPD_003 146 /* "Device %s has negative VJ\n" */
#define HELP_SP_TMPUPD_004 147 /* "Device %s has negative CJO\n" */
#define HELP_SP_TMPUPD_005 148 /* "Device %s has negative PB\n" */
#define HELP_SP_TMPUPD_006 HELP_SP_TMPUPD_001 /* "Device %s has negative CGS\n" */
#define HELP_SP_TMPUPD_007 HELP_SP_TMPUPD_002 /* "Device %s has negative CGD\n" */
#define HELP_SP_TMPUPD_008 151 /* "Device %s has negative PHI\n" */
#define HELP_SP_TMPUPD_009 HELP_SP_TMPUPD_005 /* "Device %s has negative PB\n" */
#define HELP_SP_TMPUPD_010 153 /* "Device %s has negative VJE\n" */
#define HELP_SP_TMPUPD_011 154 /* "Device %s has negative CJE\n" */
#define HELP_SP_TMPUPD_012 155 /* "Device %s has negative VJC\n" */
#define HELP_SP_TMPUPD_013 156 /* "Device %s has negative CJC\n" */
#define HELP_SP_TMPUPD_014 157 /* "Device %s has negative VJS\n" */
#define HELP_SP_TMPUPD_015 158 /* "Device %s has negative CJS\n" */
#define HELP_SP_TMPUPD_016 159 /* zero_val_msg */
#define HELP_SP_TMPUPD_017 160 /* zero_val_msg */
#define HELP_SP1_ALIAS_001 161 /* "Missing .ENDALIASES in .ALIASES" */
#define HELP_SP1_ALIAS_002 162 /* ErrorMessage1 */
#define HELP_SP1_ALIAS_003 -163 /* ".PROBE and .ALIAS must agree on /CSDF" */
#define HELP_SP1_ALIAS_004 164 /* ErrorMessage1 */
#define HELP_SP1_ALIAS_005 -165 /* "invalid device type" */
#define HELP_SP1_ALIAS_006 166 /* "Missing device alias" */
#define HELP_SP1_ALIAS_007 167 /* "Missing node name in alias" */
#define HELP_SP1_ALIAS_008 -168 /* "Maximum number of alias nodes exceeded" */
#define HELP_SP1_BIAS_001 169 /* "The BASIC Package does not support .LOADBIAS" */
#define HELP_SP1_BIAS_002 170 /* ErrorMessage1 */
#define HELP_SP1_BIAS_003 171 /* ErrorMessage1 */
#define HELP_SP1_CRTIDX_001 -172 /* "Unable to open index file %s" */
#define HELP_SP1_CRTIDX_002 173 /* IndexSeekError */
#define HELP_SP1_CRTIDX_003 174 /* IndexWriteError */
#define HELP_SP1_CRTIDX_004 175 /* IndexWriteError */
#define HELP_SP1_CRTIDX_005 -176 /* "Model type unknown" */
#define HELP_SP1_CRTIDX_006 -177 /* "Duplicate library entry for %s, (type %s)" */
#define HELP_SP1_CRTIDX_007 178 /* IndexIOWriteError */
#define HELP_SP1_CRTIDX_008 179 /* IndexIOWriteError */
#define HELP_SP1_CRTIDX_009 180 /* IndexIOWriteError */
#define HELP_SP1_CRTIDX_010 181 /* IndexSeekError */
#define HELP_SP1_CRTIDX_011 182 /* IndexWriteError */
#define HELP_SP1_CRTIDX_012 183 /* IndexCreationError */
#define HELP_SP1_CRTIDX_013 184 /* IndexCreationError */
#define HELP_SP1_CRTIDX_014 185 /* IndexCreationError */
#define HELP_SP1_CRTIDX_015 186 /* IndexCreationError */
#define HELP_SP1_CRTIDX_016 187 /* IndexCreationError */
#define HELP_SP1_CRTIDX_017 188 /* IndexCreationError */
#define HELP_SP1_CRTIDX_018 189 /* IndexCreationError */
#define HELP_SP1_CRTIDX_019 190 /* "Write index bin error: bin %d" */
#define HELP_SP1_CRTIDX_020 191 /* "Unable to create library index file.  Possibly out of disk space" */
#define HELP_SP1_CRTIDX_021 192 /* "Unable to get file modification date for %s" */
#define HELP_SP1_DEMODCHK_001 193 /* "VBI for GaAsFET model %s\n\n" */
#define HELP_SP1_DEMODCHK_002 194 /* "Invalid Model Level for GaAsFET model %s" */
#define HELP_SP1_DEMODCHK_003 195 /* "VJ must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_004 196 /* "PB must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_005 HELP_SP1_DEMODCHK_004 /* "PB must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_006 198 /* "Invalid model Level for Mosfet %s" */
#define HELP_SP1_DEMODCHK_007 199 /* "PSCBE2 cannot be 0.0 for MOS Level 6\n" */
#define HELP_SP1_DEMODCHK_008 200 /* "TOX cannot be 0.0 for MOS Level 6\n" */
#define HELP_SP1_DEMODCHK_009 201 /* "LITL cannot be 0.0 for MOS Level 6\n" */
#define HELP_SP1_DEMODCHK_010 202 /* "NSUB < XNI in model %s" */
#define HELP_SP1_DEMODCHK_011 203 /* "LAMBDA for MOSFET model %s is unusually\n\n" */
#define HELP_SP1_DEMODCHK_012 204 /* "Minimum base resistance (RBM) is greater than total (RB)\n\n" */
#define HELP_SP1_DEMODCHK_013 205 /* "VJS must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_014 206 /* "VJE must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_015 207 /* "VJC must be greater than zero for model %s" */
#define HELP_SP1_DEMODCHK_016 2071 /* "NLEV must be between 0 and 3 for model %s" */
#define HELP_SP1_DEMODCHK_017 2072 /* "Mosfet %s, model %s: Effective channel length <= 0" */
#define HELP_SP1_DEMODCHK_018 2073 /* "Mosfet %s, model %s: Effective channel width <= 0" */
#define HELP_SP1_DEMODCHK_019 2074 /* "Mosfet %s, model %s: Effective channel length for C-V <= 0" */
#define HELP_SP1_DEMODCHK_020 2075 /* "Mosfet %s, model %s: Effective channel width for C-V <= 0" */
#define HELP_SP1_DEMODCHK_021 2076 /* "k1 should be specified with k2" */
#define HELP_SP1_DEMODCHK_022 2077 /* "k2 should be specified with k1" */
#define HELP_SP1_DEMODCHK_023 2078 /* "nsub is ignored because k1 or k2 is given" */
#define HELP_SP1_DEMODCHK_024 2079 /* "xt is ignored because k1 or k2 is given" */
#define HELP_SP1_DEMODCHK_025 2080 /* "vbx is ignored because k1 or k2 is given" */
#define HELP_SP1_DEMODCHK_026 2081 /* "vbm is ignored because k1 or k2 is given" */
#define HELP_SP1_DEMODCHK_027 2082 /* "gamma1 is ignored because k1 or k2 is given" */
#define HELP_SP1_DEMODCHK_028 2083 /* "gamma2 is ignored because k1 or k2 is given" */
#define HELP_SP1_DIGCHK_001 208 /* "Device %s uses the UIO type model %s as a timing model" */
#define HELP_SP1_DIGCHK_002 209 /* "Digchk: Unable to find associate" */
#define HELP_SP1_DIGCHK_003 210 /* "Device %s must have a model of type %s\n" */
#define HELP_SP1_DIGCHK_004 211 /* "Device %s uses timing model %s as an IO model" */
#define HELP_SP1_DIGCHK_005 212 /* "Model %s parameter %s value %s is too large.\n         It must be less than %s digital cycles." */
#define HELP_SP1_DIGCHK_006 213 /* "Model %s parameter %s value %s must be at least 0.0.\n           Changing value to 0.0." */
#define HELP_SP1_DIGCHK_007 214 /* "Model %s parameter %s value %s must be greater than\n" */
#define HELP_SP1_DIGCHK_008 215 /* "GetParamName: Unable to get parameter name for %s" */
#define HELP_SP1_DIGCHK_009 216 /* "Digital node %s may not be connected to an analog device" */
#define HELP_SP1_DIGCHK_010 HELP_SP1_DIGCHK_009 /* "Digital node %s may not be connected to an analog device" */
#define HELP_SP1_DIGCHK_011 218 /* "No power supplies specified in IO models" */
#define HELP_SP1_DIGCHK_012 219 /* "Analog node (%s) not allowed on digital pin of O device (%s)" */
#define HELP_SP1_DIGCHK_013 220 /* "Analog node (%s) not allowed on digital pin of N device (%s)" */
#define HELP_SP1_DIGCHK_014 221 /* "Transfer gate %s must be converted to analog but is connected to\n\t\tspecial digital node %s" */
#define HELP_SP1_DIGCHK_015 222 /* "Dev idx for %s (%d) does not match dev idx on %s (%d)" */
#define HELP_SP1_DIGCHK_016 223 /* "Enable node on %s (%s) does not correspond to given (%s)" */
#define HELP_SP1_DIGCHK_017 224 /* "Unable to find enable pin for %s" */
#define HELP_SP1_DIGCHK_018 225 /* "Unable to find pin for %s" */
#define HELP_SP1_DIGDISP_001 226 /* "Net %s unexpectedly not found in device %s" */
#define HELP_SP1_DIGDISP_002 227 /* "Unknown primtive type %d device %s" */
#define HELP_SP1_DIOCHK_001 228 /* lt_zero_msg */
#define HELP_SP1_DIOCHK_002 229 /* gt_rmax_msg */
#define HELP_SP1_DIOCHK_003 230 /* "S%dTSW less than or equal to zero for model %s" */
#define HELP_SP1_DIOCHK_004 231 /* "Less than two states defined for DINPUT model %s" */
#define HELP_SP1_DIOCHK_005 232 /* InputFileMessage */
#define HELP_SP1_DIOCHK_006 233 /* InputFileMessage */
#define HELP_SP1_DIOCHK_007 234 /* "Unable to create mailbox to communicate with digital simulator" */
#define HELP_SP1_DIOCHK_008 235 /* "Unable to open %s for DINPUT model %s" */
#define HELP_SP1_DIOCHK_009 HELP_SP1_DIOCHK_007 /* "Unable to create mailbox to communicate with digital simulator" */
#define HELP_SP1_DIOCHK_010 237 /* "Unable to open mailbox %s for DINPUT model %s" */
#define HELP_SP1_DIOCHK_011 238 /* "Format is not between %d and %d for DINPUT model %s" */
#define HELP_SP1_DIOCHK_012 239 /* "No digital net specified for %s, but model %s is a DSO_DtoA model" */
#define HELP_SP1_DIOCHK_013 240 /* "Digital net specified for %s, but model %s is not a DSO_DtoA model" */
#define HELP_SP1_DIOCHK_014 241 /* "TIMESCALE less than 1 for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_015 242 /* err_msg */
#define HELP_SP1_DIOCHK_016 243 /* "No states defined for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_017 244 /* OutputFileMessage */
#define HELP_SP1_DIOCHK_018 245 /* OutputFileMessage */
#define HELP_SP1_DIOCHK_019 246 /* OutputFileMessage */
#define HELP_SP1_DIOCHK_020 HELP_SP1_DIOCHK_009 /* "Unable to create mailbox to communicate with digital simulator" */
#define HELP_SP1_DIOCHK_021 248 /* "Unable to open mailbox %s for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_022 249 /* "Unable to open file %s for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_023 250 /* "TIMESTEP less than or equal to zero for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_024 251 /* "Format is not between %d and %d for DOUTPUT model %s" */
#define HELP_SP1_DIOCHK_025 252 /* "No digital net specified for %s, but model %s is a DSO_AtoD model" */
#define HELP_SP1_DIOCHK_026 253 /* "Digital net specified for %s, but model %s is not a DSO_AtoD model" */
#define HELP_SP1_DIOCHK_027 254 /* "End of file reading DINPUT signal name data from file %s" */
#define HELP_SP1_DIOCHK_028 255 /* io_err */
#define HELP_SP1_DISPLAY_001 256 /* "NetList.  genp = NULL" */
#define HELP_SP1_DISPLAY_002 -257 /* "Out of Memory" */
#define HELP_SP1_DOTCARD_001 -258 /* "Unrecognizable command" */
#define HELP_SP1_DOTCARD_002 259 /* "Not unique" */
#define HELP_SP1_DOTCARD_003 260 /* "Command ignored" */
#define HELP_SP1_DOTCARD_004 HELP_SP1_DOTCARD_003 /* "Command ignored" */
#define HELP_SP1_DOTCARD_005 262 /* "Invalid outside of .ALIASES" */
#define HELP_SP1_DOTCARD_006 -263 /* "Invalid outside of .SUBCKT" */
#define HELP_SP1_DOTCARD_007 264 /* "Nesting level exceeded" */
#define HELP_SP1_FILESTIM_001 -265 /* "Unable to open stimulus file \"%s\".\n" */
#define HELP_SP1_FILESTIM_002 266 /* "stimulus file \"%s\", line %d:\n%s\n" */
#define HELP_SP1_FILESTIM_003 267 /* "stimulus file \"%s\", line %ld:\n%s\n" */
#define HELP_SP1_FILESTIM_004 268 /* "Too many signals in stimulus file \"%s\".  Maximum is %d.\n" */
#define HELP_SP1_FILESTIM_005 269 /* "stimulus file \"%s\", line %d: expecting %d more nodes.\n" */
#define HELP_SP1_FILESTIM_006 270 /* "Unable to find col/bit position of signal %s.\n" */
#define HELP_SP1_FILESTIM_007 271 /* "Unable to find signal %s in stimulus file \"%s\".\n" */
#define HELP_SP1_FIXDEV_001 272 /* FixUpUndefined */
#define HELP_SP1_FIXDEV_002 273 /* FixUpIntError */
#define HELP_SP1_FIXDEV_003 274 /* FixUpUndefined */
#define HELP_SP1_FIXDEV_004 275 /* FixUpIntError */
#define HELP_SP1_FIXDEV_005 276 /* "Voltage source %s which controls switch %s is undefined" */
#define HELP_SP1_FIXDEV_006 277 /* FixUpIntError */
#define HELP_SP1_FIXDEV_007 278 /* FixUpUndefined */
#define HELP_SP1_FIXDEV_008 279 /* FixUpUndefined */
#define	HELP_SP1_FIXDEV_009 10279
#define HELP_SP1_FIXMOD_001 -280 /* "Model references form circular list. For example:" */
#define HELP_SP1_IMPULSE_001 281 /* msgbuf */
#define HELP_SP1_IMPULSE_002 282 /* msgbuf */
#define HELP_SP1_IMPULSE_003 283 /* msgbuf */
#define HELP_SP1_IMPULSE_004 -284 /* "Unable to open probe file %s" */
#define HELP_SP1_IMPULSE_005 285 /* msgbuf */
#define HELP_SP1_IMPULSE_006 286 /* msgbuf */
#define HELP_SP1_IMPULSE_007 287 /* "Not enough memory for impulse response. Try increasing RELTOL." */
#define HELP_SP1_LIB_001 -288 /* "Unable to make index for library file %s" */
#define HELP_SP1_LIB_002 -289 /* "Model %s, referenced by model %s, is undefined" */
#define HELP_SP1_LIB_003 -290 /* "Model %s used by %s is undefined" */
#define HELP_SP1_LIB_004 -291 /* "Subcircuit %s used by %s is undefined" */
#define HELP_SP1_LIB_005 -292 /* "Unable to open library %s" */
#define HELP_SP1_LIB_006 -293 /* "Making new index file (%s) for library file %s" */
#define HELP_SP1_LIB_007 294 /* "Unable to read library file %s" */
#define HELP_SP1_LIB_008 -295 /* "Missing Model name in library" */
#define HELP_SP1_LIB_009 -296 /* "Missing Model type in library" */
#define HELP_SP1_LIB_010 HELP_SP1_LIB_008 /* "Missing Model name in library" */
#define HELP_SP1_LIB_011 HELP_SP1_LIB_009 /* "Missing Model type in library" */
#define HELP_SP1_LIB_012 -299 /* "Missing Param name in library" */
#define HELP_SP1_LIB_013 300 /* "Illegal self-reference of library file %s" */
#define HELP_SP1_LIB_014 -301 /* "Missing Subcircuit name" */
#define HELP_SP1_LIB_015 -302 /* "EOF in subcircuit" */
#define HELP_SP1_LIB_016 303 /* "Can't find library" */
#define HELP_SP1_LIBIDX_001 304 /* "Library hash is %d bytes, and should be 512" */
#define HELP_SP1_LIBIDX_002 305 /* "Unable to find index file (%s) for library file %s" */
#define HELP_SP1_LIBIDX_003 306 /* "Unable to read library index file %s" */
#define HELP_SP1_LIBIDX_004 -307 /* "Library index file %s does not have the correct format" */
#define HELP_SP1_LIBIDX_005 308 /* "Index file %s seek error" */
#define HELP_SP1_LIBIDX_006 309 /* "Library index file %s read error" */
#define HELP_SP1_LIBIDX_007 HELP_SP1_LIBIDX_005 /* "Index file %s seek error" */
#define HELP_SP1_LIBIDX_008 HELP_SP1_LIBIDX_006 /* "Library index file %s read error" */
#define HELP_SP1_LIBIDX_009 HELP_SP1_LIBIDX_007 /* "Index file %s seek error" */
#define HELP_SP1_LIBIDX_010 313 /* "Two library files (%s and %s)\n\n" */
#define HELP_SP1_LIBIDX_011 314 /* "File %s is an index for %s, not for %s.\n\n" */
#define HELP_SP1_LIBIDX_012 HELP_SP1_LIBIDX_009 /* "Index file %s seek error" */
#define HELP_SP1_LIBIDX_013 -316 /* "Unable to find library file %s" */
#define HELP_SP1_LIBIDX_014 HELP_SP1_CRTIDX_021 /* "Unable to get file modification date for %s" */
#define HELP_SP1_LIBIDX_015 -318 /* "Library file %s has changed since index file %s was created." */
#define HELP_SP1_LIBIDX_016 -319 /* "The timestamp changed from %s to %s." */
#define HELP_SP1_LIBIDX_017 320 /* "Index search error" */
#define HELP_SP1_LIBIDX_018 321 /* "Index error" */
#define HELP_SP1_LIBIDX_019 322 /* "Index file write error" */
#define HELP_SP1_LIBIDX_020 323 /* "Index file seek error" */
#define HELP_SP1_LIBIDX_021 324 /* "Index file read error" */
#define HELP_SP1_LIBIDX_022 HELP_SP1_LIBIDX_019 /* "Index file write error" */
#define HELP_SP1_LIBIDX_023 326 /* "Index Search error" */
#define HELP_SP1_LIBIDX_024 HELP_SP1_LIBIDX_018 /* "Index error" */
#define HELP_SP1_MC_001 328 /* DiskFull */
#define HELP_SP1_MODCHK_001 329 /* "Invalid model Level for CORE %s" */
#define HELP_SP1_MODCHK_002 -330 /* "|VON - VOFF| too small for VSWITCH model %s" */
#define HELP_SP1_MODCHK_003 -331 /* "RON or ROFF less than or equal to zero for VSWITCH model %s" */
#define HELP_SP1_MODCHK_004 -332 /* "RON or ROFF greater than 1/GMIN for VSWITCH model %s" */
#define HELP_SP1_MODCHK_005 -333 /* "RON = ROFF for VSWITCH model %s" */
#define HELP_SP1_MODCHK_006 334 /* "Incomplete Tline model parameters for %s" */
#define HELP_SP1_MODCHK_007 335 /* "Conflicting Tline model parameters for %s" */
#define HELP_SP1_MODCHK_008 -336 /* "|ION - IOFF| too small for ISWITCH model %s" */
#define HELP_SP1_MODCHK_009 -337 /* "RON or ROFF less than or equal to zero for ISWITCH model %s" */
#define HELP_SP1_MODCHK_010 -338 /* "RON or ROFF greater than 1/GMIN for ISWITCH model %s" */
#define HELP_SP1_MODCHK_011 -339 /* "RON = ROFF for ISWITCH model %s" */
#define HELP_SP1_PRBIO_001 340 /* "StrSelected: invalid devtype '%c' (HEX %02x)" */
#define HELP_SP1_PRBIO_002 341 /* "Writing digital probe header" */
#define HELP_SP1_PRBIOCUR_001 342 /* "IControl: invalid devtype '%c' (HEX %02x)\n" */
#define HELP_SP1_PRBIOCUR_002 343 /* "I2Term: invalid devtype '%c' (HEX %02x)\n" */
#define HELP_SP1_PRBIOCUR_003 344 /* "ISemi: invalid devtype '%c' (HEX %02x)\n" */
#define HELP_SP1_PRBIOWRT_001 345 /* DiskFull */
#define HELP_SP1_PRBIOWRT_002 346 /* "PrbioWrt '%c' undefined" */
#define HELP_SP1_PRBIOWRT_003 347 /* SaveErr */
#define HELP_SP1_PRBIOWRT_004 348 /* SaveErr */
#define HELP_SP1_PRBIOWRT_005 349 /* SaveErr */
#define HELP_SP1_PSMSG_001 350 /* "Unknown MessageItem type, %d.\n" */
#define HELP_SP1_PSMSG_002 351 /* "Probe Write - Cannot start Message\n" */
#define HELP_SP1_PSMSG_003 352 /* "Probe Write - Cannot close Message\n" */
#define HELP_SP1_PSMSG_004 353 /* "Probe Write - Cannot Write Message\n" */
#define HELP_SP1_PSMSG_005 354 /* "Post_Message-NULL Message Buffer ID=%d\n" */
#define HELP_SP1_READIN_001 -355 /* "Unable to open file" */
#define HELP_SP1_READIN_002 356 /* "Digital simulator not present" */
#define HELP_SP1_READIN_003 357 /* "Analog simulator not present" */
#define HELP_SP1_READIN_004 358 /* "Invalid device" */
#define HELP_SP1_STIMULUS_001 359 /* "The BASIC Package does not support .STIMULUS" */
#define HELP_SP1_STIMULUS_002 360 /* "Missing stimulus name" */
#define HELP_SP1_STIMULUS_003 361 /* "Missing stimulus type" */
#define HELP_SP1_STIMULUS_004 362 /* errormsg */
#define HELP_SP1_STIMULUS_005 363 /* "incomplete statement" */
#define HELP_SP1_STIMULUS_006 364 /* "The BASIC Package does not support .STIMLIB" */
#define HELP_SP1_STIMULUS_007 365 /* "Missing stimulus library name" */
#define HELP_SP1_STIMULUS_008 366 /* "Unable to open file." */
#define HELP_SP1_STIMULUS_009 367 /* "DeleteStimBlk failed" */
#define HELP_SP1_SUBXCUT_001 368 /* "No match for %c in state %d" */
#define HELP_SP1_SUBXCUT_002 369 /* "Bad expression" */
#define HELP_SP1_SUBXCUT_003 370 /* "Missing name" */
#define HELP_SP1_SUBXCUT_004 371 /* NotAllowedError */
#define HELP_SP1_SUBXCUT_005 372 /* "Invalid node number in .SUBCKT statement" */
#define HELP_SP1_SUBXCUT_006 373 /* "Missing value for optional node" */
#define HELP_SP1_SUBXCUT_007 374 /* "Invalid parameter name" */
#define HELP_SP1_SUBXCUT_008 375 /* "Builtin name conflict" */
#define HELP_SP1_SUBXCUT_009 376 /* <Missing> MissingError1 */
#define HELP_SP1_SUBXCUT_010 -377 /* "Missing .ENDS in .SUBCKT" */
#define HELP_SP1_SUBXCUT_011 378 /* TooManyError */
#define HELP_SP1_SUBXCUT_012 -379 /* "Name on .ENDS does not match .SUBCKT" */
#define HELP_SP1_SUBXCUT_013 380 /* "Command invalid in subcircuit" */
#define HELP_SP1_SUBXCUT_014 -381 /* "Invalid device in subcircuit" */
#define HELP_SP1_SUBXCUT_015 382 /* "Missing node" */
#define HELP_SP1_SUBXCUT_016 383 /* <Missing> MissingError1 */
#define HELP_SP1_SUBXCUT_017 384 /* InvalidDimension */
#define HELP_SP1_SUBXCUT_018 385 /* InvalidDimension */
#define HELP_SP1_SUBXCUT_019 -386 /* "Missing model" */
#define HELP_SP1_SUBXCUT_020 387 /* "Missing digital node" */
#define HELP_SP1_SUBXCUT_021 388 /* NotAllowedError */
#define HELP_SP1_SUBXCUT_022 389 /* "Missing subcircuit name" */
#define HELP_SP1_SUBXCUT_023 390 /* "Subcircuit name identical with node name" */
#define HELP_SP1_SUBXCUT_024 391 /* <Missing> MissingError2 */
#define HELP_SP1_SUBXCUT_025 392 /* TooManyError */
#define HELP_SP1_SUBXCUT_026 -393 /* "Subcircuit %s is undefined" */
#define HELP_SP1_SUBXCUT_027 -394 /* "Incorrect number of interface nodes for %s" */
#define HELP_SP1_SUBXCUT_028 395 /* "bad name: %s\n" */
#define HELP_SP1_SUBXCUT_029 HELP_SP1_SUBXCUT_028 /* "bad name: %s\n" */
#define HELP_SP1_SUBXCUT_030 HELP_SP1_SUBXCUT_029 /* "bad name: %s\n" */
#define HELP_SP1_SUBXCUT_031 -398 /* "<%s> not a subcircuit param" */
#define HELP_SP1_SUBXCUT_032 399 /* "Multiple use of <%s>" */
#define HELP_SP1_SUBXCUT_033 400 /* "%s is %s type in .SUBCKT, but %s type in %s" */
#define HELP_SP1_TCOUPLE_001 401 /* "Can't decouple transmission lines" */
#define HELP_SP1_TCOUPLE_002 402 /* "Internal error: Incompatible matrix multiply" */
#define HELP_SP1_TCOUPLE_003 403 /* "Singular decoupling matrix" */
#define HELP_SP1_TCOUPLE_004 404 /* "Vector allocation failure" */
#define HELP_SP1_TCOUPLE_005 HELP_SP1_TCOUPLE_004 /* "Vector allocation failure" */
#define HELP_SP1_TCOUPLE_006 406 /* "Matrix allocation failure" */
#define HELP_SP1_TCOUPLE_007 407 /* "Matrix row allocation failure" */
#define HELP_SP1_TCOUPLE_008 408 /* "Trying to free null vector" */
#define HELP_SP1_TCOUPLE_009 HELP_SP1_TCOUPLE_008 /* "Trying to free null vector" */
#define HELP_SP1_TCOUPLE_010 410 /* "Trying to free null matrix" */
#define HELP_SP1_TCOUPLE_011 HELP_SP1_TCOUPLE_001 /* "Can't decouple transmission lines" */
#define HELP_SP1_TCOUPLE_012 HELP_SP1_TCOUPLE_011 /* "Can't decouple transmission lines" */
#define HELP_SP1_TCOUPLE_013 413 /* "Coupled group containing %s has more than %d lines" */
#define HELP_SP1_TCOUPLE_014 414 /* "Must use RLGC parameters for coupling %s" */
#define HELP_SP1_TCOUPLE_015 415 /* "Length of %s must equal length of %s for coupling" */
#define HELP_SP1_TCOUPLE_016 416 /* "Can't decouple L for group containing %s" */
#define HELP_SP1_TCOUPLE_017 417 /* "Decoupling %s results in negative inductance" */
#define HELP_SP1_TCOUPLE_018 418 /* "Can't decouple C for group containing %s" */
#define HELP_SP1_TCOUPLE_019 419 /* "Decoupling %s results in negative capacitance" */
#define HELP_SP1_TOPO_001 420 /* "Node %s is undefined" */
#define HELP_SP1_TOPO_002 -421 /* "Less than 2 connections at node %s" */
#define HELP_SP1_TOPO_003 -422 /* "Node %s is floating" */
#define HELP_SP1_TOPO_004 423 /* "Dev=%s, n=%d node#=%d\n" */
#define HELP_SP1_TOPO_005 -424 /* "Voltage source and/or inductor loop involving %s\nYou may break the loop by adding a series resistance" */
#define HELP_SP1_VECTOR_001 -425 /* "Missing number of nodes" */
#define HELP_SP1_VECTOR_002 426 /* "Invalid number of nodes, expecting 1-255" */
#define HELP_SP1_VECTOR_003 427 /* "Missing node name" */
#define HELP_SP1_VECTOR_004 428 /* "Missing filename" */
#define HELP_SP1_VECTOR_005 429 /* "Missing column number" */
#define HELP_SP1_VECTOR_006 430 /* "Invalid column number, expecting 1-255" */
#define HELP_SP1_VECTOR_007 HELP_SP_MODTEMP_001 /* "Missing value" */
#define HELP_SP1_VECTOR_008 -432 /* "invalid radix, expecting BIN (1), OCT (3), or HEX (4)" */
#define HELP_SP1_VECTOR_009 433 /* "Missing bit number" */
#define HELP_SP1_VECTOR_010 434 /* "Invalid bit index, expecting 1-4" */
#define HELP_SP1_VECTOR_011 -435 /* "Unrecognized parameter" */
#define HELP_SP1_VECTOR_012 436 /* msg */
#define HELP_SP1_VECTOR_013 437 /* msg */
#define HELP_SP1_VECTOR_014 438 /* "Unable to open vector file %s" */
#define HELP_SP1_VECTOR_015 439 /* "Out of memory for vector file" */
#define HELP_SP1_XDIGREAD_001 -440 /* " Digital Simulator Option not present" */
#define HELP_SP1_XDIGREAD_002 HELP_SP1_XDIGREAD_001 /* " Digital Simulator Option not present" */
#define HELP_SP1_XDIGREAD_003 HELP_SP1_XDIGREAD_002 /* " Digital Simulator Option not present" */
#define HELP_SP1_XDIGREAD_004 HELP_SP1_XDIGREAD_003 /* " Digital Simulator Option not present" */
#define HELP_SP1_FIXDOT_001 444 /* ".%s of TEMP or MODEL PARAMETER cannot be done if .MC or .WCASE specified" */
#define HELP_SP1_FIXDOT_002 445 /* FixUpUndefined */
#define HELP_SP1_FIXDOT_003 446 /* FixUpIntError */
#define HELP_SP1_FIXDOT_004 -447 /* "Tolerances on model %s ignored due to .%s" */
#define HELP_SP1_FIXDOT_005 448 /* FixUpUndefined */
#define HELP_SP1_FIXDOT_006 449 /* FixUpIntError */
#define HELP_SP1_FIXDOT_007 450 /* FixUpUndefined */
#define HELP_SP1_FIXDOT_008 451 /* FixUpIntError */
#define HELP_SP1_FIXDOT_009 452 /* "Distribution %s is undefined" */
#define HELP_SP1_FIXDOT_010 453 /* FixUpIntError */
#define HELP_SP1_FIXDOT_011 454 /* "Dev" */
#define HELP_SP1_FIXDOT_012 455 /* "Lot" */
#define HELP_SP1_FIXDOT_013 456 /* "Track Dev" */
#define HELP_SP1_FIXDOT_014 457 /* "Track Lot" */
#define HELP_SP1_FIXDOT_015 458 /* chtmp */
#define HELP_SP1_SP1_001 459 /* tmp_str */
#define HELP_SP1_SP1_002 460 /* "Only one circuit allowed per file%s" */
#define HELP_SP1_SP1_003 -461 /* "There are no devices in this circuit, (this message will be printed\n\n" */
#define HELP_SP1_SP1_004 462 /* "All terminals are grounded in this circuit" */
#define HELP_SP1_SP1_005 463 /* tmp_str */
#define HELP_SP1_SP1_006 464 /* tmp_str */
#define HELP_SP1_SP1_007 465 /* tmp_str */
#define HELP_SP1_SP1_008 466 /* tmp_str */
#define HELP_SP1_SP1_009 467 /* tmp_str */
#define HELP_SP1_SP1_010 -468 /* ".MC or .WCASE ignored (No %s command in circuit)" */
#define HELP_SP1_SP1_011 469 /* tmp_str */
#define HELP_SP1_SP1_012 -470 /* "No models had tolerances.  .MC or .WCASE ignored" */
#define HELP_SP1_SP1_013 471 /* "Only one analysis temperature allowed%s" */
#define HELP_SP1_SP1_014 472 /* "Monte Carlo and Worst Case analyses not allowed%s" */
#define HELP_SP1_SP1_015 HELP_SP1_IMPULSE_004 /* "Unable to open probe file %s" */
#define HELP_SP1_SP1_016 -474 /* "Only one .TEMP value allowed with .STEP" */
#define HELP_SP1_SP1_017 -475 /* "Only one .TEMP, .DC TEMP, or .STEP TEMP permitted" */
#define HELP_SP1_SP1_018 476 /* "A device may appear in .DC and .STEP commands only once" */
#define HELP_SP1_SP1_019 477 /* "A model may appear in .DC and .STEP commands only once" */
#define HELP_SP1_SP1_020 478 /* "The MicroSim PSpice A/D Basics+ Package does not support .MC or .WC" */
#define HELP_SP1_SP1_021 479 /* "The MicroSim PSpice Basics Package does not support .MC or .WC" */
#define HELP_SP1_SP1_022 480 /* limit_p */
#define HELP_SP1_SP1_023 481 /* "The MicroSim PSpice A/D Basics+ Package only supports LEVEL=2 for GaAsfets" */
#define HELP_SP1_SP1_024 482 /* "The MicroSim PSpice Basics Package only supports LEVEL=2 for GaAsfets" */
#define HELP_SP1_SP1_025 483 /* "The MicroSim PSpice A/D Basics+ Package only supports ideal Transmission Lines" */
#define HELP_SP1_SP1_026 484 /* "The MicroSim PSpice Basics Package only supports ideal Transmission Lines" */
#define HELP_SP1_SP1_027 485 /* "The MicroSim PSpice A/D Basics+ Package only supports ideal Inductor Coupling" */
#define HELP_SP1_SP1_028 486 /* "The MicroSim PSpice Basics Package only supports ideal Inductor Coupling" */
#define HELP_SP1_SP1_029 HELP_SP1_SP1_027 /* "The MicroSim PSpice A/D Basics+ Package only supports ideal Inductor Coupling" */
#define HELP_SP1_SP1_030 HELP_SP1_SP1_028 /* "The MicroSim PSpice Basics Package only supports ideal Inductor Coupling" */
#define HELP_SP1_SP1_031 489 /* "The MicroSim PSpice A/D Basics+ Package does not support BTG primitives" */
#define HELP_SP1_SP1_032 490 /* "The MicroSim PSpice Basics Package does not support BTG primitives" */
#define HELP_SP1_SP1_033 491 /* "The MicroSim PSpice A/D Basics+ Package does not support .STEP" */
#define HELP_SP1_SP1_034 492 /* "The MicroSim PSpice Basics Package does not support .STEP" */
#define HELP_SP1_SP1_035 493 /* "Circuit too large for MicroSim PSpice A/D Basics+ Package" */
#define HELP_SP1_SP1_036 HELP_SP1_SP1_035 /* "Circuit too large for MicroSim PSpice A/D Basics+ Package" */
#define HELP_SP1_SP1_037 495 /* "Circuit too large for MicroSim PSpice Basics Package (too many \"small\" devices)" */
#define HELP_SP1_SP1_038 496 /* "Circuit too large for MicroSim PSpice Basics Package (too many \"big\" devices)" */
#define HELP_SP1_SP1_039 497 /* "The MicroSim PSpice A/D Basics+ Package does not support MIN Timing" */
#define HELP_SP1_SP1_040 498 /* "Unit-delay timing is used for all models." */
#define HELP_SP1_SP1_041 499 /* "The MicroSim PSpice A/D Basics+ Package does not support MAX Timing" */
#define HELP_SP1_SP1_042 HELP_SP1_SP1_040 /* "Unit-delay timing is used for all models." */
#define HELP_SP1_SP1_043 501 /* "The MicroSim PSpice A/D Basics+ Package does not support Worst-Case Timing" */
#define HELP_SP1_SP1_044 HELP_SP1_SP1_042 /* "Unit-delay timing is used for all models." */
#define HELP_SP3_DCDCMP_001 503 /* "Pivot not in DCDcmp" */
#define HELP_SP3_DCDCMP_002 -504 /* "The circuit matrix is singular and cannot be solved.\n" */
#define HELP_SP3_DCDCMP_003 -505 /* "The circuit matrix is too close to being singular to solve.\n" */
#define HELP_SP3_INDXX_001 506 /* " IndxCur0: blk == NULL, j = %d" */
#define HELP_SP3_SWPVLT_001 507 /* "In SwpVlt" */
#define HELP_SP4_BIASPNT_001 508 /* "Unknown .SAVEBIAS analysis type" */
#define HELP_SP4_BIASPNT_002 509 /* "Unable to open .SAVEBIAS file" */
#define HELP_SP4_DCCNTRL_001 510 /* "CPU Time limit exceeded in DC sweep at value = %s" */
#define HELP_SP4_DCCNTRL_002 511 /* "TIME_SCALE_FACTOR must be positive in device %s" */
#define HELP_SP4_DIO_001 512 /* "Initial state %c for device %s undefined" */
#define HELP_SP4_DIO_002 513 /* "%s %s %s %21.13E\n" */
#define HELP_SP4_DIO_003 514 /* "%s\n%s %21.13E\n%s %21.13E\n%s %21.13E %s\n" */
#define HELP_SP4_DIO_004 515 /* "Signal name %s for device %s not found in file %s" */
#define HELP_SP4_DIO_005 516 /* "Writing to digital simulator" */
#define HELP_SP4_DIO_006 517 /* IOWriteError */
#define HELP_SP4_DIO_007 518 /* IOWriteError */
#define HELP_SP4_DIO_008 519 /* IOWriteError */
#define HELP_SP4_DIO_009 520 /* "Transient analysis terminated by logic simulator" */
#define HELP_SP4_DIO_010 521 /* IOReadError */
#define HELP_SP4_DIO_011 522 /* IOReadError */
#define HELP_SP4_DIO_012 523 /* IOReadError */
#define HELP_SP4_DIO_013 524 /* "Time must be an integer in file %s" */
#define HELP_SP4_DIO_014 525 /* "Writing time to digital simulator interface" */
#define HELP_SP4_DIO_015 526 /* IOReadError */
#define HELP_SP4_DIO_016 527 /* "State string (%s) too long in file %s" */
#define HELP_SP4_DIO_017 528 /* "Bad column number (s) in file %s" */
#define HELP_SP4_DIO_018 529 /* IOReadError */
#define HELP_SP4_DIO_019 530 /* "Bad state name (%c) in file %s" */
#define HELP_SP4_ITERATE_001 -531 /* "Unable to converge all DtoA interface devices" */
#define HELP_SP4_ITERATE_002 -532 /* ConvergenceProblem */
#define HELP_SP4_ITERATE_003 533 /* "CPU Time limit exceeded in %s" */
#define HELP_SP4_ITERATE_004 -534 /* ConvergenceProblem */
#define HELP_SP4_ITERATE_005 535 /* "Convergence problem involving faulty derivatives" */
#define HELP_SP4_LOAD_001 536 /* "Problem with copy_perm_matrix()" */
#define HELP_SP4_LOAD_002 537 /* "Device %s overrides .IC/.NODESET" */
#define HELP_SP4_LOAD_003 HELP_SP4_LOAD_002 /* "Device %s overrides .IC/.NODESET" */
#define HELP_SP4_SAVESTEP_001 539 /* "Unknown STEP save" */
#define HELP_SP4_TRAN_001 540 /* FatalDigSimError */
#define HELP_SP4_TRAN_002 541 /* FatalDigSimError */
#define HELP_SP4_TRAN_003 542 /* FatalDigSimError */
#define HELP_SP4_TRAN_004 543 /* "CPU Time limit exceeded in Transient Analysis at time = %s" */
#define HELP_SP4_TRAN_005 544 /* "Transient Analysis iterations exceed limit of %d at time = %s\n\n" */
#define HELP_SP4_TRAN_006 -545 /* "Convergence problem in transient analysis at Time = %s\n" */
#define HELP_SP4_TRAN_007 -546 /* "Time step = %s is too small in Transient Analysis at\n\n" */
#define HELP_SP4_TRAN_008 547 /* FatalDigSimError */
#define HELP_SP4_TRAN_009 548 /* FatalDigSimError */
#define HELP_SP4_TRAN_010 549 /* ErrLimCnt */
#define HELP_SP5_SENCAL_001 550 /* "PP_type is %d" */
#define HELP_SP6_ACAN_001 551 /* junk */
#define HELP_SP6_ACAN_002 552 /* "CPU Time limit exceeded in AC analysis at time = %s" */
#define HELP_SP7_FOUR_001 553 /* "Transient Analysis must be at least 1/frequency seconds long.\nFourier analysis aborted" */
#define HELP_SP7_FOUR_002 554 /* "Can't find start point in FourAn; .FOUR aborted" */
#define HELP_SP7_OUTPUT_001 555 /* "Can't open input file, Print aborted!" */
#define HELP_SP7_OUTPUT_002 556 /* "Can't open input file, Plot aborted" */
#define HELP_SP7_OUTPUT_003 557 /* "Only %2d columns can be printed at one listing" */
#define HELP_SP7_PLOT_001 558 /* "out of memory process .PLOT" */
#define HELP_SP7_PRDGTLCH_001 559 /* "Out of memory process .PRINT (Dig)" */
#define HELP_SP7_PRINT_001 560 /* "Out of memory process .PRINT " */
#define HELP_SP8_ADCDAC_001 561 /* "Loss of ADC accuracy on %s due to input or ref voltage changes\n\n" */
#define HELP_SP8_DIG_001 562 /* "%s forced to X state for bias point" */
#define HELP_SP8_DIG_002 563 /* "Bad return code from termination function, device %s\n" */
#define HELP_SP8_DIG_003 564 /* "Model %s - Overflow converting delay times to ticks" */
#define HELP_SP8_DIG_004 565 /* "Overflow converting average delay times to ticks" */
#define HELP_SP8_DIG_005 566 /* "Overflow converting h->l load delay to ticks\ndevice %s, net %s, delay %s" */
#define HELP_SP8_DIG_006 567 /* "Overflow converting l->h load delay to ticks\ndevice %s, net %s, delay %s" */
#define HELP_SP8_DIG_007 568 /* "Overflow converting h->l switching time to ticks\ndevice %s, net %s, tswhl %s sec" */
#define HELP_SP8_DIG_008 569 /* "Overflow converting l->h switching time to ticks\ndevice %s, net %s, tswlh %s sec" */
#define HELP_SP8_DIGEVENT_001 570 /* "Zero Delay Oscillation on net %s at time %s caused by device %s" */
#define HELP_SP8_DIGEVENT_002 571 /* "Invalid digital device type = %d" */
#define HELP_SP8_DIGIO_001 572 /* "DIGFILE still open. Closing it now." */
#define HELP_SP8_DIGIO_002 -573 /* "Cannot open temporary digital file %s\n" */
#define HELP_SP8_DIGIO_003 HELP_SP8_DIGIO_002 /* "Cannot open temporary digital file %s\n" */
#define HELP_SP8_DIGIO_004 575 /* "Writing digital data to Probe file: %d" */
#define HELP_SP8_DIGIO_005 576 /* "On file %s.  The disk is probably full" */
#define HELP_SP8_DIGIO_006 577 /* "Digital node changes for a single time exceed limit\nChanges not put into probe file" */
#define HELP_SP8_DIGIO_007 578 /* DiskFull */
#define HELP_SP8_EVENTQ_001 579 /* tmp_str */
#define HELP_SP8_EVENTQ_002 580 /* "Bad event code: %d, at time %.0f" */
#define HELP_SP8_EXPDEV_001 581 /* "Invalid statement type %d in init_logicexp\n" */
#define HELP_SP8_EXPDEV_002 582 /* "Invalid statement type %d in term_logicexp\n" */
#define HELP_SP8_EXPDEV_003 583 /* "Invalid statement type %d in eval_logicexp\n" */
#define HELP_SP8_EXPDEV_004 584 /* "Invalid statement type %d in init_pindly\n" */
#define HELP_SP8_EXPDEV_005 585 /* "Invalid statement type %d in term_pindly\n" */
#define HELP_SP8_EXPDEV_006 586 /* "Invalid CONSTRAINT type %d in init_constraint\n" */
#define HELP_SP8_EXPDEV_007 587 /* "Constraint Device %s - Final evaluation error." */
#define HELP_SP8_EXPDEV_008 588 /* "Invalid statement type (%d) in term_constraint" */
#define HELP_SP8_EXPDEV_009 589 /* "Invalid constraint type (%d) in term_constraint" */
#define HELP_SP8_EXPDEV_010 590 /* "Invalid assignment type %d in eval_constraint\n" */
#define HELP_SP8_EXPDEV_011 591 /* "Invalid Statement type %d in eval_constraint\n" */
#define HELP_SP8_EXPDEV_012 592 /* "Invalid Constraint type %d in eval_constraint\n" */
#define HELP_SP8_EXPDEV_013 593 /* "Device %s, output %s: Overflow converting delay time to ticks" */
#define HELP_SP8_EXPDEV_014 594 /* "Overflow converting constraint time %s to ticks" */
#define HELP_SP8_FFLOP2_001 595 /* BadTrans */
#define HELP_SP8_FLIPFLOP_001 596 /* "clk_edge not established in eval_eff for %s at timestep %.0f\n" */
#define HELP_SP8_FLIPFLOP_002 597 /* BadTrans */
#define HELP_SP8_FLIPFLOP_003 598 /* "NO value for clk_edge established in eval_eff for %s at timestep %.0f\n" */
#define HELP_SP8_PLD_001 599 /* "Unable to open JEDEC file %s for device %s" */
#define HELP_SP8_PLD_002 600 /* "Reading JEDEC file %s for device %s" */
#define HELP_SP8_PLD_003 601 /* "RAM address setup time for %s" */
#define HELP_SP8_PLD_004 602 /* "RAM data setup time for %s" */
#define HELP_SP8_PLD_005 603 /* "RAM address change during write for %s at time %s" */
#define HELP_SP8_PLD_006 604 /* "RAM data change during write for %s at time %s" */
#define HELP_SP8_PLD_007 605 /* "RAM write enable pulse hi width for %s" */
#define HELP_SP8_PLD_008 HELP_SP8_PLD_005 /* "RAM address change during write for %s at time %s" */
#define HELP_SP8_PLD_009 607 /* "RAM address hold time for %s" */
#define HELP_SP8_PLD_010 HELP_SP8_PLD_006 /* "RAM data change during write for %s at time %s" */
#define HELP_SP8_PLD_011 609 /* "RAM data hold time for %s" */
#define HELP_SP8_PLD_012 610 /* "RAM model error 1 for %s at time %s" */
#define HELP_SP8_PLD_013 HELP_SP8_PLD_009 /* "RAM address hold time for %s" */
#define HELP_SP8_PLD_014 HELP_SP8_PLD_011 /* "RAM data hold time for %s" */
#define HELP_SP8_PLD_015 613 /* "RAM write enable width low for %s" */
#define HELP_SP8_PLD_016 614 /* "RAM write enable change before address hold for %s" */
#define HELP_SP8_PLD_017 615 /* "RAM write enable change before data hold for %s" */
#define HELP_SP8_PLD_018 616 /* "Unable to open HEX file %s for device %s" */
#define HELP_SP8_PLD_019 617 /* "Bad HEX format in file %s for device %s" */
#define HELP_SP8_PLD_020 618 /* "HEX file %s has data for address %lx,\nbut device %s has a max address of %lx" */
#define HELP_SP8_PLD_021 619 /* "Checksum error in file %s for device %s" */
#define HELP_SP8_PLD_022 620 /* "Reading HEX file %s for device %s" */
#define HELP_SP8_PLD_023 621 /* "Unexpected end of file while reading HEX file %s for device %s" */
#define HELP_SP8_PLSYN_001 622 /* "Unable to open test vector file %s" */
#define HELP_SP8_PLSYN_002 623 /* "Out of memory for test vector" */
#define HELP_SP8_PLSYN_003 624 /* "Should not be duplicate TRISTATE columns: %s" */
#define HELP_SP8_POSTCHG_001 625 /* "postchg: Bad wc_action\n" */
#define HELP_SP8_POSTCHG_002 626 /* "postchg: bad wc_action type\n" */
#define HELP_SP8_POSTCHG_003 627 /* "postchg: unknown action type\n" */
#define HELP_SP8_POSTCHG_004 628 /* "Post_Output_Change: both pending events full\n" */
#define HELP_SP8_PRMTV_001 629 /* "Msg ID Propagated, but not Posted!\n" */
#define HELP_SP8_PRMTV_002 630 /* "RecordXaxisPoints - bad msg id\n" */
#define HELP_SP8_PRMTV2_001 631 /* "Dinput model %s does not define state %c" */
#define HELP_SP8_PRMTV2_002 632 /* "(post_AtoD_chg) digital_time=%.0f, CUR_DIG_TIME=%.0f" */
#define HELP_SP8_PRMTV2_003 633 /* "Can not convert V(%s, %s) (= %s Volts) to a digital level.\n  Voltage is outside ranges defined for %s by model %s\n" */
#define HELP_SP8_PRMTV2_004 634 /* "Unknown state name (%c) from AtoD %s\n  Valid state names are 1, 0, X, R, F, and Z" */
#define HELP_SP8_STMEVENT_001 635 /* "Unexpected transition type" */
#define HELP_SP8_STMEVENT_002 636 /* "Digital stimulus %s trying to incr/decr X/Z value.\n  Ignoring incr/decr" */
#define HELP_SP8_STMEVENT_003 637 /* "Digital stimulus %s: transition at time %s is earlier" */
#define HELP_SP8_STMEVENT_004 638 /* "stimulus file \"%s\", line %ld:\n\n" */
#define HELP_SPLIB_CONVERT_001 639 /* "Invalid number" */
#define HELP_SPLIB_CONVERT_002 HELP_SPLIB_CONVERT_001 /* "Invalid number" */
#define HELP_SPLIB_CONVERT_003 HELP_SP1_VECTOR_007 /* "Missing value" */
#define HELP_SPLIB_CONVERT_004 642 /* "unknown parameter" */
#define HELP_SPLIB_DGEXPDEV_001 643 /* "Expecting IO_LEVEL, MNTYMXDLY, or LOGIC:" */
#define HELP_SPLIB_DGEXPDEV_002 644 /* "Expecting output node or temporary" */
#define HELP_SPLIB_DGEXPDEV_003 645 /* errmsg */
#define HELP_SPLIB_DGEXPDEV_004 HELP_SP_MODTEMP_002 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_005 -647 /* "Missing expression" */
#define HELP_SPLIB_DGEXPDEV_006 648 /* errmsg */
#define HELP_SPLIB_DGEXPDEV_007 649 /* "TRISTATE: not allowed when no enable pins are specified" */
#define HELP_SPLIB_DGEXPDEV_008 650 /* "Expecting IO_LEVEL, MNTYMXDLY, BOOLEAN:, PINDLY: or TRISTATE:" */
#define HELP_SPLIB_DGEXPDEV_009 651 /* "Expecting ENABLE LO|HI <node>" */
#define HELP_SPLIB_DGEXPDEV_010 652 /* "Expecting LO or HI" */
#define HELP_SPLIB_DGEXPDEV_011 653 /* "Missing enable nodename" */
#define HELP_SPLIB_DGEXPDEV_012 654 /* "Must be an enable node" */
#define HELP_SPLIB_DGEXPDEV_013 655 /* "target of assignment must be output node" */
#define HELP_SPLIB_DGEXPDEV_014 656 /* errmsg */
#define HELP_SPLIB_DGEXPDEV_015 657 /* "Expecting BOOLEAN target" */
#define HELP_SPLIB_DGEXPDEV_016 658 /* "Expecting output node" */
#define HELP_SPLIB_DGEXPDEV_017 HELP_SPLIB_DGEXPDEV_004 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_018 660 /* errmsg */
#define HELP_SPLIB_DGEXPDEV_019 661 /* "Invalid assignment type %d" */
#define HELP_SPLIB_DGEXPDEV_020 HELP_SPLIB_DGEXPDEV_017 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_021 HELP_SPLIB_DGEXPDEV_005 /* "Missing expression" */
#define HELP_SPLIB_DGEXPDEV_022 664 /* errmsg */
#define HELP_SPLIB_DGEXPDEV_023 665 /* Bad_Context_Err */
#define HELP_SPLIB_DGEXPDEV_024 666 /* "Invalid keyword" */
#define HELP_SPLIB_DGEXPDEV_025 667 /* "CLOCK node not specified in SETUP_HOLD: section" */
#define HELP_SPLIB_DGEXPDEV_026 668 /* "DATA node(s) not specified in SETUP_HOLD: section" */
#define HELP_SPLIB_DGEXPDEV_027 669 /* "At least one of: SETUPTIME, RELEASETIME or HOLDTIME must be specified" */
#define HELP_SPLIB_DGEXPDEV_028 670 /* "NODE not specified in WIDTH: section" */
#define HELP_SPLIB_DGEXPDEV_029 671 /* "At least one of: MIN_HIGH or MIN_LOW must be specified" */
#define HELP_SPLIB_DGEXPDEV_030 672 /* "NODE not specified in FREQ: section" */
#define HELP_SPLIB_DGEXPDEV_031 673 /* "At least one of: MINFREQ or MAXFREQ must be specified" */
#define HELP_SPLIB_DGEXPDEV_032 674 /* "WHEN expression must be specified in GENERAL: section" */
#define HELP_SPLIB_DGEXPDEV_033 675 /* "MESSAGE text must be specified in GENERAL: section" */
#define HELP_SPLIB_DGEXPDEV_034 676 /* "Expecting temporary" */
#define HELP_SPLIB_DGEXPDEV_035 HELP_SPLIB_DGEXPDEV_020 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_036 678 /* "Missing BOOLEAN expression" */
#define HELP_SPLIB_DGEXPDEV_037 679 /* "CLOCK already specified" */
#define HELP_SPLIB_DGEXPDEV_038 680 /* Missing_Edge */
#define HELP_SPLIB_DGEXPDEV_039 681 /* Missing_Edge */
#define HELP_SPLIB_DGEXPDEV_040 682 /* Not_Input_Err */
#define HELP_SPLIB_DGEXPDEV_041 683 /* "Missing clock node" */
#define HELP_SPLIB_DGEXPDEV_042 684 /* "DATA nodes already specified" */
#define HELP_SPLIB_DGEXPDEV_043 685 /* "Too many nodes" */
#define HELP_SPLIB_DGEXPDEV_044 HELP_SP1_VECTOR_001 /* "Missing number of nodes" */
#define HELP_SPLIB_DGEXPDEV_045 687 /* Not_Input_Err */
#define HELP_SPLIB_DGEXPDEV_046 688 /* "Too few DATA nodes specified" */
#define HELP_SPLIB_DGEXPDEV_047 689 /* "A SETUPTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_048 690 /* "A LO SETUPTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_049 691 /* "A HI SETUPTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_050 692 /* "A RELEASETIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_051 693 /* "A LH RELEASETIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_052 694 /* "A HL RELEASETIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_053 695 /* "A HOLDTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_054 696 /* "A LO HOLDTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_055 697 /* "A HI HOLDTIME was previously specified" */
#define HELP_SPLIB_DGEXPDEV_056 698 /* Not_Input_Err */
#define HELP_SPLIB_DGEXPDEV_057 HELP_SP1_SUBXCUT_015 /* "Missing node" */
#define HELP_SPLIB_DGEXPDEV_058 700 /* Not_Input_Err */
#define HELP_SPLIB_DGEXPDEV_059 HELP_SPLIB_DGEXPDEV_057 /* "Missing node" */
#define HELP_SPLIB_DGEXPDEV_060 702 /* "Expecting BOOLEAN expression" */
#define HELP_SPLIB_DGEXPDEV_061 703 /* Bad_Context_Err */
#define HELP_SPLIB_DGEXPDEV_062 704 /* "Expecting text string or expression" */
#define HELP_SPLIB_DGEXPDEV_063 705 /* Bad_Context_Err */
#define HELP_SPLIB_DGEXPDEV_064 706 /* Bad_Context_Err */
#define HELP_SPLIB_DGEXPDEV_065 707 /* "AFFECTS_ALL is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_066 708 /* "AFFECTS_NONE was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_067 709 /* "AFFECTS was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_068 710 /* "AFFECTS_NONE is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_069 711 /* "AFFECTS_ALL was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_070 HELP_SPLIB_DGEXPDEV_067 /* "AFFECTS was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_071 713 /* "AFFECTS is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_072 HELP_SPLIB_DGEXPDEV_069 /* "AFFECTS_ALL was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_073 HELP_SPLIB_DGEXPDEV_066 /* "AFFECTS_NONE was previously specified; use only one." */
#define HELP_SPLIB_DGEXPDEV_074 HELP_SPLIB_DGEXPDEV_044 /* "Missing number of nodes" */
#define HELP_SPLIB_DGEXPDEV_075 717 /* "AFFECTS (count) must match DATA (count)" */
#define HELP_SPLIB_DGEXPDEV_076 718 /* Not_Output_Err */
#define HELP_SPLIB_DGEXPDEV_077 -719 /* "Too few output nodes specified" */
#define HELP_SPLIB_DGEXPDEV_078 720 /* "Unknown data type in AddLocalSym" */
#define HELP_SPLIB_DGEXPDEV_079 721 /* "Unknown assignment type in AddAssignment" */
#define HELP_SPLIB_DGEXPDEV_080 HELP_SP1_SUBXCUT_001 /* "No match for %c in state %d" */
#define HELP_SPLIB_DGEXPDEV_081 HELP_SP1_SUBXCUT_002 /* "Bad expression" */
#define HELP_SPLIB_DGEXPDEV_082 HELP_SP1_SUBXCUT_019 /* "Missing model" */
#define HELP_SPLIB_DGEXPDEV_083 725 /* "Missing I/O Model" */
#define HELP_SPLIB_DGEXPDEV_084 HELP_SPLIB_CONVERT_003 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_085 HELP_SPLIB_DGEXPDEV_084 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_086 HELP_SPLIB_DGEXPDEV_001 /* "Expecting IO_LEVEL, MNTYMXDLY, or LOGIC:" */
#define HELP_SPLIB_DGEXPDEV_087 HELP_SPLIB_DGEXPDEV_002 /* "Expecting output node or temporary" */
#define HELP_SPLIB_DGEXPDEV_088 HELP_SPLIB_DGEXPDEV_035 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_089 HELP_SPLIB_DGEXPDEV_021 /* "Missing expression" */
#define HELP_SPLIB_DGEXPDEV_090 HELP_SPLIB_DGEXPDEV_083 /* "Missing I/O Model" */
#define HELP_SPLIB_DGEXPDEV_091 HELP_SPLIB_DGEXPDEV_085 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_092 HELP_SPLIB_DGEXPDEV_091 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_093 735 /* "Expecting IO_LEVEL, MNTYMXDLY, BOOLEAN:, or PINDLY:" */
#define HELP_SPLIB_DGEXPDEV_094 HELP_SPLIB_DGEXPDEV_009 /* "Expecting ENABLE LO|HI <node>" */
#define HELP_SPLIB_DGEXPDEV_095 HELP_SPLIB_DGEXPDEV_010 /* "Expecting LO or HI" */
#define HELP_SPLIB_DGEXPDEV_096 HELP_SPLIB_DGEXPDEV_011 /* "Missing enable nodename" */
#define HELP_SPLIB_DGEXPDEV_097 HELP_SPLIB_DGEXPDEV_015 /* "Expecting BOOLEAN target" */
#define HELP_SPLIB_DGEXPDEV_098 HELP_SPLIB_DGEXPDEV_016 /* "Expecting output node" */
#define HELP_SPLIB_DGEXPDEV_099 HELP_SPLIB_DGEXPDEV_089 /* "Missing expression" */
#define HELP_SPLIB_DGEXPDEV_100 742 /* "Missing constraint" */
#define HELP_SPLIB_DGEXPDEV_101 HELP_SPLIB_DGEXPDEV_099 /* "Missing expression" */
#define HELP_SPLIB_DGEXPDEV_102 HELP_SPLIB_DGEXPDEV_090 /* "Missing I/O Model" */
#define HELP_SPLIB_DGEXPDEV_103 745 /* Bad_Context_Err */
#define HELP_SPLIB_DGEXPDEV_104 HELP_SPLIB_DGEXPDEV_024 /* "Invalid keyword" */
#define HELP_SPLIB_DGEXPDEV_105 HELP_SPLIB_DGEXPDEV_025 /* "CLOCK node not specified in SETUP_HOLD: section" */
#define HELP_SPLIB_DGEXPDEV_106 HELP_SPLIB_DGEXPDEV_026 /* "DATA node(s) not specified in SETUP_HOLD: section" */
#define HELP_SPLIB_DGEXPDEV_107 749 /* "At least one of: SETUPTIME, RELEASETIME, or HOLDTIME must be specified" */
#define HELP_SPLIB_DGEXPDEV_108 HELP_SPLIB_DGEXPDEV_028 /* "NODE not specified in WIDTH: section" */
#define HELP_SPLIB_DGEXPDEV_109 HELP_SPLIB_DGEXPDEV_029 /* "At least one of: MIN_HIGH or MIN_LOW must be specified" */
#define HELP_SPLIB_DGEXPDEV_110 HELP_SPLIB_DGEXPDEV_030 /* "NODE not specified in FREQ: section" */
#define HELP_SPLIB_DGEXPDEV_111 HELP_SPLIB_DGEXPDEV_031 /* "At least one of: MINFREQ or MAXFREQ must be specified" */
#define HELP_SPLIB_DGEXPDEV_112 HELP_SPLIB_DGEXPDEV_032 /* "WHEN expression must be specified in GENERAL: section" */
#define HELP_SPLIB_DGEXPDEV_113 HELP_SPLIB_DGEXPDEV_033 /* "MESSAGE text must be specified in GENERAL: section" */
#define HELP_SPLIB_DGEXPDEV_114 HELP_SPLIB_DGEXPDEV_092 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_115 HELP_SPLIB_DGEXPDEV_034 /* "Expecting temporary" */
#define HELP_SPLIB_DGEXPDEV_116 HELP_SPLIB_DGEXPDEV_088 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DGEXPDEV_117 HELP_SPLIB_DGEXPDEV_037 /* "CLOCK already specified" */
#define HELP_SPLIB_DGEXPDEV_118 760 /* Missing_Edge */
#define HELP_SPLIB_DGEXPDEV_119 761 /* Missing_Edge */
#define HELP_SPLIB_DGEXPDEV_120 HELP_SPLIB_DGEXPDEV_041 /* "Missing clock node" */
#define HELP_SPLIB_DGEXPDEV_121 HELP_SPLIB_DGEXPDEV_042 /* "DATA nodes already specified" */
#define HELP_SPLIB_DGEXPDEV_122 HELP_SPLIB_DGEXPDEV_074 /* "Missing number of nodes" */
#define HELP_SPLIB_DGEXPDEV_123 HELP_SPLIB_DGEXPDEV_046 /* "Too few DATA nodes specified" */
#define HELP_SPLIB_DGEXPDEV_124 HELP_SPLIB_DGEXPDEV_114 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_125 HELP_SPLIB_DGEXPDEV_124 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_126 HELP_SPLIB_DGEXPDEV_125 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_127 HELP_SPLIB_DGEXPDEV_059 /* "Missing node" */
#define HELP_SPLIB_DGEXPDEV_128 HELP_SPLIB_DGEXPDEV_126 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_129 HELP_SPLIB_DGEXPDEV_128 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_130 HELP_SPLIB_DGEXPDEV_127 /* "Missing node" */
#define HELP_SPLIB_DGEXPDEV_131 HELP_SPLIB_DGEXPDEV_129 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_132 HELP_SPLIB_DGEXPDEV_131 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_133 HELP_SPLIB_DGEXPDEV_060 /* "Expecting BOOLEAN expression" */
#define HELP_SPLIB_DGEXPDEV_134 HELP_SPLIB_DGEXPDEV_062 /* "Expecting text string or expression" */
#define HELP_SPLIB_DGEXPDEV_135 HELP_SPLIB_DGEXPDEV_132 /* "Missing value" */
#define HELP_SPLIB_DGEXPDEV_136 HELP_SPLIB_DGEXPDEV_065 /* "AFFECTS_ALL is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_137 HELP_SPLIB_DGEXPDEV_068 /* "AFFECTS_NONE is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_138 HELP_SPLIB_DGEXPDEV_071 /* "AFFECTS is only valid in Pindly device" */
#define HELP_SPLIB_DGEXPDEV_139 HELP_SPLIB_DGEXPDEV_122 /* "Missing number of nodes" */
#define HELP_SPLIB_DGEXPDEV_140 HELP_SPLIB_DGEXPDEV_077 /* "Too few output nodes specified" */
#define HELP_SPLIB_DIGSTM_001 783 /* "Internal Error in STIM readin" */
#define HELP_SPLIB_DIGSTM_002 -784 /* "Bad radix spec" */
#define HELP_SPLIB_DIGSTM_003 785 /* "Radix values do not equal width" */
#define HELP_SPLIB_DIGSTM_004 786 /* "Missing digital power supply node" */
#define HELP_SPLIB_DIGSTM_005 787 /* "Missing digital ground node" */
#define HELP_SPLIB_DIGSTM_006 788 /* "Missing IO model" */
#define HELP_SPLIB_DIGSTM_007 HELP_SP1_STIMULUS_002 /* "Missing stimulus name" */
#define HELP_SPLIB_DIGSTM_008 790 /* StimInstFmt_Msg */
#define HELP_SPLIB_DIGSTM_009 791 /* "Error reading transition data for STIM device" */
#define HELP_SPLIB_DIGSTM_010 -792 /* "Bad or missing parameter" */
#define HELP_SPLIB_DIGSTM_011 793 /* "LABEL missing argument\n" */
#define HELP_SPLIB_DIGSTM_012 -794 /* "LABEL invalid in REPEAT loop\n" */
#define HELP_SPLIB_DIGSTM_013 -795 /* "Missing goto label" */
#define HELP_SPLIB_DIGSTM_014 -796 /* "GOTO invalid in REPEAT loop\n" */
#define HELP_SPLIB_DIGSTM_015 797 /* "Invalid goto label" */
#define HELP_SPLIB_DIGSTM_016 798 /* "Missing n times" */
#define HELP_SPLIB_DIGSTM_017 HELP_SPLIB_DIGSTM_016 /* "Missing n times" */
#define HELP_SPLIB_DIGSTM_018 800 /* "Expecting TIMES" */
#define HELP_SPLIB_DIGSTM_019 801 /* "Expecting UNTIL" */
#define HELP_SPLIB_DIGSTM_020 802 /* "Missing comparison type" */
#define HELP_SPLIB_DIGSTM_021 803 /* "Bad comparison type" */
#define HELP_SPLIB_DIGSTM_022 804 /* "Missing comparison value" */
#define HELP_SPLIB_DIGSTM_023 805 /* "Bad comparison value" */
#define HELP_SPLIB_DIGSTM_024 -10806 /* "REPEAT missing FOR or FOREVER\n" */
#define HELP_SPLIB_DIGSTM_025 807 /* "FOR missing count value\n" */
#define HELP_SPLIB_DIGSTM_026 808 /* "Missing  repeat count" */
#define HELP_SPLIB_DIGSTM_027 809 /* "bad REPEAT value\n" */
#define HELP_SPLIB_DIGSTM_028 810 /* "ENDREPEAT/REPEAT Mismatch" */
#define HELP_SPLIB_DIGSTM_029 811 /* "Missing  BY value" */
#define HELP_SPLIB_DIGSTM_030 812 /* "Missing  BY" */
#define HELP_SPLIB_DIGSTM_031 813 /* "Missing  value" */
#define HELP_SPLIB_DIGSTM_032 814 /* " bad INCR value" */
#define HELP_SPLIB_DIGSTM_033 HELP_SPLIB_DIGSTM_029 /* "Missing  BY value" */
#define HELP_SPLIB_DIGSTM_034 HELP_SPLIB_DIGSTM_030 /* "Missing  BY" */
#define HELP_SPLIB_DIGSTM_035 HELP_SPLIB_DIGSTM_031 /* "Missing  value" */
#define HELP_SPLIB_DIGSTM_036 818 /* " bad DECR value" */
#define HELP_SPLIB_DIGSTM_037 819 /* "Missing file name" */
#define HELP_SPLIB_DIGSTM_038 820 /* file_err */
#define HELP_SPLIB_DIGSTM_039 821 /* file_err */
#define HELP_SPLIB_DIGSTM_040 822 /* "Bad state value(s)" */
#define HELP_SPLIB_DIGSTM_041 823 /* "GOTO must have time specification" */
#define HELP_SPLIB_DIGSTM_042 824 /* "INCR must have time specification" */
#define HELP_SPLIB_DIGSTM_043 825 /* "DECR must have time specification" */
#define HELP_SPLIB_DIGSTM_044 826 /* "Expecting LABEL, FILE, REPEAT or <time>" */
#define HELP_SPLIB_DIGSTM_045 827 /* "TIMESTEP not specified" */
#define HELP_SPLIB_DIGSTM_046 828 /* "Transitions must be in ascending time order " */
#define HELP_SPLIB_DIGSTM_047 829 /* "badly-formed stimulus transition command" */
#define HELP_SPLIB_DIGSTM_048 830 /* error_msg */
#define HELP_SPLIB_DIGSTM_049 831 /* error_msg */
#define HELP_SPLIB_DIGSTM_050 832 /* GreaterThan0_Msg */
#define HELP_SPLIB_DIGSTM_051 HELP_SPLIB_DGEXPDEV_116 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_DIGSTM_052 834 /* "TIMESTEP must be greater than zero" */
#define HELP_SPLIB_DIGSTM_053 835 /* "TIMESTEP on STIM instance overrides .STIMULUS spec" */
#define HELP_SPLIB_DIGSTM_054 836 /* "IO_LEVEL must appear in .STIMULUS \"instance\"." */
#define HELP_SPLIB_DIGSTM_055 HELP_SPLIB_DIGSTM_012 /* "LABEL invalid in REPEAT loop\n" */
#define HELP_SPLIB_DIGSTM_056 838 /* "Max REPEAT/ENDREPEAT nesting depth reached." */
#define HELP_SPLIB_DIGSTM_057 HELP_SPLIB_DIGSTM_026 /* "Missing  repeat count" */
#define HELP_SPLIB_DIGSTM_058 840 /* "REPEAT/ENDREPEAT Mismatch" */
#define HELP_SPLIB_DIGSTM_059 841 /* "Expecting LABEL= or time" */
#define HELP_SPLIB_DIGSTM_060 HELP_SPLIB_DIGSTM_045 /* "TIMESTEP not specified" */
#define HELP_SPLIB_DIGSTM_061 HELP_SPLIB_DIGSTM_046 /* "Transitions must be in ascending time order " */
#define HELP_SPLIB_DIGSTM_062 HELP_SPLIB_DIGSTM_014 /* "GOTO invalid in REPEAT loop\n" */
#define HELP_SPLIB_DIGSTM_063 HELP_SPLIB_DIGSTM_015 /* "Invalid goto label" */
#define HELP_SPLIB_DIGSTM_064 HELP_SPLIB_DIGSTM_017 /* "Missing n times" */
#define HELP_SPLIB_DIGSTM_065 HELP_SPLIB_DIGSTM_018 /* "Expecting TIMES" */
#define HELP_SPLIB_DIGSTM_066 HELP_SPLIB_DIGSTM_019 /* "Expecting UNTIL" */
#define HELP_SPLIB_DIGSTM_067 849 /* "Max number of transitions reached" */
#define HELP_SPLIB_DIGSTM_068 HELP_SPLIB_DIGSTM_010 /* "Bad or missing parameter" */
#define HELP_SPLIB_DIGSTM_069 851 /* "Bad or missing stim trans" */
#define HELP_SPLIB_DIGSTM_070 -852 /* "Invalid value" */
#define HELP_SPLIB_DIGSTM_071 HELP_SPLIB_DGEXPDEV_139 /* "Missing number of nodes" */
#define HELP_SPLIB_DIGSTM_072 854 /* error_msg */
#define HELP_SPLIB_DIGSTM_073 855 /* GreaterThan0_Msg */
#define HELP_SPLIB_DIGSTM_074 HELP_SPLIB_DIGSTM_004 /* "Missing digital power supply node" */
#define HELP_SPLIB_DIGSTM_075 HELP_SPLIB_DIGSTM_005 /* "Missing digital ground node" */
#define HELP_SPLIB_DIGSTM_076 HELP_SPLIB_DIGSTM_006 /* "Missing IO model" */
#define HELP_SPLIB_DIGSTM_077 HELP_SPLIB_DIGSTM_037 /* "Missing file name" */
#define HELP_SPLIB_DIGSTM_078 860 /* "too many signals" */
#define HELP_SPLIB_DIGSTM_079 -861 /* "Unknown parameter" */
#define HELP_SPLIB_DIGSTM_080 862 /* "Missing filename.  Use FILE = <filename>" */
#define HELP_SPLIB_ENCEXP_001 863 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_002 864 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_003 865 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_004 866 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_005 867 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_006 868 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_007 869 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_008 870 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_009 871 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_010 872 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_011 873 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_012 874 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_013 875 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_014 876 /* OutOfMemory */
#define HELP_SPLIB_ENCEXP_015 877 /* "Mismatched parentheses" */
#define HELP_SPLIB_ENCEXP_016 878 /* "Expression too complex" */
#define HELP_SPLIB_ENCEXP_017 879 /* chtmp */
#define HELP_SPLIB_ENCEXP_018 880 /* "EncExp: Invalid arg count for builtin %s" */
#define HELP_SPLIB_ENCEXP_019 881 /* chtmp */
#define HELP_SPLIB_ENCEXP_020 882 /* chtmp */
#define HELP_SPLIB_ENCEXP_021 883 /* chtmp */
#define HELP_SPLIB_ENCEXP_022 884 /* "LaPlace variable (S) not allowed in this context" */
#define HELP_SPLIB_ENCEXP_023 885 /* "TIME not allowed in this context" */
#define HELP_SPLIB_ENCEXP_024 886 /* "Can't add param <%s>" */
#define HELP_SPLIB_ENCEXP_025 -887 /* "Undefined parameter used in expression" */
#define HELP_SPLIB_ENCEXP_026 888 /* "Invalid interface node in expression" */
#define HELP_SPLIB_ENCEXP_027 889 /* "Too many variables in expression" */
#define HELP_SPLIB_ENCEXP_028 890 /* "Node voltages and/or currents not allowed in this context" */
#define HELP_SPLIB_EVLSTK_001 891 /* "Parameter %s is used to define itself" */
#define HELP_SPLIB_EVLSTK_002 892 /* "Couldn't find .FUNC expression" */
#define HELP_SPLIB_EVLSTK_003 893 /* "Couldn't allocate expression" */
#define HELP_SPLIB_EVLSTK_004 894 /* "Seconds to ticks conversion overflow in CHANGED(), value=%lf" */
#define HELP_SPLIB_EVLSTK_005 895 /* "Text parameter %s is used to define itself" */
#define HELP_SPLIB_EVLSTK_006 896 /* "%s is not available in the context used" */
#define HELP_SPLIB_EVLSTK_007 897 /* "Invalid opcode %d" */
#define HELP_SPLIB_EVLSTK_008 HELP_SPLIB_EVLSTK_001 /* "Parameter %s is used to define itself" */
#define HELP_SPLIB_EVLSTK_009 HELP_SPLIB_EVLSTK_002 /* "Couldn't find .FUNC expression" */
#define HELP_SPLIB_EVLSTK_010 HELP_SPLIB_EVLSTK_003 /* "Couldn't allocate expression" */
#define HELP_SPLIB_EVLSTK_011 901 /* "TABLE() is not available for complex expressions" */
#define HELP_SPLIB_EVLSTK_012 902 /* "LIMIT() is not available for complex expressions" */
#define HELP_SPLIB_EVLSTK_013 903 /* "%s is not available for complex expressions" */
#define HELP_SPLIB_EVLSTK_014 HELP_SPLIB_EVLSTK_007 /* "Invalid opcode %d" */
#define HELP_SPLIB_EVLSTK_015 905 /* "Expression for device %s out of range" */
#define HELP_SPLIB_EVLSTK_016 906 /* "Expression evaluation out of range" */
#define HELP_SPLIB_EXTERN_001 907 /* "Missing type" */
#define HELP_SPLIB_EXTERN_002 908 /* "Invalid EXTERNAL type" */
#define HELP_SPLIB_EXTERN_003 909 /* "missing node name" */
#define HELP_SPLIB_EXTERN_004 910 /* errormsg */
#define HELP_SPLIB_FREMDEXP_001 911 /* "Can't find model descr %d" */
#define HELP_SPLIB_FREMDEXP_002 912 /* "Bad Tline impulse responses" */
#define HELP_SPLIB_FREMDEXP_003 HELP_SPLIB_FREMDEXP_002 /* "Bad Tline impulse responses" */
#define HELP_SPLIB_MACROS_001 914 /* "Expected name after \".func\"" */
#define HELP_SPLIB_MACROS_002 915 /* "Bad characters in func name" */
#define HELP_SPLIB_MACROS_003 916 /* "Missing or mismatched ()" */
#define HELP_SPLIB_MACROS_004 917 /* "Illegal name for func" */
#define HELP_SPLIB_MACROS_005 -918 /* "Attempt to redefine builtin name" */
#define HELP_SPLIB_MACROS_006 919 /* "Missing argument after ','" */
#define HELP_SPLIB_MACROS_007 920 /* "No more than 10 args allowed" */
#define HELP_SPLIB_MACROS_008 921 /* "Misformed argument list" */
#define HELP_SPLIB_MACROS_009 922 /* "No .FUNC definition" */
#define HELP_SPLIB_MACROS_010 923 /* "Character '%' not allowed" */
#define HELP_SPLIB_MACROS_011 924 /* ".FUNC does not agree with previous instance" */
#define HELP_SPLIB_MACROS_012 925 /* "Argument list does not agree with previous instance" */
#define HELP_SPLIB_MACROS_013 HELP_SPLIB_DIGSTM_051 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_MEMORY_001 927 /* norm_msg */
#define HELP_SPLIB_MEMORY_002 928 /* norm_msg */
#define HELP_SPLIB_MEMORY_003 929 /* "NULL target for strcpy()" */
#define HELP_SPLIB_MEMORY_004 930 /* "NULL source for strcpy()" */
#define HELP_SPLIB_MEMORY_005 931 /* "Target for strcpy() too small" */
#define HELP_SPLIB_MEMORY_006 932 /* "Source/target overlap for strcpy()" */
#define HELP_SPLIB_MEMORY_007 933 /* "NULL target for strcat()" */
#define HELP_SPLIB_MEMORY_008 934 /* "NULL source for strcat()" */
#define HELP_SPLIB_MEMORY_009 935 /* "Target for strcat() too small" */
#define HELP_SPLIB_MEMORY_010 936 /* "Source/target overlap for strcat()" */
#define HELP_SPLIB_MEMORY_011 937 /* "NULL target for memcpy()" */
#define HELP_SPLIB_MEMORY_012 938 /* "NULL source for memcpy()" */
#define HELP_SPLIB_MEMORY_013 939 /* "Target for memcpy() too small" */
#define HELP_SPLIB_MEMORY_014 940 /* "Source/target overlap for memcpy()" */
#define HELP_SPLIB_MEMORY_015 941 /* "NULL target for memmove()" */
#define HELP_SPLIB_MEMORY_016 942 /* "NULL source for memmove()" */
#define HELP_SPLIB_MEMORY_017 943 /* "Target for memmove() too small" */
#define HELP_SPLIB_MEMORY_018 944 /* "Source/target overlap for mmemmove()" */
#define HELP_SPLIB_MODEL_001 945 /* <Missing> ModelName */
#define HELP_SPLIB_MODEL_002 946 /* <Missing> ModelName */
#define HELP_SPLIB_MODEL_003 947 /* "Digital Files Option not present" */
#define HELP_SPLIB_MODEL_004 948 /* "Invalid format for DEV or LOT Keyword" */
#define HELP_SPLIB_MODEL_005 949 /* "Conflicting Distribution" */
#define HELP_SPLIB_MODEL_006 950 /* "Too many tolerances" */
#define HELP_SPLIB_MODEL_007 951 /* tmpbuf */
#define HELP_SPLIB_MODEL_008 HELP_SPLIB_DGEXPDEV_135 /* "Missing value" */
#define HELP_SPLIB_MODEL_009 HELP_SPLIB_MACROS_013 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_MODEL_010 HELP_SPLIB_MODEL_009 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_MODEL_011 955 /* s */
#define HELP_SPLIB_MODEL_012 956 /* s */
#define HELP_SPLIB_PARAMS_001 957 /* "junk type(%d) to AddParam" */
#define HELP_SPLIB_PARAMS_002 HELP_SPLIB_PARAMS_001 /* "junk type(%d) to AddParam" */
#define HELP_SPLIB_PARAMS_003 959 /* BadExpressionError */
#define HELP_SPLIB_PARAMS_004 960 /* BadExpressionError */
#define HELP_SPLIB_PARAMS_005 961 /* "(Param) p=%8lx type=%d ppt=%d" */
#define HELP_SPLIB_PARAMS_006 962 /* "Can't find param index %d" */
#define HELP_SPLIB_PARAMS_007 -963 /* "Undefined parameter: %s" */
#define HELP_SPLIB_PLSYNTV_001 964 /* "Expecting device number" */
#define HELP_SPLIB_PLSYNTV_002 965 /* "Invalid device number, expecting 1-20" */
#define HELP_SPLIB_PLSYNTV_003 966 /* "Expecting pin type" */
#define HELP_SPLIB_PLSYNTV_004 967 /* "Expecting INPUT, OUTPUT, TRISTATE" */
#define HELP_SPLIB_PLSYNTV_005 HELP_SP1_VECTOR_003 /* "Missing node name" */
#define HELP_SPLIB_PLSYNTV_006 969 /* "Expecting database name" */
#define HELP_SPLIB_PLSYNTV_007 -970 /* "Missing device name" */
#define HELP_SPLIB_PLSYNTV_008 971 /* "Missing enable node" */
#define HELP_SPLIB_PLSYNTV_009 972 /* "Unable to allocate pin" */
#define HELP_SPLIB_PRNTPLOT_001 973 /* "Missing analysis type" */
#define HELP_SPLIB_PRNTPLOT_002 974 /* "Invalid analysis type" */
#define HELP_SPLIB_PRNTPLOT_003 975 /* "Digital change format only allowed for TRANSIENT analysis" */
#define HELP_SPLIB_PRNTPLOT_004 976 /* "Invalid analysis type, must be TRAN" */
#define HELP_SPLIB_PRNTPLOT_005 977 /* "Missing frequency" */
#define HELP_SPLIB_PRNTPLOT_006 978 /* "Missing output variable" */
#define HELP_SPLIB_PRNTPLOT_007 979 /* "Number of harmonics must be greater than 0" */
#define HELP_SPLIB_PRNTPLOT_008 980 /* func */
#define HELP_SPLIB_PRNTPLOT_009 981 /* "TIME required with REPEAT keyword" */
#define HELP_SPLIB_PRNTPLOT_010 982 /* InvalidOption */
#define HELP_SPLIB_PRNTPLOT_011 983 /* "REPEAT keyword permitted only with TRANsient analysis." */
#define HELP_SPLIB_PRNTPLOT_012 984 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_013 985 /* "TIME keyword permitted only with TRANsient analysis." */
#define HELP_SPLIB_PRNTPLOT_014 986 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_015 987 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_016 988 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_017 989 /* InvalidOption */
#define HELP_SPLIB_PRNTPLOT_018 990 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_019 991 /* "DC keyword permitted only with DC analysis." */
#define HELP_SPLIB_PRNTPLOT_020 992 /* <Missing> MissingValue */
#define HELP_SPLIB_PRNTPLOT_021 993 /* ".SAVEBIAS" */
#define HELP_SPLIB_PRNTPLOT_022 HELP_SPLIB_PRNTPLOT_009 /* "TIME required with REPEAT keyword" */
#define HELP_SPLIB_PRNTPLOT_023 995 /* "Missing output variables" */
#define HELP_SPLIB_PRNTPLOT_024 996 /* "Incomplete range" */
#define HELP_SPLIB_PRNTPLOT_025 997 /* "Missing INOISE or ONOISE" */
#define HELP_SPLIB_PRNTPLOT_026 998 /* "Must be INOISE or ONOISE" */
#define HELP_SPLIB_PRNTPLOT_027 -999 /* "Must be D" */
#define HELP_SPLIB_PRNTPLOT_028 -1000 /* "Must be I or V or D" */
#define HELP_SPLIB_PRNTPLOT_029 -101001 /* "Must be I or V" */
#define HELP_SPLIB_PRNTPLOT_030 -1002 /* "Must be V" */
#define HELP_SPLIB_PRNTPLOT_031 -101003 /* "Must be I or V, D not allowed" */
#define HELP_SPLIB_PRNTPLOT_032 1004 /* "B or H not allowed" */
#define HELP_SPLIB_PRNTPLOT_033 1005 /* <Missing> DeviceOrNode */
#define HELP_SPLIB_PRNTPLOT_034 1006 /* "Group delay not allowed" */
#define HELP_SPLIB_PRNTPLOT_035 1007 /* <Missing> DeviceOrNode */
#define HELP_SPLIB_PRNTPLOT_036 1008 /* <Missing> DeviceOrNode */
#define HELP_SPLIB_PRNTPLOT_037 1009 /* "Must be an independent V source" */
#define HELP_SPLIB_PRNTPLOT_038 1010 /* "Must be a transformer core (K)" */
#define HELP_SPLIB_PRNTPLOT_039 -101011 /* "I(node) is not valid" */
#define HELP_SPLIB_PRNTPLOT_040 1012 /* "Unable to process digital nodes" */
#define HELP_SPLIB_PRNTPLOT_041 1013 /* "Digital net out of sequence" */
#define HELP_SPLIB_PRNTPLOT_042 1014 /* "Unable to process analog nodes and devices" */
#define HELP_SPLIB_PRNTPLOT_043 1015 /* "Missing second node in V(node1,node2)" */
#define HELP_SPLIB_PRNTPLOT_044 1016 /* "Must be a two terminal device" */
#define HELP_SPLIB_PRNTPLOT_045 1017 /* "Invalid port name for transmission line" */
#define HELP_SPLIB_PRNTPLOT_046 1018 /* "Must be a semiconductor" */
#define HELP_SPLIB_PRNTPLOT_047 1019 /* "Invalid terminal abbreviation for device" */
#define HELP_SPLIB_PRNTPLOT_048 1020 /* "Only one of .PROBE and .PROBE/CSDF allowed per circuit file" */
#define HELP_SPLIB_PRNTPLOT_049 1021 /* "Missing source" */
#define HELP_SPLIB_PRNTPLOT_050 -101022 /* "Must be independent source (I or V)" */
#define HELP_SPLIB_PRNTPLOT_051 1023 /* "Invalid print interval" */
#define HELP_SPLIB_PRNTPLOT_052 1024 /* "The BASIC Package does not support .SAVEBIAS" */
#define HELP_SPLIB_PRNTPLOT_053 HELP_SP4_BIASPNT_002 /* "Unable to open .SAVEBIAS file" */
#define HELP_SPLIB_SPDGEVAL_001 1026 /* "STIM device %s - internal error processing transition data." */
#define HELP_SPLIB_SPDGEVAL_002 1027 /* "Time must advance on STIM transition, device %s\n" */
#define HELP_SPLIB_SPDGEVAL_003 1028 /* "Device %s - Overflow converting stimulus time %s to ticks" */
#define HELP_SPLIB_SPDGEVAL_004 1029 /* "Device %s Overflow converting stimulus stepsize to ticks" */
#define HELP_SPLIB_SPDGEVAL_005 1030 /* "%s has more than one command at time %s\nwith digital time resolution (1/DIGFREQ) of %s" */
#define HELP_SPLIB_SPDGEVAL_006 1031 /* "%s has transitions out of time-order, at %s\n" */
#define HELP_SPLIB_SPDIGRD_001 1032 /* "Digital Simulator Option not present" */
#define HELP_SPLIB_SPDIGRD_002 1033 /* DevNotAllowed */
#define HELP_SPLIB_SPDIGRD_003 1034 /* "Missing device parmeters" */
#define HELP_SPLIB_SPDIGRD_004 1035 /* "31 bit max" */
#define HELP_SPLIB_SPDIGRD_005 HELP_SPLIB_SPDIGRD_004 /* "31 bit max" */
#define HELP_SPLIB_SPDIGRD_006 1037 /* error_msg */
#define HELP_SPLIB_SPDIGRD_007 1038 /* error_msg */
#define HELP_SPLIB_SPDIGRD_008 1039 /* error_msg */
#define HELP_SPLIB_SPDIGRD_009 1040 /* "number of nodes must be greater than zero" */
#define HELP_SPLIB_SPDIGRD_010 1041 /* "Too few nodes or missing digital power supply node" */
#define HELP_SPLIB_SPDIGRD_011 1042 /* "Too few nodes or missing digital ground node" */
#define HELP_SPLIB_SPDIGRD_012 1043 /* "Unable to allocate memory for data storage" */
#define HELP_SPLIB_SPDIGRD_013 HELP_SPLIB_SPDIGRD_012 /* "Unable to allocate memory for data storage" */
#define HELP_SPLIB_SPDIGRD_014 1045 /* "PLSYN devices not supported" */
#define HELP_SPLIB_SPDIGRD_015 1046 /* "Too few nodes, or no model name" */
#define HELP_SPLIB_SPDIGRD_016 1047 /* "Too few nodes, or no IO model name" */
#define HELP_SPLIB_SPDIGRD_017 HELP_SPLIB_DIGSTM_077 /* "Missing file name" */
#define HELP_SPLIB_SPDIGRD_018 HELP_SPLIB_DIGSTM_079 /* "Unknown parameter" */
#define HELP_SPLIB_SPDIGRD_019 1050 /* DevNotAllowed */
#define HELP_SPLIB_SPDIGRD_020 1051 /* "Missing primitive type" */
#define HELP_SPLIB_SPDIGRD_021 1052 /* "digital net out of sequence" */
#define HELP_SPLIB_SPDIGRD_022 HELP_SPLIB_DGEXPDEV_130 /* "Missing node" */
#define HELP_SPLIB_SPDIGRD_023 1054 /* "Evaluation version digital node limit reached. (%d nodes)" */
#define HELP_SPLIB_SPDIGRD_024 -101055 /* "DIGITAL NODE TABLE OVERFLOW" */
#define HELP_SPLIB_SPDIGRD_025 1056 /* "No data found" */
#define HELP_SPLIB_SPDIGRD_026 1057 /* "Data must start with B (binary), O (octal), or X (hex)" */
#define HELP_SPLIB_SPDIGRD_027 1058 /* "Data must be enclosed in '$'" */
#define HELP_SPLIB_SPDIGRD_028 1059 /* "Expecting more data, must end with '$'" */
#define HELP_SPLIB_SPDIGRD_029 1060 /* "Too much data" */
#define HELP_SPLIB_SPDIGRD_030 1061 /* "Data must be 0 or 1" */
#define HELP_SPLIB_SPDIGRD_031 HELP_SPLIB_SPDIGRD_029 /* "Too much data" */
#define HELP_SPLIB_SPDIGRD_032 1063 /* "Octal data must be 0-7" */
#define HELP_SPLIB_SPDIGRD_033 HELP_SPLIB_SPDIGRD_031 /* "Too much data" */
#define HELP_SPLIB_SPDIGRD_034 1065 /* "Hex data must be 0-9 or A-F" */
#define HELP_SPLIB_SPDIGRD_035 1066 /* "Missing part index" */
#define HELP_SPLIB_SPDIGRD_036 1067 /* "Value must be from 1 to 20" */
#define HELP_SPLIB_SPDIGRD_037 1068 /* "missing nodes" */
#define HELP_SPLIB_SPDIGRD_038 HELP_SPLIB_MODEL_008 /* "Missing value" */
#define HELP_SPLIB_SPDIGRD_039 HELP_SPLIB_SPDIGRD_038 /* "Missing value" */
#define HELP_SPLIB_SPDIGRD_040 -1071 /* "Expression not allowed here" */
#define HELP_SPLIB_SPDIGRD_041 1072 /* "Test vector sample window must be >= 0" */
#define HELP_SPLIB_SPDIGRD_042 HELP_SPLIB_SPDIGRD_017 /* "Missing file name" */
#define HELP_SPLIB_SPDIGRD_043 HELP_SPLIB_SPDIGRD_040 /* "Expression not allowed here" */
#define HELP_SPLIB_SPDIGRD_044 1075 /* "Hey, don't set PLSYN on a PLSYN device" */
#define HELP_SPLIB_SPDIGRD_045 HELP_SPLIB_SPDIGRD_018 /* "Unknown parameter" */
#define HELP_SPLIB_SPDIGRD_046 1077 /* "Database name not specified" */
#define HELP_SPLIB_SPDIGRD_047 1078 /* "Unable to open temporary file" */
#define HELP_SPLIB_SPDIGRD_048 1079 /* "Unable to start \"plsyntrn\" to translate database." */
#define HELP_SPLIB_SPDOTCRD_001 1080 /* "Missing sweep type" */
#define HELP_SPLIB_SPDOTCRD_002 1081 /* "Invalid sweep type" */
#define HELP_SPLIB_SPDOTCRD_003 -1082 /* "Missing parameter" */
#define HELP_SPLIB_SPDOTCRD_004 HELP_SPLIB_DIGSTM_070 /* "Invalid value" */
#define HELP_SPLIB_SPDOTCRD_005 HELP_SPLIB_SPDOTCRD_003 /* "Missing parameter" */
#define HELP_SPLIB_SPDOTCRD_006 1085 /* "Invalid global param name" */
#define HELP_SPLIB_SPDOTCRD_007 1086 /* "Sweep model type - cannot sweep U model parameters" */
#define HELP_SPLIB_SPDOTCRD_008 -101087 /* "Not a valid parameter for model type" */
#define HELP_SPLIB_SPDOTCRD_008a 11087 /* "parameter cannot be swept" */
#define HELP_SPLIB_SPDOTCRD_008b 21087 /* "\"LEVEL\" parameter cannot be swept" */
#define HELP_SPLIB_SPDOTCRD_009 -101088 /* "Must be 'I' or 'V'" */
#define HELP_SPLIB_SPDOTCRD_010 1089 /* "Must be TEMP or PARAM" */
#define HELP_SPLIB_SPDOTCRD_011 1090 /* "Cannot use LIST with DEC or OCT sweeps" */
#define HELP_SPLIB_SPDOTCRD_012 1091 /* "No values in list" */
#define HELP_SPLIB_SPDOTCRD_013 1092 /* "Too many items in list" */
#define HELP_SPLIB_SPDOTCRD_014 1093 /* "Must be monotonically increasing or decreasing" */
#define HELP_SPLIB_SPDOTCRD_015 1094 /* "Invalid start value" */
#define HELP_SPLIB_SPDOTCRD_016 1095 /* "Invalid increment" */
#define HELP_SPLIB_SPDOTCRD_017 1096 /* "Invalid step size" */
#define HELP_SPLIB_SPDOTCRD_018 1097 /* "Missing node list" */
#define HELP_SPLIB_SPDOTCRD_019 1098 /* "Must be V or I" */
#define HELP_SPLIB_SPDOTCRD_020 -101099 /* "Missing node number" */
#define HELP_SPLIB_SPDOTCRD_021 HELP_SPLIB_PLSYNTV_007 /* "Missing device name" */
#define HELP_SPLIB_SPDOTCRD_022 1101 /* "Node %s is not present in the circuit file\n" */
#define HELP_SPLIB_SPDOTCRD_023 1102 /* "Device %s is not present in the circuit file\n" */
#define HELP_SPLIB_SPDOTCRD_024 1103 /* "Missing 2nd node number" */
#define HELP_SPLIB_SPDOTCRD_025 1104 /* "Device must be V, E, H, or L" */
#define HELP_SPLIB_SPDOTCRD_026 1105 /* "Device must be an inductor" */
#define HELP_SPLIB_SPDOTCRD_027 1106 /* "Missing positive node number" */
#define HELP_SPLIB_SPDOTCRD_028 1107 /* "Node's voltage already set" */
#define HELP_SPLIB_SPDOTCRD_029 1108 /* "Device's current already set" */
#define HELP_SPLIB_SPDOTCRD_030 HELP_SPLIB_SPDOTCRD_028 /* "Node's voltage already set" */
#define HELP_SPLIB_SPDOTCRD_031 HELP_SPLIB_SPDOTCRD_029 /* "Device's current already set" */
#define HELP_SPLIB_SPDOTCRD_032 1111 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_033 HELP_SPLIB_MODEL_010 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPDOTCRD_034 1113 /* "requires Digital Option" */
#define HELP_SPLIB_SPDOTCRD_035 1114 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_036 1115 /* <Missing> DistributionName */
#define HELP_SPLIB_SPDOTCRD_037 1116 /* "undefined .OPTION" */
#define HELP_SPLIB_SPDOTCRD_038 1117 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_039 1118 /* "WIDTH must be 80 or 132" */
#define HELP_SPLIB_SPDOTCRD_040 1119 /* junk */
#define HELP_SPLIB_SPDOTCRD_041 1120 /* "DIGDRVZ must be greater than DIGDRVF" */
#define HELP_SPLIB_SPDOTCRD_042 1121 /* "DIGMNTYSCALE must be > 0.0 and <= 1.0" */
#define HELP_SPLIB_SPDOTCRD_043 1122 /* "DIGTYMXSCALE must be >= 1.0" */
#define HELP_SPLIB_SPDOTCRD_044 1123 /* "DIGWCSCALE must be > 0.0 and <= 1.0" */
#define HELP_SPLIB_SPDOTCRD_045 1124 /* "Missing temperature" */
#define HELP_SPLIB_SPDOTCRD_046 1125 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_047 HELP_SPLIB_SPDOTCRD_004 /* "Invalid value" */
#define HELP_SPLIB_SPDOTCRD_048 1127 /* "Undefined parameter" */
#define HELP_SPLIB_SPDOTCRD_049 1128 /* "Invalid .WIDTH card" */
#define HELP_SPLIB_SPDOTCRD_050 1129 /* "Missing run count" */
#define HELP_SPLIB_SPDOTCRD_051 1130 /* "Run count must be > 1 and <= 2000" */
#define HELP_SPLIB_SPDOTCRD_052 1131 /* "Only .AC .DC and .TRAN valid" */
#define HELP_SPLIB_SPDOTCRD_053 1132 /* "Missing function" */
#define HELP_SPLIB_SPDOTCRD_054 1133 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_055 1134 /* "Invalid function" */
#define HELP_SPLIB_SPDOTCRD_056 1135 /* "Missing DEV, LOT, or BOTH" */
#define HELP_SPLIB_SPDOTCRD_057 1136 /* "Invalid .. must be DEV, LOT or BOTH" */
#define HELP_SPLIB_SPDOTCRD_058 1137 /* <Missing> MissingValue */
#define HELP_SPLIB_SPDOTCRD_059 1138 /* "Must be in range 0 < value < 100%" */
#define HELP_SPLIB_SPDOTCRD_060 1139 /* "Missing seed" */
#define HELP_SPLIB_SPDOTCRD_061 1140 /* "Must be >= 1" */
#define HELP_SPLIB_SPDOTCRD_062 1141 /* "Missing list of runs" */
#define HELP_SPLIB_SPDOTCRD_063 1142 /* "Invalid run number" */
#define HELP_SPLIB_SPDOTCRD_064 1143 /* "Missing device List" */
#define HELP_SPLIB_SPDOTCRD_065 1144 /* "Only A-Z permitted" */
#define HELP_SPLIB_SPDOTCRD_066 1145 /* "Invalid Range" */
#define HELP_SPLIB_SPDOTCRD_067 1146 /* "Invalid option" */
#define HELP_SPLIB_SPDOTCRD_068 1147 /* "Not valid for .WCASE" */
#define HELP_SPLIB_SPDOTCRD_069 1148 /* "Not valid for .MC" */
#define HELP_SPLIB_SPDOTCRD_070 1149 /* <Missing> DistributionName */
#define HELP_SPLIB_SPDOTCRD_071 1150 /* "Distribution processing" */
#define HELP_SPLIB_SPDOTCRD_072 1151 /* "Valid range is -1.0 <= X <= 1.0" */
#define HELP_SPLIB_SPDOTCRD_073 1152 /* "X value must not decrease" */
#define HELP_SPLIB_SPDOTCRD_074 1153 /* "Values must be in pairs" */
#define HELP_SPLIB_SPDOTCRD_075 -1154 /* "Probability must not be less than 0." */
#define HELP_SPLIB_SPDOTCRD_076 -1155 /* "At least two pairs of numbers necessary" */
#define HELP_SPLIB_SPDOTCRD_077 -1156 /* "Please Simplify .. distribution too complicated" */
#define HELP_SPLIB_SPDOTCRD_078 1157 /* "Param name" */
#define HELP_SPLIB_SPDOTCRD_079 1158 /* "Duplicate or reserved param name" */
#define HELP_SPLIB_SPDOTCRD_080 1159 /* "Missing value for param" */
#define HELP_SPLIB_SPDOTCRD_081 1160 /* "Expression - use previously defined parameters only" */
#define HELP_SPLIB_SPDOTCRD_082 1161 /* "No params specified" */
#define HELP_SPLIB_SPDOTCRD_083 1162 /* "Text name" */
#define HELP_SPLIB_SPDOTCRD_084 1163 /* "Duplicate or reserved parameter name" */
#define HELP_SPLIB_SPDOTCRD_085 1164 /* "Missing value for Text" */
#define HELP_SPLIB_SPDOTCRD_086 HELP_SPLIB_SPDOTCRD_033 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPDOTCRD_087 1166 /* "No Text parameters specified" */
#define HELP_SPLIB_SPDOTCRD_088 1167 /* tmp */
#define HELP_SPLIB_SPREADIN_001 -1168 /* "Analog Simulator Option not present" */
#define HELP_SPLIB_SPREADIN_002 1169 /* <Missing> MissingModel */
#define HELP_SPLIB_SPREADIN_003 1170 /* <Missing> MissingValue */
#define HELP_SPLIB_SPREADIN_004 HELP_SPLIB_SPDOTCRD_086 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_005 1172 /* "Value may not be 0" */
#define HELP_SPLIB_SPREADIN_006 1173 /* <Missing> MissingValue */
#define HELP_SPLIB_SPREADIN_007 HELP_SPLIB_SPREADIN_004 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_008 HELP_SPLIB_SPREADIN_001 /* "Analog Simulator Option not present" */
#define HELP_SPLIB_SPREADIN_009 HELP_SPLIB_SPREADIN_007 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_010 HELP_SPLIB_SPREADIN_009 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_011 -1178 /* "Invalid parameter" */
#define HELP_SPLIB_SPREADIN_012 HELP_SPLIB_SPREADIN_010 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_013 1180 /* "Length must be less than 0.01 meter" */
#define HELP_SPLIB_SPREADIN_014 1181 /* <Missing> MissingModel */
#define HELP_SPLIB_SPREADIN_015 1182 /* "Missing voltage source name" */
#define HELP_SPLIB_SPREADIN_016 1183 /* "Must be a voltage source name" */
#define HELP_SPLIB_SPREADIN_017 1184 /* "Missing inductor" */
#define HELP_SPLIB_SPREADIN_018 1185 /* "Must be a transmission line" */
#define HELP_SPLIB_SPREADIN_019 1186 /* "Must be an inductor" */
#define HELP_SPLIB_SPREADIN_020 1187 /* "Must be an inductor or transmission line" */
#define HELP_SPLIB_SPREADIN_021 1188 /* "Too many inductors" */
#define HELP_SPLIB_SPREADIN_022 1189 /* "Too many transmission lines" */
#define HELP_SPLIB_SPREADIN_023 -1190 /* "Inductor part of this K device" */
#define HELP_SPLIB_SPREADIN_024 -1191 /* "Inductor part of another core device" */
#define HELP_SPLIB_SPREADIN_025 -1192 /* "Transmission line part of this K device" */
#define HELP_SPLIB_SPREADIN_026 HELP_SPLIB_SPREADIN_012 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_027 1194 /* "Coupling coefficient out of range: -1 <= x <= 1" */
#define HELP_SPLIB_SPREADIN_028 1195 /* "Mutual inductance" */
#define HELP_SPLIB_SPREADIN_029 HELP_SPLIB_SPREADIN_026 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_030 HELP_SPLIB_SPREADIN_028 /* "Mutual inductance" */
#define HELP_SPLIB_SPREADIN_031 1198 /* "Missing Mutual Capacitance" */
#define HELP_SPLIB_SPREADIN_032 HELP_SPLIB_SPREADIN_029 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_033 1200 /* "Mutual capacitance" */
#define HELP_SPLIB_SPREADIN_034 1201 /* "Inductor: mutual coupling requires two (or more)" */
#define HELP_SPLIB_SPREADIN_035 1202 /* "Inductor(s) part of another mutual coupling device" */
#define HELP_SPLIB_SPREADIN_036 HELP_SPLIB_SPREADIN_032 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_037 1204 /* "Size" */
#define HELP_SPLIB_SPREADIN_038 1205 /* MustHaveAS */
#define HELP_SPLIB_SPREADIN_039 1206 /* <Missing> MissingModel */
#define HELP_SPLIB_SPREADIN_040 1207 /* <Missing> MissingValue */
#define HELP_SPLIB_SPREADIN_041 HELP_SPLIB_SPREADIN_036 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_042 1209 /* <Missing> MissingValue */
#define HELP_SPLIB_SPREADIN_043 HELP_SPLIB_SPREADIN_041 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_044 1211 /* UnknownParameter */
#define HELP_SPLIB_SPREADIN_045 HELP_SPLIB_DIGSTM_076 /* "Missing IO model" */
#define HELP_SPLIB_SPREADIN_046 1213 /* UnknownParameter */
#define HELP_SPLIB_SPREADIN_047 1214 /* MustHaveAS */
#define HELP_SPLIB_SPREADIN_048 1215 /* <Missing> MissingModel */
#define HELP_SPLIB_SPREADIN_049 1216 /* <Missing> MissingValue */
#define HELP_SPLIB_SPREADIN_050 HELP_SPLIB_SPREADIN_043 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_051 1218 /* UnknownParameter */
#define HELP_SPLIB_SPREADIN_052 HELP_SPLIB_SPREADIN_045 /* "Missing IO model" */
#define HELP_SPLIB_SPREADIN_053 1220 /* UnknownParameter */
#define HELP_SPLIB_SPREADIN_054 1221 /* "No LEN parameter specified" */
#define HELP_SPLIB_SPREADIN_055 HELP_SPLIB_SPREADIN_050 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_056 HELP_SPLIB_SPREADIN_055 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_057 HELP_SPLIB_SPREADIN_056 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_058 HELP_SPLIB_SPREADIN_057 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_059 -1226 /* "Use RLGC & LEN for lossy line" */
#define HELP_SPLIB_SPREADIN_060 1227 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_061 HELP_SPLIB_SPREADIN_059 /* "Use RLGC & LEN for lossy line" */
#define HELP_SPLIB_SPREADIN_062 1229 /* "Incompatible with F" */
#define HELP_SPLIB_SPREADIN_063 1230 /* "Incompatible with NL" */
#define HELP_SPLIB_SPREADIN_064 HELP_SPLIB_SPREADIN_060 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_065 HELP_SPLIB_SPREADIN_061 /* "Use RLGC & LEN for lossy line" */
#define HELP_SPLIB_SPREADIN_066 1233 /* "Incompatible with TD" */
#define HELP_SPLIB_SPREADIN_067 HELP_SPLIB_SPREADIN_064 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_068 HELP_SPLIB_SPREADIN_065 /* "Use RLGC & LEN for lossy line" */
#define HELP_SPLIB_SPREADIN_069 HELP_SPLIB_SPREADIN_066 /* "Incompatible with TD" */
#define HELP_SPLIB_SPREADIN_070 HELP_SPLIB_SPREADIN_067 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_071 HELP_SPLIB_SPREADIN_058 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_072 -1239 /* "Use Z0 & TD or F/NL for ideal line" */
#define HELP_SPLIB_SPREADIN_073 HELP_SPLIB_SPREADIN_072 /* "Use Z0 & TD or F/NL for ideal line" */
#define HELP_SPLIB_SPREADIN_074 HELP_SPLIB_SPREADIN_070 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_075 HELP_SPLIB_SPREADIN_073 /* "Use Z0 & TD or F/NL for ideal line" */
#define HELP_SPLIB_SPREADIN_076 HELP_SPLIB_SPREADIN_074 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_077 HELP_SPLIB_SPREADIN_075 /* "Use Z0 & TD or F/NL for ideal line" */
#define HELP_SPLIB_SPREADIN_078 HELP_SPLIB_SPREADIN_077 /* "Use Z0 & TD or F/NL for ideal line" */
#define HELP_SPLIB_SPREADIN_079 HELP_SPLIB_SPREADIN_076 /* "Laplace expression not allowed" */
#define HELP_SPLIB_SPREADIN_080 HELP_SPLIB_SPREADIN_071 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_081 -1248 /* "Z0 or RLGC parameters must be specified" */
#define HELP_SPLIB_SPREADIN_082 -1249 /* "TD or F must be specified" */
#define HELP_SPLIB_SPREADIN_083 1250 /* "Conflicting length" */
#define HELP_SPLIB_SPREADIN_084 HELP_SPLIB_SPREADIN_083 /* "Conflicting length" */
#define HELP_SPLIB_SPREADIN_085 HELP_SPLIB_SPREADIN_084 /* "Conflicting length" */
#define HELP_SPLIB_SPREADIN_086 1253 /* "Must specify R" */
#define HELP_SPLIB_SPREADIN_087 1254 /* "Must specify L" */
#define HELP_SPLIB_SPREADIN_088 1255 /* "Must specify G" */
#define HELP_SPLIB_SPREADIN_089 1256 /* "Must specify C" */
#define HELP_SPLIB_SPREADIN_090 1257 /* "Must specify LEN" */
#define HELP_SPLIB_SPREADIN_091 1258 /* junk */
#define HELP_SPLIB_SPREADIN_092 1259 /* <Missing> keyword */
#define HELP_SPLIB_SPREADIN_093 HELP_SPLIB_SPDIGRD_022 /* "Missing node" */
#define HELP_SPLIB_SPREADIN_094 1261 /* "Missing control node" */
#define HELP_SPLIB_SPREADIN_095 1262 /* "Missing controlling source" */
#define HELP_SPLIB_SPREADIN_096 1263 /* "Missing dimension" */
#define HELP_SPLIB_SPREADIN_097 1264 /* "Invalid dimension" */
#define HELP_SPLIB_SPREADIN_098 1265 /* EandGonly */
#define HELP_SPLIB_SPREADIN_099 HELP_SPLIB_SPREADIN_080 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_100 HELP_SPLIB_SPREADIN_099 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_101 1268 /* EandGonly */
#define HELP_SPLIB_SPREADIN_102 HELP_SPLIB_SPREADIN_100 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_103 1270 /* BadExpression */
#define HELP_SPLIB_SPREADIN_104 1271 /* EandGonly */
#define HELP_SPLIB_SPREADIN_105 HELP_SPLIB_SPREADIN_102 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_106 1273 /* BadExpression */
#define HELP_SPLIB_SPREADIN_107 1274 /* <Missing> TransferFunction */
#define HELP_SPLIB_SPREADIN_108 -1275 /* BadTransferFunction */
#define HELP_SPLIB_SPREADIN_109 1276 /* TransferTooComplicated */
#define HELP_SPLIB_SPREADIN_110 1277 /* EandGonly */
#define HELP_SPLIB_SPREADIN_111 HELP_SPLIB_SPREADIN_105 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_112 1279 /* BadExpression */
#define HELP_SPLIB_SPREADIN_113 1280 /* <Missing> TransferFunction */
#define HELP_SPLIB_SPREADIN_114 1281 /* BadTransferFunction */
#define HELP_SPLIB_SPREADIN_115 1282 /* TransferTooComplicated */
#define HELP_SPLIB_SPREADIN_116 1283 /* EandGonly */
#define HELP_SPLIB_SPREADIN_117 HELP_SPLIB_SPREADIN_111 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIN_118 1285 /* BadExpression */
#define HELP_SPLIB_SPREADIN_119 1286 /* OutOfMemory */
#define HELP_SPLIB_SPREADIN_120 HELP_SPLIB_PRNTPLOT_030 /* "Must be V" */
#define HELP_SPLIB_SPREADIN_121 1288 /* "Missing gain/transconductance/transresistance" */
#define HELP_SPLIB_SPREADIN_122 1289 /* OutOfMemory */
#define HELP_SPLIB_SPREADIN_123 1290 /* "Too many coefficients" */
#define HELP_SPLIB_SPREADIN_124 1291 /* OutOfMemory */
#define HELP_SPLIB_SPREADIN_125 1292 /* "Values must be monotonic increasing" */
#define HELP_SPLIB_SPREADIN_126 1293 /* "Frequency values must be monotonic increasing" */
#define HELP_SPLIB_SPREADIN_127 1294 /* "Missing polynomial" */
#define HELP_SPLIB_SPREADIN_128 1295 /* "Table must have even # entries" */
#define HELP_SPLIB_SPREADIN_129 1296 /* "Table must have # entries which are a multiple of 3" */
#define HELP_SPLIB_SPREADIN_130 1297 /* "Magnitude can not be negative" */
#define HELP_SPLIB_SPREADIN_131 1298 /* "Invalid filter type" */
#define HELP_SPLIB_SPREADIN_132 1299 /* WrongNumber */
#define HELP_SPLIB_SPREADIN_133 1300 /* WrongNumber */
#define HELP_SPLIB_SPREADIN_134 1301 /* "Laplace expression for filter too large" */
#define HELP_SPLIB_SPREADIN_135 1302 /* "Filter order too high" */
#define HELP_SPLIB_SPREADIN_136 11302 /* "TD must be positive for Ideal Transmission lines" */
#define HELP_SPLIB_SPREADIV_001 HELP_SPLIB_SPREADIN_117 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIV_002 1304 /* "Conflicting specifications" */
#define HELP_SPLIB_SPREADIV_003 1305 /* "At least two numeric values required" */
#define HELP_SPLIB_SPREADIV_004 1306 /* "Too many PWL corners" */
#define HELP_SPLIB_SPREADIV_005 1307 /* errmsg */
#define HELP_SPLIB_SPREADIV_006 1308 /* "missing STIMULUS name" */
#define HELP_SPLIB_SPREADIV_007 1309 /* "STIMULUS <name> must be last" */
#define HELP_SPLIB_SPREADIV_008 HELP_SPLIB_SPDIGRD_042 /* "Missing file name" */
#define HELP_SPLIB_SPREADIV_009 HELP_SP1_READIN_001 /* "Unable to open file" */
#define HELP_SPLIB_SPREADIV_010 1312 /* "Missing FOR or FOREVER" */
#define HELP_SPLIB_SPREADIV_011 -1313 /* "Missing REPEAT iteration count" */
#define HELP_SPLIB_SPREADIV_012 1314 /* "REPEAT iteration count must not be less than -1" */
#define HELP_SPLIB_SPREADIV_013 1315 /* "ENDREPEAT requires matching REPEAT" */
#define HELP_SPLIB_SPREADIV_014 HELP_SPLIB_SPDIGRD_039 /* "Missing value" */
#define HELP_SPLIB_SPREADIV_015 HELP_SPLIB_SPREADIV_001 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIV_016 1318 /* "TIME_SCALE_FACTOR must be positive" */
#define HELP_SPLIB_SPREADIV_017 HELP_SPLIB_SPREADIV_014 /* "Missing value" */
#define HELP_SPLIB_SPREADIV_018 HELP_SPLIB_SPREADIV_015 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIV_019 HELP_SPLIB_SPREADIV_018 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_SPREADIV_020 1322 /* "Time value must not be an expression" */
#define HELP_SPLIB_SPREADIV_021 1323 /* "Too many PWL items" */
#define HELP_SPLIB_SPREADIV_022 1324 /* "Time must not be negative" */
#define HELP_SPLIB_SPREADIV_023 1325 /* "Time must be increasing" */
#define HELP_SPLIB_SPREADIV_024 HELP_SPLIB_SPREADIV_017 /* "Missing value" */
#define HELP_SPLIB_SPREADIV_025 1327 /* "Last PWL pair incomplete" */
#define HELP_SPLIB_SPREADIV_026 1328 /* "Missing ENDREPEAT" */
#define HELP_SPLIB_SPREADIV_027 1329 /* "Problem locating Repeat N" */
#define HELP_SPLIB_SPREADIV_028 1330 /* "Problem locating Repeat ForEver" */
#define HELP_SPLIB_SPREADIV_029 1331 /* error_msg */
#define HELP_SPLIB_SPREADIV_030 1332 /* error_msg */
#define HELP_SPLIB_SPREADIV_031 1333 /* error_msg */
#define HELP_SPLIB_SPREADIV_032 1334 /* error_msg */
#define HELP_SPLIB_SPREADIV_033 HELP_SPLIB_SPREADIV_009 /* "Unable to open file" */
#define HELP_SPLIB_SPREADIV_034 1336 /* "Unable to re-open input file" */
#define HELP_SPLIB_SPREADIV_035 1337 /* "internal error reallocating iv_dev" */
#define HELP_SPLIB_SPREADIV_036 1338 /* errtxt */
#define HELP_SPLIB_SPREADIV_037 1339 /* "stimulus definition syntax error" */
#define HELP_SPLIB_SPREADIV_038 1340 /* "non-digital context ref U-STIM device" */
#define HELP_SPLIB_SPREADIV_039 1341 /* "internal error; callback w/ bad devtype" */
#define HELP_SPLIB_SPREADIV_040 HELP_SPLIB_SPREADIV_033 /* "Unable to open file" */
#define HELP_SPLIB_SPREADIV_041 1343 /* "Internal Error reading .STIMULUS" */
#define HELP_SPLIB_SPREADIV_042 -1344 /* "Invalid specification" */
#define HELP_SPLIB_SPREADIV_043 1345 /* "Invalid Specification" */
#define HELP_SPLIB_STADD_001 1346 /* "Name %s is defined more than once\n" */
#define HELP_SPLIB_STADD_002 1347 /* "Unknown Symbol Table type" */
#define HELP_SPLIB_STADD_003 HELP_SPLIB_STADD_002 /* "Unknown Symbol Table type" */
#define HELP_SPLIB_STADD_004 1349 /* "Bad node: %s" */
#define HELP_SPLIB_STADD_005 1350 /* "Not in expand" */
#define HELP_SPLIB_STADD_006 1351 /* "Internal: Bad find flag type in STAddEntry" */
#define HELP_SPLIB_STADD_007 1352 /* "Cannot delete symbol table entry" */
#define HELP_SPLIB_STADD_008 1353 /* "No more string memory in STDelEntry" */
#define HELP_SPLIB_STADD_009 1354 /* "No More String Memory in STChgName" */
#define HELP_SPLIB_STADD_010 1355 /* "STChgName: Can't find NTE1" */
#define HELP_SPLIB_STADD_011 1356 /* "STChgName: Can't find STE1" */
#define HELP_SPLIB_STADD_012 HELP_SPLIB_STADD_003 /* "Unknown Symbol Table type" */
#define HELP_SPLIB_STADD_013 1358 /* "Out of Node Table memory" */
#define HELP_SPLIB_STADD_014 1359 /* tmp_str */
#define HELP_SPLIB_STADD_015 1360 /* "Node Symbol Table Overflow" */
#define HELP_SPLIB_STADD_016 -1361 /* "Symbols Table overflow" */
#define HELP_SPLIB_STADD_017 1362 /* tmp_str */
#define HELP_SPLIB_STADD_018 1363 /* "Symbols table overflow" */
#define HELP_SPLIB_STADD_019 HELP_SP1_DISPLAY_002 /* "Out of Memory" */
#define HELP_SPLIB_STADD_020 HELP_SPLIB_STADD_019 /* "Out of Memory" */
#define HELP_SPLIB_STADD_021 1366 /* "Out of Memory for Symbol tables" */
#define HELP_SPLIB_STGET_001 HELP_SPLIB_STADD_012 /* "Unknown Symbol Table type" */
#define HELP_SPLIB_STMISC_001 1368 /* "Out of Memory for Symtab creation" */
#define HELP_SPLIB_STMISC_002 1369 /* "Out of memory for symbol table creation" */
#define HELP_SPLIB_STMISC_003 HELP_SPLIB_STGET_001 /* "Unknown Symbol Table type" */
#define HELP_SPLIB_STMISC_004 1371 /* "Unknown Symbol table type" */
#define HELP_SPLIB_STMISC_005 1372 /* errmsg */
#define HELP_SPLIB_STMISC_006 1373 /* "Node table entry out of bounds" */
#define HELP_SPLIB_STMISC_007 1374 /* errmsg */
#define HELP_SPLIB_STMISC_008 1375 /* "Symbol table entry out of bounds" */
#define HELP_SPLIB_SUBSTEXP_001 1376 /* CantFind */
#define HELP_SPLIB_SUBSTEXP_002 1377 /* "Resistor %s has zero value" */
#define HELP_SPLIB_SUBSTEXP_003 1378 /* "Mutual inductance of %s out of range -1 to 1" */
#define HELP_SPLIB_SUBSTEXP_004 1379 /* CantFind */
#define HELP_SPLIB_SYMTAB_001 1380 /* "Invalid nnn# in PrefixToken" */
#define HELP_SPLIB_SYMTAB_002 HELP_SP1_SUBXCUT_026 /* "Subcircuit %s is undefined" */
#define HELP_SPLIB_SYMTAB_003 HELP_SPLIB_SPREADIN_093 /* "Missing node" */
#define HELP_SPLIB_TOKEN_001 1383 /* Quoted_Str_Error */
#define HELP_SPLIB_TOKEN_002 1384 /* Quoted_Str_Error */
#define HELP_SPLIB_TOKEN_003 1385 /* Quoted_Str_Error */
#define HELP_SPLIB_TOKEN_004 1386 /* Quoted_Str_Error */
#define HELP_SPLIB_TOKEN_005 1387 /* Quoted_Str_Error */
#define HELP_SPLIB_TOKEN_006 1388 /* "Line too long. Limit is 132 characters." */
#define HELP_SPLIB_TOKEN_007 1389 /* "End of expression not seen" */
#define HELP_SPLIB_TOKEN_008 HELP_SPLIB_SPREADIV_019 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_TOKEN_009 HELP_SPLIB_TOKEN_008 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_TOKEN_010 -1392 /* "Bad value" */
#define HELP_SPLIB_TOKEN_011 HELP_SPLIB_SPREADIV_024 /* "Missing value" */
#define HELP_SPLIB_TOKEN_012 HELP_SPLIB_TOKEN_009 /* "Missing or Invalid Expression" */
#define HELP_SPLIB_TOKEN_013 HELP_SPLIB_TOKEN_010 /* "Bad value" */
#define HELP_SPLIB_TOKEN_014 HELP_SPLIB_TOKEN_011 /* "Missing value" */
#define HELP_SPLIB_TOKEN_015 HELP_SPLIB_SPREADIV_008 /* "Missing file name" */
#define HELP_SPLIB_TOKEN_016 HELP_SPLIB_TOKEN_015 /* "Missing file name" */
#define HELP_SPLIB_TOKEN_017 1399 /* "File name too long" */
#define HELP_SPLIB_TOKEN_018 1400 /* "Extra text on line" */
#define HELP_SPLIB_TOKEN_019 1401 /* "Hit Terminator while looking for end of repeat 0" */
#define HELP_SPLIB_SPDIGRD_049 1402 /* "The Basics+ Package does not support DLYLINE primitives" */
