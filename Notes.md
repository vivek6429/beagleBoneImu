# Device tree
A data format to describe hardware that can not be enumerated.
has a st of rules.Is compiled to binary. a scheama is used to vaildate dts.

is comproside of nodes and has  a root nodes.
/*root node syntax*/

/{ 
 <.............>
}
bitbake -c menuconfig virtual/kernel
bitbake -c savedefconfig virtual/kernel
/home/victor/Projects/yocto/builds/beagleBuild/tmp/work/beaglebone_yocto-poky-linux-gnueabi/linux-yocto/6.6.21+git/linux-beaglebone_yocto-standard-build/defconfig



bitbake -c devshell u-boot
make menuconfig


w to correctly install .dtbo to the real U-Boot partition in Yocto

To make the .dtbo appear in the FAT partition (/dev/mmcblk0p1), you can use Yocto’s vfat boot partition installation mechanism.

If your image uses the WIC partitioning (most do), this partition is populated from ${DEPLOY_DIR_IMAGE} files listed in the IMAGE_BOOT_FILES variable.

So instead of copying in do_install(), do this in your recipe or bbappend:



fdtoverlays /overlays/LedButtonOverlay1.dtbo


mmc list
mmc dev 0   --slect sd


dtb to ram  : Device 0 (first MMC device), partition 1 ( /boot usually )

fatload mmc 0:1 0x82000000 /zImage
fatload mmc 0:1 0x88000000 /am335x-boneblack.dtb
fatload mmc 0:1 0x88100000 /overlays/LedButtonOverlay1.dtbo 

Typical Memory Map (BeagleBone Black / AM335x)
Address	Purpose	Notes
0x80000000	Start of DDR (RAM base)	Always this for AM335x
0x82000000	Kernel load address	~32 MB above base, leaves space for U-Boot & stack
0x88000000	Device Tree Blob (DTB)	Loaded after kernel, avoids overlap ---- > forced by uboot headers
0x88100000	Overlay (DTBO)	Next address, just +1MB from DTB


not sure about addersss


mmc list
mmc dev 0 

fatload mmc 0:1 0x82000000 /zImage
fatload mmc 0:1 0x88000000 /am335x-boneblack.dtb
fatload mmc 0:1 0x88100000 /overlays/LedButtonOverlay1.dtbo 

fdt addr 0x88000000
fdt resize
fdt apply 0x88100000
bootz 0x82000000 - 0x88000000


bitbake -e | grep ^VARIABLENAME=