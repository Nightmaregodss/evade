#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"	

    #Display MOTD
    echo "
    ==========================================================================
    $(tput setaf 6)   Ehhh, Yamete kudasai! Hicster is gay!
    ==========================================================================
    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O hthttps://cdn.discordapp.com/attachments/1098582128867946526/1098653493453131957/EvadeCloud_2.png

  # Forcing Hibernate Plugin.
  curl -o plugins/evadehibdonotdelete.jar https://cdn.discordapp.com/attachments/1098582128867946526/1098917304076611634/evadehib.jar

  # Forcing MOTD.
  echo "motd=Hosted in EvadeCloud." >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}



if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "
  $(tput setaf 6)Just type 1 in chat to install.
  1) Install
  "
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 6)Downloading the server!"

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085707342667838/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  *) 
    echo "Select 1 to install..."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://media.discordapp.net/attachments/1098582128867946526/1098653493453131957/EvadeCloud_2.png?width=418&height=418
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
# Redownload the Hibernate jar incase someone delete it.
  curl -o plugins/evadhibdonotdelete.jar https://cdn.discordapp.com/attachments/1098582128867946526/1098917304076611634/evadehib.jar
  display   
  launchJavaServer
fi
fi
  display   
  launchJavaServer
