/* $Id: xdmacentral_selftest.c,v 1.1.2.3 2009/12/04 18:03:40 juliez Exp $ */
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
* @file xdmacentral_selftest.c
*
* Contains a diagnostic self-test function for the XDmaCentral driver.
*
* See xdmacentral.h for more information.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- ------------------------------------------------------
* 1.00a xd   03/12/04 First release
* 1.00b xd   01/13/05 Modified to support both OPB Central DMA and PLB
*                     Central DMA.
* 1.10b mta  03/21/07 Updated to new coding style
* 1.11a sv   01/21/08 Updated for supporting unaligned transfers
* 1.12a sdm  03/26/09 Modified to Invalidate the D-Cache for destination buffer
*                     before DMA transaction
* 1.12a ecm  05/13/09 Aligned the buffers to a cacheline to ensure the
*                     flush and invalidate operations occur across the entire
*                     buffer address space to prevent stale data issues.
* 2.00a jz   12/04/09  Hal phase 1 support, changed _m to _ from register API 
* </pre>
*
*****************************************************************************/

/***************************** Include Files ********************************/

#include "xstatus.h"
#include "xdmacentral.h"

/************************** Constant Definitions ****************************/

#define XDMC_SELFTEST_BUFSIZE 16 /**< size of transfer test buffer in bytes */

/**************************** Type Definitions ******************************/

/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/

/*
 * Source buffer and Destination buffer for self-test purpose. These buffers
 * need to be aligned to a cacheline boundary.
 */
#ifdef __DCC__
static u32 SrcBuffer[XDMC_SELFTEST_BUFSIZE/4];
static u32 DestBuffer[XDMC_SELFTEST_BUFSIZE/4];
#else
static u8 SrcBuffer[XDMC_SELFTEST_BUFSIZE];
static u8 DestBuffer[XDMC_SELFTEST_BUFSIZE];
#endif

/************************** Function Prototypes *****************************/


/*****************************************************************************/
/**
*
* Run a self-test on the driver/device. The test resets the device, starts a
* DMA transfer, compares the contents of destination buffer and source
* buffer after the DMA transfer is finished, and resets the device again
* before the function returns.
*
* Note that this is a destructive test in that resets of the device are
* performed. Please refer to the device specification for the device status
* after the reset operation.
*
* If the hardware system is not built correctly, this function may never
* return to the caller.
*
*
* @param	InstancePtr is a pointer to the XDmaCentral instance.
*
* @return
*		- XST_SUCCESS if the DMA transfer could get finished and the
*		contents of destination buffer were the same as the
*		source buffer after the transfer.
*		- XST_FAILURE if a Bus error occurred or the contents of the
*		destination buffer were different from the source buffer after
*		the transfer was finished.
*
* @note		None.
*
******************************************************************************/
int XDmaCentral_SelfTest(XDmaCentral *InstancePtr)
{
	u32 Index;
	u32 RegValue;
	u8 *SrcPtr;
	u8 *DestPtr;

	/*
	 * Assert the argument
	 */
	Xil_AssertNonvoid(InstancePtr != NULL);
	Xil_AssertNonvoid(InstancePtr->IsReady == XCOMPONENT_IS_READY);

	/*
	 * Initialize the source buffer bytes with a pattern and the
	 * the destination buffer bytes to zero.
	 */
	SrcPtr = (u8 *) SrcBuffer;
	DestPtr = (u8 *) DestBuffer;

	for (Index = 0; Index < XDMC_SELFTEST_BUFSIZE; Index++) {
		SrcPtr[Index] = Index;
		DestPtr[Index] = 0;
	}

	/*
	 * Reset the device to get it back to its default state
	 */
	XDmaCentral_Reset(InstancePtr);

	/* Setup the DMA Control register to be:
	 *	- Source address incrementing
	 *	- Destination address incrementing
	 */
	XDmaCentral_SetControl(InstancePtr,
				XDMC_DMACR_SOURCE_INCR_MASK |
				XDMC_DMACR_DEST_INCR_MASK);

	/*
	 * Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((u32)&SrcBuffer,  XDMC_SELFTEST_BUFSIZE);

	/*
	 * Invalidate the DestBuffer before receiving the data, in case the Data
	 * Cache is enabled
	 */
	Xil_DCacheInvalidateRange((u32)&DestBuffer, XDMC_SELFTEST_BUFSIZE);

	/*
	 * Start the DMA transfer.
	 */
	XDmaCentral_Transfer(InstancePtr, (void *) SrcBuffer,
			     (void *) DestBuffer, XDMC_SELFTEST_BUFSIZE);

	/*
	 * Wait until the DMA transfer is done.
	 */
	do {
		/*
		 * Poll DMA status register.
		 */
		RegValue = XDmaCentral_GetStatus(InstancePtr);
	}
	while ((RegValue & XDMC_DMASR_BUSY_MASK) == XDMC_DMASR_BUSY_MASK);


	/*
	 * If Bus error occurs, reset the device and return the error code.
	 */
	if (RegValue & XDMC_DMASR_BUS_ERROR_MASK) {
		XDmaCentral_Reset(InstancePtr);
		return XST_FAILURE;
	}

	/*
	 * DMA transfer is completely successful, check the destination buffer.
	 */
	for (Index = 0; Index < XDMC_SELFTEST_BUFSIZE; Index++) {
		if (DestPtr[Index] != SrcPtr[Index]) {
			/*
			 * Destination buffer's contents are different from the
			 * source buffer. Reset the device again and return
			 * error code.
			 */
			XDmaCentral_Reset(InstancePtr);
			return XST_FAILURE;
		}
	}

	/*
	 * Destination buffer's contents are the same as the source buffer
	 * Reset the device again and return success code.
	 */
	XDmaCentral_Reset(InstancePtr);

	return XST_SUCCESS;
}


