#!/usr/bin/env bash

#!/bin/bash
#Create maven project

while [[ $1 == "" ]] && [[ $2 = "" ]]; do
	echo "Please use basename$0 domain.package app_name [e]clipse or [i]dea"
	exit 11
done

MVN=$(which mvn)
while [[ ${MVN} == "" ]]; do
	echo "there is no maven installed in the host"
	exit 10
done

echo "Building project with $1 $2 on"
${MVN} --version

${MVN} archetype:generate -DgroupID=$1 -DartifactId=$2
#-DinteractiveMode=false

if [[ $3 == "e" ]]; then
	echo "running specifications for Eclipse - import your project from $(pwd)/$2"
	cd $(pwd)/$2
	${MVN} eclipse:eclipse
elif [[ $3 == "i" ]]; then
		echo "running specifications for Idea - open your project from $(pwd)/$2"
		cd $(pwd)/$2
	elif [[ $3 == "" ]]; then
			echo "leaving as maven project"

