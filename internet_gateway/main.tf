resource "aws_internet_gateway" "libraryInternet" {
  vpc_id = var.vpc_id
  tags = {
    Name = "libraryInternet"
  }
}
