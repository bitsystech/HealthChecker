#!/bin/sh

# Laeeq Humam Twitter@laeeqhumam
# This will check disk size & then notify the user if it's less than 15GB.
# Part of HealthCheck Framework
# Inform the user about yourself

consoleuser=$(stat -f%Su /dev/console)
cname=$(scutil --get ComputerName)

# Also feel free to try cocoaDialog for display notification
# https://cocoadialog.com/
# Don't forget to whitelist the app before you add it in script

# Created a fn that will be used for complex actions in future releases.
# Feel free to try a simpler way
sayhellow()
{
/usr/bin/osascript <<-EOD
tell application "Finder"
	activate
	set DialogTitle to "Hey $consoleuser !!!"		
	set DialogText to "My name is $cname & I just wanted to say Hi to you. If I've any problem & need your attention, I will notify you here."
	set DialogButton to "Nice to meet you too, $cname"
	set DialogIcon to "usr:local:HealthCheck:icons:hellow.icns"
	display dialog DialogText buttons {DialogButton} with title DialogTitle with icon file DialogIcon giving up after 30
end tell
EOD
}

sayhellow
# Feel free to add a Self Destroy line here. This script is only needed to run once.
