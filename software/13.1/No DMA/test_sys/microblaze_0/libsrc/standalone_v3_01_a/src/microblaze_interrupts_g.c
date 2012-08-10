
/*******************************************************************
*
* CAUTION: This file is automatically generated by libgen.
* Version: Xilinx EDK 13.1 EDK_O.40d
* DO NOT EDIT.
*
* Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.

* 
* Description: Interrupt Handler Table for MicroBlaze Processor
*
*******************************************************************/

#include "microblaze_interrupts_i.h"
#include "xparameters.h"


extern void XIntc_DeviceInterruptHandler (void *);

/*
* The interrupt handler table for microblaze processor
*/

MB_InterruptVectorTableEntry MB_InterruptVectorTable[] =
{
{	XIntc_DeviceInterruptHandler,
	(void*) XPAR_XPS_INTC_0_DEVICE_ID}
};

