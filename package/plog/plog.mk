################################################################################
#
# plog
#
################################################################################
# Use a tag or a full commit ID
PLOG_VERSION := 1.1.6
PLOG_SITE := $(call github,SergiusTheBest,plog,$(PLOG_VERSION))
PLOG_CONF_OPTS := -DPLOG_BUILD_SAMPLES=OFF
PLOG_INSTALL_STAGING := YES
PLOG_INSTALL_TARGET := NO

define PLOG_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/plog
	$(INSTALL) -d $(STAGING_DIR)/usr/include/plog/Appenders
	$(INSTALL) -d $(STAGING_DIR)/usr/include/plog/Converters
	$(INSTALL) -d $(STAGING_DIR)/usr/include/plog/Formatters
	$(INSTALL) -d $(STAGING_DIR)/usr/include/plog/Initializers

	$(INSTALL) -D $(@D)/include/plog/*.h $(STAGING_DIR)/usr/include/plog
	$(INSTALL) -D $(@D)/include/plog/Appenders/*.h $(STAGING_DIR)/usr/include/plog/Appenders
	$(INSTALL) -D $(@D)/include/plog/Converters/*.h $(STAGING_DIR)/usr/include/plog/Converters
	$(INSTALL) -D $(@D)/include/plog/Formatters/*.h $(STAGING_DIR)/usr/include/plog/Formatters
	$(INSTALL) -D $(@D)/include/plog/Initializers/*.h $(STAGING_DIR)/usr/include/plog/Initializers
endef


$(eval $(generic-package))