$(call inherit-product, device/phh/treble/base-pre.mk)
include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk.mk)
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product, device/phh/treble/dot.mk)

PRODUCT_NAME := dot_treble_arm64_bvN
PRODUCT_DEVICE := phhgsi_arm64_ab
PRODUCT_BRAND := Android
PRODUCT_MODEL := Phh-Treble vanilla

PRODUCT_PACKAGES += 
