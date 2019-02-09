#!/bin/sh
snap install docker

docker run -d --name chat -e ASPNETCORE_ENVIRONMENT='Development' -p 51069:80 atte902/chatwebapp:testi