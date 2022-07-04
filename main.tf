# launch server on aws
provider "aws" {
        region = "eu-west-1"
}

module "aws_vpc" {
        source = "./modules/vpc/vpc.tf"
}

module "aws_security_group" {
        source = "./modules/security/security.tf"
}

module "named_security_group" {
        source = "./modules/security/named_security_group.tf"
}
  
module "aws_instance" {
        source = "./modules/instance/instance.tf"
        aws_instance = "controller_instance"
        
}
