#!/bin/bash -e

#azure login
TENENTID="64ceb8ab-f04f-477d-8057-7dfdacb83dcb"
RG=RG1
AS=RG26122023
SU="Azure subscription 1"
USERNAME=fa1085d1-a654-4325-8a45-6d5b9fe0534d
PASSWORD=cND8Q~oYKod4L0RPwxrNEKjCSbRiqLsqt8ZItdB7

az login --service-principal --username=${USERNAME} --password=${PASSWORD} --tenant=${TENENTID}
az account set --subscription "${SU}"

#chmod +x ./
az webapp deploy --resource-group=${RG} --name=${AS} --src-path="./_init.sh" --type="static"  --target-path="init.sh"
# az webapp deploy source config-zip --resource-group= --name=  --src=  --debug
# az webapp restart --resource-group= --name=  --debug
