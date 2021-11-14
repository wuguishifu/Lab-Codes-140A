#include "CBE_145_HW4_P2a_capi_host.h"
static CBE_145_HW4_P2a_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        CBE_145_HW4_P2a_host_InitializeDataMapInfo(&(root), "CBE_145_HW4_P2a");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
