##################################################
#
# mesh-gatweway
#
##################################################
MESH_GATEWAY_VERSION:=22.5.24
MESH_GATEWAY_SITE:=$(TOPDIR)/../package_source/mesh-gatweway
MESH_GATEWAY_SITE_METHOD:=local

$(eval $(cmake-package))