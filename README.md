# MySQL NDB Cluster 
by Richard Eric Walts


Highly Available supported by 2 x ASG
---

#Required Prerequisites:
 - AWS account with administrative access to EC2
 - Ansible installed and configured w/access to run plays through localhost for AWS
 - PHP8.

# NOTE: Regarding Update inventory PHP Script

 Currently it does not prune dead hosts.

 There is a short bash script 'clear_inventory.sh'.  It is not fancy. It just replaces the current inventory.yml with the backup inventory.yml_bkp. It is not fancy.
 I want to enrich the features of this script. But I don't think it will happen so much locally. I'm leaning toward storing the inventory in s3 or codecommit. The file would be updated by lambda and cloud watch event triggered by ASG activity.

#Overview:
- The process begins by creating dependencies in AWS: 
  [subnet, security group, iam policy, role, instance-profile, ELB, host A DNS record].
 One EC2 instance is created. The Ubuntu AMI could come straight from the AWS catalog.
  Currently using Ubuntu 22.04 LTS. 
 
 The deployment process defines some of my standard configurtions to the initial Ubuntu Instance. 
 Including, not limited to: firewall settings, SSH group membership restrictions, NTP service, currently installed packages updated, installs Java, boto, aws-cli, etc.

 After basic configurations, runs the install/configure play for MySQL NDB Cluster and Manager.

 After the software is installed on the first instance, it is cloned into the AMI for the NODES ASG launch template.

 After the node AMI is created, the cluster manager is installed.  

 The user-data scripts defined within the launch templates differ by ASG purpose the my.cnf file for nodes to the cluster.

# Groups for inventory
 - ec2hosts	(all ec2hosts in this project)
 - u22 		(all Ubuntu 22.04 hosts)
 - mycl		(all hosts providing MySQL for the NDB Cluster)
 - myclmgr	(the MySQL NDB Cluster Managment host)



# The deployment records identfying configuration information created during deployment.
 -  The default location where these details are stored: [~/.ansible/output/deployment_register_vars.yml]
 -  This is useful to rollback the deployment.

 - Sample output/deployment_register_vars.yml

      vpc_id: vpc-03171xxxxxxxxxxxxxxx
      subnet_id: subnet-015xxxxxxxxxxxxxx
      sg_id: sg-082e894xxxxxxxxxxxx
      iam_role: AROxxxxxxxxxxxxxx
      iam_policy: 01-k8s-w2-EC2Policy
      instance_profile: 01-k8s-w2-EC2Profile
      elb: 01-k8s-w2-lb01
      instance_id: i-094xxxxxxxxxxxxxxxxxxxx
      dns_record: 34.x.x.x A 01-k8s-cp.west2.mydomain.edu.
      ami_id: ami-02c7xxxxxxxxxxxxxxx
      lt_id: lt-00e4xxxxxxxxxxxxx
      asg_id: arn:aws:autoscaling:us-west-2:xxxx:autoScalingGroup:09sbs88f-xxxx-xxx2-xxd2-xxxxxa079:autoScalingGroupName/01-k8s-w2-cl
 



#Playbook tasks: INFORMATION TO FOLLOW


