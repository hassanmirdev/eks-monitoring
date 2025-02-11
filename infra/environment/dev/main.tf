module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zone   = ["us-east-1a", "us-east-1b"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

module "iam" {
  source                = "../../modules/iam"
  cluster_role_name     = "eks-cluster-role"
  node_role_name    = "eks-node-group-role"

}


output "eks_cluster_role_arn" {
  value = module.iam.eks_cluster_role_arn
}




module "eks" {
  source               = "../../modules/eks"
  cluster_name         = "my-eks-cluster"
  eks_cluster_role_arn  = module.iam.eks_cluster_role_arn
  eks_node_role_arn  = module.iam.eks_node_role_arn 
  private_subnet_ids          = module.vpc.private_subnet_ids
  vpc_id       = module.vpc.vpc_id
}


