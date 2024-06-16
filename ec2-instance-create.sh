#!/bin/bash

aws ec2 run-instances \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=instance-test}]' \
	--image-id ami-04b70fa74e45c3917 \
	--instance-type t2.micro \
	--key-name pessoal-key \
	--associate-public-ip-address \
	--security-group-ids sg-08e753bf15ecbb42d \
	--block-device-mappings DeviceName=/dev/sda1,Ebs={VolumeSize=8} \
	--user-data "
	#!/bin/bash
	sudo apt update
	sudo apt install apache2
	"
