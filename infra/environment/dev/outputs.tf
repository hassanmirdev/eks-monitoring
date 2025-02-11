output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
  description ="eks cluster name"
}


output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
  description ="eks cluster endpoint"
}



output "patient_service_repo_uri" {
  value = module.ecr.patient_service_repo_uri
  description ="patient service repo url"
}


output "appointment_service_repo_uri" {
  value = module.ecr.appointment_service_repo_uri
 description ="appointment service repo url"
}

output "eks_cluster_role_arn" {
  value = module.iam.eks_cluster_role_arn
  description =  "cluster role arn"
}
output "vpc_id" {
  value = module.vpc.vpc_id
    description =  "VPC ID"
}
