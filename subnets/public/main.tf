resource "aws_subnet" "subnetPublicLibrary" {
  vpc_id            = var.vpc_id
  availability_zone = "us-east-1b"
  cidr_block        = var.cidr_block_subnet_public
  tags = {
    Name = "subnetPublicLibrary"
  }
}
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
  subnet_id      = "${aws_subnet.subnetPublicLibrary.id}"
  route_table_id = "${aws_route_table.subnetPublicLibrary_rt.id}"
}