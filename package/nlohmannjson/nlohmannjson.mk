################################################################################
#
# nlohmannjson
#
################################################################################
# Use a tag or a full commit ID
NLOHMANNJSON_VERSION := 3.10.5
NLOHMANNJSON_SITE := $(call github,nlohmann,json,v$(NLOHMANNJSON_VERSION))
NLOHMANNJSON_INSTALL_STAGING := YES
NLOHMANNJSON_INSTALL_TARGET := NO

$(eval $(meson-package))