resource "aws_subnet" "private_eu_north_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    "Name" = "private_eu_north_1a"
  }
}

resource "aws_subnet" "public_eu_north_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public_eu_north_1a"
  }
}

# To add more subnets, just copy the above block and change the values
# this is for the load balancer