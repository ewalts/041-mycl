#!/bin/bash 
##########################################################################################
###> New x bash -> asg-ident-cron.sh  -> Initial creation user => eric => 2024-09-06_18:40:00 ###
##########################################################################################
#_#>

if
aws s3 cp s3://041-mycl/000-041-mycl-static-plan.yaml /tmp/000-041-mycl-static-plan.yaml
this_ip=$(ip add show ens33|grep inet |awk {'print $2'}|sed 's/\/28//g')


 $this_ip
