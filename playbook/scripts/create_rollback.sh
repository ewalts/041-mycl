#!/bin/bash
##########################################################################################################
###> New x bash -> scripts/create_rollback.sh  -> Initial creation user => eric => 2023-12-12_01:14:53 ###
##########################################################################################################
#_#>
# CLI Colors
Red='\e[0;31m'; BRed='\e[1;31m'; BIRed='\e[1;91m'; Gre='\e[0;32m'; BGre='\e[1;32m'; BBlu='\e[1;34m'; BWhi='\e[1;37m'; RCol='\e[0m';

date=$(date +%Y-%m-%d_%H)
dir="rollback_$date"

if [ ! -d "$dir" ]; then
	mkdir "$dir"
fi

rollback_play="$dir/remove_asg_deployment.yml"


if [ ! -f "$rollback_play" ]; then
	echo "$rollback_play does not exist"
	printf %b "- name: Rollback ASG deployment\n  hosts: localhost\n  gather_facts: false\n  tasks:\n" >> "$rollback_play"

else

	echo "the file $rollback_play exists"

fi

if [[ $1 = 'subnet' ]]; then
	printf "    - name: Remove subnet\n      amazon.aws.ec2_vpc_subnet:\n        subnet_id: $2\n        state: absent\n" >> "$rollback_play"
fi
