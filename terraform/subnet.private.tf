resource "aws_subnet" "private__a" {
  availability_zone       = "us-west-2a"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false

  tags = {
    Env  = "production"
    Name = "private-us-west-2a"
  }

  vpc_id= aws_vpc.default.id
}

resource "aws_subnet" "private__b" {
  availability_zone       = "us-west-2b"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = false

  tags = {
    Env  = "production"
    Name = "private-us-west-2b"
  }

  vpc_id= aws_vpc.default.id
}