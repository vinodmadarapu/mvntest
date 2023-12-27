#!/bin/bash -e

#azure login
TENENTID="64ceb8ab-f04f-477d-8057-7dfdacb83dcb"
RG=RG1
AS=RG26122023
SU="Azure subscription 1"
USERNAME=fa1085d1-a654-4325-8a45-6d5b9fe0534d
PASSWORD=cND8Q~oYKod4L0RPwxrNEKjCSbRiqLsqt8ZItdB7

echo "step1"

ls -l
JFROG_URL=https://svk2015.jfrog.io/artifactory
JFROG_COMMAND=${GITHUB_WORKSPACE}/jfrog
JFROG_DEFAULT_REPO=my-mvn-local-releases
JFROG_PROD_REPO=mvn-local-prod-releases
JFROG_PROD_REPO=mvn-local-prod-releases
POM_ARTIFACT_ID="jb-hello-world-maven"
GROUP_ID=$(mvn --batch-mode -s settings.xml  help:evaluate -Dexpression=project.groupId -q -DforceStdout)
GROUP_ID_Replaced=${GROUP_ID//.//}


echo "step2"

#insall jfrog
curl -sS -fL https://getcli.jfrog.io | bash -s v2 "2.46.2"
chmod +x jfrog
#sudo mv jfrog /usr/local/bin
pwd
$JFROG_COMMAND --version 
$JFROG_COMMAND config add --artifactory-url=${JFROG_URL} --access-token="cmVmdGtuOjAxOjE3MzUwNDAwOTY6TTM1bXA5ZE1rcHM4b2MzdjgwU1EyeVRJNmtm"
$JFROG_COMMAND config show


echo "step3"
artifact_dir="artifact"
mkdir $artifact_dir
$JFROG_COMMAND rt dl "*${JFROG_PROD_REPO}/${GROUP_ID_Replaced}/${POM_ARTIFACT_ID}*.jar" $artifact_dir/ --sort-by created --sort-order=desc --limit=1
# echo prodjar/${GROUP_ID_Replaced}/${POM_ARTIFACT_ID}/*/*.jar > ./cicd/buildjarNameFile.txt
cd artifact_dir
pwd
ls -l

# az login --service-principal --username=${USERNAME} --password=${PASSWORD} --tenant=${TENENTID}
# az account set --subscription "${SU}"

# chmod +x ./cicd/_init.sh
# az webapp deploy --resource-group=${RG} --name=${AS} --src-path="./cicd/_init.sh" --type="static"  --target-path="init.sh"
# az webapp deploy source config-zip --resource-group=${RG} --name=${AS}  --src=  --debug
# # az webapp restart --resource-group= --name=  --debug
