terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.82.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.7.1"
    }
     local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }
}


