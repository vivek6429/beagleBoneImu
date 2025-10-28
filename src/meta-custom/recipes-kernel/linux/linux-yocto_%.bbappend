
# to add to the FILESEXTRAPATHS so that BitBake can find files in this directory
# why does ${THISDIR}/files: not work here? it looks at meta-custom/recipes-kernel/linux/beaglebone-yocto/defconfig


FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


#keep the existing config and just add new options from defconfig
KCONFIG_MODE = "alldefconfig"


SRC_URI:append  = " file://defconfig"
