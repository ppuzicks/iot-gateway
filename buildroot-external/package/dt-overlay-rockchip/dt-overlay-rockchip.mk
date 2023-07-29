################################################################################
#
# dt overlay rockchip
#
################################################################################

DT_OVERLAY_ROCKCHIP_DEPENDENCIES = linux host-uboot-tools

ifeq ($(BR2_PACKAGE_DT_OVERLAY_ROCKCHIP),y)

ifeq ($(BR2_aarch64),y)

define DT_OVERLAY_ROCKCHIP_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(BINARIES_DIR)/rockchip/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm64/boot/dts/rockchip/overlay/*.dtbo $(BINARIES_DIR)/rockchip/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm64/boot/dts/rockchip/overlay/*.scr* $(BINARIES_DIR)/rockchip/overlay/
endef

else

define DT_OVERLAY_ROCKCHIP_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(BINARIES_DIR)/rockchip/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm/boot/dts/rockchip/overlay/*.dtbo $(BINARIES_DIR)/rockchip/overlay/
endef

endif
endif

$(eval $(generic-package))