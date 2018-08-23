/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/stat.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#include "vendor_init.h"
#include "property_service.h"

#include <fcntl.h>
#include <unistd.h>

#define SIMCODE_FILE "/factory/SIMCODE"
#define SSN_FILE "/factory/SSN"

char const *product;
char const *description;
char const *fingerprint;
char const *device;
char const *model;
char const *power_profile;
char const *carrier;
char const *hwID;
char const *csc;
char const *dpi;

using android::base::GetProperty;
using android::base::ReadFileToString;

using android::init::property_set;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void property_override_triple(char const system_prop[], char const vendor_prop[], char const bootimg_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
    property_override(bootimg_prop, value);
}

static void set_serial()
{
    std::string ssnValue;

    if (ReadFileToString(SSN_FILE, &ssnValue)) {
        property_override("ro.serialno", ssnValue.c_str());
    } else {
        property_override("ro.serialno", "UNKNOWNSERIALNO");
    }
}

static void set_simcode()
{
    bool isDualsim;
    std::string simcodeValue;

    if (ReadFileToString(SIMCODE_FILE, &simcodeValue)) {
        isDualsim = (simcodeValue == "S1") ? 0 : 1;
    } else {
        isDualsim = 1;
    }

    if (!isDualsim) {
        property_set("persist.radio.multisim.config", "none");
    } else {
        property_set("persist.radio.multisim.config", "dsds");
    }
}

void check_varient()
{
    std::string project = GetProperty("ro.boot.id.prj", "");
    int rf = stoi(GetProperty("ro.boot.id.rf", ""));
    if (project == "6") {
        switch(rf){
            case 0: model = "ASUS_Z017D"; break; /* Global Varient */
            case 1: model = "ASUS_Z017DB"; break; /* Indonesian Varient */
            case 2: model = "ASUS_Z017DC"; break; /* Latin American Varient */
            default: model = "ASUS_Z017DA"; break; /* Default to Z017DA */
        }

        product = "ZE520KL";
        power_profile = "power_profile_Z017";
        fingerprint = "asus/WW_Phone/ASUS_Z017D_1:8.0.0/OPR1.170623.026/15.0410.1804.61-0:user/release-keys";
        description = "WW_Phone-user 8.0.0 OPR1.170623.026 15.0410.1804.61-0 release-keys";
        device = "ASUS_Z017D_1";
        carrier = "US-ASUS_Z017D-WW_Phone"; /* Default to US for now TODO: Split carrier depending value in /factory/COUNTRY */
        hwID = "ZE520KL_MP";
        csc = "WW_ZE520KL-15.0410.1804.61-0";
        dpi = "420";
    } else {
        switch(rf){
            case 0: model = "ASUS_Z012S";  break; /* Canadian varient */
            case 1: model = "ASUS_Z012DB"; break; /* Indonesian Varient */
            case 2: model = "ASUS_Z012DC"; break; /* Latin American variant */
            case 8: model = "ASUS_Z012DA";  break; /* JP/TW variant */
            case 15: model = "ASUS_Z012DE"; break; /* Chinese Varient */
            default: model = "ASUS_Z012DA"; break; /* Default to Z012DA */
        }

        product = "ZE552KL";
        power_profile = "power_profile_Z012";
        fingerprint = "asus/WW_Phone/ASUS_Z012D:8.0.0/OPR1.170623.026/15.0410.1804.60-0:user/release-keys";
        description = "WW_Phone-user 8.0.0 OPR1.170623.026 15.0410.1804.60-0 release-keys";
        device = "ASUS_Z012D";
        carrier = "US-ASUS_Z012D-WW_Phone"; /* Default to US for now TODO: Split carrier depending value in /factory/COUNTRY */
        hwID = "ZE552KL_MP";
        csc = "WW_ZE552KL-15.0410.1804.60-0";
        dpi = "400";
    }
}

void vendor_load_properties()
{
    set_serial();
    set_simcode();
    check_varient();

    property_override_dual("ro.product.name", "ro.vendor.product.name", "WW_Phone");
    property_override("ro.build.product", product);
    property_override("ro.build.description", description);
    property_override_triple("ro.build.fingerprint", "ro.vendor.build.fingerprint", "ro.bootimg.build.fingerprint", fingerprint);
    property_override_dual("ro.product.device", "ro.vendor.product.device", device);
    property_override_dual("ro.product.model", "ro.vendor.product.model", model);
    property_set("ro.power_profile.override", power_profile);
    property_set("ro.product.carrier", carrier);
    property_set("ro.hardware.id", hwID);
    property_set("ro.build.csc.version", csc);
    property_set("ro.sf.lcd_density", dpi);
    property_set("ro.com.google.clientidbase.ms", "android-asus-tpin");
}
