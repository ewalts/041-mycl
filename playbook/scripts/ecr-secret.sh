#!/bin/bash

kubectl create secret docker-registry ec2cred \
--docker-server=683853257660.dkr.ecr.us-west-2.amazonaws.com \
--docker-username=AWS \
--docker-password=$(aws ecr get-login-password) \
--namespace=nginx-php

