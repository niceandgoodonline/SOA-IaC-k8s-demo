#!/bin/bash

kubectl delete -f mysql-deployment.yml
kubectl delete -f mysql-storage.yml
kubectl delete -f mysql-root-secret.yml
kubectl delete -f mysql-read-secret.yml
kubectl delete -f mysql-write-secret.yml
kubectl delete -f mysql-init-soc-iac-k8s-db-sql.yml
