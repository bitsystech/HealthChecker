This is a quick solution to run a health check once a week. In the world of emojis & gifs, things have started making more sense to the users when it has one. 
The entire solution has lots of moving parts & it's completely modular. This is meant to inform users about the issues the Mac is facing & they are not aware of. 
v1.0 has the following:

- Bulleted 1. Notify users if Macs hasn't rebooted for more than 3 days
- Bulleted 2. Notify users if Hard Disk has less than 15GB free space
- Bulleted 3. Notify users if Battery needs replacement

Features to be added in v2.0 
1. Check & fix proxy
2. Check & fix time server

How to install locally for testing:
Download the ROOT folder. 


Best Practice to deploy for users:
- Bulleted Check permissions
- Bulleted Test it locally by running the HealthCheckEngine.sh manually 
- Bulleted Test multiple times.
- Bulleted Modify the LaunchAgent to run every 15mins & test.
- Bulleted Ensure that it works.
- Bulleted Make changes you need.
- Bulleted Test on 2-3 Macs with a frequency of Daily.
- Bulleted Now create the package & deploy in Production.


Folder structure where the files should be placed, will be added soon.
