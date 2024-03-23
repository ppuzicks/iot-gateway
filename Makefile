BUILDDIR:=$(shell pwd)
RELEASE_DIR = $(BUILDDIR)/release

BUILDROOT=$(BUILDDIR)/buildroot
BUILDROOT_EXTERNAL=$(BUILDDIR)/buildroot-external
DEFCONFIG_DIR = $(BUILDROOT_EXTERNAL)/configs
VERSION_DATE := $(shell date --utc +'%Y%m%d')
VERSION_DEV := "dev$(VERSION_DATE)"

TARGETS := $(notdir $(patsubst %_defconfig,%,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_CONFIG := $(notdir $(patsubst %_defconfig,%-config,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_MENUCONFIG := $(notdir $(patsubst %_defconfig,%-menuconfig,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_SAVECONFIG := $(notdir $(patsubst %_defconfig,%-saveconfig,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_CLEAN := $(notdir $(patsubst %_defconfig,%-clean,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_KERNEL_MENUCONFIG := $(notdir $(patsubst %_defconfig,%-kernelconfig,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))
TARGETS_BUSYBOX_MENUCONFIG := $(notdir $(patsubst %_defconfig,%-busyboxconfig,$(wildcard $(DEFCONFIG_DIR)/*_defconfig)))

# Set O variable if not already done on the command line
ifneq ("$(origin O)", "command line")
O := $(BUILDDIR)/output
else
override O := $(BUILDDIR)/$(O)
endif

.NOTPARALLEL: $(TARGETS) $(TARGETS_CONFIG) all

.PHONY: $(TARGETS) $(TARGETS_CONFIG) all distclean help

all: $(TARGETS)

$(RELEASE_DIR):
	mkdir -p $(RELEASE_DIR)

$(TARGETS_BUSYBOX_MENUCONFIG): %-busyboxconfig:
	@echo "busybox-menuconfig $*"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) "busybox-menuconfig"

$(TARGETS_KERNEL_MENUCONFIG): %-kernelconfig:
	@echo "kernel-menuconfig $*"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) "linux-menuconfig"

$(TARGETS_MENUCONFIG): %-menuconfig:
	@echo "menuconfig $*"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) "menuconfig"

$(TARGETS_SAVECONFIG): %-saveconfig:
	@echo "savedefconfig $*"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) "savedefconfig"

$(TARGETS_CONFIG): %-config:
	@echo "config $*"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) "$*_defconfig"

$(TARGETS): %: $(RELEASE_DIR) %-config
	@echo "build $@"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$@ BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) VERSION_DEV=$(VERSION_DEV)
	cp -f $(O)/$@/images/sdcard.img $(RELEASE_DIR)/$@_sdcard.img

	# Do not clean when building for one target
ifneq ($(words $(filter $(TARGETS),$(MAKECMDGOALS))), 1)
	@echo "clean $@"
	$(MAKE) -C $(BUILDROOT) O=$(O)/$@ BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) clean
endif
	@echo "finished $@"

$(TARGETS_CLEAN): %-clean:
	$(MAKE) -C $(BUILDROOT) O=$(O)/$* BR2_EXTERNAL=$(BUILDROOT_EXTERNAL) clean

distclean:
	@echo "clean output dirs"
	rm -rf output/*
	rm -rf release/*

help:
	@echo "Supported targets: $(TARGETS)"
	@echo "Run 'make <target>' to build a target image."
	@echo "Run 'make <target>-menuconfig' to configure buildroot for a target."
	@echo "Run 'make <target>-busyboxconfig' to configure busybox for a target."
	@echo "Run 'make <target>-kernelconfig' to configure kernel for a target."
	@echo "Run 'make <target>-clean' to clean the target's build output."
	@echo "Run 'make distclean' to clean the all build output."