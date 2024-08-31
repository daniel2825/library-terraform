resource "aws_subnet" "subnetPublicLibrary" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone_public_subnet
  cidr_block        = var.cidr_block_subnet_public
  tags = {
    Name = "subnetPublicLibrary"
  }
}

resource "aws_subnet" "subnetPrivateLibrary" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone_private_subnet
  cidr_block        = var.cidr_block_subnet_private
  tags = {
    Name = "subnetPrivateLibrary"
  }
}

