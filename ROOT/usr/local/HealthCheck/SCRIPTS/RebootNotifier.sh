#!/bin/sh

# Laeeq Humam Twitter@laeeqhumam
# This will check disk size & then notify the user if it's less than 15GB.
# Part of HealthCheck Framework

notify_uptime()
{
/usr/bin/osascript <<-EOD
tell application "Finder"
	activate
	set DialogTitle to "Important: Please Restart You Mac"		
	set DialogText to "Oh! I'm working nonstop for $upTimeDays days & I need a restart to feel better. Please try to restart me once a day."
	set DialogButton to "OK"
	set DialogIcon to "usr:local:HealthCheck:icons:tired.icns"
	display dialog DialogText buttons {DialogButton} with title DialogTitle with icon file DialogIcon giving up after 30
end tell
EOD
}


lastBootTime=$(sysctl kern.boottime | awk -F'[ |,]' '{print $5}')   
currentTime=$(date +"%s")                                           
upTimeRaw=$((currentTime-lastBootTime))                             
upTimeMin=$((upTimeRaw/60))                                         
upTimeHours=$((upTimeMin/60))                                       
upTimeDays=$((upTimeHours/24))                                      
minusMinutes=$((((upTimeDays*24))*60))                              
remainingMin=$((upTimeMin-minusMinutes))                            
remainingHrs=$((remainingMin/60))                                   
minusHours=$((upTimeHours-remainingHrs))

## Figure out minutes value for uptime display
total1=$((upTimeDays*24*60))
total2=$((remainingHrs*60))
minusMinutes2=$((total1+total2))
remainingMinFin=$((upTimeMin-minusMinutes2))

UptimeThreshold1alt=$((UptimeThreshold1-1))
UptimeThreshold2alt=$((UptimeThreshold2-1))

if [ "$upTimeDays" == "1" ]; then
    daysText="Day"
else
    daysText="Days"
fi

if [ "$remainingHrs" == "1" ]; then
    hrsText="Hour"
else
    hrsText="Hours"
fi

if [ "$remainingMinFin" == "1" ]; then
    minsText="Minute"
else
    minsText="Minutes"
fi
echo "$upTimeDays"


if [[ $upTimeDays -ge 4 ]]; 
then
notify_uptime
fi

exit 0