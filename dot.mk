$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit some common DotOS stuff.
$(call inherit-product, vendor/dot/config/common.mk)
TARGET_BOOT_ANIMATION_RES := 1080
