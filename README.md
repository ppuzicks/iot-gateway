## Buildroot project

Buildroot external : please refer to https://github.com/linux4sam/buildroot-external-microchip

여기는 Buildroot에 없는 보드들에 대한 **패키지**, **패치**, **설정** 파일들을 저장한다.

# BUILD
``` shell
$ git clone https://github.com/ppuzicks/buildroot-external.git
$ cd buildroot-external
$ git submodule update --init
$ cd buildroot
$ BR2_EXTERNAL=../ make O=<build-dir> haoyu_a20_marsboard_defconfig
```

#### Rebuild boot.scr
``` shell
# Generate the uboot script
$ ubootName/tools/mkimage -C none -A arm -T script -d $BR2_EXTERNAL_PATH/board/RK3308/boot.cmd $BINARIES_DIR/boot.scr
```

## Decompile DTB
dtc -I dtb -O dts <your DTB> -o <dts filename>

UWE5622관련 patch
https://github.com/armbian/build/tree/master/patch/kernel/archive/rockchip64-5.19
https://forum.armbian.com/topic/23999-unisoc-uwe5621ds-on-rk3566-device-calling-orange-pi-experts/
https://github.com/armbian/build/blob/master/patch/kernel/archive/rockchip64-6.0/add-driver-for-Motorcomm-YT85xx%2BPHYs.patch

## Amlogic
https://wiki.manjaro.org/index.php/Amlogic_TV_boxes
https://github.com/ophub/amlogic-s9xxx-armbian


## Upgrade
https://rauc.io/


## IoT Server
https://github.com/openremote/openremote
https://github.com/thingsboard/thingsboard
https://github.com/GladysAssistant/Gladys
https://github.com/mainflux/mainflux
https://devicehive.com/

## Extend rootfs @ boottime
https://github.com/TOLDOTECHNIK/buildroot-webkit


## Partition Table

