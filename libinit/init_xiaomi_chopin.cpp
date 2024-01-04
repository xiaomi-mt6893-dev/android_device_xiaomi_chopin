/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

static const variant_info_t chopin_info = {
    .hwc_value = "",
    .sku_value = "chopin",

    .brand = "Xiaomi",
    .device = "chopin",
    .marketname = "POCO X3 GT",
    .model = "21061110AG",
    .build_fingerprint = "POCO/chopin_global/chopin:12/SP1A.210812.016/V14.0.6.0.TKPMIXM:user/release-keys",
};

static const std::vector<variant_info_t> variants = {
    amber_info,
};

void vendor_load_properties() {
    search_variant(variants);
}
