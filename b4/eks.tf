module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "sre-onboarding-shinta-tf"
  cluster_version = "1.27"

  enable_irsa = true
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  # kubectl で Kubernetes API サーバーと通信するため
  # ref: https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/cluster-endpoint.html
  cluster_endpoint_public_access = true
  # cluster_endpoint_private_access = false

  eks_managed_node_group_defaults = {
    iam_role_additional_policies = {
      AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }

    instance_types = ["m5.large"]
  }

  # self_managed_node_groups = {
  eks_managed_node_groups = {
    main = {
      desired_size = 3
      max_size     = 3
      min_size     = 3
    }
  }
}

