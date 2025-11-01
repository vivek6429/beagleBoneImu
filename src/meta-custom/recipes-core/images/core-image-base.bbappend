
# add any extra distro features here

IMAGE_INSTALL:append = " vim nano htop tmux less net-tools wget curl openssl git dbus iputils iproute2"
IMAGE_INSTALL:append = " evtest python3-dev python3-pip python3-setuptools python3-virtualenv python3 vim libgpiod libgpiod-tools"
IMAGE_INSTALL:append = " udev udev-extraconf"

IMAGE_INSTALL:append = " copytestscripts"

# inherit u-boot-extlinux-config

# UBOOT_EXTLINUX_FDTOVERLAYS:append =" /overlays/LedButtonOverlay1.dtbo "



# ROOTFS_POSTPROCESS_COMMAND += "add_overlay_to_extlinux;"

# add_overlay_to_extlinux() {
#     EXTCONF="${IMAGE_ROOTFS}/boot/extlinux/extlinux.conf"
#     if [ -f "$EXTCONF" ]; then
#         echo "   fdtoverlays /overlays/LedButtonOverlay1.dtbo" >> $EXTCONF
#         echo "[INFO] Added fdtoverlays to extlinux.conf"
#     else
#         echo "[WARN] extlinux.conf not found at $EXTCONF"
#     fi
# }