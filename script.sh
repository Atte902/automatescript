#!/bin/sh
snap install docker
sleep 20s
docker pull docker.io/atte902/chatwebapp:testi
docker run -d --name chat -e ASPNETCORE_ENVIRONMENT='Development' -p 51069:80 atte902/chatwebapp:testi