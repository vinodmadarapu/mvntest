#!/bin/bash -e

#azure login
az login --service-principal --username="vinod" --password="password" --tenant=tenantID"
az account set --subscription "subscription"

az webapp deploy --resource-group= --name= --src-path=init-sh --type="static"  --target-path="init.sh"
az webapp deploy source config-zip --resource-group= --name=  --src=  --debug
az webapp restart --resource-group= --name=  --debug
