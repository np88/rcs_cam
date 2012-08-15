#include "xparameters.h"
#include "xio.h"
#include "xtft.h"
#include <stdio.h>

#define TFT_DEVICE_ID XPAR_XPS_TFT_0_DEVICE_ID

#define DISPLAY_COLUMNS  640
#define DISPLAY_ROWS     480

static XTft TftInstance;

int XTft_DrawSolidBox(XTft *Tft, int x1, int y1, int x2, int y2, unsigned int col)
{
   int xmin,xmax,ymin,ymax,i,j;

   if (x1 >= 0 &&
       x1 <= DISPLAY_COLUMNS-1 &&
       x2 >= 0 &&
       x2 <= DISPLAY_COLUMNS-1 &&
       y1 >= 0 &&
       y1 <= DISPLAY_ROWS-1 &&
       y2 >= 0 &&
       y2 <= DISPLAY_ROWS-1) {
      if (x2 < x1) {
         xmin = x2;
         xmax = x1;
      }
      else {
         xmin = x1;
         xmax = x2;
      }
      if (y2 < y1) {
         ymin = y2;
         ymax = y1;
      }
      else {
         ymin = y1;
         ymax = y2;
      }

      for (i=xmin; i<=xmax; i++) {
         for (j=ymin; j<=ymax; j++) {
	   XTft_SetPixel(Tft, i, j, col);
         }
      }
      return 0;
   }
   return 1;

}

int main(){

	int Status;
	XTft_Config *TftConfigPtr;

	/*
	 * Get address of the XTft_Config structure for the given device id.
	 */

	TftConfigPtr = XTft_LookupConfig(XPAR_XPS_TFT_0_DEVICE_ID);
	if (TftConfigPtr == (XTft_Config *)NULL) {
		return XST_FAILURE;
	}

	/*
	 * Initialize all the TftInstance members and fills the screen with
	 * default background color.
	 */
	Status = XTft_CfgInitialize(&TftInstance, TftConfigPtr,
				 	TftConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

  xil_printf("  Display color ");
  xil_printf("\r\n");
  XTft_SetColor(&TftInstance, 0, 0);
  XTft_ClearScreen(&TftInstance);

  xil_printf("  Writing Color Bar Pattern\r\n");

  XTft_DrawSolidBox(&TftInstance,   0, 0, 79,479,0x00ffffff); // white
  XTft_DrawSolidBox(&TftInstance,  80, 0,159,479,0x00ff0000); // red
  XTft_DrawSolidBox(&TftInstance, 160, 0,239,479,0x0000ff00); // green
  XTft_DrawSolidBox(&TftInstance, 240, 0,319,479,0x000000ff); // blue
  XTft_DrawSolidBox(&TftInstance, 320, 0,399,479,0x00ffffff); // white
  XTft_DrawSolidBox(&TftInstance, 400, 0,479,479,0x00AAAAAA); // grey
  XTft_DrawSolidBox(&TftInstance, 480, 0,559,479,0x00777777); // not-so-grey
  XTft_DrawSolidBox(&TftInstance, 560, 0,639,479,0x00333333); // lite grey


  xil_printf("  TFT test completed!\r\n");
  xil_printf("  You should see vertical color and grayscale bars\r\n");
  xil_printf("  across your VGA Output Monitor\r\n\r\n");

	return 0;

}
