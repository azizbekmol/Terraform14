# Terraform14 Class9 
### data.tf
data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket = "backend-class-azizbek"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
output "full_list" {
  value = data.terraform_remote_state.main.outputs.*
}

## backend.tf
terraform {
  backend "s3" {
    bucket = "backend-class-azizbek"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

### instance.tf
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.main.outputs.private_subnet1
}

### vpc.tf
module "vpc" {
	source = "farrukh90/vpc/aws"
	region = "us-east-1"
	vpc_cidr = "10.0.0.0/16"
	public_cidr1 = "10.0.1.0/24"
	public_cidr2 = "10.0.2.0/24"
	public_cidr3 = "10.0.3.0/24"
	private_cidr1 = "10.0.101.0/24"
	private_cidr2 = "10.0.102.0/24"
	private_cidr3 = "10.0.103.0/24"
	tags = {
	Name = "VPC_Project"
	Environment = "Dev"
	Team = "DevOps"
	Created_by = "Farrukh"
	Department = "IT"
	Bill = "CFO"
	}
}

output "vpc" {
	value = "${module.vpc.vpc}"
}
output "private_subnet1" {
	value = "${module.vpc.private_subnets[0]}"
}

output "private_subnet2" {
	value = "${module.vpc.private_subnets[1]}"
}
output "private_subnet3" {
	value = "${module.vpc.private_subnets[2]}"
}

output "public_subnet1" {
	value = "${module.vpc.public_subnets[0]}"
}
output "public_subnet2" {
	value = "${module.vpc.public_subnets[1]}"
}
output "public_subnet3" {
	value = "${module.vpc.public_subnets[2]}"
}
output "region" {
	value = "${module.vpc.region}"
}

### sec_group.tf
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.terraform_remote_state.main.outputs.vpc

  ingress {
    description = "TLS from VPC"
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

  tags = {
    Name = "allow_tls"
  }
}