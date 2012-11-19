/* $Id: xdmacentral_l.h,v 1.1.2.3 2009/12/04 18:03:40 juliez Exp $ */
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
/****************************************************************************/
/**
*
* @file xdmacentral_l.h
*
* This header file contains identifiers and basic driver functions (or
* macros) that can be used to access the Central DMA device.
*
* @note
*
* All provided functions are for basic register access and do not provide a lot
* of error detection to minimize the overhead in these functions.
* The caller is expected to understand the impact of a function call based
* upon the current state of the Central DMA.
* <br><br>
* Refer to the device specifications and xdmacentral.h for more information
* about this driver and the device.
*
* <pre>
*
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a xd   03/11/04 First release.
* 1.00b xd   01/13/05 Modified to support both OPB Central DMA and PLB
*                     Central DMA.
* 1.10b mta  03/21/07 Updated to new coding style
* 1.11a sv   01/21/08 Updated for supporting unaligned transfers
* 2.00a jz   12/04/09  Hal phase 1 support, changed _m to _ from register API 
* </pre>
*
*****************************************************************************/
#ifndef XDMACENTRAL_L_H_ /* Prevent circular inclusions */
#define XDMACENTRAL_L_H_ /* by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files ********************************/

#include "xil_io.h"
#include "xil_types.h"

/************************** Constant Definitions ****************************/

/**
 * The following constants provide access to each of the registers of the
 * Central DMA device.
 */
#define XDMC_RST_OFFSET		0x00	/**< Reset register */
#define XDMC_DMACR_OFFSET	0x04	/**< DMA Control register */
#define XDMC_SA_OFFSET		0x08	/**< Source Address register */
#define XDMC_DA_OFFSET		0x0C	/**< Destination Address register */
#define XDMC_LENGTH_OFFSET	0x10	/**< Length register */
#define XDMC_DMASR_OFFSET	0x14	/**< DMA Status register */
#define XDMC_ISR_OFFSET		0x2C	/**< Interrupt Status register */
#define XDMC_IER_OFFSET		0x30	/**< Interrupt Enable register */

/**
 * Central DMA Reset register mask(s)
 */
#define XDMC_RST_MASK 0x0000000A	/**< Value used to reset the device */

/**
 * The following constants provide access to the bit fields of the DMA Control
 * register (DMACR). Multiple constants could be "OR"ed together and written
 * to the DMACR.
 */
#define XDMC_DMACR_SOURCE_INCR_MASK 0x80000000 /**<Increment source address */
#define XDMC_DMACR_DEST_INCR_MASK   0x40000000 /**<Increment dest address  */


/**
 * The following constants which are the bit fields of the DMA Control
 * register (DMACR) are provided for backward compatabilty, so that
 * users can use their older applications with this core and driver.
 */
#define XDMC_DMACR_DATASIZE_8_MASK  0x00000000
#define XDMC_DMACR_DATASIZE_4_MASK  0x00000000
#define XDMC_DMACR_DATASIZE_2_MASK  0x00000000
#define XDMC_DMACR_DATASIZE_1_MASK  0x00000000
#define XDMC_DMACR_DATASIZE_MASK    0x00000000


/**
 * The following constants provide access to the bit fields of the DMA Status
 * register (DMASR)
 */
#define XDMC_DMASR_BUSY_MASK	     0x80000000 /**< Device is busy */
#define XDMC_DMASR_BUS_ERROR_MASK    0x40000000 /**< Bus error occurred */

/**
 * The following constants provide access to the bit fields of the DMA Status
 * register (DMASR) are provided for backward compatabilty, so that
 * users can use their older applications with this core and driver.
 */
#define XDMC_DMASR_BUS_TIMEOUT_MASK  0x00000000

/**
 * The following constants provide access to the bit fields of the Interrupt
 * Status register (ISR) and the Interrupt Enable register (IER), bit masks
 * match for both registers such that they are named IXR
 */
#define XDMC_IXR_DMA_DONE_MASK	   0x00000001	 /**< DMA operation done  */
#define XDMC_IXR_DMA_ERROR_MASK	   0x00000002	 /**< DMA operation error */


/**************************** Type Definitions ******************************/


/***************** Macros (Inline Functions) Definitions ********************/

#define XDmaCentral_In32  Xil_In32
#define XDmaCentral_Out32 Xil_Out32

/****************************************************************************/
/**
*
* Read a register of the Central DMA. This macro provides register access to
* all registers using the register offsets defined above.
*
* @param	BaseAddress contains the base address of the device.
* @param	RegOffset is the offset of the register to read.
*
* @return	The contents of the register.
*
* @note		C-style Signature:
*		u32 XDmaCentral_ReadReg(u32 BaseAddress, u32 RegOffset)
*
******************************************************************************/
#define XDmaCentral_ReadReg(BaseAddress, RegOffset) \
		XDmaCentral_In32((BaseAddress) + (RegOffset))

/****************************************************************************/
/**
*
* Write a register of the Central DMA. This macro provides register access to
* all registers using the register offsets defined above.
*
* @param	BaseAddress contains the base address of the device.
* @param	RegOffset is the offset of the register to write.
* @param	Data is the value to write to the register.
*
* @return	None.
*
* @note		C-style Signature:
*		void XDmaCentral_WriteReg(u32 BaseAddress, u32 RegOffset,
*						u32 Data)
*
******************************************************************************/
#define XDmaCentral_WriteReg(BaseAddress, RegOffset, Data) \
		XDmaCentral_Out32((BaseAddress) + (RegOffset), (Data))


/************************** Function Prototypes *****************************/

#ifdef __cplusplus
}
#endif

#endif /* End of protection macro. */
