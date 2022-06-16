apiVersion: v1
kind: ConfigMap
metadata:
  name: mysql-init-soc-iac-k8s-db-sql
data:
  mysql-init-soc-iac-k8s-db.sql: |-
    CREATE DATABASE soc-iac-k8s;
    USE soc-iac-k8s;
    CREATE TABLE soilNNI (watershed CHAR(128) NOT NULL, site INT NOT NULL, collectionYear INT NOT NULL, collectionMonth INT NOT NULL, collectionDay INT NOT NULL, soilDepthCentimeters CHAR(8) NOT NULL, season CHAR(2) NOT NULL, fieldGrowthStage CHAR(16) NOT NULL, chemicalCompound CHAR(64) NOT NULL, value FLOAT NOT NULL, units CHAR(4) NOT NULL, MDLFlag BOOLEAN NOT NULL);
    CREATE USER 'read'@'%' IDENTIFIED BY 'localMysqlSecret';
    CREATE USER 'write'@'%' IDENTIFIED BY 'localSecretMysql';
    GRANT SELECT ON soc-iac-k8s.soilNNI TO 'read'@'%';
    GRANT ALL ON soc-iac-k8s.soilNNI TO 'write'@'%';
