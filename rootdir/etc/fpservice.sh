#!/system/vendor/bin/sh

/system/vendor/bin/fpseek

FP_module=`getprop ro.hardware.fingerprint`

BOOTSTATE=`getprop sys.boot_completed`

while [ "$BOOTSTATE" != "1" ]
do
    /system/bin/sleep 1
    BOOTSTATE=`getprop sys.boot_completed`
done

if [ "$FP_module" == 'gxfp3' ]; then
	/system/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfp5' ]; then
	/system/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfpa' ]; then
	/system/vendor/bin/gx_fpd
fi
