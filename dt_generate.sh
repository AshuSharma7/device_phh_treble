#!/bin/bash
#Script to generate Device tree fot treble
cat <<EOF
"                                           _                                       "
"                                  __ _ ___(_)                                      "
"                                 / _` / __| |                                      "
"                                | (_| \__ \ |                                      "
"                                 \__, |___/_|                                      "
"                                 |___/                                             "
"                                                                                   "
"                        | Script By ASHU SHARMA |                                  "
"                            | GSI compilation |                                    "
EOF
read -p "Enter Rom Name: " rom
read -p "Enter arch name arm64/arm: " arch
read -p "Enter device type a/ab:" part
read -p "Do You want Gapps y/n: " choice
read -p "build type user/userdebug/eng: " build_type
read -p "Enter current variant for lunch: " lunch_variant
variant=treble_"$arch"_"$part"
rom_script='$(call inherit-product, device/phh/treble/'$rom'.mk)'
Build_dt() {
    mkdir -p device/phh/"$variant"
    touch device/phh/"$variant"/"$rom"_"$variant".mk
    if [ "$choice" == "y" ]; then
    gapps_script='$(call inherit-product, device/phh/treble/gapps.mk)'
    fi
    cat > device/phh/"$variant"/"$rom"_"$variant".mk << EOF
\$(call inherit-product, device/phh/treble/base-pre.mk)
include build/make/target/product/treble_common.mk
\$(call inherit-product, vendor/vndk/vndk.mk)
\$(call inherit-product, device/phh/treble/base.mk)
\$(call inherit-product, device/phh/treble/phhgsi_${arch}_$part/BoardConfig.mk)
$rom_script
$gapps_script
PRODUCT_NAME := ${rom}_$variant
PRODUCT_DEVICE := phhgsi_${arch}_$part
PRODUCT_BRAND := Android
PRODUCT_MODEL := Phh-Treble
EOF
    echo 'PRODUCT_MAKEFILES := '$rom'_'$variant'.mk' > device/phh/$variant/AndroidProducts.mk
}
Build_gsi() {
    lunch "$lunch_variant"-"$build_type"
    WITHOUT_CKECK_API=true make -j8 systemimage
}
Build_dt
