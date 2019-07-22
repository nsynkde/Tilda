#Installation


-To enable Windows Subsystem for Linux, follow the instructions on Microsoft Docs. The short version is: In Windows 10, Microsoft replaces Command Prompt with PowerShell as the default shell. Open PowerShell as Administrator and run this command to enable Windows Subsystem for Linux (WSL):


```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```


-Reboot Windows after making the change — note that you only need to do this one time.

-Download and install one of the supported Linux distros from the Microsoft Store.

-Install the latest Redis version


```
wget http://download.redis.io/releases/redis-5.0.5.tar.gz
tar xzf redis-5.0.5.tar.gz
cd redis-5.0.5
make

sudo make install
```