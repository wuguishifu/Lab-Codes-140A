#ifndef RTW_HEADER_CBE_145_HW4_P2a_h_
#define RTW_HEADER_CBE_145_HW4_P2a_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap_simtarget.h"
#ifndef CBE_145_HW4_P2a_COMMON_INCLUDES_
#define CBE_145_HW4_P2a_COMMON_INCLUDES_
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "CBE_145_HW4_P2a_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME CBE_145_HW4_P2a
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (4) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (3)   
#elif NCSTATES != 3
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T fn0unh2ha3 ; real_T i3f0e0wt1y ; real_T no4iv1d1om ;
real_T lsz3uen22l ; } B ; typedef struct { struct { void * LoggedData [ 4 ] ;
} i4nd2wja0w ; struct { void * AQHandles ; } ovxpqunp15 ; struct { void *
AQHandles ; } lornky1dlc ; struct { void * AQHandles ; } lzd3oqczul ; struct
{ void * AQHandles ; } fdree3snwc ; } DW ; typedef struct { real_T folfyo5vrc
; real_T c0xqkfbiom ; real_T i0so0rvfsc ; } X ; typedef struct { real_T
folfyo5vrc ; real_T c0xqkfbiom ; real_T i0so0rvfsc ; } XDot ; typedef struct
{ boolean_T folfyo5vrc ; boolean_T c0xqkfbiom ; boolean_T i0so0rvfsc ; } XDis
; typedef struct { real_T folfyo5vrc ; real_T c0xqkfbiom ; real_T i0so0rvfsc
; } CStateAbsTol ; typedef struct { real_T folfyo5vrc ; real_T c0xqkfbiom ;
real_T i0so0rvfsc ; } CXPtMin ; typedef struct { real_T folfyo5vrc ; real_T
c0xqkfbiom ; real_T i0so0rvfsc ; } CXPtMax ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
TFwhentau04min_A ; real_T TFwhentau04min_C ; real_T TFwhentau1min_A ; real_T
TFwhentau1min_C ; real_T TFwhentau3min_A ; real_T TFwhentau3min_C ; real_T
A1kWf5s1_Amp ; real_T A1kWf5s1_Bias ; real_T A1kWf5s1_Freq ; real_T
A1kWf5s1_Phase ; } ; extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern
B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_CBE_145_HW4_P2a_GetDWork ( ) ; extern void mr_CBE_145_HW4_P2a_SetDWork (
const mxArray * ssDW ) ; extern mxArray *
mr_CBE_145_HW4_P2a_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * CBE_145_HW4_P2a_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern
const int_T gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
extern const int_T gblNumRootInportBlks ; extern const int_T
gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ; extern
const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [ ] ;
extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ; extern const int_T gblParameterTuningTid ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
