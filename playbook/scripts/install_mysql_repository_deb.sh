#!/bin/bash 
###############################################################################################################
###> New x bash -> install_mysql_repository_deb.sh  -> Initial creation user => eric => 2024-09-01_11:33:00 ###
###############################################################################################################
#_#>
# CLI Colors    
Red='\e[0;31m'; BRed='\e[1;31m'; BIRed='\e[1;91m'; Gre='\e[0;32m'; BGre='\e[1;32m'; BBlu='\e[1;34m'; BWhi='\e[1;37m'; RCol='\e[0m';

sudo su - root
export DEBIAN_FRONTEND=noninteractive
apt-get install -y /tmp/mysql-apt-config_0.8.32-1_all.deb
o


