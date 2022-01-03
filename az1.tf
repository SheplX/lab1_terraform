
data "aws_availability_zones" "available" {
  state = "available"
}



resource "aws_subnet" "public_sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_public_subnet1
  availability_zone = data.aws_availability_zones.available.names[0]


  tags = {
    Name = "public_sub1"
  }
}


resource "aws_subnet" "private_sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_private_subnet1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private_sub1"
  }
}

resource "aws_subnet" "private_pure_sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_private_pure_subnet1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private_pure_sub1"
  }
}