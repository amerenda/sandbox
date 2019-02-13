#!/usr/bin/env bash
gcloud config set project nomadic-bison-143517
echo | gcloud compute instance-templates delete centos7-base-jenkins-agent

# get latest java base image
IMAGE=$(gcloud compute images list --filter='family: centos7-java-base' --sort-by='~creationTimestamp' --limit=1 | grep -v NAME | awk '{ print $1 }')

gcloud compute instance-templates create centos7-base-jenkins-agent --image=${IMAGE} --network=prod --subnet=prod-us-east1 --tags=allow-ssh --no-address  --region=us-east1

gcloud compute instances create jenkins-agent-poc-test  --source-instance-template centos7-base-jenkins-agent --machine-type n1-standard-1 --zone us-east1-b
