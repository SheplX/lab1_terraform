resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw_day1"
  }
}

resource "aws_eip" "main" {
  vpc      = true
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_sub1.id

  tags = {
    Name = "ngw_day1"
  }
}
  resource "aws_route_table" "pure" {
  vpc_id = aws_vpc.main.id

  
  tags = {
    Name = "private_pure_rt"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public_rt"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "pure_association1" {
  subnet_id      = aws_subnet.private_pure_sub1.id
  route_table_id = aws_route_table.pure.id
}

resource "aws_route_table_association" "pure_association2" {
  subnet_id      = aws_subnet.private_pure_sub2.id
  route_table_id = aws_route_table.pure.id
}

resource "aws_route_table_association" "public_association1" {
  subnet_id      = aws_subnet.public_sub1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_association2" {
  subnet_id      = aws_subnet.public_sub2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association1" {
  subnet_id      = aws_subnet.private_sub1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_association2" {
  subnet_id      = aws_subnet.private_sub2.id
  route_table_id = aws_route_table.private_rt.id
}