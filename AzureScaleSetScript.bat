az vmss create --name chatscaleset2 --resource-group AtenTesti2 --image Canonical:UbuntuServer:18.04-LTS:latest  --vm-sku Standard_B1s --authentication-type password  --admin-username atte --admin-password AsD123456789 --instance-count 1 --vnet-name chat-vnet --load-balancer chat-lb --public-ip-address chat-scale-ip --upgrade-policy-mode automatic

az vmss extension set --publisher Microsoft.Azure.Extensions --version 2.0 --name CustomScript --resource-group AtenTesti2 --vmss-name chatscaleset2 --settings '{"fileUris":["https://github.com/Atte902/automatescript/blob/master/script2.sh"],"commandToExecute":"./script2.sh", "skipDos2Unix":"true"}'

az network lb probe create --name chat-lb-probe --lb-name chat-lb --port 51069 --protocol tcp --resource-group AtenTesti2

az network lb rule create --resource-group AtenTesti2 --name chat-bl-Rule --lb-name chat-lb --backend-pool-name chat-lbBEPool  --backend-port 51069 --frontend-ip-name loadBalancerFrontEnd --frontend-port 80 --protocol tcp --probe-name chat-lb-probe

az monitor autoscale create --resource-group AtenTesti2   --resource chatscaleset2   --resource-type Microsoft.Compute/virtualMachineScaleSets   --name chatautoscale   --min-count 1   --max-count 4   --count 1
  
az monitor autoscale rule create --resource-group AtenTesti2 --autoscale-name chatautoscale --condition "Percentage CPU > 70 max 5m" --scale out 1
  
az monitor autoscale rule create --resource-group AtenTesti2 --autoscale-name chatautoscale --condition "Percentage CPU < 30 avg 5m" --scale in 1