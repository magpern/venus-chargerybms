# License
 - MIT License
 - Use this project at your own risk

# Thanks a lot

Inspired by @Tobi177 : [https://github.com/Tobi177/venus-chargerybms].
He created a driver for a chargery BMS and made it available and thus provided a very good example of how to create such a driver
Many Thanks!

# Deviation from original code
 - Use The Chargery BMS as a Battery Monitor
 - GUI is default for 16 cells
 - No custom overview page
 - Allow usage of fake FTDI chip (or atleast address the issue)

# Description

The serial driver receives data from the Chargery BMS and can be used with Venus OS. The serial driver is coded in Python
and grabs the data form the RS232 USB interface every second. Example Images:

![ChargeryBMS](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybms.png)
![ChargeryBMS Voltages](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybmsvoltages.png)
![ChargeryBMS Impedances](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybmsimpedances.png)

# Requirements

- Chargery BMS
- FTDI Adapter FT232RL USB TTL Serial (IMPORTANT: Must be flashed with FT_PROG software to invert tx mode)
- Venus OS, GX Device or Raspberry Pi

# Installation on Venus OS
- Access Venus os via SSH with root: [https://www.victronenergy.com/live/ccgx:root_access]
- Download the install.sh AND ftdi_serialnumber under /install/
	Edit the serial number file
	```sh
	nano ftdi_serialnumber
	```
	type in the serial number of your FTDI usb device, without a line break. Save and exit nano (Ctrl + x and y)

	If you don't know the serial number of yor device use
	```sh
	usb-devices
	```
	and you can figure it out.
- change the permission of the install.sh by typing
	```sh
	chmod +x install.sh
	```
- run it with `./install.sh`
- reboot
- connect the Battery and FTDI

If you encounter problems running the install.sh, like bad line breaks (edited file on windows) you can clean the file with this command
```sh
sed -i -e 's/\r$//' install.sh
```

# Notes
- The driver must be reinstalled after a firmware upgrade

