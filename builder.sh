rm *.o
rm *.elf
rm *.img
arm-none-eabi-as -c -o boot.o boot.S
arm-none-eabi-gcc -c -nostdlib -o kernel.o kernel.c -lgcc
arm-none-eabi-ld -T link.ld boot.o kernel.o -o kernel.elf -nostdlib
arm-none-eabi-objcopy kernel.elf -O binary kernel.img
qemu-system-arm -m 1g -M raspi2b -serial stdio -kernel kernel.elf