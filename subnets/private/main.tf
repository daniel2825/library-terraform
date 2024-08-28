resource "aws_subnet" "subnetPrivateLibrary" {
  vpc_id            = module.aws_vpc.vpc_id
  availability_zone = "us-east-1c"
  cidr_block        = "11.0.0.0/25"
  tags = {
    Name = "subnetPrivateLibrary"
  }
}

resource "aws_eip" "elasticIpLibrary" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway_library" {
  allocation_id = "${aws_eip.elasticIpLibrary.id}"
  subnet_id     = module.subnet_public_id
  tags = {
    Name = "gw library"
  }
}

resource "aws_route_table" "subnetPrivateMederi_rt" {
  vpc_id = module.aws_vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gateway_library.id}"
  }
  tags = {
    Name = "privateRouteTable"
  }
}

resource "aws_route_table_association" "subnetPrivateMederi_rt" {
  subnet_id      = "${aws_subnet.subnetPrivateMederi.id}"
  route_table_id = "${aws_route_table.subnetPrivateMederi_rt.id}"
}
