resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-04716897be83e3f04"  
  instance_type = "t2.micro"

  tags = {
    Name = "Ubuntu-Instance"
  }

  key_name = aws_key_pair.my_key_pair.key_name  

  root_block_device {
    volume_size = 25
    volume_type = "gp3"  
  }

  security_groups = [
    aws_security_group.instance_sg.name
  ]
}

resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Allow SSH, HTTP, and HTTPS traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8501
    to_port     = 8501
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = file("C:/Users/Lucas/.ssh/id_rsa.pub")  
}