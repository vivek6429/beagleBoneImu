DESCRIPTION = "recipe to easily add some scripts to the image"
LICENSE = "CLOSED"




SRC_URI = "file://toggleLed.sh "

S = "${WORKDIR}"

do_install() {
    install -d ${D}/usr/bin/testscripts
    install -m 0755 ${S}/toggleLed.sh ${D}/usr/bin/testscripts/toggleLed.sh
}