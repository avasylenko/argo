module "eks" {
  source        = "../../../modules/eks"
  cluster_name  = "crossplane-eks"
  k8s_version   = "1.28"
  aws_region    = "us-east-1"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  node_group_desired_capacity = 2
  node_group_min_capacity = 1
  node_group_max_capacity = 2
}


output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
  description = "Endpoint for the EKS cluster."
}

output "eks_cluster_id" {
  value = module.eks.eks_cluster_id
  description = "Cluster ID for the EKS cluster."
}

