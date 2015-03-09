#!/bin/sh

bat_cmd="/sbin/sysctl -n hw.acpi.battery.state hw.acpi.battery.life | tr '\n' ' '"
interval=15
stump_pid=`pgrep -a -n stumpwm`

# while stumpwm is still running
while kill -0 $stump_pid > /dev/null 2>&1; do
    bat_info=`eval ${bat_cmd}`
    echo ${bat_info}
    sleep ${interval}
done