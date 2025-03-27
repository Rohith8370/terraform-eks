provider "aws" {
  region = var.aws_region
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "vpc-terraform"
    cidr = var.vpc_cidr

    azs = ["ap-south-1a","ap-south-1b"]
    private_subnets = ["10.0.0.0/24","10.0.8.0/24","10.0.9.0/24","10.0.3.0/24"]
    #public_subnets = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24","10.0.7.0/24"]

    enable_nat_gateway = true
    enable_vpn_gateway = true


    tags = {
        terraform = "true"
    }

    public_subnets = {
    public = {
      cidr                   = "10.0.1.0/24"
      map_public_ip_on_launch = true  # This enables auto public IP
    }
  }
}

