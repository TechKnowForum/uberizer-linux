#!/bin/sh
adb wait-for-device;
while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ##  by HcH / skrzyp   ##";
echo "##########################################";
echo "## a. Manage Device   ##";
echo "## b. Root Options    ##";
echo "## c. BusyBox menu    ##";
echo "## d. ROM Kitchens    ##";
echo "## q. Quit            ##";
echo "########################";
read choice
case $choice in

A) while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## Manage Device      ##";
echo "##########################################";
echo "## 1. Fix WiFi  ##";
echo "##################";
exit 0 ;;
read choice
case $choice in

B) while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## Root Options       ##";
echo "##########################################";
echo "## Root Android 1.6 Donut v1            ##";
echo "## Root Android 1.6 Donut v2            ##";
echo "## Root Android 2.2 Froyo               ##";
echo "## Root Android 2.3 GingerBread         ##";
echo "## Root Android 4.0 Ice Cream Sandwich  ##";
echo "##########################################";
exit 0 ;;
read choice
case $choice in


:root16
echo "Root for Android 1.6 Donut by HcH"
echo "using Magic Android Apps su bin (no su elevation)"
echo "Copying Superuser bin ..."
cp changer_files/su7/su /system/bin/su
cp changer_files/su7/su /system/xbin/su
echo "Setting owner ..."
chown root.root /system/bin/su
chown root.root /system/xbin/su
echo "Setting permissions ..."
chmod 4777 /system/bin/su
chmod 4777 /system/xbin/su

:root162
echo "Root for Android 1.6 Donut v2 by HcH"
echo "Copying Superuser to system app ..."
cp changer_files/su5/Superuser.apk /system/app/Superuser.apk
echo "Copying Superuser bin ..."
cp changer_files/su5/su /system/bin/su
echo "Setting owner ..."
chown root.root /system/bin/su
chown root.root /system/xbin/su
echo "Setting permissions ..."
chmod 4777 /system/bin/su
chmod 4777 /system/xbin/su

:root23
echo "Root for Android 2.3 GingerBread by HcH"
echo "Copying Superuser to system app ..."
cp changer_files/su8/Superuser.apk /system/app/Superuser.apk
echo "Copying Superuser bin ..."
cp changer_files/su8/su /system/bin/su
cp changer_files/su8/su /system/xbin/su
echo "Setting owner ..."
chown root.root /system/bin/su
chown root.root /system/xbin/su
echo "Setting permissions ..."
chmod 6755 /system/bin/su
chmod 6755 /system/xbin/su
chmod 755 /system/app/Superuser.apk
echo.

:root40
echo "Root for Android 4.0.x by HcH"
echo "When remount FS is not enough, remounting rootfs ..."
mount -o rw,remount -t rootfs rootfs /
echo "Remounting system ..."
mount -o rw,remount -t /system /system
echo "Copying Busybox xbin ..."
cp changer_files/su11/busybox /system/xbin/busybox
echo "Installing busybox ..."
chmod 4755 /system/xbin/busybox
/system/xbin/busybox --install -s /system/xbin
echo "Copying SU xbin ..."
cp changer_files/su11/su /system/xbin/su
echo "Copying Superuser app ..."
cp changer_files/su11/Superuser.apk /system/app/Superuser.apk
echo "Settings owner ..."
chown root.root /system/xbin/su
echo "Setting permissions ..."
chmod 6755 /system/xbin/su
chmod 644 /system/app/Superuser.apk
echo "Creating su symlink for xbin ..."
rm /system/bin/su
rm /system/sbin/su
ln -s /system/xbin/su /system/bin/su



C) while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## BusyBox Installer  ##";
echo "##########################################";
echo "## 1. busybox-armv5l                    ##";
echo "##  ARMv5 ARM7EJ, ARM9E, ARM10E, XScale ##";
echo "##                                      ##";
echo "## 2. busybox-armv6l                    ##";
echo "##  ARMv6 ARM11                         ##";
echo "##                                      ##";
echo "## 3. busybox-mips                      ##";
echo "##  MIPS based devices                  ##";
echo "##                                      ##";
echo "## 4. busybox-x86_64                    ##";
echo "##  x86/x64 32bit, 64bit                ##";
echo "##########################################";
exit 0 ;;
read choice
case $choice in

echo "Copying Busybox xbin ...";
cp changer_files/su11/busybox /system/xbin/busybox;
echo "Installing busybox ...";
chmod 4755 /system/xbin/busybox;
/system/xbin/busybox --install -s /system/xbin;



D) while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## Rom Kitchens       ##";
echo "##########################################";
exit 0 ;;
read choice
case $choice in

1)
ls /sdcard/FirmwareInstall/packages/fs_patch/root_patch/lib/modules/2.6.32.9-default/rt3070sta.ko > /dev/null;
if [ $? -eq 2 ]
then
cp /sdcard/changer_files/rt3070sta.ko /sdcard/FirmwareInstall/packages/fs_patch/root_patch/lib/modules/2.6.32.9-default/rt3070sta.ko
clear
echo "Uberoid has RT3070v2 support now"
sleep 5 
else
clear
echo "Uberoid already has RT3070v2 support"
sleep 5
fi
;;

Q) clear
echo "Thank you for (ab)using the Uberizer, goodbye!";
sleep 5
exit 0 ;;

*) clear
clear
echo "##########################################";
echo "## Uberizer-linux ## by HcH / ... / ... ##";
echo "##########################################";
echo "## a. Manage Device   ##";
echo "## b. Root Options    ##";
echo "## c. ROM Kitchens    ##";
echo "## q. Quit            ##";
echo "########################";
;;
esac
done
