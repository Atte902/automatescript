#!/bin/sh
if [ `sudo systemctl is-active docker` != "active" ]
then
	apt update
	apt install -y docker.io
fi
if [ $(docker inspect -f '{{.State.Running}}' chat) = "false" ]
then
	docker start chat
elif [ $(docker inspect -f '{{.State.Running}}' chat) = "true" ]
then
	echo "Already running"
else
	docker run -d --name chat -e ASPNETCORE_ENVIRONMENT='Development' -p 51069:80 --restart always atte902/chatwebapp:testi 
fi
