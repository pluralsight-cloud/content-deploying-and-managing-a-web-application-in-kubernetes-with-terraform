module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0" # 20.21.0

  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  authentication_mode = "API_AND_CONFIG_MAP"

  eks_managed_node_group_defaults = {
    ami_type       = "AL2023_x86_64_STANDARD"

  }

  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}