sudo fdisk -l 
&&
umount /dev/sda
&&
sudo dd if=/home/(redacted)/Desktop/lol.iso of=/dev/sda bs=4M
&&
sync &&
sudo eject /dev/sdc
