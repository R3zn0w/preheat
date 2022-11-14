#!/bin/bash


while getopts l: flag
do
    case "${flag}" in
        l) level=${OPTARG};;
    esac
done

if [ -z "$level" ] || [ "$level" -lt "1" ] || [ "$level" -gt "3" ]
then
      echo "Usage: ./H34T.sh -l <level>\n"
      echo "Available levels:"
      echo "1 - Full temp"
      echo "2 - Tools only - install"
      echo "3 - Tools only - reinstall/purge"
      exit
fi

if [ "1" -eq "$level" ]
then
    echo -e "\e[32mFull install selected, this will take some time...\e[0m"
    sudo apt update 
    echo -e "\e[32mUpgrading default packages\e[0m"
    sudo apt upgrade -y
    echo -e "\e[31mRemoving bundled burp\e[0m"
    sudo apt purge burpsuite -y
    sudo apt install p7zip-full,python3-pip -y


    cd ~/Downloads
    echo -e "\e[32mInstalling VSCode\e[0m"
    wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O "code_install.deb"
    sudo apt install ./code_install.deb -y
    rm ./code_install.deb
fi

if [ "3" -eq "$level" ]
then
    echo -e "\e[31mPurging tools\e[0m"
    rm -rf ~/Desktop/tools
fi
echo -e "\e[32mGetting tools\e[0m"
mkdir ~/Desktop/tools
cp ./bundled.7z ~/Desktop/tools/

cd ~/Desktop/tools
git clone "https://github.com/lobuhi/byp4xx" 
chmod 700 byp4xx/byp4xx.py

mkdir deser
cd deser/

wget "https://github.com/frohoff/ysoserial/releases/download/v0.0.6/ysoserial-all.jar"
wget "https://github.com/NickstaDB/SerializationDumper/releases/download/1.13/SerializationDumper-v1.13.jar"

cd ../
git clone "https://github.com/ticarpi/jwt_tool"
chmod 700 jwt_tool/jwt_tool.py

wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage" -O Obsidian.AppImage
chmod 700 ./Obsidian.AppImage
git clone "https://github.com/pwndbg/pwndbg"
./pwndbg/setup.sh
git clone "https://github.com/danielmiessler/SecLists"

mkdir uploadable
cd uploadable

wget "https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz" -O chisel.gz
gunzip ./chisel.gz
chmod 700 ./chisel
git clone "https://github.com/t3l3machus/eviltree"

mkdir linux
cd linux

git clone "https://github.com/rebootuser/LinEnum"
wget "https://github.com/carlospolop/PEASS-ng/releases/download/20221113/linpeas.sh"
git clone "https://github.com/diego-treitos/linux-smart-enumeration"
wget "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"

cd ../
git clone "https://github.com/flozz/p0wny-shell"
rm p0wny-shell/screenshot.png


mkdir winda
cd winda

git clone "https://github.com/t3l3machus/hoaxshell"
git clone "https://github.com/Kevin-Robertson/Powermad"
git clone "https://github.com/PowerShellMafia/PowerSploit"
wget "https://github.com/carlospolop/PEASS-ng/releases/download/20221113/winPEAS.bat"
wget "https://github.com/carlospolop/PEASS-ng/releases/download/20221113/winPEASany.exe"

cd ../../
git clone "https://github.com/joernchen/xxeserve"


#unpack misc
7z x bundled.7z
rm bundled.7z

echo -e "\e[32mRemember to manually install burpsuite\e[0m"
echo "https://portswigger.net/burp/releases"