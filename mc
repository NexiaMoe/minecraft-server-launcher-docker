#!/bin/bash

if [ -z "$1" ]
 then
  clear
  echo "Minecraft Server Launcher on Docker by Nexiamuel"
  echo "Please insert Amount of RAM in Megabyte to the minecraft server (1GB is minimum)."
  echo ""
  echo "Usage :"
  echo "mc amount_ram"
  echo "Example:"
  echo "'mc 1024' <--- it will run minecraft server in 1024MB of ram (in Megabyte or MB)"
  exit 0
elif [ "$1" = "--install" ]
 then
  if [ -f /srv/minecraft/server.jar ]
   then
    echo "Minecraft server is exist bro"
    exit 0
  else
    clear
    echo "Installing Minecraft server to your Docker boii!"
    echo ""
    echo "Installing Java"
    apt update
    apt install default-jre -y
    apt install wget
    clear
    echo "downloading minecraft vanilla server"
    echo ""
    mkdir /srv/minecraft/
    cd /srv/minecraft || exit
    wget -O /srv/minecraft/server.jar "https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar"
    echo "Write eula to true, so you not to add manually"
    echo "eula=true" > /srv/minecraft/eula.txt
    echo "Done, now run it boi!"
    exit 1
  fi
elif [ "$1" = "--help" ]
 then
  echo "Usage :"
  echo "mc amount_ram"
  echo "Example:"
  echo "'mc 1024' <--- it will run minecraft server in 1024MB of ram (in Megabyte or MB)"
  echo ""
  echo "If want to change type of server, goto /srv/minecraft/ and download spigot or any server and rename to server.jar"
  echo "Also minecraft server data on /srv/minecraft/"
elif [ "$1" = "-h" ]
 then
  echo "Usage :"
  echo "mc amount_ram"
  echo "Example:"
  echo "'mc 1024' <--- it will run minecraft server in 1024MB of ram (in Megabyte or MB)"
  echo ""
  echo "If want to change type of server, goto /srv/minecraft/ and download spigot or any server and rename to server.jar"
  echo "Also minecraft server data on /srv/minecraft/"
else
  clear
  echo "starting Minecraft Server"
  cd /srv/minecraft/ || exit
  java -Xmx"$1"M -Xms"$1"M -jar /srv/minecraft/server.jar
fi
