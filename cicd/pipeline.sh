echo "start process pipeline"

cp ./cicd/settings.xml settings.xml

JFROG_URL=https://svk2015.jfrog.io/artifactory
JFROG_COMMAND=${GITHUB_WORKSPACE}/jfrog
JFROG_DEFAULT_REPO=dev-releases

POM_VERSION=$(mvn --batch-mode -s settings.xml  help:evaluate -Dexpression=project.version -q -DforceStdout)
POM_ART_ID=$(mvn --batch-mode -s settings.xml help:evaluate -Dexpression=project.artifactId -q DforceStdout)
# NEW_VERSION=${POM_VERSION}-$(date)
echo pom version is ${POM_VERSION}
echo pom arti is ${POM_ART_ID}


#insall jfrog
curl -sS -fL https://getcli.jfrog.io | bash -s v2 "2.46.2"
# chmod +x jfrog
# sudo mv jfrog /usr/local/bin
# jfrog --version
# pwd
# $JFROG_COMMAND --version 
# $JFROG_COMMAND config add --artifactory-url=${JFROG_URL} --access-token=cmVmdGtuOjAxOjE3MzQ2NDQzMTU6YzJybVRCUFFTeXZFZDBub0lBSHEzWXBaWWVP
# $JFROG_COMMAND config show

#POM_VERSION= $(mvn --batch-mode -s settings.xml help:evaluate -Dexpression=project.version -q -DforceStdout)

# POM_ARTIFACT_ID=$(mvn --batch-mode -s settings.xml help:evaluate -Dexpression=project.artifactId -q DforceStdout)
# NEW_VERSION=${POM_VERSION}-$(date + %Y-%m-%d-%H-%M)

# build anbd uppload
# $JFROG_COMMAND rt mvn-config --repo-deploy-releases=$JFROG_DEFAULT_REPO --repo-deploy-snapshots=snapshots
# $JFROG_COMMAND rt mvn install -DskipTests --batch-mode -s settings.xml --build-name=${POM_ARTIFACT_ID} --build-number=${NEW_VERSION}


