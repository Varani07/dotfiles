#!/bin/bash

cd ~/archiso
qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -cpu host -cdrom archlinux.iso -drive file=arch_disk.qcow2,format=qcow2 -boot d -net nic -net user -display gtk -audiodev none,id=noaudio
