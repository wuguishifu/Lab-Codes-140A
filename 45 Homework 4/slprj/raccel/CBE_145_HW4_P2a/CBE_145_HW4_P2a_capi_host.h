#ifndef RTW_HEADER_CBE_145_HW4_P2a_cap_host_h_
#define RTW_HEADER_CBE_145_HW4_P2a_cap_host_h_
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
CBE_145_HW4_P2a_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void CBE_145_HW4_P2a_host_InitializeDataMapInfo (
CBE_145_HW4_P2a_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
