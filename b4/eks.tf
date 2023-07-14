module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name = "sre-onboarding-shinta-tf"
  cluster_version = "1.27"

  # kubectl で Kubernetes API サーバーと通信するため
  # ref: https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/cluster-endpoint.html
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = false

  # cluster_endpoint_public_access_cidrs = [var.office_vpn]

  vpc_id = module.vpc.vpc_id
  subnet_ids = concat(module.vpc.public_subnets, module.vpc.private_subnets)

  # Default では Kubernetes コントロールプレーンは AWSの管理するVPC内に作成される
  # control_plane_subnet_ids = []

  self_managed_node_group_defaults = {
    iam_role_additional_policies = {
      AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
  }

  self_managed_node_groups = {
    sre-onboarding-shinta-tf = {
      desired_size = 3
      max_size     = 3
      min_size     = 3
      instance_type    = "m5.large"
      # v1.27 EKS optimized AMI
      # ref: https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/retrieve-ami-id.html
      ami_id = "ami-0a6fc0cbf0a8433cb"
      subnet_ids          = module.vpc.public_subnets
    }
  }
}

