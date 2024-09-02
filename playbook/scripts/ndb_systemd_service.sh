#!/bin/bash 
######################################################################################################
###> New x bash -> ndb_systemd_service.sh  -> Initial creation user => eric => 2024-08-02_07:03:56 ###
######################################################################################################
#_#>
# CLI Colors    
Red='\e[0;31m'; BRed='\e[1;31m'; BIRed='\e[1;91m'; Gre='\e[0;32m'; BGre='\e[1;32m'; BBlu='\e[1;34m'; BWhi='\e[1;37m'; RCol='\e[0m';
sudo echo '[Unit]
Description=MySQL NDB Data Node Daemon
After=network.target auditd.service

[Service]
Type=forking
ExecStart=/usr/sbin/ndbd
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target' >> /etc/systemd/system/ndbd.service

systemctl enable ndbd


