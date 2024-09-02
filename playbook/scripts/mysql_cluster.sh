#!/bin/bash 
################################################################################################
###> New x bash -> mysql_cluster.sh  -> Initial creation user => eric => 2024-08-02_06:24:17 ###
################################################################################################
#_#>
# CLI Colors    
Red='\e[0;31m'; BRed='\e[1;31m'; BIRed='\e[1;91m'; Gre='\e[0;32m'; BGre='\e[1;32m'; BBlu='\e[1;34m'; BWhi='\e[1;37m'; RCol='\e[0m';

sudo mkdir -p /data0/mycl-data

if 
sudo mkdir -p /usr/src/mycl_sw


echo "Downloading mysql cluster files"
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-client_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-client_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-server-core_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-server-core_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-data-node_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-data-node_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-common_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-common_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-server_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-server_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-client-core_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-client-core_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-client_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-client_8.0.19-1ubuntu18.04_amd64.deb
curl https://downloads.mysql.com/archives/get/p/14/file/mysql-server_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-server_8.0.19-1ubuntu18.04_amd64.deb


sudo dpkg -i /usr/src/mycl_sw/*





curl https://downloads.mysql.com/archives/get/p/14/file/mysql-cluster-community-management-server_8.0.19-1ubuntu18.04_amd64.deb -o /usr/src/mycl_sw/mysql-cluster-community-management-server_8.0.19-1ubuntu18.04_amd64.deb

sudo dpkg -i /usr/src/mycl_sw/mysql-cluster-community-management-server_8.0.19-1ubuntu18.04_amd64.deb 


echo "[mysqld]
ndbcluster
ndp-connectstring=NEW_IP

