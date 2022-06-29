# Docker-native-on-Termux-on-Android
You can now run Docker on Android with Termux and it's sub-packages

## How-To
First thing first you require is supported kernel with docker required config flags turned on and rooted device.You can search with your device code name with docker on GitHub because if someone has already compiled for your device
than you do not have to compile it. To search for it I would like to do in GitHub search is

- my device is k20 pro and it's codename is "Raphael"
so I will search for "Raphael docker kernel"
and if you find any compiled kernel than go with it otherwise you have to compile it by your self
trust me compiling kernel is very easy only you need is pc or laptop with minimum Intel-i3 or AMD-Athlon processor with UBUNTU
OR any other Debian based Linux OS installed
I will add easy steps for compiling kernel latter...

## Installation process
now I assume you have docker compatible kernel on your device now you need to install [termux](https://github.com/termux/termux-app/actions/workflows/debug_build.yml) on your device and open app and enter this commands:

## Termux-Docker

```bash
pkg install root-repo && pkg install docker
pkg install golang make cmake ndk-multilib tsu
```
after that you have to install tini but you have to compile it manually on your device with

```bash
mkdir $TMPDIR/docker-build
cd $TMPDIR/docker-build
cd $TMPDIR/docker-build
wget https://github.com/krallin/tini/archive/v0.19.0.tar.gz
tar xf v0.19.0.tar.gz
cd tini-0.19.0
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j8
make install
ln -s $PREFIX/bin/tini-static $PREFIX/bin/docker-init
```

## Get some useful scripts
```bash
cd ~
pkg install wget
mkdir dhs
cd dhs
wget https://raw.githubusercontent.com/Morakhiyasaiyam/Docker-native-on-Termux-on-Android/main/docker.sh
wget https://raw.githubusercontent.com/Morakhiyasaiyam/Docker-native-on-Termux-on-Android/main/network.sh
chmod 777 docker.sh && chmod 777 network.sh
```
## Hacks
 
Now add some shortcut commands to our bashrc to make alias of our commands. Open it and then copy paste text mentioned below
 
```bash
cd ~
nano /data/data/com.termux/files/usr/etc/bash.bashrc
```
and add this text to it..
I also added some useful alias I am using.
 
```bash
# It will make folder and cd in to it directly
mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}
# It will update everything on termux
alias ud="pkg update && pkg upgrade"
# Install package with it i.e. "pki wget"
alias pki="pkg install"
# Open this bashrc file for edit and on close it will cd to home directory i will make it to cd on current working directory
alias myalias="nano /data/data/com.termux/files/usr/etc/bash.bashrc && cd ~"
# It will run docker.sh script to start docker daemon
alias ds="sudo bash ~/dhs/docker.sh"
# It will run network.sh script for setting network for docker
alias ns="sudo bash ~/dhs/network.sh"
# Now you can run docker command without typing sudo
alias docker="sudo docker"
# alias for kubectl for minikube or any other kubernetes apps
alias k="kubectl"
# It will open nano with touch position enabled editor mode
alias nano="nano -m"
# To clear working termux tab
alias cl="clear"
# To exit from termux app quickly
alias q="exit"
```
now save file and exit from termux and restart termux app

# Run docker

```bash
# now to start docker you only have to type command "ns" for network and "ds" for docker daemon to start

ns
ds
```
Now you can run docker successfully

Thanks to :
- [FreddieOliveira](https://github.com/FreddieOliveira) for making it work for android.
- [termux](https://github.com/termux) for their amazing app.
