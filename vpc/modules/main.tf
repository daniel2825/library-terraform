

resource "aws_vpc" "library_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "library_tf_vpc"
  }
  enable_dns_hostnames = true
}