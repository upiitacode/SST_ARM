INCLUDE_DIRS:= device/include cmsis/include 
SOURCE_DIRS:= ../source device/source

CFILES:= main.c system_TM4C123.c
ASM_FILES:= startup_ARMCM4.S



INCLUDE_FLAGS:=$(patsubst %,-I%,$(INCLUDE_DIRS)) 
TCHIP=TM4C123GH6PM
CC=arm-none-eabi-gcc
CFLAGS=-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
CPPFLAGS= $(INCLUDE_FLAGS) -D$(TCHIP)
vpath %.h $(INCLUDE_DIRS)
vpath %.c $(SOURCE_DIRS)
vpath %.S device/source
vpath %.o objects

COBJECTS:= $(patsubst %.c,%.o,$(CFILES)) 
ASMOBJECTS:= $(patsubst %.S,%.o,$(ASM_FILES))

all: objects salida.elf 
objects:
	mkdir objects
salida.elf: $(COBJECTS) $(ASMOBJECTS)
	$(CC) $(CFLAGS) -Ldevice -Tgcc_arm.ld objects/*.o  -o $@
$(COBJECTS): %.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o objects/$@
$(ASMOBJECTS): %.o: %.S
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o objects/$@
.PHONY:clean rebuild
clean:
	rm -f  *.elf
	rm -fr objects
rebuild: clean all
