/* $Id: xdmacentral.h,v 1.1.2.3 2009/12/04 18:03:40 juliez Exp $ */
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
* @file xdmacentral.h
*
* This header file contains prototypes of high-level driver function that can
* be used to access the Central DMA device.
*
*
* <b>DESCRIPTION</b>
*
* Central DMA is a standalone IP core, as opposed to a DMA channel component
* distributed in devices.
*
* Central DMA allows a CPU to minimize the CPU interaction required to move
* data between a memory and a device. The CPU requests the Central DMA to
* perform a DMA operation and typically continues performing other processing
* until the DMA operation completes.  DMA could be considered a primitive form
* of multiprocessing such that caching and address translation can be an issue.
*
*
* The user should refer to the hardware device specification for more
* details of the device operation.
*
*
* <b>CONFIGURATION</b>
*
*
* <b>INTERRUPTS</b>
*
* Central DMA has the ability to generate an interrupt. It is the
* responsibility of the caller of DMA functions to manage the interrupt
* including connecting to the interrupt and enabling/disabling the interrupt.
*
*
* <b>CRITICAL SECTIONS</b>
*
* This driver does not use critical sections and it does access registers using
* read-modify-write operations.  Calls to DMA functions from a main thread
* and from an interrupt context could produce unpredictable behavior such that
* the caller must provide the appropriate critical sections.
*
*
* <b>ADDRESS TRANSLATION</b>
*
* All addresses of data structures which are passed to DMA functions must
* be physical (real) addresses as opposed to logical (virtual) addresses.
*
*
* <b>CACHING</b>
*
* The caller of DMA functions is responsible for ensuring that any data
* buffers which are passed to the Central DMA have been flushed from the cache.
*
* The caller of DMA functions is responsible for ensuring that the cache is
* invalidated prior to using any data buffers which are the result of a DMA
* operation.
*
*
* <b>MUTUAL EXCLUSION</b>
*
* The functions of the Central DMA are not thread safe such that the caller
* of all DMA functions is responsible for ensuring mutual exclusion for a
* Central DMA device. Mutual exclusion across multiple Central DMA device is
* not necessary.
*
* The user should refer to the hardware device specification for more
* details of the device operation.
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
* 1.11a sv   01/21/08 Updated for supporting unaligned transfers.
*		      Added the function XDmaCentral_CfgInitialize,
*		      for removing the dependency on the static config table and
*		      xparameters.h from the driver initialization
* 1.12a sdm  03/26/09 Modified XDmaCentral_SelfTest() and examples to
*		      Invalidate the D-Cache for destination buffer before
*		      the DMA transaction
*
* 1.12a ecm  05/13/09 Aligned the buffers to a cacheline to ensure the
*					  flush and invalidate operations occur across the entire
*					  buffer address space to prevent stale data issues.
* 2.00a jz   12/04/09  Hal phase 1 support, changed _m to _ from register API 
* </pre>
*
*****************************************************************************/
#ifndef XDMACENTRAL_H_		/* Prevent circular inclusions */
#define XDMACENTRAL_H_		/* by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files ********************************/

#include "xstatus.h"
#include "xil_assert.h"
#include "xil_cache.h"
#include "xdmacentral_l.h"

/************************** Constant Definitions ****************************/


/**************************** Type Definitions ******************************/

/**
 * This typedef contains configuration information for the Central DMA device.
 */
typedef struct {
	u16 DeviceId;		/**< Unique ID of device */
	u32 BaseAddress;	/**< Register base address */
} XDmaCentral_Config;


/**
 * The driver's instance data. The user is required to allocate a variable
 * of this type for every Central DMA device in the system. A pointer to
 * a variable of this type is then passed to the driver API functions.
 */
typedef struct {
	XDmaCentral_Config DmaConfig;   /* Device configuration */
	u32 IsReady;		 	/* Device is initialized and ready */
} XDmaCentral;


/***************** Macros (Inline Functions) Definitions ********************/


/************************** Function Prototypes *****************************/

/**
 * Functions in xdmacentral.c
 */
int XDmaCentral_CfgInitialize(XDmaCentral *InstancePtr,
				XDmaCentral_Config *DmaCentralCfgPtr,
				u32 EffectiveAddr);
void XDmaCentral_Reset(XDmaCentral *InstancePtr);
void XDmaCentral_SetControl(XDmaCentral *InstancePtr, u32 Value);
u32 XDmaCentral_GetControl(XDmaCentral *InstancePtr);
u32 XDmaCentral_GetStatus(XDmaCentral *InstancePtr);
u32 XDmaCentral_GetSrcAddress(XDmaCentral *InstancePtr);
u32 XDmaCentral_GetDestAddress(XDmaCentral *InstancePtr);
void XDmaCentral_Transfer(XDmaCentral *InstancePtr,
			  void *SourcePtr, void *DestinationPtr, u32 ByteCount);

/*
 * Initialization functions in xdmacentral_sinit.c
 */
XDmaCentral_Config *XDmaCentral_LookupConfig(u16 DeviceId);
int XDmaCentral_Initialize(XDmaCentral *InstancePtr, u16 DeviceId);

/**
 * Diagnostic function in xdmacentral_selftest.c
 */
int XDmaCentral_SelfTest(XDmaCentral *InstancePtr);

/**
 * Interrupt functions in xdmacentral_intr.c
 */
void XDmaCentral_InterruptEnableSet(XDmaCentral *InstancePtr, u32 Mask);
u32 XDmaCentral_InterruptEnableGet(XDmaCentral *InstancePtr);
u32 XDmaCentral_InterruptStatusGet(XDmaCentral *InstancePtr);
void XDmaCentral_InterruptClear(XDmaCentral *InstancePtr, u32 Mask);


#ifdef __cplusplus
}
#endif

#endif /* End of protection macro. */

