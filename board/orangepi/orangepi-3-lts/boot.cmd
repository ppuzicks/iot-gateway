setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait

fatload mmc 0 $kernel_addr_r Image
fatload mmc 0 $fdt_addr_r sun50i-h6-orangepi-3-lts.dtb

booti $kernel_addr_r - $fdt_addr_r
