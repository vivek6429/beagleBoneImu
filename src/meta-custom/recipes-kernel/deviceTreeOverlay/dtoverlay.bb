DESCRIPTION = "Custom device tree overlay for BeagleBone"
SECTION = "kernel"
LICENSE = "CLOSED"
COMPATIBLE_MACHINE = "(beaglebone|beaglebone-black|beaglebone-green)"


# DTS source
SRC_URI = "file://LedButtonOverlay1.dts \
           file://uEnv.txt "


# Set working directory : files from source URI are in WORKDIR
S = "${WORKDIR}"


#compiling source files will be done from build directory
#here the device tree class will look for .dts files to compile

# Inherit device tree class to build dtbo
inherit devicetree


# Output file name (Yocto will compile it)
DTBO_FILE = "LedButtonOverlay1.dtbo"

do_install:append() {

    # Install overlay for kernel/firmware reference
    install -d ${D}${nonarch_base_libdir}/firmware/overlays
    install -m 0644 ${B}/${DTBO_FILE} ${D}${nonarch_base_libdir}/firmware/overlays/


    # Also copy to boot partition (U-Boot looks here)
    install -d ${D}/boot/overlays
    install -m 0644 ${B}/${DTBO_FILE} ${D}/boot/overlays/


    # Copy uEnv.txt to the boot partition root
    install -d ${D}/boot
    install -m 0644 ${S}/uEnv.txt ${D}/boot/uEnv.txt


    # # Install the compiled dtbo file to boot overlays directory : uboot picks from here 
    # install -d ${D}/boot/overlays
    # install -m 0644 ${B}/LedButtonOverlay1.dtbo ${D}/boot/overlays/


    # # Install uEnv.txt to boot directory to load the overlay at boot time
    # install -d ${D}/boot
    # install -m 0644 ${S}/uEnv.txt ${D}/boot/uEnv.txt
}

#BitBake needs to know what subset of ${D} to package 
FILES:${PN} = " ${nonarch_base_libdir}/firmware/overlays  /boot /boot/overlays"