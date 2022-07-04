
# Security Groups
resource "aws_security_group" "app_security_ports" {
  name = "app_ports"
  description = "Allow ports"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    protocol  = "tcp"
    to_port   = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app_ports"
  }
}

resource "aws_security_group" "db_security_ports" {
  name = "db_ports"
  description = "Allow SSH"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 27017
    protocol  = "tcp"
    to_port   = 27017
    cidr_blocks = ["${aws_instance.app_instance.private_ip}/32"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db_ports"
  }
}

resource "aws_security_group" "controller_security_ports" {
  name = "controller_ports"
  description = "Allow port 80"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "controller_ports"
  }
}