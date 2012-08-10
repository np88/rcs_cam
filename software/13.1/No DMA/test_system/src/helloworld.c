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
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xintc.h"
#include "mb_interface.h"

void print(char *str);

XGpio gpio_fifo_data, gpio_leds, gpio_button, gpio_pos_leds, gpio_camera, gpio_fifo_en_full;
XIntc intc;



// flag indicates that fifo is full
volatile u8 fifo_full = 0;
// buffer for storing data
volatile u16 * buf;
volatile static u32 index1, index2 = 0;
volatile u8 rd_wr_en = 0, get_pic = 0, read_en = 0;
volatile u16 data = 0, read_count = 0;
volatile u32 cam1 = 0, cam2 = 0;

void gpio_fifo_almost_full_isr(void * param){
	u32 dat = XGpio_DiscreteRead(&gpio_fifo_en_full, 1);
	u16 cnt = 0;
	if (read_en && (dat == 1)){
		fifo_full = 1;
	}

	XGpio_InterruptClear(&gpio_fifo_en_full, XGPIO_IR_CH1_MASK);
}


void gpio_button_pressed_isr(void * param){
	u32 dat = XGpio_DiscreteRead(&gpio_button, 1);
	if (dat&0x10)
		get_pic = 1;

	cam2 = XGpio_DiscreteRead(&gpio_camera, 1);
	XGpio_InterruptClear(&gpio_button, XGPIO_IR_CH1_MASK);
}

void gpio_camera_isr(void * param){
	cam1 = XGpio_DiscreteRead(&gpio_camera, 1);

	// vsync is 1, so new frame can be read
	if (((cam1&0x2)!=0) && get_pic==1){
		// work around because fifo is already full (wr_en is button + clk)
		// read out data, so interrupt will occur (too late?)
		read_en = 1;
		get_pic = 0;
		index1 = 0;
		rd_wr_en |= 0x1;
		XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
	} else if ( ((cam1&0x2) != 0) && (get_pic==0) && (read_en == 1) ){
		read_en = 0;
		rd_wr_en &= 0xFE;
		XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
	}
	XGpio_InterruptClear(&gpio_camera, XGPIO_IR_CH1_MASK);
}


void init(){
	// gpio
	XGpio_Initialize(&gpio_fifo_data, XPAR_XPS_FIFO_DATA_DEVICE_ID);
	XGpio_Initialize(&gpio_fifo_en_full, XPAR_GPIO_FIFO_DEVICE_ID);
	XGpio_Initialize(&gpio_leds, XPAR_LEDS_8BIT_DEVICE_ID);
	XGpio_Initialize(&gpio_pos_leds, XPAR_LEDS_POSITIONS_DEVICE_ID);
	XGpio_Initialize(&gpio_button, XPAR_PUSH_BUTTONS_5BIT_DEVICE_ID);
	XGpio_Initialize(&gpio_camera, XPAR_GPIO_CAMERA_DEVICE_ID);

	XGpio_SetDataDirection(&gpio_fifo_data, 1, 0xFFFFFFFF);
	XGpio_SetDataDirection(&gpio_fifo_data, 2, 0xFFFFFFFF);
	XGpio_SetDataDirection(&gpio_fifo_en_full, 1, 0xFFFFFFFF);
	XGpio_SetDataDirection(&gpio_fifo_en_full, 2, 0x0);
	XGpio_SetDataDirection(&gpio_camera, 1, 0xFFFFFFFF);
	XGpio_SetDataDirection(&gpio_camera, 2, 0xFFFFFFFF);
	//XGpio_SetDataDirection(&gpio_camera, 2, 0x3E8); // IO-Port
	XGpio_SetDataDirection(&gpio_leds, 1, 0x0);
	XGpio_SetDataDirection(&gpio_button, 1, 0xFFFFFFFF);
	//XGpio_SetDataDirection(&gpio_pos_leds, 1, 0x0);

	// interrupts
	if (XIntc_Initialize(&intc, XPAR_XPS_INTC_0_DEVICE_ID) != XST_SUCCESS)
		printf("Error while initializing interrupts\n");

	// enable interrupt banks (mask is used to choose channel, whole channel is interrupt enabled!)
	// that is, why extra channels are needed for data that causes interrupts
	XGpio_InterruptGlobalEnable(&gpio_fifo_en_full);
	XGpio_InterruptEnable(&gpio_fifo_en_full, XGPIO_IR_CH1_MASK);

	XGpio_InterruptGlobalEnable(&gpio_camera);
	XGpio_InterruptEnable(&gpio_camera, XGPIO_IR_CH1_MASK); // only Is are interrupt enabled, only vsync

	XGpio_InterruptGlobalEnable(&gpio_button);
	XGpio_InterruptEnable(&gpio_button, XGPIO_IR_CH1_MASK);

	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_GPIO_FIFO_IP2INTC_IRPT_INTR, (XInterruptHandler) gpio_fifo_almost_full_isr, (void*)0 );
	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_PUSH_BUTTONS_5BIT_IP2INTC_IRPT_INTR , (XInterruptHandler) gpio_button_pressed_isr, (void*)0 );
	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_GPIO_CAMERA_IP2INTC_IRPT_INTR , (XInterruptHandler) gpio_camera_isr, (void*)0 );

	XIntc_DeviceInterruptHandler(XPAR_XPS_INTC_0_DEVICE_ID);

	XIntc_Start(&intc, XIN_REAL_MODE);

	XIntc_Enable(&intc, XPAR_XPS_INTC_0_GPIO_FIFO_IP2INTC_IRPT_INTR);
	XIntc_Enable(&intc, XPAR_XPS_INTC_0_PUSH_BUTTONS_5BIT_IP2INTC_IRPT_INTR);
	XIntc_Enable(&intc, XPAR_XPS_INTC_0_GPIO_CAMERA_IP2INTC_IRPT_INTR);


	microblaze_enable_interrupts();
}


int main()
{
	// buffer for data from fifo
	u16 cnt = 0;


    init_platform();
    init();

    XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, 0x00);

    // allocate buffer (a lot of space is needed for pictures)
    buf = malloc(16*1000000);
    if (buf == 0){
    	return 0; // error occured
    }

    while(1){
    	//if (fifo_full == 1){
    		//for (cnt = 0; cnt < 1024; cnt++){
    			// generate fifo read pulse
    			rd_wr_en |= 2;
    			//XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
    			XGpio_DiscreteWrite(&gpio_leds, 1, rd_wr_en);
    			data = XGpio_DiscreteRead(&gpio_camera, 1);
    			buf[index1++] = data;
    			rd_wr_en &= 0xFD;
    			XGpio_DiscreteWrite(&gpio_leds, 1, rd_wr_en);
    			//XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
    		//}
//    		index2 = index1;
//    		fifo_full = 0;
//    		XGpio_DiscreteWrite(&gpio_leds, 1, 0x01);
//   		}
    }

    cleanup_platform();

    return 0;
}
