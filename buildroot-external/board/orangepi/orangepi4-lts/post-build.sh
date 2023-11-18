#!/bin/sh

linux_image()
{
	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
		echo "uImage"
	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
		echo "Image"
	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
		echo "Image.gz"
	else
		echo "zImage"
	fi
}

generic_getty()
{
	if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG}; then
		echo ""
	else
		echo "s/\s*console=\S*//"
	fi
}

PARTUUID="$($HOST_DIR/bin/uuidgen)"
PARTBOOTUUID="$($HOST_DIR/bin/uuidgen)"

install -d "$BINARIES_DIR/extlinux/"

## install uEnv.txt
sed -e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_MINE_PATH/board/orangepi/orangepi4-lts/uEnv.txt" > "$BINARIES_DIR/uEnv.txt"

sed -e "$(generic_getty)" \
	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
	-e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_MINE_PATH/board/orangepi/orangepi4-lts/extlinux.conf" > "$BINARIES_DIR/extlinux/extlinux.conf"

sed -e "s/%LINUXIMAGE%/$(linux_image)/g" \
	-e"s/%PARTBOOTUUID%/$PARTBOOTUUID/g" \
	-e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_MINE_PATH/board/orangepi/orangepi4-lts/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"

## install dt overlay
install -d $TARGET_DIR/boot/allwinner/overlay
#install -D $BINARIES_DIR/allwinner/overlay/* $TARGET_DIR/boot/allwinner/overlay


## install boot.scr
#cp -f $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr