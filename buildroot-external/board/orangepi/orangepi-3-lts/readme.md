### bootlog @armbian
```text
U-Boot SPL 2022.07-armbian (Aug 30 2022 - 06:47:16 +0000)
DRAM: 2048 MiB
Trying to boot from MMC1
NOTICE:  BL31: v2.2(debug):a04808c1-dirty
NOTICE:  BL31: Built : 06:47:07, Aug 30 2022
NOTICE:  BL31: Detected Allwinner H6 SoC (1728)
NOTICE:  BL31: Found U-Boot DTB at 0xc083bc0, model: OrangePi 3 LTS
INFO:    ARM GICv2 driver initialized
NOTICE:  PMIC: Probing AXP805
NOTICE:  PMIC: AXP805 detected
INFO:    BL31: Platform setup done
INFO:    BL31: Initializing runtime services
INFO:    BL31: cortex_a53: CPU workaround for 855873 was applied
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x4a000000
INFO:    SPSR = 0x3c9



U-Boot 2022.07-armbian (Aug 30 2022 - 06:47:16 +0000) Allwinner Technology

CPU:   Allwinner H6 (SUN50I)
Model: OrangePi 3 LTS
DRAM:  2 GiB
Core:  50 devices, 14 uclasses, devicetree: separate
WDT:   Not starting watchdog@7020400
MMC:   mmc@4020000: 0, mmc@4022000: 1
Loading Environment from FAT... Unable to use mmc 0:1...
In:    serial@5000000
Out:   serial@5000000
Err:   serial@5000000
Net:   No ethernet found.
Autoboot in 1 seconds
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found U-Boot script /boot/boot.scr
3202 bytes read in 2 ms (1.5 MiB/s)
## Executing script at 4fc00000
U-boot loaded from SD
Boot script loaded from mmc
203 bytes read in 2 ms (98.6 KiB/s)
37640 bytes read in 5 ms (7.2 MiB/s)
Failed to load '/boot/dtb/allwinner/overlay/-fixup.scr'
10687385 bytes read in 529 ms (19.3 MiB/s)
21866504 bytes read in 1081 ms (19.3 MiB/s)
Moving Image from 0x40080000 to 0x40200000, end=41730000
## Loading init Ramdisk from Legacy Image at 4ff00000 ...
   Image Name:   uInitrd
   Image Type:   AArch64 Linux RAMDisk Image (gzip compressed)
   Data Size:    10687321 Bytes = 10.2 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 4fa00000
   Booting using the fdt blob at 0x4fa00000
   Loading Ramdisk to 495ce000, end 49fff359 ... OK
   Loading Device Tree to 000000004955c000, end 00000000495cdfff ... OK

Starting kernel ...
```