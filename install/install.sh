#!/bin/bash

read -p "Install Chargery BMS on Venus OS at your own risk? [Y to proceed]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Download driver and library"

	wget https://github.com/magpern/venus-chargerybms/archive/master.zip
	unzip master.zip
	rm master.zip

	wget https://github.com/victronenergy/velib_python/archive/master.zip
	unzip master.zip
	rm master.zip

	mkdir -p venus-chargerybms-master/ext/velib_python
	cp -R velib_python-master/* venus-chargerybms-master/ext/velib_python

	echo "Add Chargery entries to serial-starter"
	sed -i  's/ENV{VE_SERVICE}="rs485:default"/ENV{VE_SERVICE}="rs485:default:chargerybms"/g' /etc/udev/rules.d/serial-starter.rules
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

	ln -s /opt/victronenergy/chargerybms/service /service/chargerybms

	echo "Copy gui files"

	cp venus-chargerybms-master/gui/qml/MbItemRowTOBO.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/MbTextDescriptionTOBO.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMS.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMSImpedances.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageBatteryChargeryBMSVoltages.qml /opt/victronenergy/gui/qml
	cp venus-chargerybms-master/gui/qml/PageMain.qml /opt/victronenergy/gui/qml

	echo "To finish, reboot the Venus OS device"
fi