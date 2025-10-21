
# Yocto learn Project — Plan & Tasks

## TODO
- [x] Create project using a target distro
- [ ] Add dummy I2C device in DTS with an interrupt
- [ ] Implement kernel module that auto-loads when driver is present
- [ ] Create a system service to perform the required action
- [ ] Configure systemd units and dependencies
- [ ] Package and add required Python package

## Implementation notes
- Device: implement ISRs for the I2C interrupt and validate with kernel logs
- Kernel: expose module loading via modprobe/udev rules if needed
- Service: enable & test with systemctl (ensure proper unit dependencies)
- Packaging: add recipe for Python package and verify in image build

## Useful commands
```bash
# generate a salted SHA-512 password
openssl passwd -6 pass1234

# open a development shell for the kernel recipe
bitbake -c devshell virtual/kernel
```