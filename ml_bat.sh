#!/bin/sh

## You may need to customize the sysctl command below to use variables that show
## your system's battery state and remaining life.

interval=15 # customize this

# Set the variable stump_pid using one of these two lines.  Which line you use
# depends on whether you run the large StumpWM executable that bundles SBCL, or
# if you simply start SBCL and load StumpWM.  If you are using the FreeBSD
# StumpWM package, use the second line.

sleep 1

stump_pid="$(pgrep -a -n stumpwm)"
#stump_pid="$(pgrep -anf -U "$(id -u)" "sbcl .*(stumpwm:stumpwm)")"

# while stumpwm is still running
while kill -0 "$stump_pid" > /dev/null 2>&1; do
    sysctl -n hw.acpi.battery.state hw.acpi.battery.life | paste -s -d ' ' -
    sleep "$interval"
done
