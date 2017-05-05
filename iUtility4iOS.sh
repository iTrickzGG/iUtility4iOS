#!/bin/bash
echo "Utility Script For iOS"
echo "Select An Option"
echo "*** - Sign As Root Before Running Option"
echo "======================================================="
echo "[HELP] Troubleshoot"
echo "[0] Reset NVRAM [BASIC]"
echo "[1] iDeviceInfo"
echo "[2] ECID_DUMP [64BIT]"
echo "[3] Set Generator To NVRAM"
echo "[4] ***Reboot To Recovery Mode, For Restore"
echo "======================================================="
read a
if [ "$a" = "HELP" ]
then
echo "Troubleshooting!"
echo "[*] Reset NVRAM [BASIC]"
echo "Resets Variables This Script Modifies"
echo " "
echo "[*] iDeviceInfo"
echo "Prints Info Of iDevice"
echo " "
echo "[*] ECID_DUMP [64BIT]"
echo "Dumps ECID"
echo "64BIT Devices ONLY"
echo " "
echo "[*] Set Generator To NVRAM"
echo "Sets Generator To NVRAM"
echo "Best To Use With :
-yalu102**b6 Or Later
-nonceEnabler**pre-ios10
"
echo "[*] ***Reboot To Recovery Mode.."
echo "Make Sure To Run As Root"
echo "To Escape Recovery :
-Use Tool Such As RecBoot/Redsn0w"
elif [ "$a" = "0" ]
then
echo "Current NVRAM"
nvram -p
echo "Resetting NVRAM..[BASIC]"
sleep 1
nvram -d com.apple.System.boot-nonce
nvram auto-boot=true
echo "Reseted NVRAM"
nvram -p
elif [ "$a" = "1" ]
then
echo "Dumping Info.."
sleep 1
printf "`echo iDevice =` `uname -n`\n"
printf "`echo Model =` `uname -m`\n"
printf "`echo BoardConfig =` `uname -i`\n"
printf "`echo Architecture =` `uname -p`\n"
printf "`echo Kernel =` `uname -s`\n"
uname -a
elif [ "$a" = "2" ]
then
echo "Dumping ECID.."
sleep 1
echo "ECID = :###############"
echo "ECID (Hex Form)"
openssl asn1parse -inform DER -in apticket.der | grep -A1 ECID | tail -n +1
elif [ "$a" = "3" ]
then
echo "Sets Generator To NVRAM"
echo "Type Generator Here"
read gen
	function pause(){
   read -p "$*"
}
echo "WARNING:This Will Now Modify NVRAM"
pause 'Press [Enter] Key To Proceed'
nvram com.apple.System.boot-nonce="$gen"
echo "Setting Generator.."
nvram -p
echo "Make Sure Your Generator Is Written There"
echo "@iTrickzGG"
#
elif [ "$a" = "4" ]
then
whoami
echo "Reboots To Recovery Mode"
echo "WARNING:This Will Now Modify NVRAM"
	function pause(){
   read -p "$*"
}
pause 'Press [Enter] Key To Proceed'
nvram auto-boot=false
echo "Setting auto-boot.."
echo "Your iDevice Is Now Ready"
pause 'Press [Enter] Key To Reboot'
echo "Rebooting To Recovery.."
echo "Good-Bye!"
echo "@iTrickzGG"
sleep 1
reboot
#
fi