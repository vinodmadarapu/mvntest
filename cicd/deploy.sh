#!/bin/bash -e

#azure login
TENENTID="64ceb8ab-f04f-477d-8057-7dfdacb83dcb"
RG=RG1
SU="Azure subscription 1"
USERNAME=satya.madarapu23@gmail.com
PASSWORD=Sansat@2k

az login --service-principal --username=${USERNAME} --password=${PASSWORD} --tenant=${TENENTID}
az account set --subscription ${SU}

# az webapp deploy --resource-group= --name= --src-path=init-sh --type="static"  --target-path="init.sh"
# az webapp deploy source config-zip --resource-group= --name=  --src=  --debug
# az webapp restart --resource-group= --name=  --debug
