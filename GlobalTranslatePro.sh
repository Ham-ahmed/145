#!/bin/sh

#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1

#config
plugin=GlobalTranslatePro
version=6.6.1
url=https://raw.githubusercontent.com/Ham-ahmed/145/refs/heads/main/GlobalTranslatePro.tar.gz
package=/var/volatile/tmp/$plugin-$version.tar.gz

#download & install
echo "> Downloading $plugin-$version package  please wait ..."
sleep 3s

wget --show-progress -qO $package --no-check-certificate $url
tar -xzf $package -C /
extract=$?
rm -rf $package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then
echo "#########################################################"
echo "#                INSTALLED SUCCESSFULLY                 #"
echo "#              ON - MagicPanelGold v11.0                #"
echo "#             Enigma2 restart is required               #"
echo "#        .::UPLOADED BY  >>>>   HAMDY_AHMED::.          #"
echo "#     https://www.facebook.com/share/g/18qCRuHz26/      #"
echo "#########################################################"
echo "#           your Device will RESTART Now                #"
echo "#########################################################"

echo ""
echo "> Restarting Enigma2 in:"
for i in 3 2 1; do
    echo "   $i ..."
    sleep 1
done
echo "> Restarting now ..."

# Restart Enigma2
killall -9 enigma2

else
echo "> $plugin-$version package installation failed"
sleep 3s
fi