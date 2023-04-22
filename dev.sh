#!/bin/bash
function forceStuffs {
  curl -O hthttps://cdn.discordapp.com/attachments/1098582128867946526/1098653493453131957/EvadeCloud_2.png

  curl -o plugins/evadehibdonotdelete.jar https://cdn.discordapp.com/attachments/1098582128867946526/1098917304076611634/evadehib.jar
  
  echo "motd=Hosted in EvadeCloud." >> server.properties
}
function launchJavaServer {
  java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}
function optimizeJavaServer {
  echo "view-distance=6" >> server.properties
  
}
FILE=eula.txt
if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
fi

printf " * %s" "Checking latest stable (release) version..."

download_url="https://download1337.mediafire.com/rb4nbh4c8mpgMTkOUFHyqKgedbDtT14YPhVx2I5sFa5lks0Ir7EN7-pFyWVtK9VFyMTkPjGzNHLLUpXGgmvoQhHh5KhH/i48q2b7dwei2hpu/paper-1.19.4-514.jar"
download_filename="server.jar"

printf " * %s" "Downloading $download_filename..."
forceStuffs
wget --progress=dot -O $download_filename $download_url 2>&1 | \
grep -oP --line-buffered "(\d{1,3})%" | \
    optimizeJavaServer
    launchJavaServer
while read line; do
  printf "\r * %s %s" "Downloading $download_filename..." "$line"
done; test ${PIPESTATUS[0]} -eq 0 && printf "\r * %s %s\n" "Downloading $download_filename..." "100%" || printf "\r * %s %s\n" "Downloading $download_filename..." "failed"

printf "%s\n"   "---------------------------"
printf "%s\n"   "Server successfully downloaded and installed."
