#! /vendor/bin/sh

# Copyright (c) 2012-2013,2016,2018 The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#enable atfwd daemon all targets except sda, apq, qcs
setprop persist.vendor.radio.atfwd.start true;;

# Setup display nodes & permissions
# HDMI can be fb1 or fb2
# Loop through the sysfs nodes and determine
# the HDMI(dtv panel)

function set_perms() {
    #Usage set_perms <filename> <ownership> <permission>
    chown -h $2 $1
    chmod $3 $1
}

function setHDMIPermission() {
   file=/sys/class/graphics/fb$1
   dev_file=/dev/graphics/fb$1
   dev_gfx_hdmi=/devices/virtual/switch/hdmi

   set_perms $file/hpd system.graphics 0664
   set_perms $file/res_info system.graphics 0664
   set_perms $file/vendor_name system.graphics 0664
   set_perms $file/product_description system.graphics 0664
   set_perms $file/video_mode system.graphics 0664
   set_perms $file/format_3d system.graphics 0664
   set_perms $file/s3d_mode system.graphics 0664
   set_perms $file/dynamic_fps system.graphics 0664
   set_perms $file/msm_fb_dfps_mode system.graphics 0664
   set_perms $file/hdr_stream system.graphics 0664
   set_perms $file/cec/enable system.graphics 0664
   set_perms $file/cec/logical_addr system.graphics 0664
   set_perms $file/cec/rd_msg system.graphics 0664
   set_perms $file/pa system.graphics 0664
   set_perms $file/cec/wr_msg system.graphics 0600
   set_perms $file/hdcp/tp system.graphics 0664
   set_perms $file/hdcp2p2/min_level_change system.graphics 0660
   set_perms $file/hdmi_audio_cb audioserver.audio 0600
   ln -s $dev_file $dev_gfx_hdmi
}

# check for the type of driver FB or DRM
fb_driver=/sys/class/graphics/fb0
if [ -e "$fb_driver" ]
then
    # check for HDMI connection
    for fb_cnt in 0 1 2 3
    do
        file=/sys/class/graphics/fb$fb_cnt/msm_fb_panel_info
        if [ -f "$file" ]
        then
          cat $file | while read line; do
            case "$line" in
                *"is_pluggable"*)
                 case "$line" in
                      *"1"*)
                      setHDMIPermission $fb_cnt
                 esac
            esac
          done
        fi
    done

    # check for mdp caps
    file=/sys/class/graphics/fb0/mdp/caps
    if [ -f "$file" ]
    then
        setprop vendor.gralloc.disable_ubwc 1
        cat $file | while read line; do
          case "$line" in
                    *"ubwc"*)
                    setprop vendor.gralloc.enable_fb_ubwc 1
                    setprop vendor.gralloc.disable_ubwc 0
                esac
        done
    fi

    file=/sys/class/graphics/fb0
    if [ -d "$file" ]
    then
            set_perms $file/idle_time system.graphics 0664
            set_perms $file/dynamic_fps system.graphics 0664
            set_perms $file/dyn_pu system.graphics 0664
            set_perms $file/modes system.graphics 0664
            set_perms $file/mode system.graphics 0664
            set_perms $file/msm_cmd_autorefresh_en system.graphics 0664
    fi

    # set lineptr permissions for all displays
    for fb_cnt in 0 1 2 3
    do
        file=/sys/class/graphics/fb$fb_cnt
        if [ -f "$file/lineptr_value" ]; then
            set_perms $file/lineptr_value system.graphics 0664
        fi
        if [ -f "$file/msm_fb_persist_mode" ]; then
            set_perms $file/msm_fb_persist_mode system.graphics 0664
        fi
    done
else
    set_perms /sys/devices/virtual/hdcp/msm_hdcp/min_level_change system.graphics 0660
fi

boot_reason=`cat /proc/sys/kernel/boot_reason`
reboot_reason=`getprop ro.boot.alarmboot`
power_off_alarm_file=`cat /mnt/vendor/persist/alarm/data | tail -c 2 | head -c 1`
if [ "$boot_reason" = "3" ] || [ "$reboot_reason" = "true" ]; then
    if [ "$power_off_alarm_file" = "1" ]
    then
        setprop ro.vendor.alarm_boot true
        setprop debug.sf.nobootanimation 1
    fi
else
    setprop ro.vendor.alarm_boot false
fi

# copy GPU frequencies to vendor property
gpu_freq=`cat /sys/class/kgsl/kgsl-3d0/gpu_available_frequencies` 2> /dev/null
setprop vendor.gpu.available_frequencies "$gpu_freq"
