#!/bin/bash

function forceStuffs {
    mkdir -p plugins https://media.discordapp.net/attachments/1138938556765704213/1150078592634593280/a6cb4ad0098a0ea125e1e2194f7e68eb.png
    
    curl -o plugins/evadehibdonotdelete.jar https://cdn.discordapp.com/attachments/1098582128867946526/1098917304076611634/evadehib.jar
    
    echo "motd=Hosted in Myridax. Fun fact of the week: The host has been running smooth since Demon, CR072 and Kns joined the team." >> server.properties
}

function launchJavaServer {
    java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

forceStuffs

curl -O https://cdn.discordapp.com/attachments/928863382235389993/1099190007161442345/server.jar

optimizeJavaServer

launchJavaServer
    if [ ! -d "plugins" ]; then
        mkdir plugins
    fi

    if [ ! -f "plugins/evadehibdonotdelete.jar" ]; then
        curl -o plugins/evadehibdonotdelete.jar https://cdn.discordapp.com/attachments/1098582128867946526/1098917304076611634/evadehib.jar
    fi
    if [ ! -f "server-icon.png" ]; then
        curl -O  https://media.discordapp.net/attachments/1098582128867946526/1099179452287696966/server-icon.png
        fi
