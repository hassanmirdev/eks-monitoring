output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}


output "patient_service_repo_uri" {
  value = module.ecr.patient_service_repo_uri
}

output "appointment_service_repo_uri" {
  value = module.ecr.appointment_service_repo_uri
}
