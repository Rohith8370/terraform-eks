provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-terraform"
  cidr   = var.vpc_cidr

  azs               = ["ap-south-1a", "ap-south-1b"]
  private_subnets   = ["10.0.0.0/24", "10.0.8.0/24"]
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    terraform = "true"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "vpc-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Associate Public Subnets with the Public Route Table
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(module.vpc.public_subnets)
  subnet_id      = element(module.vpc.public_subnets, count.index)
  route_table_id = aws_route_table.public_rt.id
}
