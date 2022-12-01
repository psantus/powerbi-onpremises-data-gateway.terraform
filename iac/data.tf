# Initial AMI to use
data "aws_ami" "windows" {
  most_recent = true
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["801119661308"] # Canonical
}

# AMI to use
data "aws_ami" "final" {
  most_recent = true
  filter {
    name   = "name"
    values = ["PowerBI-On-Premise-Gateway"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"]
}

# Subnets
data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Type"
    values = ["private"]
  }
}

# VPC
data "aws_vpc" "account_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.account_name]
  }
}

# Security group of db
data "aws_security_group" "db_sg" {
  filter {
    name   = "group-name"
    values = [var.db_sg_name]
  }

  vpc_id = data.aws_vpc.account_vpc.id
}
