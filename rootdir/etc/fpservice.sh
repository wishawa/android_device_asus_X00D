#!/system/vendor/bin/sh

FP_module=`getprop ro.hardware.fingerprint`

if [ "$FP_module" == 'gxfp3' ]; then
	/system/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfp5' ]; then
	/system/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfpa' ]; then
	/system/vendor/bin/gx_fpd
fi
