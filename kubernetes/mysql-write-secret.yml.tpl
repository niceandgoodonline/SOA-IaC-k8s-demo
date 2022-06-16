apiVersion: v1
kind: Secret
metadata:
  name: mysql-write-secret
type: kubernetes.io/basic-auth
stringData:
  password: localMysqlSecret
