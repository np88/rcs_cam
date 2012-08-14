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
#include <stdlib.h>
#include "xparameters.h"
#include "xgpio.h"
#include "xintc.h"
#include "mb_interface.h"
#include "xdmacentral.h"

void print(char *str);


#define DISPLAY_COLUMNS  640
#define DISPLAY_ROWS     480


XGpio gpio_fifo_data, gpio_leds, gpio_button, gpio_pos_leds, gpio_camera, gpio_fifo_en_full;
XIntc intc;
XDmaCentral dma;
static u32 num_bytes[100];
//XTft tft;


volatile u32 num = 0;
// flag indicates that fifo is full
volatile u8 fifo_full = 0, start_reading = 0, error_flag = 0;
// buffer for storing data
volatile u16 * buf;
volatile static u32 index1, index2 = 0, index3 = 0;
volatile u8 rd_wr_en = 0, get_pic = 0, read_en = 0;
volatile u32 data = 0, read_count = 0;
volatile u32 cam1 = 0, cam2 = 0;
volatile u32 * fifo_address = (u32 *) XPAR_XPS_EPC_0_PRH0_BASEADDR;

void gpio_fifo_empty_isr(void * param){
	u32 dat = XGpio_DiscreteRead(&gpio_fifo_en_full, 1);
	u16 cnt = 0;


	XGpio_InterruptClear(&gpio_fifo_en_full, XGPIO_IR_CH1_MASK);
}


void gpio_button_pressed_isr(void * param){
	u32 dat = XGpio_DiscreteRead(&gpio_button, 1);
	if (dat&0x10)
		get_pic = 1;

	XGpio_InterruptClear(&gpio_button, XGPIO_IR_CH1_MASK);
}

void gpio_camera_isr(void * param){
	cam1 = XGpio_DiscreteRead(&gpio_camera, 1);

	// vsync is 1, so new frame can be read
	if (((cam1&0x2)!=0) && get_pic==1){
		read_en = 1;
		get_pic = 0;
		index1 = 0;
		index2 = 0;
		index3 = 0;
		rd_wr_en = 0x3; // enable writing into fifo
		XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
		start_reading = 1;
	} else if ( ((cam1&0x2) != 0) && (get_pic==0) && (read_en == 1) ){
		rd_wr_en &= 0x02;
		XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
		read_en = 0;
	}

	// start reading
	//if (read_en && (cam1&0x4) == 0 && (XDmaCentral_GetStatus(&dma) & XDMC_DMASR_BUSY_MASK) == 0){
		//u32 num = XGpio_DiscreteRead(&gpio_fifo_data, 2);
		//if (index3 < 100)
			//num_bytes[index3++] = num;
		//XDmaCentral_Transfer(&dma, (u32 *)XPAR_XPS_EPC_0_PRH0_BASEADDR, &buf + index2, num_bytes[index3]);
		//index2+=num;
		//start_reading = 1;
	//}

	// fifo empty is set
	if ( (cam1&0x4) != 0 && start_reading == 1 && read_en == 0){
		start_reading = 0;
		rd_wr_en &= 0x01;
		XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, rd_wr_en);
	}

	//if ((XDmaCentral_GetStatus(&dma)&XDMC_DMASR_BUS_ERROR_MASK) != 0)
	//	index1++;

	XGpio_InterruptClear(&gpio_camera, XGPIO_IR_CH1_MASK);
}


void init(){

	// tft
	/*
	 * Get address of the XTft_Config structure for the given device id.
	 */

//	TftConfigPtr = XTft_LookupConfig(XPAR_XPS_TFT_0_DEVICE_ID);
//	if (TftConfigPtr == (XTft_Config *)NULL) {
//		return XST_FAILURE;
//	}

	/*
	 * Initialize all the TftInstance members and fills the screen with
	 * default background color.
	 */
//	Status = XTft_CfgInitialize(&TftInstance, TftConfigPtr,
//				 	TftConfigPtr->BaseAddress);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}

	// dma
	XDmaCentral_Initialize(&dma, XPAR_XPS_CENTRAL_DMA_0_DEVICE_ID);
	// XDmaCentral_Reset(&dma);
	// increment destination address register only
	XDmaCentral_SetControl(&dma, XDMC_DMACR_DEST_INCR_MASK);

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

	//XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_GPIO_FIFO_IP2INTC_IRPT_INTR, (XInterruptHandler) gpio_fifo_empty_isr, (void*)0 );
	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_PUSH_BUTTONS_5BIT_IP2INTC_IRPT_INTR , (XInterruptHandler) gpio_button_pressed_isr, (void*)0 );
	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_INTC_0_GPIO_CAMERA_IP2INTC_IRPT_INTR , (XInterruptHandler) gpio_camera_isr, (void*)0 );

	XIntc_DeviceInterruptHandler(XPAR_XPS_INTC_0_DEVICE_ID);

	XIntc_Start(&intc, XIN_REAL_MODE);

	//XIntc_Enable(&intc, XPAR_XPS_INTC_0_GPIO_FIFO_IP2INTC_IRPT_INTR);
	XIntc_Enable(&intc, XPAR_XPS_INTC_0_PUSH_BUTTONS_5BIT_IP2INTC_IRPT_INTR);
	XIntc_Enable(&intc, XPAR_XPS_INTC_0_GPIO_CAMERA_IP2INTC_IRPT_INTR);


	microblaze_enable_interrupts();
}

void tft_test(){

//	  XTft_SetColor(&TftInstance, 0, 0);
//	  XTft_ClearScreen(&TftInstance);
//
//	  xil_printf("  Writing Color Bar Pattern\r\n");
//
//	  XTft_DrawSolidBox(&TftInstance,   0, 0, 79,479,0x00ffffff); // white
//	  XTft_DrawSolidBox(&TftInstance,  80, 0,159,479,0x00ff0000); // red
//	  XTft_DrawSolidBox(&TftInstance, 160, 0,239,479,0x0000ff00); // green
//	  XTft_DrawSolidBox(&TftInstance, 240, 0,319,479,0x000000ff); // blue
//	  XTft_DrawSolidBox(&TftInstance, 320, 0,399,479,0x00ffffff); // white
//	  XTft_DrawSolidBox(&TftInstance, 400, 0,479,479,0x00AAAAAA); // grey
//	  XTft_DrawSolidBox(&TftInstance, 480, 0,559,479,0x00777777); // not-so-grey
//	  XTft_DrawSolidBox(&TftInstance, 560, 0,639,479,0x00333333); // lite grey

}


int main()
{
	// buffer for data from fifo

	 u32 i = 0;

    init_platform();
    init();



    XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, 0x00);

    // allocate buffer (a lot of space is needed for pictures)
    buf = malloc(16*1000000);
    if (buf == 0){
    	return 1; // error occured
    }

    //XGpio_DiscreteWrite(&gpio_fifo_en_full, 2, 0x3);

    //while(1){
    //	u32 data = *((u32 *)XPAR_XPS_EPC_0_PRH0_BASEADDR);
    //}

    while(1){
    	// read while fifo is not empty
    	while (start_reading == 1){
    		num = XGpio_DiscreteRead(&gpio_fifo_data, 2);
    		if (num > 0){
    			num_bytes[index2++] = num;
    			//XDmaCentral_Transfer(&dma, (u32 *)XPAR_XPS_EPC_0_PRH0_BASEADDR, &buf + index3, num);
    			//index3+=num;
    			for (i = 0; i < num; i++)
    				buf[index1++] = *((u32 *)XPAR_XPS_EPC_0_PRH0_BASEADDR);
    		}
    	}
    }

    cleanup_platform();

    return 0;
}
