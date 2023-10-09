/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

static const variant_info_t choping_info = {
    .hwc_value = "",
    .sku_value = "choping",

    .brand = "POCO",
    .device = "choping",
    .marketname = "POCO X3 GT",
    .model = "21061110AG",
    .build_fingerprint = "POCO/chopin_global/chopin:12/SP1A.210812.016/V14.0.6.0.TKPMIXM:user/release-keys",
};

static const variant_info_t chopin_info = {
    .hwc_value = "",
    .sku_value = "chopin",

    .brand = "Redmi",
    .device = "chopin",
    .marketname = "Redmi Note 10 Pro",
    .model = "M2104K10AC",
    .build_fingerprint = "Redmi/chopin/chopin:12/SP1A.210812.016/V14.0.6.0.TKPMIXM:user/release-keys",
};

static const std::vector<variant_info_t> variants = {
    choping_info,
    chopin_info
};

void vendor_load_properties() {
    search_variant(variants);
}
