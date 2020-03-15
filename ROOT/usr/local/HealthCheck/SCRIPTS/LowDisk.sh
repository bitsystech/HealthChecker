#!/bin/sh

# Laeeq Humam Twitter@laeeqhumam
# This will check disk size & then notify the user if it's less than 15GB.
# Part of HealthCheck Framework

consoleuser=$(stat -f%Su /dev/console)

notify_user()
{
/usr/bin/osascript <<-EOD
tell application "Finder"
	activate
	set DialogTitle to "Important Alert"		
	set DialogText to "Oh! I am running very low on Disk Space. Please remove unwanted files. For help, call Helpdesk."
	set DialogButton to "OK"
	set DialogIcon to "usr:local:HealthCheck:icons:LOVE.icns"
	display dialog DialogText buttons {DialogButton} with title DialogTitle with icon file DialogIcon giving up after 30
end tell
EOD
}

leftover=$(df -h /Volumes/MacHD | sed -n 2p | awk '{print $4}' | sed 's/\(.*\)../\1/')
CN=$(scutil --get ComputerName)

if [[ $leftover -lt 1500 ]]; 
then
notify_user
fi

rm -Rf /usr/local/FileWaveInstallers/*

exit 0