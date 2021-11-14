#ifndef RTW_HEADER_CBE_145_HW4_P2b_h_
#define RTW_HEADER_CBE_145_HW4_P2b_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap_simtarget.h"
#ifndef CBE_145_HW4_P2b_COMMON_INCLUDES_
#define CBE_145_HW4_P2b_COMMON_INCLUDES_
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
#include "CBE_145_HW4_P2b_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME CBE_145_HW4_P2b
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
typedef struct { real_T mbpqptvvm1 ; real_T e1tmzpebsf ; real_T phnszncp2s ;
real_T ihzemdnzv0 ; } B ; typedef struct { struct { void * LoggedData [ 4 ] ;
} nohi400qfp ; struct { void * AQHandles ; } kwcxbruuhk ; struct { void *
AQHandles ; } eru1pev222 ; struct { void * AQHandles ; } ajcp31j4ow ; struct
{ void * AQHandles ; } doai0jpbq3 ; } DW ; typedef struct { real_T gwe4mjumpe
; real_T cinyvj15wo ; real_T o30sfyld1t ; } X ; typedef struct { real_T
gwe4mjumpe ; real_T cinyvj15wo ; real_T o30sfyld1t ; } XDot ; typedef struct
{ boolean_T gwe4mjumpe ; boolean_T cinyvj15wo ; boolean_T o30sfyld1t ; } XDis
; typedef struct { real_T gwe4mjumpe ; real_T cinyvj15wo ; real_T o30sfyld1t
; } CStateAbsTol ; typedef struct { real_T gwe4mjumpe ; real_T cinyvj15wo ;
real_T o30sfyld1t ; } CXPtMin ; typedef struct { real_T gwe4mjumpe ; real_T
cinyvj15wo ; real_T o30sfyld1t ; } CXPtMax ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
TFwhenK05CkW_A ; real_T TFwhenK05CkW_C ; real_T TFwhenK2CkW_A ; real_T
TFwhenK2CkW_C ; real_T TFwhenK5CkW_A ; real_T TFwhenK5CkW_C ; real_T
A1kWf5s1_Amp ; real_T A1kWf5s1_Bias ; real_T A1kWf5s1_Freq ; real_T
A1kWf5s1_Phase ; } ; extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern
B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_CBE_145_HW4_P2b_GetDWork ( ) ; extern void mr_CBE_145_HW4_P2b_SetDWork (
const mxArray * ssDW ) ; extern mxArray *
mr_CBE_145_HW4_P2b_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * CBE_145_HW4_P2b_GetCAPIStaticMap ( void ) ;
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
