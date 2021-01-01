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
 - Allow usade of fake FTDI chip (or atleast address the issue)

# Description

The serial driver receives data from the Chargery BMS and can be used with Venus OS. The serial driver is coded in Python
and grabs the data form the RS232 USB interface every second. Example Images:

![ChargeryBMS](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybms.png)
![ChargeryBMS Voltages](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybmsvoltages.png)
![ChargeryBMS Impedances](https://raw.githubusercontent.com/Tobi177/venus-chargerybms/master/examples/chargerybmsimpedances.png)

# Installation Venus OS
 - Enable root access on Venus OS [https://www.victronenergy.com/live/ccgx:root_access]
 - Download the file /install/install.sh from this archive
 - Use it at you rown risk!
 - Execute the file, the latest versions of the the script and victron python library are downloaded
 - Installation will be done (remember we need a FT232RL USB adapter, check the requirements)
 - Reboot your device

# Requirements

- Chargery BMS
- FTDI Adapter FT232RL USB TTL Serial (IMPORTANT: Must be flashed with FT_PROG software to invert tx mode)
- Venus OS, GX Device or Raspberry Pi

# Installation on Venus OS
- Access Venus os via SSH with root: [https://www.victronenergy.com/live/ccgx:root_access]
- Download the install.sh under /install/install.sh
- run it with `sh install.sh`
- reboot
- connect the Battery and FTDI

# Notes
- The driver must be reinstalled after a firmware upgrade

