##################################################
#
# libspacenorm
#
##################################################
LIBSPACENORM_VERSION:=22.5.24
LIBSPACENORM_SITE:=$(TOPDIR)/../pkg_src/libspacenorm
LIBSPACENORM_SITE_METHOD:=local

$(eval $(cmake-package))
