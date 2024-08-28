module "aws_vpc" {
    source = "./vpc/modules"
    cidr_block = var.cidr_block
}

module "aws_internet_gateway"{
    source = "./internet_gateway"
    vpc_id = module.aws_vpc.library_vpc_id
}

module "aws_subnet"{
    source = "./subnets/public"
    vpc_id = module.aws_vpc.library_vpc_id   
    internet_gateway_id = module.aws_internet_gateway.internet_gateway_id
    cidr_block_subnet_public = var.cidr_block_subnet_public
}

module "aws_route_table"{
    source = "./subnets/public"
    vpc_id = module.aws_vpc.library_vpc_id   
    internet_gateway_id = module.aws_internet_gateway.internet_gateway_id
    cidr_block_subnet_public = var.cidr_block_subnet_public
}

