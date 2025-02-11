# Output EKS Cluster and Fargate Profile details
output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
  description = "eks cluster name"
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
  description = "eks cluster endpoint"
}
