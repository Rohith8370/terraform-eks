provider "aws" {
  region = var.aws_region
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "vpc-terraform"
    cidr = var.vpc_cidr

    azs = ["ap-south-1"]
    private_subnets = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
    public_subnets = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24","10.0.7.0/24"]

    enable_nat_gateway = true
    enable_vpn_gateway = true


    tags = {
        terraform = "true"
    }

}

