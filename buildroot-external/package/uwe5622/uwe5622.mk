####################################################
#
# UWE5622 Wi-Fi/Bluetooth Driver
#
####################################################

UWE5622_SITE:=$(BR2_EXTERNAL_MINE_PATH)/package_source/linux-uwe5622
UWE5622_SITE_METHOD:=local

UWE5622_MODULE_MAKE_OPTS = \
    CONFIG_SPARD_WLAN_SUPPORT=y \
    CONFIG_AW_WIFI_DEVICE_UWE5622=y \
    CONFIG_AW_BIND_VERIFY=y \
    CONFIG_WLAN_UWE5622=m \
    CONFIG_SPRDWL_NG=m \
    CONFIG_UNISOC_WIFI_PS=y \
    CONFIG_TTY_OVERY_SDIO=m \
    KERNELDIR=$(LINUX_DIR) \
    ARCH=$(KERNEL_ARCH) \
    CROSS_COMPILE=$(TARGET_CROSS)

define UWE5622_BUILD_CMDS
    $(MAKE) -C $(@D) $(UWE5622_MODULE_MAKE_OPTS)
endef

#define UWE5622_INSTALL_TARGET_CMDS
#    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/uwe5622
#    find $(@D) -name '*.ko' -exec cp {} $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/uwe5622/ \;
#endef

$(eval $(kernel-module))
$(eval $(generic-package))