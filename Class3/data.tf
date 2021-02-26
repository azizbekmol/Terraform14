# This line pulls Ubuntu AMI
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


# Shows AMI ID
output "UBUNTU_ID" {
  value = data.aws_ami.ubuntu.id
}

# This line pulls CentOS AMI 
data "aws_ami" "centos" {
  most_recent = true
  owners = ["679593333241"] # CentOS Owner
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM *"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Shows AMI ID
output "CENTOS_ID" {
  value = data.aws_ami.centos.id
}
