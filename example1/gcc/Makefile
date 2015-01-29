TCHIP=TM4C123GH6PM
CC=arm-none-eabi-gcc
CFLAGS=-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
CPPFLAGS= -Idevice/include -Icmsis/include -D$(TCHIP)
vpath %.h device/include cmsis/include
vpath %.c ../source device/source
vpath %.S device/source
vpath %.o objects

COBJECTS:= main.o system_TM4C123.o 
ASMOBJECTS:= startup_ARMCM4.o

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
