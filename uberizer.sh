#!/bin/sh
while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## by HcH / ... / ... ##";
echo "##########################################";
echo "## a. Manage Device   ##";
echo "## b. Root Options    ##";
echo "## c. ROM Kitchens    ##";
echo "## q. Quit            ##";
echo "########################";
read choice
case $choice in

a) while :
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

b) while :
do
clear
echo "##########################################";
echo "## Uberizer-linux ## Root Options       ##";
echo "##########################################";
exit 0 ;;
read choice
case $choice in

c) while :
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

q) clear
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
