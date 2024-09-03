module "aws_vpc" {
  source     = "./vpc/modules"
  cidr_block = var.cidr_block
}

module "aws_internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.aws_vpc.library_vpc_id
}

module "aws_subnet" {
  source                           = "./subnets"
  vpc_id                           = module.aws_vpc.library_vpc_id
  internet_gateway_id              = module.aws_internet_gateway.internet_gateway_id
  cidr_block_subnet_public         = var.cidr_block_subnet_public
  cidr_block_subnet_private        = var.cidr_block_subnet_private
  availability_zone_public_subnet  = var.availability_zone_public_subnet
  availability_zone_private_subnet = var.availability_zone_private_subnet
}

module "aws_route_table" {
  source              = "./route_table"
  vpc_id              = module.aws_vpc.library_vpc_id
  internet_gateway_id = module.aws_internet_gateway.internet_gateway_id
  subnet_public_id    = module.aws_subnet.subnet_public_id
  subnet_private_id   = module.aws_subnet.subnet_private_id
}

module "aws_network_acl" {
  source            = "./network_acl"
  vpc_id            = module.aws_vpc.library_vpc_id
  subnet_private_id = module.aws_subnet.subnet_private_id
}

module "aws_security_group" {
  source = "./security_groups"
  vpc_id = module.aws_vpc.library_vpc_id
}

module "aws_instance" {
  source                     = "./instances"
  subnet_public_id           = module.aws_subnet.subnet_public_id
  security_group_public_id   = module.aws_security_group.security_group_public_id
  subnet_private_id          = module.aws_subnet.subnet_private_id
  security_group_private_id  = module.aws_security_group.security_group_private_id
  ami_bastion_host           = var.ami_bastion_host
  ami_server                 = var.ami_server
  instance_type_bastion_host = var.instance_type_bastion_host
  instance_type_server       = var.instance_type_server
  key_name_instances         = var.key_name_instances
}

module "aws_elb" {
  source                    = "./elb"
  subnet_public_id          = module.aws_subnet.subnet_public_id
  subnet_private_id         = module.aws_subnet.subnet_private_id
  security_group_public_id  = module.aws_security_group.security_group_public_id
  security_group_private_id = module.aws_security_group.security_group_private_id
  instance_type_autoscaling = var.instance_type_autoscaling
  ami_autoscaling           = var.ami_autoscaling
  vpc_id                    = module.aws_vpc.library_vpc_id
  key_name_instances        = var.key_name_instances
  percentage_cpu_scaling    = var.percentage_cpu_scaling
}