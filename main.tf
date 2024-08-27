
module "aws_vpc" {
    source = "./vpc/modules"
    cidr_block = var.cidr_block
}

module "aws_internet_gateway"{
    source = "./internet_gateway"
    vpc_id = module.aws_vpc.library_vpc.id
}