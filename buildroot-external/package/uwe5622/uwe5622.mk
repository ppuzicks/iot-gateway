##################################################
#
# uwe5622
#
##################################################
UWE5622_VERSION:=22.5.24
UWE5622_SITE:=$(BR2_EXTERNAL_IOTGATEWAY_PATH)/package_source/uwe5622
UWE5622_SITE_METHOD:=local
UWE5622_MODULE_MAKE_OPTS = \
	CONFIG_SPARD_WLAN_SUPPORT=y	\
	CONFIG_AW_WIFI_DEVICE_UWE5622=y	\
	CCONFIG_AW_BIND_VERIFY=y	\
	CONFIG_WLAN_UWE5622=m	\
	CONFIG_SPRDWL_NG=m	\
	CONFIG_UNISOC_WIFI_PS=y	\
	CONFIG_TTY_OVERY_SDIO=m

#UWE5622_MODULE_SUBDIRS = tty-sdio \
#	unisocwcn \
#	unisocwifi

$(eval $(kernel-module))
$(eval $(generic-package))