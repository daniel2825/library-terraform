// public subnet association
resource "aws_route_table" "subnetPublicLibrary_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

resource "aws_route_table_association" "subnetPubliclibraryAs_rt" {
  subnet_id      = var.cidr_block_subnet_public
  route_table_id = "${aws_route_table.subnetPublicLibrary_rt.id}"
}

// private subnet association

resource "aws_eip" "elasticIpMederi" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway_library" {
  allocation_id = "${aws_eip.elasticIpMederi.id}"
  subnet_id     = var.cidr_block_subnet_public
  tags = {
    Name = "gw library"
  }
}

resource "aws_route_table" "subnetPrivateLibrary_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gateway_library.id}"
  }
  tags = {
    Name = "privateRouteTable"
  }
}

resource "aws_route_table_association" "subnetPrivateMederiAs_rt" {
  subnet_id      = var.cidr_block_subnet_private
  route_table_id = "${aws_route_table.subnetPrivateMederi_rt.id}"
}

