resource "aws_route_table" "private" {
  # Get the `main` VPC from 1-vpc.tf
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  # Get the `main` VPC from 1-vpc.tf
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    # Get the gateway id from 1-internet-gateway.tf
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

# If we want more than one subnet in the same availability zone, we need to create a route table association for each subnet
resource "aws_route_table_association" "private_eu_north_1a" {
  subnet_id      = aws_subnet.private_eu_north_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_eu_north_1a" {
  subnet_id      = aws_subnet.public_eu_north_1a.id
  route_table_id = aws_route_table.public.id
}