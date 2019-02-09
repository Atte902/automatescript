az container create --resource-group AtenTestiPaas --name chat-paas-container2 --image atte902/chatwebapp:testi --dns-name-label chat-testi --ports 80 51069 --environment-variables 'ASPNETCORE_ENVIRONMENT'='Development'


