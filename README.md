# 17.1 branch is WIP!


Android device tree for ASUS Zenfone 3 Max (ZC553KL)
========================================================

This is a work in progress porting LineageOS to the Zenfone 3 Max (Model X00DD).

Asus Zenfone 3 Max (codenamed "X00D") is a mid-range smartphone from Asus.

Kernel here: https://github.com/wishawa/android_kernel_asus_msm8937

## Spec Sheet

Feature                 | Specification                                                                       |
:---------------------- | :-----------------------------------------------------------------------------------|
Chipset                 | Qualcomm MSM8937 Snapdragon 430                                                     |
GPU                     | Adreno 505                                                                          |

## Progress

### Features
Feature                 | Status
:---------------------- | :-----------------------------------------------------------------------------------
Ril						| Maybe. Haven't tested.
Sensors					| Working
Camera					| Working
Camera Video Recording	| Working
Camera Photo Capture	| Working
Fingerprint				| Not working
Bluetooth				| Very buggy
Speaker					| Working
Wifi					| Working
GPS						| Working
Touchkey				| Working
FM Radio				| Not working
USB     				| Working
USB tethering			| Working
Wifi Hotspot			| Working

### Issues
Issue                   | Description
:---------------------- | :-----------------------------------------------------------------------------------
Camera Laser Focus      | Not sure if working or not. Throws errors very rapidly, yet the errors include the correct focus distance. Hmmm...
Screen Recording        | Resulting videos are broken (either unplayable or filled with encoding artifacts).
Bluetooth               | Not getting proper MAC address. Transfers fail often. Can't pair properly.

### Notes
Note                    | Status
:---------------------- | :-----------------------------------------------------------------------------------
Battery Life            | 5%-10% idle (only wifi on) overnight. Not great, but much better than before.



## This Repo

ROM issues? Open an GitHUb issue, comment on [XDA thread](https://forum.xda-developers.com/zenfone-3/how-to/lineageos-zenfone-3-max-zc553kl-t4032769), or email me.

Contributions and helps are welcomed.
