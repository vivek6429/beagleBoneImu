
# to add to the FILESEXTRAPATHS so that BitBake can find files in this directory
# why does ${THISDIR}/files: not work here? it looks at meta-custom/recipes-kernel/linux/beaglebone-yocto/defconfig


FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


#keep the existing config and just add new options from defconfig
KCONFIG_MODE = "alldefconfig"


SRC_URI:append  = " file://defconfig"
# SRC_URI:append  = " file://am335x-boneblack-custom.dts"
SRC_URI:append  = " file://am335x-boneblack.dts"


# IMAGE_BOOT_FILES:append = " am335x-boneblack-custom.dtb"

# KERNEL_DEVICETREE:append  = " ti/omap/am335x-boneblack-custom.dtb"
KERNEL_DTC_FLAGS += " -@ "
KERNEL_DTC_FLAGS:append = " -I dts -O dtb -i ${S}/arch/arm/boot/dts/ti/omap"
DTC_FLAGS += " -@ "


do_configure:append() {
    # replace our DTS into kernel source tree
    echo "Replacing DTS in kernel source tree!!!!!"
    mkdir -p ${S}/arch/arm/boot/dts/ti/omap/
    install -m 0644 ${WORKDIR}/am335x-boneblack.dts ${S}/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
    # echo 'dtb-$(CONFIG_SOC_AM33XX) += am335x-boneblack-custom.dtb' >> ${S}/arch/arm/boot/dts/ti/omap/Makefile
}

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*  Example DEFCONFIG *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

# do_install:append() {
#     # Copy uEnv.txt to the boot partition root
#     install -d ${D}/boot
#     echo ${B}
#     install -m 0644 ${B}/arch/arm/boot/dts/ti/omap/am335x-boneblack-custom.dtb ${D}/boot/am335x-boneblack-custom.dtb

# }

addtask display_banner before do_configure
