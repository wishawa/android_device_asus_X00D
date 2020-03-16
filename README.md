Android device tree for ASUS Zenfone 3 Max (ZC553KL)
========================================================

This is a work in progress porting LineageOS to the Zenfone 3 Max (Model X00DD).

Asus Zenfone 3 Max (codenamed "X00D") is a mid-range smartphone from Asus.

Kernel here: https://github.com/wishawa/android_kernel_asus_msm8937

## Spec Sheet

| Feature                 | Specification                                                                       |
| :---------------------- | :-----------------------------------------------------------------------------------|
| Chipset                 | Qualcomm MSM8937 Snapdragon 430                                                     |
| GPU                     | Adreno 505                                                                          |

## Progress

Known Issue             | Descripton
:---------------------- | :-----------------------------------------------------------------------------------
Boots					| Yes
Ril						| Very likely not, though I haven't test with the latest build.
Sensor					| Working (tested Gyroscope, Magnetometer, Accelerometer)
Camera					| Working, but resolution seems wrong.
Camera Video Recording	| Not working
Camera Photo Capture	| Working, but resolution seems wrong.
Fingerprint				| Not working
Bluetooth				| Working buggily
Speaker					| Not working
Wifi					| 2.4GHz works, 5GHz doesn't.
GPS						| Working
Touchkey				| Working
FM Radio				| Not working
USB     				| Working
USB tethering			| Working
Wifi Hotspot			| Working

