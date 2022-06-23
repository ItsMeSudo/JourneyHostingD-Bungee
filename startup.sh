#!/bin/bash
#SUDO                 2022              SERVERHU.EU

normal_startup() {
    echo "A mappa nem üres, szerver indítás folyamatban."
        cd /data && \
        java -Xms1G -Xmx1G -jar waterfall.jar nogui
}

installnstartup() {
    echo "A mappa üres, szerver telepítás folyamatban."
        cp /root/JourneyHostingD-Bungee/waterfall.jar /data && \
        cd /data && \
        echo eula=true > eula.txt && \
        chmod a+x waterfall.jar
    echo "A szerver telepítése kész van, szerver indítás folyamatban."
        cd /data && \
        java -Xms1G -Xmx1G -jar waterfall.jar nogui
}

if find /data -mindepth 1 -maxdepth 1 | read; then
   normal_startup
else
   installnstartup
fi