#!/bin/bash

echo "Running fsck on /dev/nvme0n1p1..."
echo -e "3\n1\n1\n1" | sudo fsck /dev/nvme0n1p1
echo "done."

echo "Mounting filesystems..."
sudo mount /dev/sda3 /mnt
sudo mount /dev/nvme0n1p1 /mnt/boot
echo "done."

echo "Entering NixOS installation..."
echo "NIXOS_INSTALL_BOOTLOADER=1 /nix/var/nix/profiles/system/bin/switch-to-configuration boot" | sudo nixos-enter
echo "Rebuilding bootloader..."
echo "done."
