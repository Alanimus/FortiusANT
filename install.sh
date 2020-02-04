apt-get install python3.7-pip python3.7-tk
pip3 install pyserial pyusb numpy
mkdir FortiusAnt
cd FortiusAnt
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/FortiusAnt.ico
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/FortiusAnt.jpg
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/FortiusAnt.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/FotiusAntCommand.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/FortiusAntGui.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/antDongle.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/debug.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/logfile.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/structConstants.py
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/usbTrainer.py
mkdir supportfiles
wget --quiet -N https://raw.githubusercontent.com/Alanimus/FortiusAnt/master/supportfiles/FortiusANT - Powercurve.xlsm
echo "##########################################################################"
echo "This script has installed python-pip and pyserial. It has created the"
echo "directory antifier and downloaded the required files."
echo "##########################################################################"
echo "Installation finished"
dongle=$(lsusb  | grep -o -i "0fcf:.\{4\}" | cut -c6-)
if [ -n "$dongle" ] ; then
 echo "Dongle found"
else
 echo "Dongle not found"
 dongle="[PRODUCT ID OF DONGLE FROM lsusb]"
fi
echo "If you have problems finding the dongle then ensure /dev/ttyUSB0 exists"
echo "If /dev/ttyUSB0 does not exist then create /etc/udev/rules.d/garmin-ant2.rules and add:"
echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"0fcf\", ATTRS{idProduct}==\"$dongle\", RUN+=\"/sbin/modprobe usbserial vendor=0x0fcf product=0x$dongle\""
echo "Now cd into antifier and read README.txt, then run sudo python ./antifier.py"