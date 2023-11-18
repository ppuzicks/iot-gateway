################################################################################
#
# sdbus-c++
#
################################################################################
SDBUSCPP_VERSION := 1.4.0
SDBUSCPP_SITE := $(call github,Kistler-Group,sdbus-cpp,v$(SDBUSCPP_VERSION))
SDBUSCPP_DEPENDENCIES := systemd
SDBUSCPP_INSTALL_STAGING := YES

SDBUSCPP_CONF_OPTS := -DBUILD_DOC=OFF
HOST_SDBUSCPP_CONF_OPTS := -DBUILD_CODE_GEN=ON -DBUILD_DOC=OFF -DBUILD_SHARED_LIBS=OFF 

$(eval $(cmake-package))
$(eval $(host-cmake-package))
