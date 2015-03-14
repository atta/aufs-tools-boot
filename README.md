# aufs-tools-boot

aufs-tools-boot is a tool that will mount the original root filesystem to /ro and creates a tmpfs in /rw. The two will be combined with aufs (a overlay filesystem) to a new unchangeable root filesystem, to activate you need to give aufs=tmpfs as bootparemeter. 

the original source can be found on: https://help.ubuntu.com/community/aufsRootFileSystemOnUsbFlash

## folders created in the initrd

  - /ro is the original root
  - /rw is the ramdisk
  - /aufs the overlay in the initrd
  - /aufs/ro the original root in the running linux
  - /aufs/rw the tmpfs in the running linux

## 

### Installation requirements

You need fpm installed on your system:

```sh
$ gem install fpm
```

### build the debian package 
```sh
$ git clone [git-repo-url] 
$ cd aufs-tools-boot
$ make deb
```

### Installation
``` sh
dpkg -i aufs-tools-boot_*.deb
```
this will do:

   - create the file /etc/initramfs-tools/scripts/init-bottom/rootaufs
   - add "aufs" to /etc/initramfs-tools/modules
   - add "aufs=tmpfs" to /etc/default/grub (GRUB_CMDLINE_LINUX_DEFAULT)
   - update grup "update-grub"
   - update initrd "update-initramfs -u "

License
----

GPL

