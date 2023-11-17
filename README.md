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


## GPU
https://linux-sunxi.org/Sunxi-Cedrus

## Allwinner H6 Hantro G2 core
https://www.spinics.net/lists/linux-media/msg202705.html

## Kernel compile
```sh
$ export ARCH=arm64
$ export CROSS_COMPILE=<complier_path>/aarch64-linux-gnu-
$ make -j4 Image
$ make -j4 dtbs
```

http://trac.gateworks.com/wiki/MMC

## Armbian 설정 관련
<armbian_code>/config/sources/families/include/에서 각 soc별 inc파일 존재. (bootscript, 패치 파일 위치등 설정되어있음)

## docker-compose 관련
https://github.com/tommoulard/make-my-server

## reverse proxy 관련
https://caddyserver.com/
https://github.com/lucaslorentz/caddy-docker-proxy
https://blog.karaolidis.com/ultimate-home-server-part-3/



## OrangePi 4 LTS
### patch오류
1. ~~Add_driver_for_Motorcomm_yt8521_gigabit_ethernet_phy.patch build 오류~~ armbian것으로 패치 완료
  linux v6에 맞추어져 있음.
  ethernet phy는 yt8531이 실장되어 있음. 
  --> armbian것을 이용하여 패치 필요 or v6.x?

2. boot.cmd 파일 수정



# 참고 (패치파일들)
https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-opi
