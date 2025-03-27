module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "20.34.0"
    cluster_name = var.cluster_name
    cluster_version = var.kubernetes_version
    

    enable_irsa = true

    tags = {
        cluster = " From_Terraform "
  }

    #vpc
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets

    #node group defaults
    eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
  
  }
