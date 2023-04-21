#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"	

    #Display MOTD
    echo "
    ==========================================================================
    $(tput setaf 6)   Ehhh
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
  $(tput setaf 3)Which platform are you gonna use?
  1) Paper 1.8.8       7)  BungeeCord 
  2) Paper 1.12.2 
  3) Paper 1.16.5
  4) paper 1.17.1
  5) Paper 1.18.2    
  6) Paper 1.19.2
  "
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.8.8 please wait"

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085351443394570/paper-server.jar

    display
    
    echo "$(tput setaf 1)Invalid docker image. Change it to java 8"
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

2) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.12.2 please wait"

    sleep 4

    forceStuffs

    curl -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

    display   

    echo "$(tput setaf 1)Invalid docker image, otherwise it will not work.Change it to java 11"
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.16.5 and start it for you."

    sleep 4
    optimizeJavaServer
    launchJavaServer
    forceStuffs

    curl -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.17.1 and start it for you."

    sleep 4

    forceStuffs
    optimizeJavaServer
    launchJavaServer
    curl -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.18.2 and start it for you."

    sleep 4

    forceStuffs
    optimizeJavaServer
    launchJavaServer
    curl -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  6)
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2, please be patient."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085707342667838/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
      7)
    echo "$(tput setaf 3)Ok, I will download latest Bungeecord Server and start it for you."

    curl -O BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms128M -Xmx1024M -jar BungeeCord.jar
else
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
