resource "aws_instance" "ec2" {

    ami = "ami-002068ed284fb165b"

    instance_type = "t2.micro"

    subnet_id = aws_subnet.private_sub1.id

    associate_public_ip_address = "false"


    tags = {

    Name = "test_instance"

    }
}