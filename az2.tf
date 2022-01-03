resource "aws_subnet" "public_sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_public_subnet2
    availability_zone = data.aws_availability_zones.available.names[1]


  tags = {
    Name = "public_sub2"
  }
}


resource "aws_subnet" "private_sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_private_subnet2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private_sub2"
  }
}

resource "aws_subnet" "private_pure_sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_private_pure_subnet2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private_pure_sub2"
  }
}