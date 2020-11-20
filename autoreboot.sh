#!/bin/sh

while :
do
        echo "Lancement des serveurs..."
	sed -i '/EST/d' welcome.txt
	dateusa=$(zdump EST)
	dateeu=$(zdump OUEST)
	echo $dateusa ": Washington time" >> welcome.txt
	echo $dateeu ": London time" >> welcome.txt
	screen -S "drift-playground" -dm bash -c 'cd /home/enzo/acServer/drift-playground/; ./acServer >> server.log'
	screen -S "24h-of-spa" -dm bash -c 'cd /home/enzo/acServer/24h-of-spa/; ./acServer >> server.log'
	echo "Serveurs lancés !"
	screen -ls
	echo "Ils démarreront automatiquement dans 48h"
	sleep 172800
	killall acServer
	echo "serveurs éteints"
	screen -ls
	sleep 2
done
