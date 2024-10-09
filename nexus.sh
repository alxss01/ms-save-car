#!/bin/bash

mvn=$(which mvn)
worke_dir=$(pwd)
version=$($mvn -f "$worke_dir/pom.xml" help:evaluate -Dexpression=project.version -q -DforceStdout) || echo "Falha ao capturar version do pom.xml" exit 0
groupId=$($mvn -f "$worke_dir/pom.xml" help:evaluate -Dexpression=project.groupId -q -DforceStdout) || echo "Falha ao capturar groupId do pom.xml" exit 0
artifactId=$($mvn -f "$worke_dir/pom.xml" help:evaluate -Dexpression=project.artifactId -q -DforceStdout) || echo "Falha ao capturar artifactId do pom.xml" exit 0
repositoryId="devops-maven-snapshot"

mvn deploy -B -s ~/.m2/settings.xml \
    -Durl=http://localhost:8081 \
    -Dfile=target/$artifactId.jar \
    -DgroupId=$groupId \
    -DartifactId=$artifactId \
    -Dpackaging=jar \
    -Dversion=$version \
    -DrepositoryId=$repositoryId