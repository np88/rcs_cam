/* $Id: xdmacentral_intr.c,v 1.1.2.3 2009/12/04 18:03:40 juliez Exp $ */
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
* @file xdmacentral_intr.c
*
* This file contains interrupt handling API functions of the Central DMA
* device on PLB.
*
* Please refer to xdmacentral.h header file for more information.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a xd   03/11/04 First release
* 1.00b xd   01/13/05 Modified to support both OPB Central DMA and PLB
*                     Central DMA.
* 1.10b mta  03/21/07 Updated to new coding style
* 2.00a jz   12/04/09  Hal phase 1 support, changed _m to _ from register API 
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xdmacentral.h"
#include "xil_io.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/


/****************************************************************************/
/**
*
* Set the contents of Interrupt Enable Register. Use the XDMC_IXR_* constants
* defined in xdmacentral_l.h to create the bit-mask to enable interrupts.
*
*
* @param	InstancePtr is a pointer to the XDmaCentral instance.
* @param	Mask is the mask to enable. Bit positions of 1 are enabled. Bit
*		positions of 0 are disabled. This mask is formed by OR'ing
*		bits from XDMC_IXR_* bits which are contained in
*		xdmacentral_l.h.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XDmaCentral_InterruptEnableSet(XDmaCentral *InstancePtr, u32 Mask)
{
	/*
	 * Assert the arguments
	 */
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XCOMPONENT_IS_READY);

	/*
	 * Write the mask to the Interrupt Enable register
	 */
	XDmaCentral_WriteReg(InstancePtr->DmaConfig.BaseAddress,
				XDMC_IER_OFFSET, Mask);
}

/****************************************************************************/
/**
*
* Get the contents of the Interrupt Enable Register. Use the XDMC_IXR_*
* constants defined in xdmacentral_l.h to interpret the value.
*
* @param	InstancePtr is a pointer to the XDmaCentral instance .
*
* @return	A 32-bit value representing the contents of the Interrupt Enable
*		register.
*
* @note		None.
*
*****************************************************************************/
u32 XDmaCentral_InterruptEnableGet(XDmaCentral *InstancePtr)
{
	/*
	 * Assert the arguments
	 */
	Xil_AssertNonvoid(InstancePtr != NULL);
	Xil_AssertNonvoid(InstancePtr->IsReady == XCOMPONENT_IS_READY);

	/*
	 * Read the Interrupt Enable register and return the contents
	 */
	return XDmaCentral_ReadReg(InstancePtr->DmaConfig.BaseAddress,
					XDMC_IER_OFFSET);
}


/****************************************************************************/
/**
*
* Get the contents of the Interrupt Status register. Use the XDMC_IXR_*
* constants defined in xdmacentral_l.h to interpret the value.
*
* The Interrupt Status register indicates which interrupts are active
* for the Central DMA device. The definitions of each bit in the register
* match the definitions of the bits in the Interrupt Enable register.
*
* @param	InstancePtr is a pointer to the XDmaCentral instance .
*
* @return	A 32-bit value representing the contents of the Interrupt Status
*		register.
*
* @note		None.
*
*****************************************************************************/
u32 XDmaCentral_InterruptStatusGet(XDmaCentral *InstancePtr)
{
	/*
	 * Assert the arguments
	 */
	Xil_AssertNonvoid(InstancePtr != NULL);
	Xil_AssertNonvoid(InstancePtr->IsReady == XCOMPONENT_IS_READY);

	/*
	 * Return the value read from the Interrupt Status register
	 */
	return XDmaCentral_ReadReg(InstancePtr->DmaConfig.BaseAddress,
					XDMC_ISR_OFFSET);
}


/****************************************************************************/
/**
*
* Clear pending interrupts with the provided mask. This function should be
* called after the software has serviced the interrupts that are pending.
*
* @param	InstancePtr is a pointer to the XDmaCentral instance.
*
* @param	Mask is the mask to clear pending interrupts for. Bit positions
*		of 1 are cleared. This mask is formed by OR'ing bits from
*		XDMC_IXR_* bits which are defined in xdmacentral_l.h.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XDmaCentral_InterruptClear(XDmaCentral *InstancePtr, u32 Mask)
{
	u32 IntrStatusValue;

	/*
	 * Assert the arguments
	 */
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XCOMPONENT_IS_READY);

	/*
	 * Read current value in Interrupt Status register
	 */
	IntrStatusValue = XDmaCentral_InterruptStatusGet(InstancePtr);

	/*
	 * Filter out any invalid bit in the input mask
	 */
	IntrStatusValue &= Mask;

	/*
	 * Write the mask to the Interrupt Status register to clear active
	 * interrupt(s).
	 */
	XDmaCentral_WriteReg(InstancePtr->DmaConfig.BaseAddress,
				XDMC_ISR_OFFSET, IntrStatusValue);
}
