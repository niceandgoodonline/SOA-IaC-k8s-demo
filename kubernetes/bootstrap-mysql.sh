#!/bin/bash

ROOT_SSM_NAME="/soc-iac-k8s/secrets/mysql-root-pass"
READ_SSM_NAME="/soc-iac-k8s/secrets/mysql-read-pass"
WRITE_SSM_NAME="/soc-iac-k8s/secrets/mysql-write-pass"
LOCAL_PATTERN="localMysqlSecret"
LOCAL_PATTERN_2="localSecretMysql"
MYSQL_ROOT_PASSWORD=$(aws ssm get-parameter --name "$ROOT_SSM_NAME" | jq -r .Parameter.Value)
MYSQL_READ_PASSWORD=$(aws ssm get-parameter --name "$READ_SSM_NAME" | jq -r .Parameter.Value)
MYSQL_WRITE_PASSWORD=$(aws ssm get-parameter --name "$WRITE_SSM_NAME" | jq -r .Parameter.Value)

cp mysql-root-secret.yml.tpl mysql-root-secret.yml
cp mysql-read-secret.yml.tpl mysql-read-secret.yml
cp mysql-write-secret.yml.tpl mysql-write-secret.yml
cp mysql-init-soc-iac-k8s-db-sql.yml.tpl mysql-init-soc-iac-k8s-db-sql.yml

sed -i "s|$LOCAL_PATTERN|$MYSQL_ROOT_PASSWORD|g" mysql-root-secret.yml
sed -i "s|$LOCAL_PATTERN|$MYSQL_READ_PASSWORD|g" mysql-read-secret.yml
sed -i "s|$LOCAL_PATTERN|$MYSQL_WRITE_PASSWORD|g" mysql-write-secret.yml
sed -i "s|$LOCAL_PATTERN|$MYSQL_READ_PASSWORD|g" mysql-init-soc-iac-k8s-db-sql.yml
sed -i "s|$LOCAL_PATTERN_2|$MYSQL_WRITE_PASSWORD|g" mysql-init-soc-iac-k8s-db-sql.yml

kubectl apply -f mysql-root-secret.yml
kubectl apply -f mysql-read-secret.yml
kubectl apply -f mysql-write-secret.yml
kubectl apply -f mysql-init-soc-iac-k8s-db-sql.yml
kubectl apply -f mysql-storage.yml
kubectl apply -f mysql-deployment.yml
