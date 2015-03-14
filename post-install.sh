#! /bin/bash

# add aufs to initrd modules
grep -q -F 'aufs' /etc/initramfs-tools/modules || echo 'aufs' >> /etc/initramfs-tools/modules

# add aufs=tmpfs to GRUB_CMDLINE_LINUX_DEFAULT
grep -q -F 'GRUB_CMDLINE_LINUX_DEFAULT*aufs=tmpfs' /etc/default/grub || sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT\)="\(.*\)"$/\1="\2 aufs=tmpfs"/' /etc/default/grub

update-grub
update-initramfs -u 
