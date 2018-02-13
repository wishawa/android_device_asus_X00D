#!/system/bin/sh
FP_module=`getprop ro.hardware.fingerprint`
HW_module=`getprop ro.config.versatility`

if [ "$FP_module" == 'gxfp3' ]; then
	start gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfp5' ]; then
	start gx_fpd_gxfp3
elif [ "$FP_module" == 'gxfpa' ]; then
	start gx_fpd
fi

if [ "$HW_module" == 'CN' ]; then
	start TEEService
fi