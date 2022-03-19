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