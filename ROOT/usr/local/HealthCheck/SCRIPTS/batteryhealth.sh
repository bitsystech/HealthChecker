#!/bin/sh

# Laeeq Humam Twitter@laeeqhumam
# This will check disk size & then notify the user if it's less than 15GB.
# Part of HealthCheck Framework
# Inform if battery health is poor.

isitMB=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | grep "Book")

if [ "$isitMB" != "" ]; then

batterycondition=$(system_profiler SPPowerDataType | grep "Condition" | awk '{print $2}')
consoleuser=$(stat -f%Su /dev/console)
cname=$(scutil --get ComputerName)

batterynotify()
{
/usr/bin/osascript <<-EOD
tell application "Finder"
	activate
	set DialogTitle to "Important Alert"		
	set DialogText to "Battery of this Mac, $cname has issues & it needs to be replaced. Please contact Helpdesk."
	set DialogButton to "OK"
	set DialogIcon to "usr:local:HealthCheck:icons:SAD.icns"
	display dialog DialogText buttons {DialogButton} with title DialogTitle with icon file DialogIcon giving up after 120
end tell
EOD
}
sleep 5
if [[ $batterycondition == "Normal" ]] || [[ $batterycondition == "Service Battery" ]]; then
batterynotify
fi
else
exit 0
fi
