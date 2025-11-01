# to add to the FILESEXTRAPATHS so that BitBake can find files in this directory
# {THISDIR}/packagename/machinename  
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


#keep the existing config and just add new options from defconfig
# KCONFIG_MODE = "alldefconfig"
# SRC_URI:append  = " file://defconfig"

SRC_URI:append  = " file://am335x-boneblack.dts"
SRC_URI:append  = " file://gpioLedButton.cfg"


# SRC_URI:append  = " file://am335x-boneblack-custom.dts"
# IMAGE_BOOT_FILES:append = " am335x-boneblack-custom.dtb"
# KERNEL_DEVICETREE:append  = " ti/omap/am335x-boneblack-custom.dtb"

#asking kernel to support overlay symbols in dtb
KERNEL_DTC_FLAGS:append = " -@ "
#build dtc tool for target with overlay support
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
    bb.plain("* Modifiying kernel                           *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}



addtask display_banner before do_configure
