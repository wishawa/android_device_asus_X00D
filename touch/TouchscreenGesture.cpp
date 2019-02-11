/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "TouchscreenGestureService"

#include <unordered_map>

#include <android-base/file.h>
#include <android-base/logging.h>

#include <bitset>

#include "TouchscreenGesture.h"

namespace {
typedef struct {
    int32_t keycode;
    const char* name;
    int mask;
} GestureInfo;

// id -> info
const std::unordered_map<int32_t, GestureInfo> kGestureInfoMap = {
    {0, {265, "c Letter", 0x10}},
    {1, {266, "e Letter", 0x08}},
    {2, {267, "s Letter", 0x04}},
    {3, {263, "v Letter", 0x01}},
    {4, {268, "w Letter", 0x02}},
    {5, {264, "z Letter", 0x20}},
};

constexpr const char kControlPath[] = "/sys/bus/i2c/devices/i2c-3/3-0038/gesture_mode";

}  // anonymous namespace

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

Return<void> TouchscreenGesture::getSupportedGestures(getSupportedGestures_cb resultCb) {
    std::vector<Gesture> gestures;

    for (const auto& entry : kGestureInfoMap) {
        gestures.push_back({entry.first, entry.second.name, entry.second.keycode});
    }
    resultCb(gestures);

    return Void();
}

Return<bool> TouchscreenGesture::setGestureEnabled(
    const ::vendor::lineage::touch::V1_0::Gesture& gesture, bool enabled) {

    std::string gestureValue;

    if (!android::base::ReadFileToString(kControlPath, &gestureValue, true)) {
        LOG(ERROR) << "Failed to read " << kControlPath;
        return false;
    }

    int gestureMode = std::strtol(gestureValue.c_str(), NULL, 16) & ~0x40;

    const auto entry = kGestureInfoMap.find(gesture.id);
    if (entry == kGestureInfoMap.end()) {
        return false;
    }

    int mask = entry->second.mask;

    if (enabled) {
        gestureMode |= mask;
    } else {
        gestureMode &= ~mask;
    }

    if (gestureMode != 0) {
        gestureMode |= 0x40;
    }

    if (!android::base::WriteStringToFile(std::bitset<7>(gestureMode).to_string(), kControlPath, true)) {
        LOG(ERROR) << "Wrote file " << kControlPath << " failed";
        return false;
    }
    return true;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
