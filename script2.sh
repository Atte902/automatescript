#!/bin/bash
apt update
apt install -y docker.io
docker run -d --name chat -e ASPNETCORE_ENVIRONMENT='Development' -p 51069:80 atte902/chatwebapp:testi