#!/bin/bash
if [ -n "$AWS_ACCESS_KEY_ID" ] && [ -n "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" > ~/.aws/testcredentials
fi

if [ -n "$AWS_DEFAULT_REGION" ]; then
    echo "[default]
region = $AWS_DEFAULT_REGION
output = json" > ~/.aws/testconfig
fi

cd /root/aws-apigateway-importer/
/root/aws-apigateway-importer/aws-api-import.sh $@
