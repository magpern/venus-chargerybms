#!/bin/bash

read -p "Install Chargery BMS on Venus OS at your own risk? [Y to proceed]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Download driver and library"

	wget -nv https://github.com/magpern/venus-chargerybms/archive/Master.zip
	unzip -o -q Master.zip
	rm Master.zip

	wget -nv https://github.com/victronenergy/velib_python/archive/master.zip
	unzip -o -q master.zip
	rm master.zip

	mkdir -p venus-chargerybms-master/ext/velib_python
	cp -R velib_python-master/* venus-chargerybms-master/ext/velib_python

	echo "Add Chargery entries to serial-starter"
	serialnumber=$(head -n 1 ftdi_serialnumber)

	grep -q -F $serialnumber /etc/udev/rules.d/serial-starter.rules
	if [ $? -ne 0 ]; then
		echo 'ACTION=="add", ATTRS{serial}=="'$serialnumber'", ENV{VE_SERVICE}="chargerybms"' >> /etc/udev/rules.d/serial-starter.rules
	fi
	
	sed -i  '/service.*imt.*dbus-imt-si-rs485tc/a service chargerybms     chargerybms' /etc/venus/serial-starter.conf

	echo "Install Chargery driver"
	mkdir -p /var/log/chargerybms
	mkdir -p /opt/victronenergy/chargerybms
	cp -R venus-chargerybms-master/ext /opt/victronenergy/chargerybms
	cp -R venus-chargerybms-master/driver/* /opt/victronenergy/chargerybms

	chmod +x /opt/victronenergy/chargerybms/start-chargerybms.sh
	chmod +x /opt/victronenergy/chargerybms/chargerybms.py
	chmod +x /opt/victronenergy/chargerybms/service/run
	chmod +x /opt/victronenergy/chargerybms/service/log/run

	ln -sf /opt/victronenergy/chargerybms/service /service/chargerybms

	echo "Copy gui files"

	cp venus-chargerybms-master/gui/qml/MbItemRowTOBO.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/MbTextDescriptionTOBO.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMS.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMSImpedances.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMSVoltages.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageMain.qml /opt/victronenergy/gui/qml

	echo "To finish, reboot the Venus OS device"
fi