#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "CBE_145_HW4_P2a_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#else
#include "builtin_typeid_types.h"
#include "CBE_145_HW4_P2a.h"
#include "CBE_145_HW4_P2a_capi.h"
#include "CBE_145_HW4_P2a_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"CBE_145_HW4_P2a/A = 1 kW, f = 5 s^-1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 ,
0 , 0 } , { 1 , 0 , TARGET_STRING ( "CBE_145_HW4_P2a/TF when tau = 0.4 min" )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 2 , 0 , TARGET_STRING (
"CBE_145_HW4_P2a/TF when tau = 1 min" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 ,
0 , 0 } , { 3 , 0 , TARGET_STRING ( "CBE_145_HW4_P2a/TF when tau = 3 min" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 4 , TARGET_STRING (
"CBE_145_HW4_P2a/A = 1 kW, f = 5 s^-1" ) , TARGET_STRING ( "Amplitude" ) , 0
, 0 , 0 } , { 5 , TARGET_STRING ( "CBE_145_HW4_P2a/A = 1 kW, f = 5 s^-1" ) ,
TARGET_STRING ( "Bias" ) , 0 , 0 , 0 } , { 6 , TARGET_STRING (
"CBE_145_HW4_P2a/A = 1 kW, f = 5 s^-1" ) , TARGET_STRING ( "Frequency" ) , 0
, 0 , 0 } , { 7 , TARGET_STRING ( "CBE_145_HW4_P2a/A = 1 kW, f = 5 s^-1" ) ,
TARGET_STRING ( "Phase" ) , 0 , 0 , 0 } , { 8 , TARGET_STRING (
"CBE_145_HW4_P2a/TF when tau = 0.4 min" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0
} , { 9 , TARGET_STRING ( "CBE_145_HW4_P2a/TF when tau = 0.4 min" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 10 , TARGET_STRING (
"CBE_145_HW4_P2a/TF when tau = 1 min" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0 }
, { 11 , TARGET_STRING ( "CBE_145_HW4_P2a/TF when tau = 1 min" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 12 , TARGET_STRING (
"CBE_145_HW4_P2a/TF when tau = 3 min" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0 }
, { 13 , TARGET_STRING ( "CBE_145_HW4_P2a/TF when tau = 3 min" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 }
} ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . lsz3uen22l , & rtB . fn0unh2ha3 ,
& rtB . i3f0e0wt1y , & rtB . no4iv1d1om , & rtP . A1kWf5s1_Amp , & rtP .
A1kWf5s1_Bias , & rtP . A1kWf5s1_Freq , & rtP . A1kWf5s1_Phase , & rtP .
TFwhentau04min_A , & rtP . TFwhentau04min_C , & rtP . TFwhentau1min_A , & rtP
. TFwhentau1min_C , & rtP . TFwhentau3min_A , & rtP . TFwhentau3min_C , } ;
static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , (
int8_T ) 0 , ( uint8_T ) 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 4 , rtRootInputs , 0 , rtRootOutputs , 0 } ,
{ rtBlockParameters , 10 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 1812776681U , 3058981147U , 3822591189U ,
2523459939U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ;
const rtwCAPI_ModelMappingStaticInfo * CBE_145_HW4_P2a_GetCAPIStaticMap (
void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void CBE_145_HW4_P2a_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( (
* rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void CBE_145_HW4_P2a_host_InitializeDataMapInfo (
CBE_145_HW4_P2a_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap ->
mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
