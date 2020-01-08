#!/bin/sh


# CentOS 7 aarch64
# UEFI boot loader
wget http://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/latest/QEMU-AARCH64/RELEASE_GCC5/QEMU_EFI.img.gz
gunzip QEMU_EFI.img.gz
qemu-img create -f qcow2 varstore.img 64M

qemu-img create -f raw disk.img 4G

qemu-system-aarch64 -M virt -cpu host -enable-kvm -m 512M -monitor telnet:127.0.0.1:5555,server,nowait -drive if=pflash,format=raw,file=/data/centos/QEMU_EFI.img -drive if=pflash,file=/data/centos/varstore.img -drive if=virtio,format=raw,file=/data/centos/disk.img -vga std -vnc 0.0.0.0:1 -k en-us -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device virtio-net-pci,netdev=net0,id=net0,mac=52:54:00:c9:18:27 -device vhost-vsock-pci,id=vhost-vsock-pci0,guest-cid=3 -device piix3-usb-uhci -device usb-host,vendorid=0x04f2,productid=0x1665
