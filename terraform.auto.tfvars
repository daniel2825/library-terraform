cidr_block                       = "10.0.0.0/24"
cidr_block_subnet_public         = "10.0.0.0/25"
cidr_block_subnet_private        = "10.0.0.128/25"
availability_zone_public_subnet  = "us-east-1b"
availability_zone_private_subnet = "us-east-1c"
ami_bastion_host                 = "ami-0fc61db8544a617ed"
ami_server                       = "ami-0fc61db8544a617ed"
ami_autoscaling                  = "ami-0fc61db8544a617ed"
key_name_instances               = "Dgsoftwarekey"
instance_type_bastion_host       = "t2.micro"
instance_type_server             = "t2.micro"
instance_type_autoscaling        = "t2.micro"
percentage_cpu_scaling           = 40.0
