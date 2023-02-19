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

## install uEnv.txt
sed -e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_IOTGATEWAY_PATH/board/orangepi/orangepi-3-lts/uEnv.txt" > "$TARGET_DIR/boot/uEnv.txt"

sed "s/%PARTUUID%/$PARTUUID/g" "$BR2_EXTERNAL_IOTGATEWAY_PATH/board/orangepi/common/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"

## install dt overlay
install -d $TARGET_DIR/boot/allwinner/overlay
install -D $BINARIES_DIR/allwinner/overlay/* $TARGET_DIR/boot/allwinner/overlay

## install boot.scr
cp -f $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr