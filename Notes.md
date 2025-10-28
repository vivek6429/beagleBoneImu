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
