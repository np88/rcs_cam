/* $Id: xdmacentral_sinit.c,v 1.1.2.3 2009/12/04 18:03:40 juliez Exp $ */
/******************************************************************************
*
* (c) Copyright 2004-2009 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xdmacentral_sinit.c
*
* This file contains the implementation of the XDmaCentral driver's static
* initialization functionality.
*
* @note		None.
*
* <pre>
*
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.11a sv   02/07/08 First release
* 2.00a jz   12/04/09  Hal phase 1 support, changed _m to _ from register API 
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "xparameters.h"
#include "xdmacentral.h"

/************************** Constant Definitions *****************************/

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

/************************** Variable Definitions *****************************/

extern XDmaCentral_Config XDmaCentral_ConfigTable[];

/*****************************************************************************/
/**
*
* Lookup the device configuration based on the unique device ID. The table
* XDmaCentral_ConfigTable contains the configuration info for each device
* in the system.
*
* @param 	DeviceId is the unique device ID of the device being looked up.
*
* @return	A pointer to the configuration table entry corresponding to the
*		given device ID, or NULL if no match is found.
*
* @note		None.
*
******************************************************************************/
XDmaCentral_Config *XDmaCentral_LookupConfig(u16 DeviceId)
{
	XDmaCentral_Config *CfgPtr = NULL;
	u32 Index;

	for (Index = 0; Index < XPAR_XDMACENTRAL_NUM_INSTANCES; Index++) {
		if (XDmaCentral_ConfigTable[Index].DeviceId == DeviceId) {
			CfgPtr = &XDmaCentral_ConfigTable[Index];
			break;
		}
	}

	return CfgPtr;
}


/****************************************************************************/
/**
*
* Initialize a specific XDmaCentral instance. This function must be called
* prior to using a Central DMA device. Initialization of a device includes
* looking up the configuration for the given device instance, initializing
* the instance structure, and resetting the device such that it is in a known
* state.
*
* @param	InstancePtr is a pointer to the XDmaCentral instance to be
*		worked on.
* @param	DeviceId is the unique id of the device controlled by this
		XDmaCentral instance.
*
* @return
* 		- XST_SUCCESS if everything initializes as expected.
* 		- XST_DEVICE_NOT_FOUND if the requested device is not found
*
* @note		None.
*
*****************************************************************************/
int XDmaCentral_Initialize(XDmaCentral *InstancePtr, u16 DeviceId)
{
	int Status;
	XDmaCentral_Config *ConfigPtr;

	/*
	 * Assert validates the input arguments
	 */
	Xil_AssertNonvoid(InstancePtr != NULL);

	/*
	 * Lookup the device configuration. Use this configuration info below
	 * when initializing this device.
	 */
	ConfigPtr = XDmaCentral_LookupConfig(DeviceId);
	if (ConfigPtr == (XDmaCentral_Config *) NULL) {
		InstancePtr->IsReady = 0;
		return XST_DEVICE_NOT_FOUND;
	}


	Status = XDmaCentral_CfgInitialize(InstancePtr, ConfigPtr,
						ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

