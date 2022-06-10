##################################################
#
# le-gatweway
#
##################################################
LE_GATEWAY_VERSION:=22.5.24
LE_GATEWAY_SITE:=$(TOPDIR)/../pkg_src/le-gateway
LE_GATEWAY_SITE_METHOD:=local
LE_GATEWAY_INSTALL_STAGING:=NO
LE_GATEWAY_INSTALL_TARGET:=YES
LE_GATEWAY_DEPENDENCIES := plog json-for-modern-cpp sdbuscpp


$(eval $(cmake-package))