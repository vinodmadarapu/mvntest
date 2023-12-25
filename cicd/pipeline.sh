echo "start process pipeline"
#!/bin/bash

cp ./cicd/settings.xml settings.xml

JFROG_URL=https://svk2015.jfrog.io/artifactory
JFROG_COMMAND=${GITHUB_WORKSPACE}/jfrog
JFROG_DEFAULT_REPO=my-mvn-local-releases

POM_VERSION=$(mvn --batch-mode -s settings.xml  help:evaluate -Dexpression=project.version -q -DforceStdout)
POM_ARTIFACT_ID="jb-hello-world-maven"
#mvn help:evaluate -Dexpression=project.artifactId -q DforceStdout
NEW_VERSION=${POM_VERSION}-"1234"
echo pom version is ${POM_VERSION}
echo pom arti is ${NEW_VERSION}
echo jfcmd is ${JFROG_COMMAND}


#insall jfrog
curl -sS -fL https://getcli.jfrog.io | bash -s v2 "2.46.2"
chmod +x jfrog
#sudo mv jfrog /usr/local/bin
pwd
$JFROG_COMMAND --version 
$JFROG_COMMAND config add --artifactory-url=${JFROG_URL} --access-token="cmVmdGtuOjAxOjE3MzUwNDAwOTY6TTM1bXA5ZE1rcHM4b2MzdjgwU1EyeVRJNmtm"
$JFROG_COMMAND config show


# build and uppload
$JFROG_COMMAND rt mvn-config --repo-deploy-releases=$JFROG_DEFAULT_REPO --repo-deploy-snapshots=snapshots
$JFROG_COMMAND rt mvn install -DskipTests --batch-mode -s settings.xml --build-name=${POM_ARTIFACT_ID} --build-number=${NEW_VERSION}
$JFROG_COMMAND rt mvn build-publish ${POM_ARTIFACT_ID} ${NEW_VERSION}
#$JFROG_COMMAND rt mvn clean install
#jfrog rt mvn clean install


