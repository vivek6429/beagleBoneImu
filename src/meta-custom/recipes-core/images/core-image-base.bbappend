# inherit u-boot-extlinux-config

# UBOOT_EXTLINUX_FDTOVERLAYS:append =" /overlays/LedButtonOverlay1.dtbo "



ROOTFS_POSTPROCESS_COMMAND += "add_overlay_to_extlinux;"

add_overlay_to_extlinux() {
    EXTCONF="${IMAGE_ROOTFS}/boot/extlinux/extlinux.conf"
    if [ -f "$EXTCONF" ]; then
        echo "   fdtoverlays /overlays/LedButtonOverlay1.dtbo" >> $EXTCONF
        echo "[INFO] Added fdtoverlays to extlinux.conf"
    else
        echo "[WARN] extlinux.conf not found at $EXTCONF"
    fi
}