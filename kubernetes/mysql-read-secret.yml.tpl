apiVersion: v1
kind: Secret
metadata:
  name: mysql-read-secret
type: kubernetes.io/basic-auth
stringData:
  password: localMysqlSecret
