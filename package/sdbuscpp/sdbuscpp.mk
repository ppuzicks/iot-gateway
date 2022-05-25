################################################################################
#
# sdbus-c++
#
################################################################################
SDBUSCPP_VERSION := 1.1.0
SDBUSCPP_SITE := $(call github,Kistler-Group,sdbus-cpp,v$(SDBUSCPP_VERSION))
SDBUSCPP_DEPENDENCIES := systemd
SDBUSCPP_INSTALL_STAGING := YES

SDBUSCPP_CONF_OPTS := -DBUILD_DOC=OFF

$(eval $(cmake-package))
