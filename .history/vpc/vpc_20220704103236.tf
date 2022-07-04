# create a VPC
resource "aws_vpc" "eng114_shazid_terraform" {
  cidr_block = "10.34.0.0/16"
  instance_tenancy = "default"

  tags = {
      Name = "eng114_shazid_vpc"
  }
}

# create a internet gateway

resource "aws_internet_gateway" "eng114_shazid_ig" {
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  tags = {
    Name = "eng114_shazid_terraform_ig"
  }
}

# create a public and a private subnets

resource "aws_subnet" "eng114_shazid_terraform_public_subnet" {
  vpc_id     = aws_vpc.eng114_shazid_terraform.id
  cidr_block = "10.34.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_shazid_terraform_public_subnet"
  }
}

resource "aws_subnet" "eng114_shazid_terraform_private_subnet" {
  vpc_id     = aws_vpc.eng114_shazid_terraform.id
  cidr_block = "10.34.3.0/24"
  map_public_ip_on_launch = false
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_shazid_terraform_private_subnet"
  }
}

# Route table (public)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eng114_shazid_terraform.id
  tags = {
    Name = "eng114-shazid-terraform-public-RT"
  }
}

# Route from (public)
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eng114_shazid_ig.id
}