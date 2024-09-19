#!/bin/bash
# Pull cluster status from s3
#aws s3 cp s3://041-mycl/mycluster-status.log

# Stop mysql
sudo systemctl stop mysql

# remove the auto.cnf file from the data directory /new-gen when start
sudo rm -f /var/lib/mysql/auto.cnf

# copy my.cnf file to etc, 
sudo cp ~/041-mycl/files/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Generate a random number and set it as unique server_id 
new_id=$(($RANDOM % (10 - 98 + 1) + 10))
sudo sed -i "s/_NEW_ID_/$new_id/g" /etc/mysql/mysql.conf.d/mysqld.cnf

# allowable ip address list
ips=('10.1.241.11','10.1.241.12','10.1.241.13','10.1.241.14','10.1.241.15')

#Check the curernt IP address
this_ip=$(ip add show ens33|grep inet |awk {'print $2'}|sed 's/\/28//g')

D="|"
if  [[ "${D}${ips[*]}${D}" =~ "${D}${this_ip}${D}" ]]; then
    echo "true"
else
    echo "false"
fi


sudo cp ~/041-mycl/files/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf


