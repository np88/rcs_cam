#include <inttypes.h>

typedef struct _sipc_image{
	uint32_t width;
	uint32_t height;
	
	uint8_t* pixels;
	
	
} sipc_image;


 uint8_t sipc_image_get_pixel_R(sipc_image* image,uint32_t X, uint32_t Y);

 uint8_t sipc_image_get_pixel_G(sipc_image* image,uint32_t X, uint32_t Y);

 uint8_t sipc_image_get_pixel_B(sipc_image* image,uint32_t X, uint32_t Y);


void sipc_image_set_pixel_R(sipc_image* image,uint32_t X, uint32_t Y, uint8_t colour);

void sipc_image_set_pixel_G(sipc_image* image,uint32_t X, uint32_t Y, uint8_t colour);

void sipc_image_set_pixel_B(sipc_image* image,uint32_t X, uint32_t Y, uint8_t colour);

void sipc_image_create_from_yuy2(sipc_image* img, uint8_t* p, uint32_t size);
void sipc_image_alloc(sipc_image** img, uint32_t width, uint32_t height);

