################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/simpleIPC/sipc_image.c \
../src/simpleIPC/sipc_main.c 

OBJS += \
./src/simpleIPC/sipc_image.o \
./src/simpleIPC/sipc_main.o 

C_DEPS += \
./src/simpleIPC/sipc_image.d \
./src/simpleIPC/sipc_main.d 


# Each subdirectory must supply rules for building sources it contributes
src/simpleIPC/%.o: ../src/simpleIPC/%.c
	@echo Building file: $<
	@echo Invoking: MicroBlaze gcc compiler
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -I../../hello_world_bsp_0/microblaze_0/include -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.10.a -mno-xl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo Finished building: $<
	@echo ' '


