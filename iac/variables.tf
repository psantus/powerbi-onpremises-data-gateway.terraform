### MAIN VARIABLES
##################
variable "aws_region" {
  description = "Default region where to deploy resources"
  type        = string
}

## Account
variable "account_name" {
  description = "Account where to deploy VPC"
  type        = string
}

## Account
variable "db_sg_name" {
  description = "Name of edeal security group"
  type        = string
}