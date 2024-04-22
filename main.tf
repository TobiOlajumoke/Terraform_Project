provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "your_ip_address" {}
variable "ansible_server_ip" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "security_group" {
  source = "./security_group"

  your_ip_address    = var.your_ip_address
  ansible_server_ip  = var.ansible_server_ip
}

module "instance" {
  source = "./instance"

  subnet_id    = "subnet-06f4bafe1bde4ed61"
  ami_id       = "ami-0fe630eb857a6ec83"
  security_group_id = module.security_group.security_group_id
}

output "instance_public_ip" {
  value = module.instance.instance_public_ip
}