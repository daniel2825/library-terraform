resource "aws_internet_gateway" "libraryInternet" {
 # vpc_id = "${aws_vpc.library_vpc.id}"

  tags = {
    Name = "libraryInternet"
  }
}
