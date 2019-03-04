#!/vendor/bin/sh

FP_module=`getprop ro.hardware.fingerprint`

if [ "$FP_module" == 'gxfp3' ]; then
	/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfp5' ]; then
	/vendor/bin/gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfpa' ]; then
	/vendor/bin/gx_fpd
fi
