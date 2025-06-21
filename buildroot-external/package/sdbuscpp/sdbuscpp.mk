################################################################################
#
# sdbus-c++
#
################################################################################
SDBUSCPP_VERSION := 2.1.0
SDBUSCPP_SITE := $(call github,Kistler-Group,sdbus-cpp,v$(SDBUSCPP_VERSION))
SDBUSCPP_DEPENDENCIES := systemd
SDBUSCPP_INSTALL_STAGING := YES

SDBUSCPP_CONF_OPTS += \
	-DBUILD_DOC=OFF \
	-DCMAKE_CXX_STANDARD=11 \
  -DCMAKE_CXX_STANDARD_REQUIRED=ON

HOST_SDBUSCPP_CONF_OPTS += \
	-DBUILD_CODE_GEN=ON \
	-DBUILD_DOC=OFF \
	-DBUILD_SHARED_LIBS=OFF \
	-DCMAKE_CXX_STANDARD=11 \
  -DCMAKE_CXX_STANDARD_REQUIRED=ON

$(eval $(cmake-package))
$(eval $(host-cmake-package))
