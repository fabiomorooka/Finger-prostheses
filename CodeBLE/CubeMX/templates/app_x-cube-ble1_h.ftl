[#ftl]
/**
  ******************************************************************************
  * File Name          : app_x-cube-ble1.h
  * Description        : Header file
  *                    
  ******************************************************************************
  *
  * COPYRIGHT ${year} STMicroelectronics
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  ******************************************************************************
  */#n
  
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APP_X_CUBE_BLE1_H
#define __APP_X_CUBE_BLE1_H
#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
[#if includes??]
[#list includes as include]
[/#list]
[/#if]

[#assign useSENSORDEMO = false]
[#assign useSENSORDEMO_BS = false]
[#assign useSAMPLEAPP = false]
[#assign useBEACON = false]
[#assign useVIRTUALCOMPORT = false]
[#assign useCENTRALPROFILES = false]
[#assign usePERIPHERALPROFILES = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?ends_with("SENSOR_DEMO")]
[#assign useSENSORDEMO = true]
[/#if]
[#if define?contains("SENSOR_DEMO_BS")]
[#assign useSENSORDEMO_BS = true]
[/#if]
[#if define?contains("SAMPLE_APP")]
[#assign useSAMPLEAPP = true]
#include "${FamilyName?lower_case}_${BoardName}.h"
[/#if]
[#if define?contains("BEACON")]
[#assign useBEACON = true]
[/#if]
[#if define?contains("VIRTUAL_COM_PORT")]
[#assign useVIRTUALCOMPORT = true]
[/#if]
[#if define?contains("CENTRAL_PROFILES")]
[#assign useCENTRALPROFILES = true]
[/#if]
[#if define?contains("PERIPHERAL_PROFILES")]
[#assign usePERIPHERALPROFILES = true]
[/#if]

[/#list]
[/#if]

/* Exported Functions --------------------------------------------------------*/
void ${fctName}(void);
void ${fctProcessName}(void);

#ifdef __cplusplus
}
#endif
#endif /* __APP_X_CUBE_BLE1_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
