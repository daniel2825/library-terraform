resource "aws_internet_gateway" "libraryInternet" {
  tags = {
    Name = "libraryInternet"
  }
}
