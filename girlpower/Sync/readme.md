# Installation


- To enable Windows Subsystem for Linux, follow the instructions on Microsoft Docs. The short version is: In Windows 10, Microsoft replaces Command Prompt with PowerShell as the default shell. Open PowerShell as Administrator and run this command to enable Windows Subsystem for Linux (WSL):


```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

- Reboot Windows after making the change — note that you only need to do this one time.


- Download and install one of the supported Linux distros from the Microsoft Store. I prefer Ubuntu 18.04. Installation is finished only after you launch WSL for the first time. During installation it will ask you to create the new user and set password. You will need that passport in order to use sudo commands. Yes, I know, too much linux shit, but be patient. Now close WSL shell.


- Next step is installing the latest Redis version on our subsystem. For that you can run install_redis.bat or open command promt and try using this commands:


```
wsl sudo apt-get update
wsl sudo apt-get upgrade
wsl sudo apt-get install build-essential

wsl wget http://download.redis.io/releases/redis-5.0.5.tar.gz
wsl tar xzf redis-5.0.5.tar.gz
cd redis-5.0.5
wsl make

wsl sudo make install
```

NB: you will need to type in the password couple of times and say yes to everyting linux ask you.

- To run server run start_redis.bat

- You can monitor redis activity by running start_redis_monitoring.bat
