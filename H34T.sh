#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install p7zip-full

mkdir ~/Desktop/tools
cp ./bundled.7z ~/Desktop/tools/

cd ~/Desktop/tools

git clone https://github.com/lobuhi/byp4xx 
chmod 700 byp4xx/byp4xx.py

mkdir deser
cd deser/

wget https://github.com/frohoff/ysoserial/releases/download/v0.0.6/ysoserial-all.jar
wget https://github.com/NickstaDB/SerializationDumper/releases/download/1.13/SerializationDumper-v1.13.jar

cd ../
git clone https://github.com/ticarpi/jwt_tool
chmod 700 jwt_tool/jwt_tool.py

wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage
chmod 700 ./Obsidian-1.0.3.AppImage
git clone https://github.com/pwndbg/pwndbg
./pwndbg/setup.sh
git clone https://github.com/danielmiessler/SecLists

mkdir uploadable
cd uploadable

wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz
gunzip ./chisel_1.7.7_linux_amd64.gz
mv ./chisel_1.7.7_linux_amd64 ./chisel
chmod 700 ./chisel
git clone https://github.com/t3l3machus/eviltree

mkdir linux
cd linux

git clone https://github.com/rebootuser/LinEnum
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221113/linpeas.sh
git clone https://github.com/diego-treitos/linux-smart-enumeration
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64

cd ../
git clone https://github.com/flozz/p0wny-shell
rm p0wny-shell/screenshot.png


mkdir winda
cd winda

git clone https://github.com/t3l3machus/hoaxshell
git clone https://github.com/Kevin-Robertson/Powermad
git clone https://github.com/PowerShellMafia/PowerSploit
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221113/winPEAS.bat
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221113/winPEASany.exe

cd ../../
git clone https://github.com/joernchen/xxeserve


#unpack misc
7z x bundled.7z