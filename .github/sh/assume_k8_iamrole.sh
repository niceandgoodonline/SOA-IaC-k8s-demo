#!/bin/sh

K8_ARN="arn:aws:iam::666630334140:role/Kubernetes-Deployment"
K8_STS=$(aws sts assume-role --role-arn "$K8_ARN" --role-session-name "k8-github-deploy" --external-id "$K8_EXT" --duration-seconds 1200 --profile orchestration)
K8_KEY=$(echo $K8_STS | jq -r .Credentials.AccessKeyId)
K8_SEC=$(echo $K8_STS | jq -r .Credentials.SecretAccessKey)
K8_TKN=$(echo $K8_STS | jq -r .Credentials.SessionToken)

export AWS_ACCESS_KEY_ID="$K8_KEY"
export AWS_SECRET_ACCESS_KEY="$K8_SEC"
export AWS_SESSION_TOKEN="$K8_TKN"
