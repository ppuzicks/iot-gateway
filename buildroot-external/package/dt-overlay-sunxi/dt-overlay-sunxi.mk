################################################################################
#
# dt overlay sunxi
#
################################################################################

DT_OVERLAY_SUNXI_DEPENDENCIES = linux host-uboot-tools

ifeq ($(BR2_PACKAGE_DT_OVERLAY_SUNXI),y)

ifeq ($(BR2_aarch64),y)

define DT_OVERLAY_SUNXI_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(BINARIES_DIR)/allwinner/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm64/boot/dts/allwinner/overlay/*.dtbo $(BINARIES_DIR)/allwinner/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm64/boot/dts/allwinner/overlay/*.scr* $(BINARIES_DIR)/allwinner/overlay/
endef

else

define DT_OVERLAY_SUNXI_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(BINARIES_DIR)/allwinner/overlay/
	$(INSTALL) -D $(LINUX_DIR)/arch/arm/boot/dts/allwinner/overlay/*.dtbo $(BINARIES_DIR)/allwinner/overlay/
endef

endif
endif

$(eval $(generic-package))