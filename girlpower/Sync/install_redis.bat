wsl sudo apt-get update
wsl sudo apt-get upgrade
wsl sudo apt-get install build-essential

wsl wget http://download.redis.io/releases/redis-5.0.5.tar.gz
wsl tar xzf redis-5.0.5.tar.gz
cd redis-5.0.5
wsl make

wsl sudo make install

set /p DUMMY=Hit ENTER to continue..
