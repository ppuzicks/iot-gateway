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

sed -e "$(generic_getty)" \
	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
	-e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_IOTGATEWAY_PATH/board/orangepi/orangepi-4lts/extlinux-old.conf" > "$BINARIES_DIR/extlinux/extlinux.conf"

sed -e "s/%LINUXIMAGE%/$(linux_image)/g" \
	-e"s/%PARTBOOTUUID%/$PARTBOOTUUID/g" \
	-e "s/%PARTUUID%/$PARTUUID/g" \
	"$BR2_EXTERNAL_IOTGATEWAY_PATH/board/orangepi/orangepi-4lts/genimage-old.cfg" > "$BINARIES_DIR/genimage.cfg"
