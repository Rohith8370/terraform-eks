variable "aws_region" {
    default = "ap-south-1"
    description = " This is about aws region "
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = " This is about vpc cidr range "
  
}

variable "kubernetes_version" {
    default = "1.27"
    description = " This is about kubernetes version "
}

variable "cluster_name" {
    default = "Demo"
    description = " This is about cluster name "
  
}