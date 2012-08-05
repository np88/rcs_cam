/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */


#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xintc.h"

void print(char *str);

XGpio gpio_fifo, gpio_leds;
XIntc intc;


void gpio_fifo_full_isr(void * param){


}

void init(){
// gpio
XGpio_Initialize(&gpio_fifo, XPAR_GPIO_FIFO_DEVICE_ID);
XGpio_Initialize(&gpio_leds, XPAR_LEDS_8BIT_DEVICE_ID);

XGpio_SetDataDirection(&gpio_fifo, 1, 0xFFFFFFFF);
XGpio_SetDataDirection(&gpio_fifo, 2, 0x0);
XGpio_SetDataDirection(&gpio_leds, 2, 0x0);


// interrupts
if (XIntc_Initialize(&intc, XPAR_XPS_INTC_0_DEVICE_ID) != XST_SUCCESS)
	printf("Error while initializing interrupts\n");

XGpio_InterruptGlobalEnable(&gpio_fifo);
XGpio_InterruptEnable(&gpio_fifo, 0x20000);

XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_GPIO_FIFO_IP2INTC_IRPT_INTR, (XInterruptHandler) gpio_fifo_full_isr, (void*)0 );

XIntc_DeviceInterruptHandler(XPAR_XPS_INTC_0_DEVICE_ID);

XIntc_Start(&intc, XIN_REAL_MODE);
XIntc_Enable(&intc, XPAR_INTC_0_GPIO_1_VEC_ID);

microblaze_enable_interrupts();

}


int main()
{
    init_platform();
    init();

    while(1){
    	XGpio_DiscreteWrite(&gpio_leds, 2, 0xF0);
    }

    cleanup_platform();

    return 0;
}
