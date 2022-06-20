#!/bin/sh

project="soc-iac-k8s-demo-backend"
private_subnets_param="/$project/state/vpc/private_subnets"
public_subnets_param="/$project/state/vpc/public_subnets"
vpc_id_param="/$project/state/vpc/id"

cp state.tfvars.tpl state.tfvars

aws ssm get-parameter --name $private_subnets_param | jq .Parameter.Value > private.subnets
aws ssm get-parameter --name $public_subnets_param | jq .Parameter.Value > public.subnets
vpc_id=$(aws ssm get-parameter --name $vpc_id_param | jq .Parameter.Value)

private_array="[$(sed "s|,|\",\"|g" private.subnets)]"
public_array="[$(sed "s|,|\",\"|g" public.subnets)]"
rm *.subnets

sed -i "s|PRIVATE_SUBNETS|$private_array|g" state.tfvars
sed -i "s|PUBLIC_SUBNETS|$public_array|g" state.tfvars
sed -i "s|VPC_ID|$id|g" state.tfvars

cat state.tfvars
